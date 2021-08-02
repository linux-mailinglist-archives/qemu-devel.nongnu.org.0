Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21773DD223
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 10:39:44 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATU7-00066j-KF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 04:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mATT0-0005Gg-3W
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mATSx-0002I9-Cw
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 04:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627893510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=5Hyj4f2hPd//mGZeVwnm/7WlH7DtbnuxN2SBwUE7FwY=;
 b=CrbUQosQKw/vcrJn1f56CWrWvAq1Otw5ffGIrtJUjkufOUYLlr1SWW0zyxndeUKcvL+d1w
 PZ4PqhXw5CcSMdmJ+ny/efuZHhusE2kNF249qF+sxHU8BL00xnv2NeIwXpY+dqDLGwe8do
 0ci4+VzadmXXh0QWlPV/rP+roM0MA0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-Xv-5bKqFONaIEThtVBK2Ww-1; Mon, 02 Aug 2021 04:38:22 -0400
X-MC-Unique: Xv-5bKqFONaIEThtVBK2Ww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60DB9802923;
 Mon,  2 Aug 2021 08:38:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6FAD1899A;
 Mon,  2 Aug 2021 08:38:19 +0000 (UTC)
Date: Mon, 2 Aug 2021 09:38:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YQeu+Jm2Q0NlQ2Im@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
> 
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.
> 
> Output saying where the time went. The first two tests take
> more than 10 minutes *each*. I think a good start would be to find
> a way of testing what they're testing that is less heavyweight.

While there is certainly value in testing with a real world "full" guest
OS, I think it is overkill as the default setup. I reckon we would get
80-90% of the value, by making our own test image repo, containing minimal
kernel builds for each machine/target combo we need, together with a tiny
initrd containing busybox. This could easily be made to boot in 1 second,
which would make 'make check-acceptance' waaaaay faster, considering how
many times we boot a guest. This would also solve our problem that we're
pointing to URLs to download these giant images, and they're frequently
break URLs.

If we want the re-assurance of running a full guest OS, we could wire
that up 'make check-acceptance FULL_OS=1' and then set that up as a
nightly CI job to run post-merge as a sanity-check, where speed does
not matter


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


