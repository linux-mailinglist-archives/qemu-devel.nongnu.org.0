Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B95A279B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:20:47 +0200 (CEST)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYKN-0003aA-0E
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oRY5W-00085Z-Bg
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1oRY5O-0006Jf-9T
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661515516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqVN2Mmv5mhPRtIa+ejBuyxah1mmL2j+Y9HGL5UDm0w=;
 b=YvjnQ7xNIaNEIV0PPcmdVF4xoHasTDwIrII8CyZLU+xU87JSiq7C92luiVsPlx+6tGaAu+
 wAw+FdbJYL+RYg81srDILvd+wkGdThH/Z3QSqr87V6ZDhhOeaKOfaUxle2lmPepTkjlckV
 OeUiIgnzcm5VDJ/QfR2GCpQlEb9mEew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-W-TU-fUNP0OhX7u8g5oSZw-1; Fri, 26 Aug 2022 08:05:15 -0400
X-MC-Unique: W-TU-fUNP0OhX7u8g5oSZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C83E7101A54E;
 Fri, 26 Aug 2022 12:05:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3244010D45;
 Fri, 26 Aug 2022 12:05:14 +0000 (UTC)
Date: Fri, 26 Aug 2022 13:05:13 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: use 'max' instead of 'qemu32' / 'qemu64' by
 defualt
Message-ID: <20220826120513.GA30245@redhat.com>
References: <20220826113900.794046-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220826113900.794046-1-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 26, 2022 at 12:39:00PM +0100, Daniel P. Berrangé wrote:
> The 'qemu64' CPU model implements the least featureful x86_64 CPU that's
> possible. Historically this hasn't been an issue since it was rare for
> OS distros to build with a higher mandatory CPU baseline.
> 
> With RHEL-9, however, the entire distro is built for the x86_64-v2 ABI
> baseline:
> 
>   https://developers.redhat.com/blog/2021/01/05/building-red-hat-enterprise-linux-9-for-the-x86-64-v2-microarchitecture-level
> 
> It is likely that other distros may take similar steps in the not too
> distant future. For example, it has been suggested for Fedora on a
> number of occassions.
> 
> This new baseline is not compatible with the qemu64 CPU model though.
> While it is possible to pass a '-cpu xxx' flag to qemu-x86_64, the
> usage of QEMU doesn't always allow for this. For example, the args
> are typically controlled via binfmt rules that the user has no ability
> to change. This impacts users who are trying to use podman on aarch64
> platforms, to run containers with x86_64 content. There's no arg to
> podman that can be used to change the qemu-x86_64 args, and a non-root
> user of podman can not change binfmt rules without elevating privileges:
> 
>   https://github.com/containers/podman/issues/15456#issuecomment-1228210973
> 
> Changing to the 'max' CPU model gives 'qemu-x86_64' maximum
> compatibility with binaries it is likely to encounter in the wild,
> and not likely to have a significant downside for existing usage.
> 
> Most other architectures already use an 'any' CPU model, which is
> often mapped to 'max' (or similar) already, rather than the oldest
> possible CPU model.
> 
> For the sake of consistency the 'i386' architecture is also changed
> from using 'qemu32' to 'max'.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  linux-user/i386/target_elf.h   | 2 +-
>  linux-user/x86_64/target_elf.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/i386/target_elf.h b/linux-user/i386/target_elf.h
> index 1c6142e7da..238a9aba73 100644
> --- a/linux-user/i386/target_elf.h
> +++ b/linux-user/i386/target_elf.h
> @@ -9,6 +9,6 @@
>  #define I386_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    return "qemu32";
> +    return "max";
>  }
>  #endif
> diff --git a/linux-user/x86_64/target_elf.h b/linux-user/x86_64/target_elf.h
> index 7b76a90de8..3f628f8d66 100644
> --- a/linux-user/x86_64/target_elf.h
> +++ b/linux-user/x86_64/target_elf.h
> @@ -9,6 +9,6 @@
>  #define X86_64_TARGET_ELF_H
>  static inline const char *cpu_get_model(uint32_t eflags)
>  {
> -    return "qemu64";
> +    return "max";
>  }
>  #endif

Can we be assured we won't ever hit this TCG bug that currently
affects -cpu max ?

https://gitlab.com/qemu-project/qemu/-/issues/1023

I'm going to guess we will be OK because qemu-user doesn't run a
kernel and therefore wouldn't normally touch %cr3.  Is there any other
situation?  (Of course it would be better all round if that glaring
bug could be fixed.)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


