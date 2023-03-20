Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D964F6C13F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:49:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFsO-0007KA-Ho; Mon, 20 Mar 2023 09:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFsJ-0007JV-TS
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:48:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peFsH-00064V-2K
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679320112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nB8jDRvF4InxzdYsKwDk5IU8RqNst0djb4nl+V9qIeY=;
 b=bIeutRX8Z3wfQo0zeakwGDXdKrRCxs+rJ9JMbvICrDeUf8Zd1uYmfF84IgEJAvPojIKw7+
 U45Kzx7KIjNy0YZ+nYjew5zr5z4cH7P4gbX6giL56pJak+KqdsZ6hoZ9mM/YwEsRGcaSv4
 /XohY1KQCC8JOwhnrzwlFx/eHaRqRvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-CV0XY9JSOlCYuAhr_QvM2g-1; Mon, 20 Mar 2023 09:48:28 -0400
X-MC-Unique: CV0XY9JSOlCYuAhr_QvM2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5DACD800B23;
 Mon, 20 Mar 2023 13:48:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 957E8C15BA0;
 Mon, 20 Mar 2023 13:48:21 +0000 (UTC)
Date: Mon, 20 Mar 2023 13:48:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH-for-8.1 4/5] bulk: Do not declare function prototypes
 using extern keyword
Message-ID: <ZBhkIjelEtR7lckj@redhat.com>
References: <20230320134219.22489-1-philmd@linaro.org>
 <20230320134219.22489-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320134219.22489-5-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Mar 20, 2023 at 02:42:18PM +0100, Philippe Mathieu-Daudé wrote:
> By default, C function prototypes declared in headers are visible,
> so there is no need to declare them as 'extern' functions.
> Remove this redundancy in a single bulk commit; do not modify:
> 
>   - meson.build (used to check function availability at runtime)
>   - pc-bios
>   - libdecnumber
>   - *.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  block/dmg.h                    |  8 +++----
>  bsd-user/bsd-file.h            |  6 ++---
>  crypto/hmacpriv.h              | 13 +++++------
>  hw/xen/xen_pt.h                |  8 +++----
>  include/crypto/secret_common.h | 14 +++++-------
>  include/exec/page-vary.h       |  4 ++--
>  include/hw/misc/aspeed_scu.h   |  2 +-
>  include/hw/nvram/npcm7xx_otp.h |  4 ++--
>  include/hw/qdev-core.h         |  4 ++--
>  include/qemu/crc-ccitt.h       |  4 ++--
>  include/qemu/osdep.h           |  2 +-
>  include/qemu/rcu.h             | 14 ++++++------
>  include/qemu/sys_membarrier.h  |  4 ++--
>  include/qemu/uri.h             |  6 ++---
>  include/sysemu/accel-blocker.h | 14 ++++++------
>  include/sysemu/os-win32.h      |  4 ++--
>  include/user/safe-syscall.h    |  4 ++--
>  target/i386/sev.h              |  6 ++---
>  target/mips/cpu.h              |  4 ++--
>  tcg/tcg-internal.h             |  4 ++--
>  tests/tcg/minilib/minilib.h    |  2 +-
>  include/exec/memory_ldst.h.inc | 42 +++++++++++++++++-----------------
>  roms/seabios                   |  2 +-

Accidental submodule commit.,

>  23 files changed, 84 insertions(+), 91 deletions(-)
> 
> diff --git a/block/dmg.h b/block/dmg.h
> index e488601b62..ed209b5dec 100644
> --- a/block/dmg.h
> +++ b/block/dmg.h
> @@ -51,10 +51,10 @@ typedef struct BDRVDMGState {
>      z_stream zstream;
>  } BDRVDMGState;
>  
> -extern int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> -                                 char *next_out, unsigned int avail_out);
> +int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> +                          char *next_out, unsigned int avail_out);
>  
> -extern int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> -                                   char *next_out, unsigned int avail_out);
> +int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> +                            char *next_out, unsigned int avail_out);

These are variable declarations, so with this change you'll get multiple
copies of the variable if this header is included from multiple source
files. IOW, the 'extern' usage is correct.

> diff --git a/roms/seabios b/roms/seabios
> index ea1b7a0733..3208b098f5 160000
> --- a/roms/seabios
> +++ b/roms/seabios
> @@ -1 +1 @@
> -Subproject commit ea1b7a0733906b8425d948ae94fba63c32b1d425
> +Subproject commit 3208b098f51a9ef96d0dfa71d5ec3a3eaec88f0a

Nope !

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


