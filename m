Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C064F57B9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:17:18 +0200 (CEST)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0qr-0006LG-6e
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc0at-0004kR-UN
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:00:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc0ap-0003Bn-Hi
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 04:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649232042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTpQOTbERZsEe22psOCqWYY6v36CQmz7hySETkF/AXY=;
 b=K7ioz6nEJpR97EbiXrVb79Hjnp5xKj+UO2GOru/FN1heXFg7KZrSOBc5ShDes/56bBFBLd
 hierFpEs+vqGXnUJLJ35Q5q996rYN/Q9ccxfZfSDAx4CIKZEFXSqZnOLCZRFAVC9b7ZFDE
 jyRBEyq9eMkkWmmcmdb/BV2Rs88A4mI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-JegcvElZPm2VBrcBFqQpyw-1; Wed, 06 Apr 2022 04:00:41 -0400
X-MC-Unique: JegcvElZPm2VBrcBFqQpyw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2eb645be8dbso14736577b3.11
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 01:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aTpQOTbERZsEe22psOCqWYY6v36CQmz7hySETkF/AXY=;
 b=7BAsYuQx2ORESVLO2Im/cptL/gP5ABbx+ndraINeDFx1Co4yW8884lCfxim/IZyl1Q
 rH1BxhrCykg3G6nD72Ma7reGdXf/YKMb3sbpv/ERDOsNP2TeGsGKRLkB3mBkyEQ7rmse
 eYep8TDE+AK0LqDGPswUidlEJgRL+YYrHkM+0GP+7PgcbS1wbMuk7iR4ky3sKJ8MLm+S
 7BuYelOEaHoW6qgQw60JmH7PidylV+Kui9IREz0iPTOCxw5VR6TBU7qzy8CzdQYBX7rV
 M2m4XYwZIp/cswOGlJ9ZLlZEHg5JywXDuRksnnrtPKtDxgr1W1fiG36w+eXBmyPYByCC
 fqYw==
X-Gm-Message-State: AOAM531XPSIzvdqxmCKhCuX9pXD1eIbW3fjspaUG+F16DBJnh/v0Mn2r
 jCzYlKEXH+r9kmpGmtTuXeYHTPo/nShXhOqY0/7Fzpxy+ebiboV6RZj0teFqsQ/yw+1F/x2/iKm
 xC5K8BIkZQ7gPwcT62TWxB5XCy0iGG0Q=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr6242150ywn.33.1649232041145; 
 Wed, 06 Apr 2022 01:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/g+n4iO+tfgFCe4S4aOkaG1fX2eP+8OTUQeWgeYdAR6CFas0OjLW9Sis9Q0VS4vBRkVgBP1OWrEQyf6nauUo=
X-Received: by 2002:a81:fe01:0:b0:2e5:85ba:f316 with SMTP id
 j1-20020a81fe01000000b002e585baf316mr6242131ywn.33.1649232040804; Wed, 06 Apr
 2022 01:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
 <20220325195130.62090-5-viktor.prutyanov@redhat.com>
In-Reply-To: <20220325195130.62090-5-viktor.prutyanov@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 12:00:29 +0400
Message-ID: <CAMxuvaxV_EP+A5dLwuaiBxkXc8fQhNLmxCqL28q1EsnYamqW_g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dump/win_dump: add 32-bit guest Windows support
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

Hi

On Fri, Mar 25, 2022 at 11:51 PM Viktor Prutyanov
<viktor.prutyanov@redhat.com> wrote:
>
> Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
> dump header provided by guest through vmcoreinfo and thus was unable
> to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
> dumping support.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

lgtm,
you should update dump-guest-memory doc in hmp-commands.hx

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/win_dump.c | 245 +++++++++++++++++++++++++++++-------------------
>  1 file changed, 149 insertions(+), 96 deletions(-)
>
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index df3b432ca5..fda32da036 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -24,18 +24,24 @@
>  #include "hw/misc/vmcoreinfo.h"
>  #include "win_dump.h"
>
> -#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)
> +static size_t win_dump_ptr_size(bool x64)
> +{
> +    return x64 ? sizeof(uint64_t) : sizeof(uint32_t);
> +}
>
> -#define _WIN_DUMP_FIELD(f) (h->f)
> +#define _WIN_DUMP_FIELD(f) (x64 ? h->x64.f : h->x32.f)
>  #define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)
>
> -#define _WIN_DUMP_FIELD_PTR(f) ((void *)&h->f)
> +#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&h->x64.f : (void *)&h->x3=
2.f)
>  #define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
>
> -#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
> +#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h->x64.f) : sizeof(h->x32.=
f))
>  #define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)
>
> -#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)
> +static size_t win_dump_ctx_size(bool x64)
> +{
> +    return x64 ? sizeof(WinContext64) : sizeof(WinContext32);
> +}
>
>  static size_t write_run(uint64_t base_page, uint64_t page_count,
>          int fd, Error **errp)
> @@ -71,7 +77,7 @@ static size_t write_run(uint64_t base_page, uint64_t pa=
ge_count,
>      return total;
>  }
>
> -static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
> +static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error *=
*errp)
>  {
>      uint64_t BasePage, PageCount;
>      Error *local_err =3D NULL;
> @@ -88,22 +94,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 =
*h, Error **errp)
>      }
>  }
>
> -static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)
> +static int cpu_read_ptr(bool x64, CPUState *cpu, uint64_t addr, uint64_t=
 *ptr)
