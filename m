Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCBD69AED9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2DX-0008Nq-PC; Fri, 17 Feb 2023 10:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2DU-0008Ne-5M
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:00:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.145.221.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pT2DR-0005HL-2j
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676645998;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QBvRq2XIWUvi8ik2urr6sd2mH8oci1YFXRUwfQtrKP4=;
 b=TxfOOkvH0EO490zINV6lKs94z+3Rkj1vZVcpBvQBjaWOUYnx4VxpRPQG4fFM/wrzuJAsWC
 Fh2HQg5UIztba3uyTHU8dFU8g6KtbygCRxLHQZWTl0/d64N2gwBoNrUr+rIWtEseroWvGn
 2Kntf2gM8WDgc91N+RJ5soTCZj9fV9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-JrRuRucCNXOYVaKqi2NfCA-1; Fri, 17 Feb 2023 09:59:54 -0500
X-MC-Unique: JrRuRucCNXOYVaKqi2NfCA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9325E80D0E0;
 Fri, 17 Feb 2023 14:59:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E814492C14;
 Fri, 17 Feb 2023 14:59:52 +0000 (UTC)
Date: Fri, 17 Feb 2023 14:59:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro
 support policy
Message-ID: <Y++WZfJUC8B/fUKr@redhat.com>
References: <20230217132631.403112-1-thuth@redhat.com>
 <3b6b4035-0a7b-431e-6479-70753f850554@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b6b4035-0a7b-431e-6479-70753f850554@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: permerror client-ip=216.145.221.124;
 envelope-from=berrange@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_FAIL=0.001, SPF_HELO_NONE=0.001,
 TO_EQ_FM_DOM_SPF_FAIL=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 03:44:23PM +0100, Paolo Bonzini wrote:
> On 2/17/23 14:26, Thomas Huth wrote:
> > Note: These changes mean that openSUSE is not considered as supported
> > anymore (since version 15.0 has been released in May 2018), and
> > RHEL/CentOS 8 will not be supported anymore in 3 months (since version
> > 8.0 has been released in May 2019).
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> This has the advantage of being a very simple change to the support policy.
> However, it has the disadvantage that at this point both SLE15 and RHEL8 are
> not hard to support _at run-time_, only the build is a bit problematic; so,
> it kinda throws away the baby with the bathwater.

I think it could be a little fuzzy. I agree if thinking about
QEMU.git in isolation.

If we consider that python-qemu-qmp.git is conceptually positioned
as a general purpose QEMU python client, that would extend to runtime
support.

We could define a separate support policy for python-qemu-qmp.git,
but if we're intending to delete the in-tree python QMP code and
use python-qemu-qmp.git directly, then its support policy does
interact with qemu.git.

> I have posted another RFC at https://lore.kernel.org/qemu-devel/20230217124150.205012-1-pbonzini@redhat.com;
> they share the 4 year deadline but it only applies to non-native
> dependencies (which means Python right now).
> 
> Thanks for posting this, it's useful to have two different possibilities to
> compare.
> 
> Paolo
> 
> > ---
> >   docs/about/build-platforms.rst | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> > index 1c1e7b9e11..cdc38f16a4 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -67,10 +67,11 @@ Non-supported architectures may be removed in the future following the
> >   Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
> >   -----------------------------------------
> > -The project aims to support the most recent major version at all times. Support
> > -for the previous major version will be dropped 2 years after the new major
> > -version is released or when the vendor itself drops support, whichever comes
> > -first. In this context, third-party efforts to extend the lifetime of a distro
> > +The project aims to support the most recent major version at all times for
> > +up to four years after its initial release. Support for the previous major
> > +version will be dropped one years after the new major version is released
> > +or when the vendor itself drops support, whichever comes first.
> > +In this context, third-party efforts to extend the lifetime of a distro
> >   are not considered, even when they are endorsed by the vendor (eg. Debian LTS);
> >   the same is true of repositories that contain packages backported from later
> >   releases (e.g. Debian backports). Within each major release, only the most
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


