Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D446ADB93
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:16:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUMl-0000qL-Oh; Tue, 07 Mar 2023 05:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZUMi-0000q8-Cq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZUMg-0002Ny-OB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678184174;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bp0jjPupuOQGcb5KtDL9xox01b2Etj/lLYn0pR1NAd8=;
 b=YajY94em8NpvjQx6P85Y+n7LU+EXtzU31q6w0VsIS9BImhzgB/Hsfk+lKxL6TeBApIDRMu
 1magHWnHreBKIIbDqzwR776hTD1KgVZWKbzK0hHIM4z0pPSSKE8M+WG1N735WtCLESB4fW
 qzvYY7PRwenEeqvTRbBO3Jcll7gfvVc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-u01Z0KzUOFOTocK51phStg-1; Tue, 07 Mar 2023 05:16:11 -0500
X-MC-Unique: u01Z0KzUOFOTocK51phStg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8DDE858F09;
 Tue,  7 Mar 2023 10:16:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE43C2026D4B;
 Tue,  7 Mar 2023 10:16:09 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:16:07 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Willem van de Velde <williamvdvelde@gmail.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] Add qemu qcode support for keys F13 to F24
Message-ID: <ZAcO53sV4Un2S15A@redhat.com>
References: <20230301125211.278808-1-williamvdvelde@gmail.com>
 <87y1oaqcua.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1oaqcua.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Mar 06, 2023 at 12:30:37PM +0000, Alex Bennée wrote:
> 
> Willem van de Velde <williamvdvelde@gmail.com> writes:
> 
> > To be able to use the function keys F13 to F24 these should be defined in de keycodemapdb and added to the qapi.
> > The keycodemapdb is updated in its own repository, this patch enables the use of those keys within qemu.
> >
> > Signed-off-by: Willem van de Velde <williamvdvelde@gmail.com>
> 
> Adding maintainer to CC list so this doesn't get lost.

FYI, since its trivial, I'm fine with queuing this myself in the next
set of misc fixes I've got collected for this release.

> 
> For reference from:
> https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html#cc-the-relevant-maintainer
> 
>   git config sendemail.cccmd 'scripts/get_maintainer.pl --nogit-fallback'
> 
> will configure git send-email to do this automatically.
> 
> > ---
> >  qapi/ui.json    | 15 ++++++++++++++-
> >  ui/keycodemapdb |  2 +-
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 0abba3e930..98322342f7 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -886,6 +886,19 @@
> >  # @lang1: since 6.1
> >  # @lang2: since 6.1
> >  #
> > +# @f13: since 8.0
> > +# @f14: since 8.0
> > +# @f15: since 8.0
> > +# @f16: since 8.0
> > +# @f17: since 8.0
> > +# @f18: since 8.0
> > +# @f19: since 8.0
> > +# @f20: since 8.0
> > +# @f21: since 8.0
> > +# @f22: since 8.0
> > +# @f23: since 8.0
> > +# @f24: since 8.0
> > +#
> >  # 'sysrq' was mistakenly added to hack around the fact that
> >  # the ps2 driver was not generating correct scancodes sequences
> >  # when 'alt+print' was pressed. This flaw is now fixed and the
> > @@ -918,7 +931,7 @@
> >              'volumeup', 'volumedown', 'mediaselect',
> >              'mail', 'calculator', 'computer',
> >              'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
> > -            'lang1', 'lang2' ] }
> > +            'lang1', 'lang2','f13','f14','f15','f16','f17','f18','f19','f20','f21','f22','f23','f24' ] }
> >  
> >  ##
> >  # @KeyValueKind:
> > diff --git a/ui/keycodemapdb b/ui/keycodemapdb
> > index d21009b1c9..f5772a62ec 160000
> > --- a/ui/keycodemapdb
> > +++ b/ui/keycodemapdb
> > @@ -1 +1 @@
> > -Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
> > +Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


