Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6A6A9692
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:40:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3l5-0005O1-0Q; Fri, 03 Mar 2023 06:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY3kw-0005J0-L7
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY3ku-0000q7-Be
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677843559;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Sexof3CaldIYpbgHhQFfPYuNh/PjDrWj3k12Gp1hVDo=;
 b=QsMuFKRu6YCU9QIvnzrdbhwKgBBlkXTGIaAPOVbpbLOOZxohzycKYIaasqTd2eRLUKHWJo
 HrF8dk8siFLWH++hzMF/CNrD2TP3LlSCek61jfclFuYmzqRq2g9LPgjaQ1QI/rSxAOIbdv
 anfSCNm2cGpgHlVLgCGPMJ/pk2D9aCc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-7_OlWQwlO0GNqGzgpw94mw-1; Fri, 03 Mar 2023 06:39:15 -0500
X-MC-Unique: 7_OlWQwlO0GNqGzgpw94mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA9B29AA3B0;
 Fri,  3 Mar 2023 11:39:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E45B6140EBF4;
 Fri,  3 Mar 2023 11:39:11 +0000 (UTC)
Date: Fri, 3 Mar 2023 11:39:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Message-ID: <ZAHcXUvAKFHeJiM7@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
 <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Mar 03, 2023 at 12:31:42PM +0100, Thomas Huth wrote:
> On 03/03/2023 12.16, Peter Maydell wrote:
> > On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > qemu-system-aarch64 is a proper superset of qemu-system-arm,
> > > and the latter was mainly still required for 32-bit KVM support.
> > > But this 32-bit KVM arm support has been dropped in the Linux
> > > kernel a couple of years ago already, so we don't really need
> > > qemu-system-arm anymore, thus deprecated it now.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index a30aa8dfdf..21ce70b5c9 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> > >   on x86_64 hosts. Thus users are recommended to reconfigure their systems
> > >   to use the ``qemu-system-x86_64`` binary instead.
> > > 
> > > +``qemu-system-arm`` binary (since 8.0)
> > > +''''''''''''''''''''''''''''''''''''''
> > > +
> > > +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> > 
> > I think this is not quite true -- at the moment if you want
> > "every feature we implement, 32-bit" the only way to get
> > that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> > qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> > the "-cpu max,aarch64=off" syntax that we do for KVM that would
> > let the user say "no 64-bit support".
> 
> Ok ... so what does that mean now? ... can we continue with this patch, e.g.
> after rephrasing the text a little bit, or do we need to implement "-cpu
> max,aarch64=off" for TCG first?

I think we need to have a way to request the max 32-bit CPU before we
deprecate, because deprecation has to tell people what they should use
instead.

For qemu-system-i686 -cpu max, I guess we have lm=off to hide the 64-bit
support, so that's OK from QEMU POV, but will need libvirt enhancement
as I don't think we've taken that into account.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


