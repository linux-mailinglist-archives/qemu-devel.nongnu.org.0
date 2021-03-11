Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D76333700A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:31:33 +0100 (CET)
Received: from localhost ([::1]:56854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIbM-0007mG-2O
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKIZT-0006Ob-Ew
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:29:36 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKIZR-0003Lb-Eb
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:29:35 -0500
Received: by mail-ed1-x52f.google.com with SMTP id x21so1968592eds.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 02:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ORFeneEHGs48NTJg807PvpgntpDDVsh1oL6ISMoy/HA=;
 b=gp/uwZqjadXK6p7DxmVkh7g+JfYnmPY/vWzgxsaYNXSY2QeZKynpbm6xHXdHTA9CbI
 snh/QcmvKBSkrqKgqy4SpS2O/1hsP/mL7cvkkFuVf4BFAGs18hehfS1Kpu6rFItJj1Hc
 +pcemWwborO3d5AIs9tPjpbvdxsVKOS4nPg2OJLhcKdflIUMMlWPdljZ6aupuh05OgJY
 EKOVUyLludxR1lv0Yw5v8j52u4PVTDITXf8Usleb8pAPg3zSx83wMODHc0rbESW8vCVp
 1tECK04iMIs6AKn6o3rD/Fh0o4dfW3SwGyh4vldNRKSmRYBqV2Y9BsR2tHRXrrdwm4tQ
 v9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ORFeneEHGs48NTJg807PvpgntpDDVsh1oL6ISMoy/HA=;
 b=P2jHn2H5l1JKIfH4UwVJHdhkGIUXPh10JUTjmbGP0nlonz39ipGitKTaC6d65hMcjS
 5R6DeLnpstorYcOgDIP5NQme7aMa3vk98YXJFSvLzmMO4zx8PYpJmd/HXtuuAyfF5GYS
 HSp0wM/vE5amnlNvFJd2pEqGmeNQUbBNUfWnDDbR7kvwSjMQQJsjJ3J/LMrlaQbJXnok
 S3Lhm0eBrHODm9fp31oDVymXqi3vjwuWVqhXSb2Sg4YGR9fDLqStx+bkFT7GWpIGTSAS
 qGKg4j5WYWCO2Yd3l02s0uRR1rANV7cbgNStcMX674N8zwQmQn70CDCfJGE88WM4F1kt
 ioXA==
X-Gm-Message-State: AOAM532gtDkkVUF7nGRpTxzziEHtd3alLcVakClro5k2eA7eUkXN4565
 5oGSB+t42IVLpvFzq3gPX10DrQ==
X-Google-Smtp-Source: ABdhPJzZ56GBp0wZVClprs3GueYACc2Y5r6k7nJSOxsdEffP/9U19gNAznl0Ckk4M+vgqvkTu+3Cag==
X-Received: by 2002:a05:6402:30a2:: with SMTP id
 df2mr7751945edb.29.1615458571692; 
 Thu, 11 Mar 2021 02:29:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm987999eds.66.2021.03.11.02.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 02:29:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 301E51FF7E;
 Thu, 11 Mar 2021 10:29:30 +0000 (GMT)
References: <20210309202802.211756-1-aaron@os.amperecomputing.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH v2] plugins: Expose physical addresses instead of device
 offsets
Date: Thu, 11 Mar 2021 10:29:24 +0000
In-reply-to: <20210309202802.211756-1-aaron@os.amperecomputing.com>
Message-ID: <87pn066l11.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, cota@braap.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> This allows plugins to query for full virtual-to-physical address
> translation for a given `qemu_plugin_hwaddr` and stops exposing the
> offset within the device itself. As this change breaks the API,
> QEMU_PLUGIN_VERSION is incremented.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>

Queued to plugins/next, thanks.

