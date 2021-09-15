Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E6240C283
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:11:58 +0200 (CEST)
Received: from localhost ([::1]:49284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQxR-00076Y-NC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQrK-0001NE-5y
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:05:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQrI-0005zm-36
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631696730;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPqhrRbo5g3BvXLeOdr0SMj6MFLIYdR412ZBL+w1vMk=;
 b=ait/TKpBBle3pPeU+Z26DnNXrRHqB/BTP30vxUwu+oZFvDxDwaGOydsstPCFXfAfB9OY68
 A8C1KmYM5XhJMJaUncG94frjJt99HreyaUkE9dzy+Ie899Uv9ntXkB/DRFtCpk0LzKopTJ
 jlV1boSOqYh1PcnPuOb5T8Yldj0lLnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-9No6J7jpP4KoNqZKTaAfow-1; Wed, 15 Sep 2021 05:05:26 -0400
X-MC-Unique: 9No6J7jpP4KoNqZKTaAfow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B62802923;
 Wed, 15 Sep 2021 09:05:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3226C196E2;
 Wed, 15 Sep 2021 09:05:14 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:05:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed:
 Add Fuji machine type)
Message-ID: <YUG3R/TSH7bAJhVg@redhat.com>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
 <YUGw1v20jNRxq2zH@redhat.com>
 <a7a8ee29-cfc5-fec4-30fc-761df76107da@amsat.org>
MIME-Version: 1.0
In-Reply-To: <a7a8ee29-cfc5-fec4-30fc-761df76107da@amsat.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 10:51:56AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/15/21 10:37 AM, Daniel P. Berrangé wrote:
> > On Wed, Sep 15, 2021 at 09:42:48AM +0200, Thomas Huth wrote:
> >> On 14/09/2021 17.22, Richard Henderson wrote:
> >>> On 9/14/21 5:26 AM, Peter Maydell wrote:
> >>>> (2) RAM blocks should have a length that fits inside a
> >>>>      signed 32-bit type on 32-bit hosts (at least I assume this
> >>>>      is where the 2047MB limit is coming from; in theory this ought
> >>>>      to be improveable but auditing the code for mishandling of
> >>>>      RAMblock sizes to ensure we weren't accidentally stuffing
> >>>>      their size into a signed 'long' somewhere would be kind
> >>>>      of painful)
> >>>
> >>> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit
> >>> while pointers are 64-bit, how close do we think we are to this being
> >>> fixed already?
> >>>
> >>>> Even if we did fix (2) we'd need to compromise on (3)
> >>>> sometimes still -- if a board has 4GB of RAM that's
> >>>> not going to fit in 32 bits regardless. But we would be
> >>>> able to let boards with 2GB have 2GB.
> >>>
> >>> I'm not opposed to deprecating 32-bit hosts...  ;-)
> >>
> >> I think we should consider this again, indeed. Plain 32-bit CPUs are quite
> >> seldom these days, aren't they? And I think we urgently need to decrease the
> >> amount of things that we have to test and maintain in our CI and developer
> >> branches... So is there still a really really compelling reason to keep
> >> 32-bit host support alive?
> > 
> > I think it probably depends on the architecture to some extent.
> > 
> > i386 is possibly getting rare enough to consider dropping, though
> > IIUC, KVM in the kernel still supports it.  Would feel odd to drop
> > it in QEMU if the kernel still thinks it is popular enough to keep
> > KVM support.
> > 
> > armv7 feels like it is relatively common as 64-bit didn't arrive
> > in widespread use until relatively recent times compared to x86_64.
> > KVM dropped armv7, but then hardware for that was never widespread,
> > so armv7 was always TCG dominated
> > 
> > Other 32-bit arches were/are always rare.
> 
> While I could understand there are rare uses of system emulation on
> 32-bit hosts, I still believe user-emulation is used, but would like
> to be proven to the contrary. With that in mind, I'm not sure removing
> sysemu on 32-bit hosts is worthful. Maybe we should ask distribution
> maintainers first, then eventually poll the community? Or start with
> a deprecation warning?

Well Debian still supports arm7, i686, mips officially, and several
more unofficially, so that's an easy answer from that side.

Fedora only has arm7, having dropped i686 a while ago.

I don't have insight into usage of QEMU on any platforms breakdown
though.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


