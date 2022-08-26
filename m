Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269105A27DE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:29:48 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYT5-0003vD-8r
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRYKz-00048M-FJ
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oRYKu-0000kg-D9
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661516479;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b5qHlqnX7eURG5R0BrR/8ui/xob7iwcordXsxcObPoU=;
 b=B2XJt5SoLEfpGKfzcycZaEdg7vLqzQCtWGpGiMfNHnvJaJsvgdMVowFZ8q3rVnPV25D6wv
 hXjysB3e4z6gLzsMfU5OvjdiUb/cUZqAmjbtC2h9ZTWoeXlSfB0n5fRhp4b3+VV9IAeAZT
 wIX5qKrVB/g3GHU6V25IK/65vmKAZ8E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-olsW92_eN0u22eGQUHNElw-1; Fri, 26 Aug 2022 08:21:17 -0400
X-MC-Unique: olsW92_eN0u22eGQUHNElw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77BF33C02189;
 Fri, 26 Aug 2022 12:21:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9241E2166B26;
 Fri, 26 Aug 2022 12:21:16 +0000 (UTC)
Date: Fri, 26 Aug 2022 13:21:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Message-ID: <Ywi6ueT2wtIxDCfv@redhat.com>
References: <20220826113900.794046-1-berrange@redhat.com>
 <20220826120513.GA30245@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220826120513.GA30245@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 01:05:13PM +0100, Richard W.M. Jones wrote:
> On Fri, Aug 26, 2022 at 12:39:00PM +0100, Daniel P. Berrangé wrote:
> > The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> > possible. Historically this hasn't been an issue since it was rare for
> > OS distros to build with a higher mandatory CPU baseline.
> > 
> > With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> > baseline:
> > 
> >   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> > 
> > It is likely that other distros may take similar steps in the not too
> > distant future. For example, it has been suggested for Fedora on a
> > number of occassions.
> > 
> > This new baseline is not compatible with the qemu64 CPU model though.
> > While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> > usage of QEMU doesn't always allow for this. For example, the args
> > are typically controlled via binfmt rules that the user has no ability
> > to change. This impacts users who are trying to use podman on aarch64
> > platforms, to run containers with x86_64 content. There's no arg to
> > podman that can be used to change the qemu-x86_64 args, and a non-root
> > user of podman can not change binfmt rules without elevating privileges:
> > 
> >   https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> > 
> > Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> > compatibility with binaries it is likely to encounter in the wild,
> > and not likely to have a significant downside for existing usage.
> > 
> > Most other architectures already use an 'any' CPU model, which is
> > often mapped to 'max' (or similar) already, rather than the oldest
> > possible CPU model.
> > 
> > For the sake of consistency the 'i386' architecture is also changed
> > from using 'qemu32' to 'max'.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  linux-user/i386/target_elf.h   | 2 +-
> >  linux-user/x86_64/target_elf.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> > index 1c6142e7da..238a9aba73 100644
> > --- a/linux-user/i386/target_elf.h
> > +++ b/linux-user/i386/target_elf.h
> > @@ -9,6 +9,6 @@
> >  #define I386_TARGET_ELF_H
> >  static inline const char *cpu_get_model(uint32_t eflags)
> >  {
> > -    return "qemu32";
> > +    return "max";
> >  }
> >  #endif
> > diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> > index 7b76a90de8..3f628f8d66 100644
> > --- a/linux-user/x86_64/target_elf.h
> > +++ b/linux-user/x86_64/target_elf.h
> > @@ -9,6 +9,6 @@
> >  #define X86_64_TARGET_ELF_H
> >  static inline const char *cpu_get_model(uint32_t eflags)
> >  {
> > -    return "qemu64";
> > +    return "max";
> >  }
> >  #endif
> 
> Can we be assured we won't ever hit this TCG bug that currently
> affects -cpu max ?
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1023
> 
> I'm going to guess we will be OK because qemu-user doesn't run a
> kernel and therefore wouldn't normally touch %cr3.  Is there any other
> situation?  (Of course it would be better all round if that glaring
> bug could be fixed.)

Yeah, the bug appears to be an interaction with the VM configuring
page tables, and since qemu-user is not doing that my guess it it
won't affect this usage. If we did want to be totally safe, we could
add -la57, since that feature flag is useless for user emulation
anyway.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