> ---
>  contrib/plugins/hotpages.c  |  2 +-
>  contrib/plugins/hwprofile.c |  2 +-
>  include/qemu/qemu-plugin.h  | 32 +++++++++++++++++++++++++-------
>  plugins/api.c               | 17 ++++++++++++-----
>  4 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/contrib/plugins/hotpages.c b/contrib/plugins/hotpages.c
> index eacc678eac..bf53267532 100644
> --- a/contrib/plugins/hotpages.c
> +++ b/contrib/plugins/hotpages.c
> @@ -122,7 +122,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_p=
lugin_meminfo_t meminfo,
>          }
>      } else {
>          if (hwaddr && !qemu_plugin_hwaddr_is_io(hwaddr)) {
> -            page =3D (uint64_t) qemu_plugin_hwaddr_device_offset(hwaddr);
> +            page =3D (uint64_t) qemu_plugin_hwaddr_phys_addr(hwaddr);
>          } else {
>              page =3D vaddr;
>          }
> diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
> index 6dac1d5f85..faf216ac00 100644
> --- a/contrib/plugins/hwprofile.c
> +++ b/contrib/plugins/hwprofile.c
> @@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_p=
lugin_meminfo_t meminfo,
>          return;
>      } else {
>          const char *name =3D qemu_plugin_hwaddr_device_name(hwaddr);
> -        uint64_t off =3D qemu_plugin_hwaddr_device_offset(hwaddr);
> +        uint64_t off =3D qemu_plugin_hwaddr_phys_addr(hwaddr);
>          bool is_write =3D qemu_plugin_mem_is_store(meminfo);
>          DeviceCounts *counts;
>=20=20
> diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
> index c66507fe8f..3303dce862 100644
> --- a/include/qemu/qemu-plugin.h
> +++ b/include/qemu/qemu-plugin.h
> @@ -47,7 +47,7 @@ typedef uint64_t qemu_plugin_id_t;
>=20=20
>  extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
>=20=20
> -#define QEMU_PLUGIN_VERSION 0
> +#define QEMU_PLUGIN_VERSION 1
>=20=20
>  typedef struct {
>      /* string describing architecture */
> @@ -307,8 +307,8 @@ bool qemu_plugin_mem_is_sign_extended(qemu_plugin_mem=
info_t info);
>  bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
>  bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
>=20=20
> -/*
> - * qemu_plugin_get_hwaddr():
> +/**
> + * qemu_plugin_get_hwaddr() - return handle for memory operation
>   * @vaddr: the virtual address of the memory operation
>   *
>   * For system emulation returns a qemu_plugin_hwaddr handle to query
> @@ -323,12 +323,30 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(q=
emu_plugin_meminfo_t info,
>                                                    uint64_t vaddr);
>=20=20
>  /*
> - * The following additional queries can be run on the hwaddr structure
> - * to return information about it. For non-IO accesses the device
> - * offset will be into the appropriate block of RAM.
> + * The following additional queries can be run on the hwaddr structure to
> + * return information about it - namely whether it is for an IO access a=
nd the
> + * physical address associated with the access.
> + */
> +
> +/**
> + * qemu_plugin_hwaddr_is_io() - query whether memory operation is IO
> + * @haddr: address handle from qemu_plugin_get_hwaddr()
> + *
> + * Returns true if the handle's memory operation is to memory-mapped IO,=
 or
> + * false if it is to RAM
>   */
>  bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
> -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwadd=
r *haddr);
> +
> +/**
> + * qemu_plugin_hwaddr_phys_addr() - query physical address for memory op=
eration
> + * @haddr: address handle from qemu_plugin_get_hwaddr()
> + *
> + * Returns the physical address associated with the memory operation
> + *
> + * Note that the returned physical address may not be unique if you are =
dealing
> + * with multiple address spaces.
> + */
> +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *h=
addr);
>=20=20
>  /*
>   * Returns a string representing the device. The string is valid for
> diff --git a/plugins/api.c b/plugins/api.c
> index 0b04380d57..3c7dc406e3 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -40,6 +40,7 @@
>  #include "sysemu/sysemu.h"
>  #include "tcg/tcg.h"
>  #include "exec/exec-all.h"
> +#include "exec/ram_addr.h"
>  #include "disas/disas.h"
>  #include "plugin.h"
>  #ifndef CONFIG_USER_ONLY
> @@ -298,19 +299,25 @@ bool qemu_plugin_hwaddr_is_io(const struct qemu_plu=
gin_hwaddr *haddr)
>  #endif
>  }
>=20=20
> -uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwadd=
r *haddr)
> +uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *h=
addr)
>  {
>  #ifdef CONFIG_SOFTMMU
>      if (haddr) {
>          if (!haddr->is_io) {
> -            ram_addr_t ram_addr =3D qemu_ram_addr_from_host((void *) had=
dr->v.ram.hostaddr);
> -            if (ram_addr =3D=3D RAM_ADDR_INVALID) {
> +            RAMBlock *block;
> +            ram_addr_t offset;
> +            void *hostaddr =3D (void *) haddr->v.ram.hostaddr;
> +
> +            block =3D qemu_ram_block_from_host(hostaddr, false, &offset);
> +            if (!block) {
>                  error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.h=
ostaddr);
>                  abort();
>              }
> -            return ram_addr;
> +
> +            return block->offset + offset + block->mr->addr;
>          } else {
> -            return haddr->v.io.offset;
> +            MemoryRegionSection *mrs =3D haddr->v.io.section;
> +            return haddr->v.io.offset + mrs->mr->addr;
>          }
>      }
>  #endif


--=20
Alex Benn=C3=A9e

