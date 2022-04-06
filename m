Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294644F56D1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 09:27:33 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc04h-0001qM-M7
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 03:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc01Z-00019K-1L
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc01W-0001ox-9P
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649229853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kpvS7/vbukDDZgeD7ojth2eHCMjqtcHjeV93ECVKwA=;
 b=Hg0sjgu8itZTUpe9JGLgeUlZSX8aTS6VjVDuc4d9C4bQbY8hWAKzIzdCKc1nzvmNfdTjqb
 bxs/PYSfg7oB8bZkYE/gKAz239+XWQbHHJtDsQQZYRrCB5HcRbigzzrG7WNh0vW1PnA1Kh
 dvTXvzWfq0PQBYH1Ft7L5GF9v2Ue+o0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-Ec-8tcIiNXyn0NbsiwgyEg-1; Wed, 06 Apr 2022 03:24:12 -0400
X-MC-Unique: Ec-8tcIiNXyn0NbsiwgyEg-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2eb8c0ddcf6so14212857b3.10
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0kpvS7/vbukDDZgeD7ojth2eHCMjqtcHjeV93ECVKwA=;
 b=FIHrCC0HOn7DRCLAzKSZdp5ON2bMGrU5CO3KghM+l1auPePQh2xsGLYHI9UUZ7r3Mi
 wiNgyuVynSPgIc2CyUfdGAUtuVtO8Jm3ks9pWbPahOZMuwxaTPSH782DaBT/208MaIkQ
 S1UZejV4fev6bmhKiNP74gZDxK2hp4/O5FV0xwDUzd6r5mWGWDKqS7mUN+LkqxBRlezc
 0+vAZlWBsEwxxNMy7eeMcVwgOoAS0E1eJhI07SkXB4I9Q2zRZQKVxklWy66i1/EkexXp
 ExZgMKeCBbhMlufU7XMekCI8yq+IeSF0GvdhQK1UkdYgDO/uXIoEGI/1Zma2N5cqBFOM
 ca+g==
X-Gm-Message-State: AOAM530RqLapplZuygDaYzkHASMfQ9pA1Vwi6SLy/hEkTqmjcZiluegb
 rFzCNf0yVOd3+yY7j+RGX8s27UQAHPooKeyuGB28erCPEAtRSQFsTYF/m062ORTzOripSd2rP7H
 RmWDbFdyE6g63SOTp/DT+Ay3v/2V4wqo=
X-Received: by 2002:a81:6c89:0:b0:2e6:beec:2968 with SMTP id
 h131-20020a816c89000000b002e6beec2968mr6039876ywc.267.1649229851731; 
 Wed, 06 Apr 2022 00:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz70Npen1VSCKffIzxY9Xj/6xj/8HIuMpbzjQX2dykzjaBKBK8/QR+cnF5p/mBXoNz3SsuB4a29QZyNX/+kW8k=
X-Received: by 2002:a81:6c89:0:b0:2e6:beec:2968 with SMTP id
 h131-20020a816c89000000b002e6beec2968mr6039863ywc.267.1649229851512; Wed, 06
 Apr 2022 00:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
 <20220325195130.62090-2-viktor.prutyanov@redhat.com>
In-Reply-To: <20220325195130.62090-2-viktor.prutyanov@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 11:24:00 +0400
Message-ID: <CAMxuvay8oYDWQ8mhy0=_EdCGRGFu3D=eeUu9B4Rjva3s-JRFCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] include/qemu: rename Windows context definitions
 to expose bitness
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Vugenfirer, Yan" <yan@daynix.com>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>,
 viktor.prutyanov@phystech.edu, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 25, 2022 at 11:51 PM Viktor Prutyanov
