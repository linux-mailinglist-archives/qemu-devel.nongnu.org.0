Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D93DD65E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:03:00 +0200 (CEST)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXat-0007lM-9Y
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXYf-0004oC-An
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAXYd-00080O-Gx
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627909238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbS6uskudfcf3iDUUBtMs876d8BUuBaYYbX9usxKa5c=;
 b=Wi3DnOJvkLvknjfaGPaY+zho9zLRFAk4yp3Z5Pq8YJBy/faIIJgsNBGBYB+lD23XBOFV5r
 SDrmWA4Dln6yi45w23OoKLWEOOJ9Ax1hGRKodqaYxri8WLtF1Cpys/6lXwHBqRoP8ya9jl
 5+G1qwkVhQID2Xdy4YD76ZXVbo2Fvzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Zf_wTGEqPj-knDOGMUyfbg-1; Mon, 02 Aug 2021 09:00:37 -0400
X-MC-Unique: Zf_wTGEqPj-knDOGMUyfbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C6B787504C;
 Mon,  2 Aug 2021 13:00:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9AE619C59;
 Mon,  2 Aug 2021 13:00:33 +0000 (UTC)
Date: Mon, 2 Aug 2021 14:00:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YQfsb4MQY+EL6LMl@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <878s1kgg2f.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <878s1kgg2f.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 01:55:44PM +0100, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
> >> "make check-acceptance" takes way way too long. I just did a run
> >> on an arm-and-aarch64-targets-only debug build and it took over
> >> half an hour, and this despite it skipping or cancelling 26 out
> >> of 58 tests!
> >> 
> >> I think that ~10 minutes runtime is reasonable. 30 is not;
> >> ideally no individual test would take more than a minute or so.
> >> 
> >> Output saying where the time went. The first two tests take
> >> more than 10 minutes *each*. I think a good start would be to find
> >> a way of testing what they're testing that is less heavyweight.
> >
> > While there is certainly value in testing with a real world "full" guest
> > OS, I think it is overkill as the default setup. I reckon we would get
> > 80-90% of the value, by making our own test image repo, containing minimal
> > kernel builds for each machine/target combo we need, together with a tiny
> > initrd containing busybox.
> 
> Also another minor wrinkle for this test is because we are booting via
> firmware we need a proper disk image with bootloader and the rest of it
> which involves more faff than a simple kernel+initrd (which is my goto
> format for the local zoo of testing images I have).

Ok, so that would require a bootloader build too, which is likely going
to be arch specific, so probably the most tedious part.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


