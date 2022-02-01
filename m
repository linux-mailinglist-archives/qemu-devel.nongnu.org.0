Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FAF4A6323
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 19:04:14 +0100 (CET)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExVk-0005mq-Rb
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 13:04:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEvt7-0007VM-Mg
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:20:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEvt4-0006VC-O4
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 11:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643732409;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BTf/zuq6sNmai+PKRNRS+ALRtZ8aJNCEmTEV7lur/oI=;
 b=elPEMHhucgpFV8PJptBsjurEqaiJ7b7np4VQFNBzW4cDCnCRRoEpkeQ7IV8IVR3iSnot/m
 Y5opZ3sxhzyws58sbrbyHATQVnS1zcrWpu5ckJvQw72NHC9Fh1Y85pO8cMIHsecE8sK7pj
 OciUKeXQ2tIrkCHD34ElO7Ahs64Yqm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-4A0P-OifOj6MiAKqkxLvyA-1; Tue, 01 Feb 2022 11:20:00 -0500
X-MC-Unique: 4A0P-OifOj6MiAKqkxLvyA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B223B8519E1;
 Tue,  1 Feb 2022 16:19:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE73478AB6;
 Tue,  1 Feb 2022 16:19:24 +0000 (UTC)
Date: Tue, 1 Feb 2022 16:19:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <Yfldie06h92qxqf3@redhat.com>
References: <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 11:01:43AM -0500, Cleber Rosa wrote:
> On Tue, Feb 1, 2022 at 6:25 AM Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > We have up to now tried really hard as a project to avoid building and
> > hosting our own binaries to avoid theoretical* GPL compliance issues.
> > This is why we've ended up relying so much on distros to build and host
> > binaries we can use. Most QEMU developers have their own personal zoo of
> > kernels and userspaces which they use for testing. I use custom kernels
> > with a buildroot user space in initramfs for example. We even use the
> > qemu advent calendar for a number of our avocado tests but we basically
> > push responsibility for GPL compliance to the individual developers in
> > that case.
> >
> > *theoretical in so far I suspect most people would be happy with a
> > reference to an upstream repo/commit and .config even if that is not to
> > the letter of the "offer of source code" required for true compliance.
> >
> 
> Yes, it'd be fine (great, really!) if a lightweight distro (or
> kernels/initrd) were to
> be maintained and identified as an "official" QEMU pick.  Putting the binaries
> in the source tree though, brings all sorts of compliance issues.

All that's really needed is to have the source + build recipes
in a separate git repo. A pipeline can build them periodically
and publish artifacts, which QEMU can then consume in its pipeline.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