<viktor.prutyanov@redhat.com> wrote:
>
> Context structure in 64-bit Windows differs from 32-bit one and it
> should be reflected in its name.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  contrib/elf2dmp/main.c       |  6 +++---
>  dump/win_dump.c              | 14 +++++++-------
>  include/qemu/win_dump_defs.h |  8 ++++----
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 20b477d582..b9fc6d230c 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -141,10 +141,10 @@ static KDDEBUGGER_DATA64 *get_kdbg(uint64_t KernBas=
e, struct pdb_reader *pdb,
>      return kdbg;
>  }
>
> -static void win_context_init_from_qemu_cpu_state(WinContext *ctx,
> +static void win_context_init_from_qemu_cpu_state(WinContext64 *ctx,
>          QEMUCPUState *s)
>  {
> -    WinContext win_ctx =3D (WinContext){
> +    WinContext64 win_ctx =3D (WinContext64){
>          .ContextFlags =3D WIN_CTX_X64 | WIN_CTX_INT | WIN_CTX_SEG | WIN_=
CTX_CTL,
>          .MxCsr =3D INITIAL_MXCSR,
>
> @@ -302,7 +302,7 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
>      for (i =3D 0; i < qe->state_nr; i++) {
>          uint64_t Prcb;
>          uint64_t Context;
> -        WinContext ctx;
> +        WinContext64 ctx;
>          QEMUCPUState *s =3D qe->state[i];
>
>          if (va_space_rw(vs, kdbg->KiProcessorBlock + sizeof(Prcb) * i,
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index c5eb5a9aac..29b6e4f670 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -189,7 +189,7 @@ try_again:
>  }
>
>  struct saved_context {
> -    WinContext ctx;
> +    WinContext64 ctx;
>      uint64_t addr;
>  };
>
> @@ -221,7 +221,7 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,
>          CPUX86State *env =3D &x86_cpu->env;
>          uint64_t Prcb;
>          uint64_t Context;
> -        WinContext ctx;
> +        WinContext64 ctx;
>
>          if (cpu_memory_rw_debug(first_cpu,
>                  KiProcessorBlock + i * sizeof(uint64_t),
> @@ -241,8 +241,8 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,
>
>          saved_ctx[i].addr =3D Context;
>
> -        ctx =3D (WinContext){
> -            .ContextFlags =3D WIN_CTX_ALL,
> +        ctx =3D (WinContext64){
> +            .ContextFlags =3D WIN_CTX64_ALL,
>              .MxCsr =3D env->mxcsr,
>
>              .SegEs =3D env->segs[0].selector,
> @@ -284,13 +284,13 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>          };
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 0)) {
> +                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 0)) =
{
>              error_setg(errp, "win-dump: failed to save CPU #%d context",=
 i);
>              return;
>          }
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                (uint8_t *)&ctx, sizeof(WinContext), 1)) {
> +                (uint8_t *)&ctx, sizeof(WinContext64), 1)) {
>              error_setg(errp, "win-dump: failed to write CPU #%d context"=
, i);
>              return;
>          }
> @@ -306,7 +306,7 @@ static void restore_context(WinDumpHeader64 *h,
>
>      for (i =3D 0; i < h->NumberProcessors; i++) {
>          if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
> -                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext), 1)) {
> +                (uint8_t *)&saved_ctx[i].ctx, sizeof(WinContext64), 1)) =
{
>              warn_report("win-dump: failed to restore CPU #%d context", i=
);
>          }
>      }
> diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
> index 145096e8ee..5a5e5a5e09 100644
> --- a/include/qemu/win_dump_defs.h
> +++ b/include/qemu/win_dump_defs.h
> @@ -97,8 +97,8 @@ typedef struct WinDumpHeader64 {
>  #define WIN_CTX_FP  0x00000008L
>  #define WIN_CTX_DBG 0x00000010L
>
> -#define WIN_CTX_FULL    (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_C=
TX_FP)
> -#define WIN_CTX_ALL     (WIN_CTX_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
> +#define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_C=
TX_FP)
> +#define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
>
>  #define LIVE_SYSTEM_DUMP    0x00000161
>
> @@ -107,7 +107,7 @@ typedef struct WinM128A {
>      int64_t high;
>  } QEMU_ALIGNED(16) WinM128A;
>
> -typedef struct WinContext {
> +typedef struct WinContext64 {
>      uint64_t PHome[6];
>
>      uint32_t ContextFlags;
> @@ -174,6 +174,6 @@ typedef struct WinContext {
>      uint64_t LastBranchFromRip;
>      uint64_t LastExceptionToRip;
>      uint64_t LastExceptionFromRip;
> -} QEMU_ALIGNED(16) WinContext;
> +} QEMU_ALIGNED(16) WinContext64;
>
>  #endif /* QEMU_WIN_DUMP_DEFS_H */
> --
> 2.35.1
>