>  {
>      int ret;
> +    uint32_t ptr32;
>      uint64_t ptr64;
>
> -    ret =3D cpu_memory_rw_debug(cpu, addr, &ptr64, WIN_DUMP_PTR_SIZE, 0)=
;
> +    ret =3D cpu_memory_rw_debug(cpu, addr, x64 ? (void *)&ptr64 : (void =
*)&ptr32,
> +            win_dump_ptr_size(x64), 0);
>
> -    *ptr =3D ptr64;
> +    *ptr =3D x64 ? ptr64 : ptr32;
>
>      return ret;
>  }
>
> -static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
> +static void patch_mm_pfn_database(WinDumpHeader *h, bool x64, Error **er=
rp)
>  {
>      if (cpu_memory_rw_debug(first_cpu,
> -            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_O=
FFSET64,
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_MM_PFN_DATABASE_O=
FFSET,
>              WIN_DUMP_FIELD_PTR(PfnDatabase),
>              WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
>          error_setg(errp, "win-dump: failed to read MmPfnDatabase");
> @@ -111,13 +119,12 @@ static void patch_mm_pfn_database(WinDumpHeader64 *=
h, Error **errp)
>      }
>  }
>
> -static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)
> +static void patch_bugcheck_data(WinDumpHeader *h, bool x64, Error **errp=
)
>  {
>      uint64_t KiBugcheckData;
>
> -    if (cpu_read_ptr(first_cpu,
> -            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
> -                KDBG_KI_BUGCHECK_DATA_OFFSET64,
> +    if (cpu_read_ptr(x64, first_cpu,
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) + KDBG_KI_BUGCHECK_DATA_=
OFFSET,
>              &KiBugcheckData)) {
>          error_setg(errp, "win-dump: failed to read KiBugcheckData");
>          return;
> @@ -142,30 +149,34 @@ static void patch_bugcheck_data(WinDumpHeader64 *h,=
 Error **errp)
>  /*
>   * This routine tries to correct mistakes in crashdump header.
>   */
> -static void patch_header(WinDumpHeader64 *h)
> +static void patch_header(WinDumpHeader *h, bool x64)
>  {
>      Error *local_err =3D NULL;
>
> -    h->RequiredDumpSpace =3D sizeof(WinDumpHeader64) +
> -            (h->PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BITS);
> -    h->PhysicalMemoryBlock.unused =3D 0;
> -    h->unused1 =3D 0;
> +    if (x64) {
> +        h->x64.RequiredDumpSpace =3D sizeof(WinDumpHeader64) +
> +            (h->x64.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BIT=
S);
> +        h->x64.PhysicalMemoryBlock.unused =3D 0;
> +        h->x64.unused1 =3D 0;
> +    } else {
> +        h->x32.RequiredDumpSpace =3D sizeof(WinDumpHeader32) +
> +            (h->x32.PhysicalMemoryBlock.NumberOfPages << TARGET_PAGE_BIT=
S);
> +    }
>
> -    patch_mm_pfn_database(h, &local_err);
> +    patch_mm_pfn_database(h, x64, &local_err);
>      if (local_err) {
>          warn_report_err(local_err);
>          local_err =3D NULL;
>      }
> -    patch_bugcheck_data(h, &local_err);
> +    patch_bugcheck_data(h, x64, &local_err);
>      if (local_err) {
>          warn_report_err(local_err);
>      }
>  }
>
> -static void check_header(WinDumpHeader64 *h, Error **errp)
> +static void check_header(WinDumpHeader *h, bool *x64, Error **errp)
>  {
>      const char Signature[] =3D "PAGE";
> -    const char ValidDump[] =3D "DU64";
>
>      if (memcmp(h->Signature, Signature, sizeof(h->Signature))) {
>          error_setg(errp, "win-dump: invalid header, expected '%.4s',"
> @@ -173,14 +184,17 @@ static void check_header(WinDumpHeader64 *h, Error =
**errp)
>          return;
>      }
>
> -    if (memcmp(h->ValidDump, ValidDump, sizeof(h->ValidDump))) {
> -        error_setg(errp, "win-dump: invalid header, expected '%.4s',"
> -                         " got '%.4s'", ValidDump, h->ValidDump);
> -        return;
> +    if (!memcmp(h->ValidDump, "DUMP", sizeof(h->ValidDump))) {
> +        *x64 =3D false;
> +    } else if (!memcmp(h->ValidDump, "DU64", sizeof(h->ValidDump))) {
> +        *x64 =3D true;
> +    } else {
> +        error_setg(errp, "win-dump: invalid header, expected 'DUMP' or '=
DU64',"
> +                         " got '%.4s'", h->ValidDump);
>      }
>  }
>
> -static void check_kdbg(WinDumpHeader64 *h, Error **errp)
> +static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)
>  {
>      const char OwnerTag[] =3D "KDBG";
>      char read_OwnerTag[4];
> @@ -189,7 +203,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **er=
rp)
>
>  try_again:
>      if (cpu_memory_rw_debug(first_cpu,
> -            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET64,
> +            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET,
>              (uint8_t *)&read_OwnerTag, sizeof(read_OwnerTag), 0)) {
>          error_setg(errp, "win-dump: failed to read OwnerTag");
>          return;
> @@ -214,15 +228,19 @@ try_again:
>          }
>      }
>
> -    h->KdDebuggerDataBlock =3D KdDebuggerDataBlock;
> +    if (x64) {
> +        h->x64.KdDebuggerDataBlock =3D KdDebuggerDataBlock;
> +    } else {
> +        h->x32.KdDebuggerDataBlock =3D KdDebuggerDataBlock;
> +    }
>  }
>
>  struct saved_context {
> -    WinContext64 ctx;
> +    WinContext ctx;
>      uint64_t addr;
>  };
>
> -static void patch_and_save_context(WinDumpHeader64 *h,
> +static void patch_and_save_context(WinDumpHeader *h, bool x64,
>                                     struct saved_context *saved_ctx,
>                                     Error **errp)
>  {
> @@ -232,15 +250,15 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>      CPUState *cpu;
>      int i =3D 0;
>
> -    if (cpu_read_ptr(first_cpu,
> -            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET64,
> +    if (cpu_read_ptr(x64, first_cpu,
> +            KdDebuggerDataBlock + KDBG_KI_PROCESSOR_BLOCK_OFFSET,
>              &KiProcessorBlock)) {
>          error_setg(errp, "win-dump: failed to read KiProcessorBlock");
>          return;
>      }
>
>      if (cpu_memory_rw_debug(first_cpu,
> -            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET64,
> +            KdDebuggerDataBlock + KDBG_OFFSET_PRCB_CONTEXT_OFFSET,
>              (uint8_t *)&OffsetPrcbContext, sizeof(OffsetPrcbContext), 0)=
) {
>          error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
>          return;
> @@ -251,17 +269,17 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>          CPUX86State *env =3D &x86_cpu->env;
>          uint64_t Prcb;
>          uint64_t Context;
> -        WinContext64 ctx;
> +        WinContext ctx;
>
> -        if (cpu_read_ptr(first_cpu,
> -                KiProcessorBlock + i * WIN_DUMP_PTR_SIZE,
> +        if (cpu_read_ptr(x64, first_cpu,
> +                KiProcessorBlock + i * win_dump_ptr_size(x64),
>                  &Prcb)) {
>              error_setg(errp, "win-dump: failed to read"
>                               " CPU #%d PRCB location", i);
>              return;
>          }
>
> -        if (cpu_read_ptr(first_cpu,
> +        if (cpu_read_ptr(x64, first_cpu,
>                  Prcb + OffsetPrcbContext,
>                  &Context)) {
>              error_setg(errp, "win-dump: failed to read"
> @@ -271,56 +289,88 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>
>          saved_ctx[i].addr =3D Context;
>
> -        ctx =3D (WinContext64){
> -            .ContextFlags =3D WIN_CTX64_ALL,
> -            .MxCsr =3D env->mxcsr,
> -
> -            .SegEs =3D env->segs[0].selector,
> -            .SegCs =3D env->segs[1].selector,
> -            .SegSs =3D env->segs[2].selector,
> -            .SegDs =3D env->segs[3].selector,
> -            .SegFs =3D env->segs[4].selector,
> -            .SegGs =3D env->segs[5].selector,
> -            .EFlags =3D cpu_compute_eflags(env),
> -
> -            .Dr0 =3D env->dr[0],
> -            .Dr1 =3D env->dr[1],
> -            .Dr2 =3D env->dr[2],
> -            .Dr3 =3D env->dr[3],
> -            .Dr6 =3D env->dr[6],
> -            .Dr7 =3D env->dr[7],
> -
> -            .Rax =3D env->regs[R_EAX],
> -            .Rbx =3D env->regs[R_EBX],
> -            .Rcx =3D env->regs[R_ECX],
> -            .Rdx =3D env->regs[R_EDX],
> -            .Rsp =3D env->regs[R_ESP],
> -            .Rbp =3D env->regs[R_EBP],
> -            .Rsi =3D env->regs[R_ESI],
> -            .Rdi =3D env->regs[R_EDI],
> -            .R8  =3D env->regs[8],
> -            .R9  =3D env->regs[9],
> -            .R10 =3D env->regs[10],
> -            .R11 =3D env->regs[11],
> -            .R12 =3D env->regs[12],
> -            .R13 =3D env->regs[13],
> -            .R14 =3D env->regs[14],
> -            .R15 =3D env->regs[15],
> -
> -            .Rip =3D env->eip,
> -            .FltSave =3D {
> +        if (x64) {
> +            ctx.x64 =3D (WinContext64){
> +                .ContextFlags =3D WIN_CTX64_ALL,
>                  .MxCsr =3D env->mxcsr,
> -            },
> -        };
> +
> +                .SegEs =3D env->segs[0].selector,
> +                .SegCs =3D env->segs[1].selector,
> +                .SegSs =3D env->segs[2].selector,
> +                .SegDs =3D env->segs[3].selector,
> +                .SegFs =3D env->segs[4].selector,
> +                .SegGs =3D env->segs[5].selector,
> +                .EFlags =3D cpu_compute_eflags(env),
> +
> +                .Dr0 =3D env->dr[0],
> +                .Dr1 =3D env->dr[1],
> +                .Dr2 =3D env->dr[2],
> +                .Dr3 =3D env->dr[3],
> +                .Dr6 =3D env->dr[6],
> +                .Dr7 =3D env->dr[7],
> +
> +                .Rax =3D env->regs[R_EAX],
> +                .Rbx =3D env->regs[R_EBX],
> +                .Rcx =3D env->regs[R_ECX],
> +                .Rdx =3D env->regs[R_EDX],
> +                .Rsp =3D env->regs[R_ESP],
> +                .Rbp =3D env->regs[R_EBP],
> +                .Rsi =3D env->regs[R_ESI],
> +                .Rdi =3D env->regs[R_EDI],
> +                .R8  =3D env->regs[8],
> +                .R9  =3D env->regs[9],
> +                .R10 =3D env->regs[10],
> +                .R11 =3D env->regs[11],
> +                .R12 =3D env->regs[12],
> +                .R13 =3D env->regs[13],
> +                .R14 =3D env->regs[14],
> +                .R15 =3D env->regs[15],
> +
> +                .Rip =3D env->eip,
> +                .FltSave =3D {
> +                    .MxCsr =3D env->mxcsr,
> +                },
> +            };
> +        } else {
> +            ctx.x32 =3D (WinContext32){
> +                .ContextFlags =3D WIN_CTX32_FULL | WIN_CTX_DBG,
> +
> +                .SegEs =3D env->segs[0].selector,
> +                .SegCs =3D env->segs[1].selector,
> +                .SegSs =3D env->segs[2].selector,
> +                .SegDs =3D env->segs[3].selector,
> +                .SegFs =3D env->segs[4].selector,
> +                .SegGs =3D env->segs[5].selector,
> +                .EFlags =3D cpu_compute_eflags(env),
> +
> +                .Dr0 =3D env->dr[0],
> +                .Dr1 =3D env->dr[1],
> +                .Dr2 =3D env->dr[2],
> +                .Dr3 =3D env->dr[3],
> +                .Dr6 =3D env->dr[6],
> +                .Dr7 =3D env->dr[7],
> +
> +                .Eax =3D env->regs[R_EAX],
> +                .Ebx =3D env->regs[R_EBX],
> +                .Ecx =3D env->regs[R_ECX],
> +                .Edx =3D env->regs[R_EDX],
> +                .Esp =3D env->regs[R_ESP],
> +                .Ebp =3D env->regs[R_EBP],
> +                .Esi =3D env->regs[R_ESI],
> +                .Edi =3D env->regs[R_EDI],
> +
> +                .Eip =3D env->eip,
> +            };
> +        }
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 0)) {
> +                &saved_ctx[i].ctx, win_dump_ctx_size(x64), 0)) {
>              error_setg(errp, "win-dump: failed to save CPU #%d context",=
 i);
>              return;
>          }
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                &ctx, WIN_DUMP_CTX_SIZE, 1)) {
> +                &ctx, win_dump_ctx_size(x64), 1)) {
>              error_setg(errp, "win-dump: failed to write CPU #%d context"=
, i);
>              return;
>          }
> @@ -329,14 +379,14 @@ static void patch_and_save_context(WinDumpHeader64 =
*h,
>      }
>  }
>
> -static void restore_context(WinDumpHeader64 *h,
> +static void restore_context(WinDumpHeader *h, bool x64,
>                              struct saved_context *saved_ctx)
>  {
>      int i;
>
>      for (i =3D 0; i < WIN_DUMP_FIELD(NumberProcessors); i++) {
>          if (cpu_memory_rw_debug(first_cpu, saved_ctx[i].addr,
> -                &saved_ctx[i].ctx, WIN_DUMP_CTX_SIZE, 1)) {
> +                &saved_ctx[i].ctx, win_dump_ctx_size(x64), 1)) {
>              warn_report("win-dump: failed to restore CPU #%d context", i=
);
>          }
>      }
> @@ -344,25 +394,28 @@ static void restore_context(WinDumpHeader64 *h,
>
>  void create_win_dump(DumpState *s, Error **errp)
>  {
> -    WinDumpHeader64 *h =3D (WinDumpHeader64 *)(s->guest_note +
> -            VMCOREINFO_ELF_NOTE_HDR_SIZE);
> +    WinDumpHeader *h =3D (void *)(s->guest_note + VMCOREINFO_ELF_NOTE_HD=
R_SIZE);
>      X86CPU *first_x86_cpu =3D X86_CPU(first_cpu);
>      uint64_t saved_cr3 =3D first_x86_cpu->env.cr[3];
>      struct saved_context *saved_ctx =3D NULL;
>      Error *local_err =3D NULL;
> +    bool x64;
> +    size_t hdr_size;
>
> -    if (s->guest_note_size !=3D sizeof(WinDumpHeader64) +
> -            VMCOREINFO_ELF_NOTE_HDR_SIZE) {
> +    if (s->guest_note_size !=3D VMCOREINFO_WIN_DUMP_NOTE_SIZE32 &&
> +            s->guest_note_size !=3D VMCOREINFO_WIN_DUMP_NOTE_SIZE64) {
>          error_setg(errp, "win-dump: invalid vmcoreinfo note size");
>          return;
>      }
>
> -    check_header(h, &local_err);
> +    check_header(h, &x64, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          return;
>      }
>
> +    hdr_size =3D x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32)=
;
> +
>      /*
>       * Further access to kernel structures by virtual addresses
>       * should be made from system context.
> @@ -370,13 +423,13 @@ void create_win_dump(DumpState *s, Error **errp)
>
>      first_x86_cpu->env.cr[3] =3D WIN_DUMP_FIELD(DirectoryTableBase);
>
> -    check_kdbg(h, &local_err);
> +    check_kdbg(h, x64, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          goto out_cr3;
>      }
>
> -    patch_header(h);
> +    patch_header(h, x64);
>
>      saved_ctx =3D g_new(struct saved_context, WIN_DUMP_FIELD(NumberProce=
ssors));
>
> @@ -385,7 +438,7 @@ void create_win_dump(DumpState *s, Error **errp)
>       * to determine if the system-saved context is valid
>       */
>
> -    patch_and_save_context(h, saved_ctx, &local_err);
> +    patch_and_save_context(h, x64, saved_ctx, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          goto out_free;
> @@ -393,20 +446,20 @@ void create_win_dump(DumpState *s, Error **errp)
>
>      s->total_size =3D WIN_DUMP_FIELD(RequiredDumpSpace);
>
> -    s->written_size =3D qemu_write_full(s->fd, h, sizeof(*h));
> -    if (s->written_size !=3D sizeof(*h)) {
> +    s->written_size =3D qemu_write_full(s->fd, h, hdr_size);
> +    if (s->written_size !=3D hdr_size) {
>          error_setg(errp, QERR_IO_ERROR);
>          goto out_restore;
>      }
>
> -    write_runs(s, h, &local_err);
> +    write_runs(s, h, x64, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          goto out_restore;
>      }
>
>  out_restore:
> -    restore_context(h, saved_ctx);
> +    restore_context(h, x64, saved_ctx);
>  out_free:
>      g_free(saved_ctx);
>  out_cr3:
> --
> 2.35.1
>


