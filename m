Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558A50A24E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:28:19 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXn8-00023r-26
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhXLN-0003Kh-Ek
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:59:37 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:37800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhXLJ-0007S4-NZ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:59:36 -0400
Received: by mail-qv1-xf30.google.com with SMTP id d9so3715803qvm.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vshcfHDhBPWDVqK4NTAFnuxthu25cBEV4n1L3ocstfA=;
 b=MHxb4rNMzNdPXJo09vH/qh5TbN9mNB7UdkiOywImdXJfPw3uprBpbFv65i3HTKFZ1I
 rtodbDBBZanPLVuJZnH1sjjYCWLTBuRbCAmmnZf8OX63rG7gUM5DHH/w2wpEgq8HQ6tV
 SOkn8RKFAOx+nHa9ckdl5nUHnz7K92qBCNaPPhBAWaAlhsVpS1ywbDW0Zmk4nprH2ySr
 ipB12ai/kKUUizJAAY8eON1bZKWbao0ipWiUzupUCYiZPJjQMiDDmsZNlBioTsxZrwL0
 1TxUXY8cG29lUg7nFWa0RQunCipPn86f2E4mABSz0CneCErgZA5WFprGnFYMafSfo/bk
 6q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vshcfHDhBPWDVqK4NTAFnuxthu25cBEV4n1L3ocstfA=;
 b=c9EdIlMEMnmT7PsNqLZ+cDCYmFNYyAaB8raiCx3nCCugvfTnV35rEZujOBJhwSKLyP
 n6FtH1rzzfdEGS/pMuaMSKFWdxF4zeDA8WRi37Ta2sYkD+HbW+2/rFwnN/FOMkF1ZYEU
 2HxBZjg+FpvwhZYJgzWU2DxxW4/RlUp65u/vvY2SHtbHzmXsy/ZBet5Sjdayy5W5d9wv
 26pQqYnuCWEMAI6RfKarcfyNatodon9iW8gkfJkmmPwbCaXNMxz8Rb73ZpEcJrcbxZ3k
 GAKRr7cBizAgt1bhkPadiQk+1RUc8z25Xc6Y6jrT3C9XdyFsn5OhDN4lrFZGMu3AgQ1k
 S35g==
X-Gm-Message-State: AOAM531S2nstEtdNygKWs3qtinvckV9R/nc+3+cyGlFMeJ2htD0CSwEU
 mXu9KDvtNV4uqmaaOC/x2nf3D/XAmLvmSoMnIdikyrZyvJLw/A==
X-Google-Smtp-Source: ABdhPJz7LK8lxfK5WZ234hZvmaMk4HfHfZhN6pEFe58+U4f24wAppEg34qsuyvsjVjiPFj/0JHvYkHLjQF1g/O3VuvQ=
X-Received: by 2002:a05:6214:1c8f:b0:443:8505:14b3 with SMTP id
 ib15-20020a0562141c8f00b00443850514b3mr19774945qvb.7.1650549571501; Thu, 21
 Apr 2022 06:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220421124835.2831856-1-marcandre.lureau@redhat.com>
 <20220421124835.2831856-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220421124835.2831856-14-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 21 Apr 2022 17:59:18 +0400
Message-ID: <CAJ+F1CLcQ1x0L9v8UcxL+_6bRC9pVMxAK72i4ekgx5O_cnasdQ@mail.gmail.com>
Subject: Re: [PULL 13/13] dump/win_dump: add 32-bit guest Windows support
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e4c36005dd2a8451"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: viktor.prutyanov@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e4c36005dd2a8451
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 5:08 PM <marcandre.lureau@redhat.com> wrote:

> From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
>
> Before this patch, 'dump-guest-memory -w' was accepting only 64-bit
> dump header provided by guest through vmcoreinfo and thus was unable
> to produce 32-bit guest Windows dump. So, add 32-bit guest Windows
> dumping support.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20220406171558.199263-5-viktor.prutyanov@redhat.com>
> ---
>  dump/win_dump.c | 245 +++++++++++++++++++++++++++++-------------------
>  hmp-commands.hx |   2 +-
>  2 files changed, 150 insertions(+), 97 deletions(-)
>
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index d733918038b2..ba508790bcea 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -23,18 +23,24 @@
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
> +#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&h->x64.f : (void
> *)&h->x32.f)
>  #define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)
>
> -#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h->f)
> +#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h->x64.f) :
> sizeof(h->x32.f))
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
> @@ -70,7 +76,7 @@ static size_t write_run(uint64_t base_page, uint64_t
> page_count,
>      return total;
>  }
>
> -static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)
> +static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error
> **errp)
>  {
>      uint64_t BasePage, PageCount;
>      Error *local_err =3D NULL;
> @@ -87,22 +93,24 @@ static void write_runs(DumpState *s, WinDumpHeader64
> *h, Error **errp)
>      }
>  }
>
> -static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)
> +static int cpu_read_ptr(bool x64, CPUState *cpu, uint64_t addr, uint64_t
> *ptr)
>  {
>      int ret;
> +    uint32_t ptr32;
>      uint64_t ptr64;
>
> -    ret =3D cpu_memory_rw_debug(cpu, addr, &ptr64, WIN_DUMP_PTR_SIZE, 0)=
;
> +    ret =3D cpu_memory_rw_debug(cpu, addr, x64 ? (void *)&ptr64 : (void
> *)&ptr32,
> +            win_dump_ptr_size(x64), 0);
>
> -    *ptr =3D ptr64;
> +    *ptr =3D x64 ? ptr64 : ptr32;
>
>      return ret;
>  }
>
> -static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)
> +static void patch_mm_pfn_database(WinDumpHeader *h, bool x64, Error
> **errp)
>  {
>      if (cpu_memory_rw_debug(first_cpu,
> -            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
> KDBG_MM_PFN_DATABASE_OFFSET64,
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
> KDBG_MM_PFN_DATABASE_OFFSET,
>              WIN_DUMP_FIELD_PTR(PfnDatabase),
>              WIN_DUMP_FIELD_SIZE(PfnDatabase), 0)) {
>          error_setg(errp, "win-dump: failed to read MmPfnDatabase");
> @@ -110,13 +118,12 @@ static void patch_mm_pfn_database(WinDumpHeader64
> *h, Error **errp)
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
> +            WIN_DUMP_FIELD(KdDebuggerDataBlock) +
> KDBG_KI_BUGCHECK_DATA_OFFSET,
>              &KiBugcheckData)) {
>          error_setg(errp, "win-dump: failed to read KiBugcheckData");
>          return;
> @@ -141,30 +148,34 @@ static void patch_bugcheck_data(WinDumpHeader64 *h,
> Error **errp)
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
> +            (h->x64.PhysicalMemoryBlock.NumberOfPages <<
> TARGET_PAGE_BITS);
> +        h->x64.PhysicalMemoryBlock.unused =3D 0;
> +        h->x64.unused1 =3D 0;
> +    } else {
> +        h->x32.RequiredDumpSpace =3D sizeof(WinDumpHeader32) +
> +            (h->x32.PhysicalMemoryBlock.NumberOfPages <<
> TARGET_PAGE_BITS);
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
> @@ -172,14 +183,17 @@ static void check_header(WinDumpHeader64 *h, Error
> **errp)
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
> +        error_setg(errp, "win-dump: invalid header, expected 'DUMP' or
> 'DU64',"
> +                         " got '%.4s'", h->ValidDump);
>      }
>  }
>
> -static void check_kdbg(WinDumpHeader64 *h, Error **errp)
> +static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)
>  {
>      const char OwnerTag[] =3D "KDBG";
>      char read_OwnerTag[4];
> @@ -188,7 +202,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error
> **errp)
>
>  try_again:
>      if (cpu_memory_rw_debug(first_cpu,
> -            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET64,
> +            KdDebuggerDataBlock + KDBG_OWNER_TAG_OFFSET,
>              (uint8_t *)&read_OwnerTag, sizeof(read_OwnerTag), 0)) {
>          error_setg(errp, "win-dump: failed to read OwnerTag");
>          return;
> @@ -213,15 +227,19 @@ try_again:
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
> @@ -231,15 +249,15 @@ static void patch_and_save_context(WinDumpHeader64
> *h,
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
)
> {
>          error_setg(errp, "win-dump: failed to read OffsetPrcbContext");
>          return;
> @@ -250,17 +268,17 @@ static void patch_and_save_context(WinDumpHeader64
> *h,
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
> @@ -270,56 +288,88 @@ static void patch_and_save_context(WinDumpHeader64
> *h,
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
>              error_setg(errp, "win-dump: failed to save CPU #%d context",
> i);
>              return;
>          }
>
>          if (cpu_memory_rw_debug(first_cpu, Context,
> -                &ctx, WIN_DUMP_CTX_SIZE, 1)) {
> +                &ctx, win_dump_ctx_size(x64), 1)) {
>              error_setg(errp, "win-dump: failed to write CPU #%d context"=
,
> i);
>              return;
>          }
> @@ -328,14 +378,14 @@ static void patch_and_save_context(WinDumpHeader64
> *h,
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
> @@ -343,25 +393,28 @@ static void restore_context(WinDumpHeader64 *h,
>
>  void create_win_dump(DumpState *s, Error **errp)
>  {
> -    WinDumpHeader64 *h =3D (WinDumpHeader64 *)(s->guest_note +
> -            VMCOREINFO_ELF_NOTE_HDR_SIZE);
> +    WinDumpHeader *h =3D (void *)(s->guest_note +
> VMCOREINFO_ELF_NOTE_HDR_SIZE);
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
>

The compiler is not smart enough here:
../dump/win_dump.c:416:46: error: 'x64' may be used uninitialized in this
function [-Werror=3Dmaybe-uninitialized]
hdr_size =3D x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);

I'll simply initialize the variable to true by default.

+
>      /*
>       * Further access to kernel structures by virtual addresses
>       * should be made from system context.
> @@ -369,13 +422,13 @@ void create_win_dump(DumpState *s, Error **errp)
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
>      saved_ctx =3D g_new(struct saved_context,
> WIN_DUMP_FIELD(NumberProcessors));
>
> @@ -384,7 +437,7 @@ void create_win_dump(DumpState *s, Error **errp)
>       * to determine if the system-saved context is valid
>       */
>
> -    patch_and_save_context(h, saved_ctx, &local_err);
> +    patch_and_save_context(h, x64, saved_ctx, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
>          goto out_free;
> @@ -392,20 +445,20 @@ void create_win_dump(DumpState *s, Error **errp)
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
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9c9..dd4006d3558a 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1064,7 +1064,7 @@ ERST
>                        "-l: dump in kdump-compressed format, with lzo
> compression.\n\t\t\t"
>                        "-s: dump in kdump-compressed format, with snappy
> compression.\n\t\t\t"
>                        "-w: dump in Windows crashdump format (can be used
> instead of ELF-dump converting),\n\t\t\t"
> -                      "    for Windows x64 guests with vmcoreinfo driver
> only.\n\t\t\t"
> +                      "    for Windows x86 and x64 guests with vmcoreinf=
o
> driver only.\n\t\t\t"
>                        "begin: the starting physical address.\n\t\t\t"
>                        "length: the memory size, in bytes.",
>          .cmd        =3D hmp_dump_guest_memory,
> --
> 2.35.1.693.g805e0a68082a
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e4c36005dd2a8451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 21, 2022 at 5:08 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Viktor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@redhat.com" tar=
get=3D"_blank">viktor.prutyanov@redhat.com</a>&gt;<br>
<br>
Before this patch, &#39;dump-guest-memory -w&#39; was accepting only 64-bit=
<br>
dump header provided by guest through vmcoreinfo and thus was unable<br>
to produce 32-bit guest Windows dump. So, add 32-bit guest Windows<br>
dumping support.<br>
<br>
Signed-off-by: Viktor Prutyanov &lt;<a href=3D"mailto:viktor.prutyanov@redh=
at.com" target=3D"_blank">viktor.prutyanov@redhat.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220406171558.199263-5-viktor.prutyanov@=
redhat.com" target=3D"_blank">20220406171558.199263-5-viktor.prutyanov@redh=
at.com</a>&gt;<br>
---<br>
=C2=A0dump/win_dump.c | 245 +++++++++++++++++++++++++++++------------------=
-<br>
=C2=A0hmp-commands.hx |=C2=A0 =C2=A02 +-<br>
=C2=A02 files changed, 150 insertions(+), 97 deletions(-)<br>
<br>
diff --git a/dump/win_dump.c b/dump/win_dump.c<br>
index d733918038b2..ba508790bcea 100644<br>
--- a/dump/win_dump.c<br>
+++ b/dump/win_dump.c<br>
@@ -23,18 +23,24 @@<br>
=C2=A0#include &quot;hw/misc/vmcoreinfo.h&quot;<br>
=C2=A0#include &quot;win_dump.h&quot;<br>
<br>
-#define WIN_DUMP_PTR_SIZE sizeof(uint64_t)<br>
+static size_t win_dump_ptr_size(bool x64)<br>
+{<br>
+=C2=A0 =C2=A0 return x64 ? sizeof(uint64_t) : sizeof(uint32_t);<br>
+}<br>
<br>
-#define _WIN_DUMP_FIELD(f) (h-&gt;f)<br>
+#define _WIN_DUMP_FIELD(f) (x64 ? h-&gt;x64.f : h-&gt;x32.f)<br>
=C2=A0#define WIN_DUMP_FIELD(field) _WIN_DUMP_FIELD(field)<br>
<br>
-#define _WIN_DUMP_FIELD_PTR(f) ((void *)&amp;h-&gt;f)<br>
+#define _WIN_DUMP_FIELD_PTR(f) (x64 ? (void *)&amp;h-&gt;x64.f : (void *)&=
amp;h-&gt;x32.f)<br>
=C2=A0#define WIN_DUMP_FIELD_PTR(field) _WIN_DUMP_FIELD_PTR(field)<br>
<br>
-#define _WIN_DUMP_FIELD_SIZE(f) sizeof(h-&gt;f)<br>
+#define _WIN_DUMP_FIELD_SIZE(f) (x64 ? sizeof(h-&gt;x64.f) : sizeof(h-&gt;=
x32.f))<br>
=C2=A0#define WIN_DUMP_FIELD_SIZE(field) _WIN_DUMP_FIELD_SIZE(field)<br>
<br>
-#define WIN_DUMP_CTX_SIZE sizeof(WinContext64)<br>
+static size_t win_dump_ctx_size(bool x64)<br>
+{<br>
+=C2=A0 =C2=A0 return x64 ? sizeof(WinContext64) : sizeof(WinContext32);<br=
>
+}<br>
<br>
=C2=A0static size_t write_run(uint64_t base_page, uint64_t page_count,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, Error **errp)<br>
@@ -70,7 +76,7 @@ static size_t write_run(uint64_t base_page, uint64_t page=
_count,<br>
=C2=A0 =C2=A0 =C2=A0return total;<br>
=C2=A0}<br>
<br>
-static void write_runs(DumpState *s, WinDumpHeader64 *h, Error **errp)<br>
+static void write_runs(DumpState *s, WinDumpHeader *h, bool x64, Error **e=
rrp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint64_t BasePage, PageCount;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
@@ -87,22 +93,24 @@ static void write_runs(DumpState *s, WinDumpHeader64 *h=
, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static int cpu_read_ptr(CPUState *cpu, uint64_t addr, uint64_t *ptr)<br>
+static int cpu_read_ptr(bool x64, CPUState *cpu, uint64_t addr, uint64_t *=
ptr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 uint32_t ptr32;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t ptr64;<br>
<br>
-=C2=A0 =C2=A0 ret =3D cpu_memory_rw_debug(cpu, addr, &amp;ptr64, WIN_DUMP_=
PTR_SIZE, 0);<br>
+=C2=A0 =C2=A0 ret =3D cpu_memory_rw_debug(cpu, addr, x64 ? (void *)&amp;pt=
r64 : (void *)&amp;ptr32,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 win_dump_ptr_size(x64), 0);<br>
<br>
-=C2=A0 =C2=A0 *ptr =3D ptr64;<br>
+=C2=A0 =C2=A0 *ptr =3D x64 ? ptr64 : ptr32;<br>
<br>
=C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
-static void patch_mm_pfn_database(WinDumpHeader64 *h, Error **errp)<br>
+static void patch_mm_pfn_database(WinDumpHeader *h, bool x64, Error **errp=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WIN_DUMP_FIELD(KdDebuggerDataBlo=
ck) + KDBG_MM_PFN_DATABASE_OFFSET64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WIN_DUMP_FIELD(KdDebuggerDataBlo=
ck) + KDBG_MM_PFN_DATABASE_OFFSET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WIN_DUMP_FIELD_PTR(PfnDatab=
ase),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WIN_DUMP_FIELD_SIZE(PfnData=
base), 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: failed t=
o read MmPfnDatabase&quot;);<br>
@@ -110,13 +118,12 @@ static void patch_mm_pfn_database(WinDumpHeader64 *h,=
 Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void patch_bugcheck_data(WinDumpHeader64 *h, Error **errp)<br>
+static void patch_bugcheck_data(WinDumpHeader *h, bool x64, Error **errp)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint64_t KiBugcheckData;<br>
<br>
-=C2=A0 =C2=A0 if (cpu_read_ptr(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WIN_DUMP_FIELD(KdDebuggerDataBlo=
ck) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KDBG_KI_BUGCHECK_D=
ATA_OFFSET64,<br>
+=C2=A0 =C2=A0 if (cpu_read_ptr(x64, first_cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WIN_DUMP_FIELD(KdDebuggerDataBlo=
ck) + KDBG_KI_BUGCHECK_DATA_OFFSET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;KiBugcheckData)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: failed t=
o read KiBugcheckData&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -141,30 +148,34 @@ static void patch_bugcheck_data(WinDumpHeader64 *h, E=
rror **errp)<br>
=C2=A0/*<br>
=C2=A0 * This routine tries to correct mistakes in crashdump header.<br>
=C2=A0 */<br>
-static void patch_header(WinDumpHeader64 *h)<br>
+static void patch_header(WinDumpHeader *h, bool x64)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
<br>
-=C2=A0 =C2=A0 h-&gt;RequiredDumpSpace =3D sizeof(WinDumpHeader64) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (h-&gt;PhysicalMemoryBlock.Numbe=
rOfPages &lt;&lt; TARGET_PAGE_BITS);<br>
-=C2=A0 =C2=A0 h-&gt;PhysicalMemoryBlock.unused =3D 0;<br>
-=C2=A0 =C2=A0 h-&gt;unused1 =3D 0;<br>
+=C2=A0 =C2=A0 if (x64) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x64.RequiredDumpSpace =3D sizeof(WinDump=
Header64) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (h-&gt;x64.PhysicalMemoryBlock.N=
umberOfPages &lt;&lt; TARGET_PAGE_BITS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x64.PhysicalMemoryBlock.unused =3D 0;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x64.unused1 =3D 0;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x32.RequiredDumpSpace =3D sizeof(WinDump=
Header32) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (h-&gt;x32.PhysicalMemoryBlock.N=
umberOfPages &lt;&lt; TARGET_PAGE_BITS);<br>
+=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 patch_mm_pfn_database(h, &amp;local_err);<br>
+=C2=A0 =C2=A0 patch_mm_pfn_database(h, x64, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report_err(local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0local_err =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 patch_bugcheck_data(h, &amp;local_err);<br>
+=C2=A0 =C2=A0 patch_bugcheck_data(h, x64, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report_err(local_err);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void check_header(WinDumpHeader64 *h, Error **errp)<br>
+static void check_header(WinDumpHeader *h, bool *x64, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char Signature[] =3D &quot;PAGE&quot;;<br>
-=C2=A0 =C2=A0 const char ValidDump[] =3D &quot;DU64&quot;;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (memcmp(h-&gt;Signature, Signature, sizeof(h-&gt;Sig=
nature))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: invalid =
header, expected &#39;%.4s&#39;,&quot;<br>
@@ -172,14 +183,17 @@ static void check_header(WinDumpHeader64 *h, Error **=
errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (memcmp(h-&gt;ValidDump, ValidDump, sizeof(h-&gt;ValidDum=
p))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;win-dump: invalid heade=
r, expected &#39;%.4s&#39;,&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot; got &#39;%.4s&#39;&quot;, ValidDump, h-&gt;ValidDum=
p);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 if (!memcmp(h-&gt;ValidDump, &quot;DUMP&quot;, sizeof(h-&gt;=
ValidDump))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x64 =3D false;<br>
+=C2=A0 =C2=A0 } else if (!memcmp(h-&gt;ValidDump, &quot;DU64&quot;, sizeof=
(h-&gt;ValidDump))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *x64 =3D true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;win-dump: invalid heade=
r, expected &#39;DUMP&#39; or &#39;DU64&#39;,&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot; got &#39;%.4s&#39;&quot;, h-&gt;ValidDump);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void check_kdbg(WinDumpHeader64 *h, Error **errp)<br>
+static void check_kdbg(WinDumpHeader *h, bool x64, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char OwnerTag[] =3D &quot;KDBG&quot;;<br>
=C2=A0 =C2=A0 =C2=A0char read_OwnerTag[4];<br>
@@ -188,7 +202,7 @@ static void check_kdbg(WinDumpHeader64 *h, Error **errp=
)<br>
<br>
=C2=A0try_again:<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_OWNER=
_TAG_OFFSET64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_OWNER=
_TAG_OFFSET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint8_t *)&amp;read_OwnerT=
ag, sizeof(read_OwnerTag), 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: failed t=
o read OwnerTag&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -213,15 +227,19 @@ try_again:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 h-&gt;KdDebuggerDataBlock =3D KdDebuggerDataBlock;<br>
+=C2=A0 =C2=A0 if (x64) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x64.KdDebuggerDataBlock =3D KdDebuggerDa=
taBlock;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 h-&gt;x32.KdDebuggerDataBlock =3D KdDebuggerDa=
taBlock;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0struct saved_context {<br>
-=C2=A0 =C2=A0 WinContext64 ctx;<br>
+=C2=A0 =C2=A0 WinContext ctx;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t addr;<br>
=C2=A0};<br>
<br>
-static void patch_and_save_context(WinDumpHeader64 *h,<br>
+static void patch_and_save_context(WinDumpHeader *h, bool x64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct saved_context *=
saved_ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
=C2=A0{<br>
@@ -231,15 +249,15 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu;<br>
=C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
<br>
-=C2=A0 =C2=A0 if (cpu_read_ptr(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_KI_PR=
OCESSOR_BLOCK_OFFSET64,<br>
+=C2=A0 =C2=A0 if (cpu_read_ptr(x64, first_cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_KI_PR=
OCESSOR_BLOCK_OFFSET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;KiProcessorBlock)) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: failed t=
o read KiProcessorBlock&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_OFFSE=
T_PRCB_CONTEXT_OFFSET64,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KdDebuggerDataBlock + KDBG_OFFSE=
T_PRCB_CONTEXT_OFFSET,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint8_t *)&amp;OffsetPrcbC=
ontext, sizeof(OffsetPrcbContext), 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: failed t=
o read OffsetPrcbContext&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -250,17 +268,17 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPUX86State *env =3D &amp;x86_cpu-&gt;env=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t Prcb;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t Context;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 WinContext64 ctx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WinContext ctx;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_read_ptr(first_cpu,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KiProcessorBlock +=
 i * WIN_DUMP_PTR_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_read_ptr(x64, first_cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KiProcessorBlock +=
 i * win_dump_ptr_size(x64),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;Prcb)) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-=
dump: failed to read&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; CPU #%d PRCB location&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_read_ptr(first_cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu_read_ptr(x64, first_cpu,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Prcb + Offset=
PrcbContext,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;Context)=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-=
dump: failed to read&quot;<br>
@@ -270,56 +288,88 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_ctx[i].addr =3D Context;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx =3D (WinContext64){<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ContextFlags =3D WIN_CTX64_ALL,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .MxCsr =3D env-&gt;mxcsr,<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegEs =3D env-&gt;segs[0].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegCs =3D env-&gt;segs[1].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegSs =3D env-&gt;segs[2].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegDs =3D env-&gt;segs[3].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegFs =3D env-&gt;segs[4].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegGs =3D env-&gt;segs[5].selec=
tor,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .EFlags =3D cpu_compute_eflags(e=
nv),<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr0 =3D env-&gt;dr[0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr1 =3D env-&gt;dr[1],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr2 =3D env-&gt;dr[2],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr3 =3D env-&gt;dr[3],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr6 =3D env-&gt;dr[6],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr7 =3D env-&gt;dr[7],<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rax =3D env-&gt;regs[R_EAX],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rbx =3D env-&gt;regs[R_EBX],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rcx =3D env-&gt;regs[R_ECX],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rdx =3D env-&gt;regs[R_EDX],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rsp =3D env-&gt;regs[R_ESP],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rbp =3D env-&gt;regs[R_EBP],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rsi =3D env-&gt;regs[R_ESI],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rdi =3D env-&gt;regs[R_EDI],<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R8=C2=A0 =3D env-&gt;regs[8],<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R9=C2=A0 =3D env-&gt;regs[9],<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R10 =3D env-&gt;regs[10],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R11 =3D env-&gt;regs[11],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R12 =3D env-&gt;regs[12],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R13 =3D env-&gt;regs[13],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R14 =3D env-&gt;regs[14],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R15 =3D env-&gt;regs[15],<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rip =3D env-&gt;eip,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .FltSave =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (x64) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.x64 =3D (WinContext64){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ContextFlags =3D =
WIN_CTX64_ALL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.MxCsr =3D en=
v-&gt;mxcsr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegEs =3D env-&gt=
;segs[0].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegCs =3D env-&gt=
;segs[1].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegSs =3D env-&gt=
;segs[2].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegDs =3D env-&gt=
;segs[3].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegFs =3D env-&gt=
;segs[4].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegGs =3D env-&gt=
;segs[5].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .EFlags =3D cpu_co=
mpute_eflags(env),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr0 =3D env-&gt;d=
r[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr1 =3D env-&gt;d=
r[1],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr2 =3D env-&gt;d=
r[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr3 =3D env-&gt;d=
r[3],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr6 =3D env-&gt;d=
r[6],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr7 =3D env-&gt;d=
r[7],<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rax =3D env-&gt;r=
egs[R_EAX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rbx =3D env-&gt;r=
egs[R_EBX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rcx =3D env-&gt;r=
egs[R_ECX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rdx =3D env-&gt;r=
egs[R_EDX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rsp =3D env-&gt;r=
egs[R_ESP],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rbp =3D env-&gt;r=
egs[R_EBP],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rsi =3D env-&gt;r=
egs[R_ESI],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rdi =3D env-&gt;r=
egs[R_EDI],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R8=C2=A0 =3D env-=
&gt;regs[8],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R9=C2=A0 =3D env-=
&gt;regs[9],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R10 =3D env-&gt;r=
egs[10],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R11 =3D env-&gt;r=
egs[11],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R12 =3D env-&gt;r=
egs[12],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R13 =3D env-&gt;r=
egs[13],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R14 =3D env-&gt;r=
egs[14],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .R15 =3D env-&gt;r=
egs[15],<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Rip =3D env-&gt;e=
ip,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .FltSave =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .MxC=
sr =3D env-&gt;mxcsr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ctx.x32 =3D (WinContext32){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ContextFlags =3D =
WIN_CTX32_FULL | WIN_CTX_DBG,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegEs =3D env-&gt=
;segs[0].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegCs =3D env-&gt=
;segs[1].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegSs =3D env-&gt=
;segs[2].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegDs =3D env-&gt=
;segs[3].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegFs =3D env-&gt=
;segs[4].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .SegGs =3D env-&gt=
;segs[5].selector,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .EFlags =3D cpu_co=
mpute_eflags(env),<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr0 =3D env-&gt;d=
r[0],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr1 =3D env-&gt;d=
r[1],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr2 =3D env-&gt;d=
r[2],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr3 =3D env-&gt;d=
r[3],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr6 =3D env-&gt;d=
r[6],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Dr7 =3D env-&gt;d=
r[7],<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Eax =3D env-&gt;r=
egs[R_EAX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Ebx =3D env-&gt;r=
egs[R_EBX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Ecx =3D env-&gt;r=
egs[R_ECX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Edx =3D env-&gt;r=
egs[R_EDX],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Esp =3D env-&gt;r=
egs[R_ESP],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Ebp =3D env-&gt;r=
egs[R_EBP],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Esi =3D env-&gt;r=
egs[R_ESI],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Edi =3D env-&gt;r=
egs[R_EDI],<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .Eip =3D env-&gt;e=
ip,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu, Contex=
t,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;saved_ctx[i].=
ctx, WIN_DUMP_CTX_SIZE, 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;saved_ctx[i].=
ctx, win_dump_ctx_size(x64), 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-=
dump: failed to save CPU #%d context&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu, Contex=
t,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ctx, WIN_DUMP=
_CTX_SIZE, 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ctx, win_dump=
_ctx_size(x64), 1)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-=
dump: failed to write CPU #%d context&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -328,14 +378,14 @@ static void patch_and_save_context(WinDumpHeader64 *h=
,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void restore_context(WinDumpHeader64 *h,<br>
+static void restore_context(WinDumpHeader *h, bool x64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct saved_context *saved_ctx)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; WIN_DUMP_FIELD(NumberProcessors); =
i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_memory_rw_debug(first_cpu, saved_=
ctx[i].addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;saved_ctx[i].=
ctx, WIN_DUMP_CTX_SIZE, 1)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;saved_ctx[i].=
ctx, win_dump_ctx_size(x64), 1)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0warn_report(&quot;win-dump:=
 failed to restore CPU #%d context&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -343,25 +393,28 @@ static void restore_context(WinDumpHeader64 *h,<br>
<br>
=C2=A0void create_win_dump(DumpState *s, Error **errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 WinDumpHeader64 *h =3D (WinDumpHeader64 *)(s-&gt;guest_note =
+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMCOREINFO_ELF_NOTE_HDR_SIZE);<b=
r>
+=C2=A0 =C2=A0 WinDumpHeader *h =3D (void *)(s-&gt;guest_note + VMCOREINFO_=
ELF_NOTE_HDR_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0X86CPU *first_x86_cpu =3D X86_CPU(first_cpu);<br>
=C2=A0 =C2=A0 =C2=A0uint64_t saved_cr3 =3D first_x86_cpu-&gt;<a href=3D"htt=
p://env.cr" rel=3D"noreferrer" target=3D"_blank">env.cr</a>[3];<br>
=C2=A0 =C2=A0 =C2=A0struct saved_context *saved_ctx =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0Error *local_err =3D NULL;<br>
+=C2=A0 =C2=A0 bool x64;<br>
+=C2=A0 =C2=A0 size_t hdr_size;<br>
<br>
-=C2=A0 =C2=A0 if (s-&gt;guest_note_size !=3D sizeof(WinDumpHeader64) +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMCOREINFO_ELF_NOTE_HDR_SIZE) {<=
br>
+=C2=A0 =C2=A0 if (s-&gt;guest_note_size !=3D VMCOREINFO_WIN_DUMP_NOTE_SIZE=
32 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;guest_note_size !=3D VMCOR=
EINFO_WIN_DUMP_NOTE_SIZE64) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;win-dump: invalid =
vmcoreinfo note size&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 check_header(h, &amp;local_err);<br>
+=C2=A0 =C2=A0 check_header(h, &amp;x64, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 hdr_size =3D x64 ? sizeof(WinDumpHeader64) : sizeof(WinDumpH=
eader32);<br></blockquote><div><br></div>The compiler is not smart enough h=
ere:<br>../dump/win_dump.c:416:46: error: &#39;x64&#39; may be used uniniti=
alized in this function [-Werror=3Dmaybe-uninitialized]<br>hdr_size =3D x64=
 ? sizeof(WinDumpHeader64) : sizeof(WinDumpHeader32);<br><br>I&#39;ll simpl=
y initialize the variable to true by default.<div> <br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Further access to kernel structures by virtual addre=
sses<br>
=C2=A0 =C2=A0 =C2=A0 * should be made from system context.<br>
@@ -369,13 +422,13 @@ void create_win_dump(DumpState *s, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0first_x86_cpu-&gt;<a href=3D"http://env.cr" rel=3D"nore=
ferrer" target=3D"_blank">env.cr</a>[3] =3D WIN_DUMP_FIELD(DirectoryTableBa=
se);<br>
<br>
-=C2=A0 =C2=A0 check_kdbg(h, &amp;local_err);<br>
+=C2=A0 =C2=A0 check_kdbg(h, x64, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_cr3;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 patch_header(h);<br>
+=C2=A0 =C2=A0 patch_header(h, x64);<br>
<br>
=C2=A0 =C2=A0 =C2=A0saved_ctx =3D g_new(struct saved_context, WIN_DUMP_FIEL=
D(NumberProcessors));<br>
<br>
@@ -384,7 +437,7 @@ void create_win_dump(DumpState *s, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0 * to determine if the system-saved context is valid<br=
>
=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
-=C2=A0 =C2=A0 patch_and_save_context(h, saved_ctx, &amp;local_err);<br>
+=C2=A0 =C2=A0 patch_and_save_context(h, x64, saved_ctx, &amp;local_err);<b=
r>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free;<br>
@@ -392,20 +445,20 @@ void create_win_dump(DumpState *s, Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;total_size =3D WIN_DUMP_FIELD(RequiredDumpSpace);=
<br>
<br>
-=C2=A0 =C2=A0 s-&gt;written_size =3D qemu_write_full(s-&gt;fd, h, sizeof(*=
h));<br>
-=C2=A0 =C2=A0 if (s-&gt;written_size !=3D sizeof(*h)) {<br>
+=C2=A0 =C2=A0 s-&gt;written_size =3D qemu_write_full(s-&gt;fd, h, hdr_size=
);<br>
+=C2=A0 =C2=A0 if (s-&gt;written_size !=3D hdr_size) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, QERR_IO_ERROR);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_restore;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 write_runs(s, h, &amp;local_err);<br>
+=C2=A0 =C2=A0 write_runs(s, h, x64, &amp;local_err);<br>
=C2=A0 =C2=A0 =C2=A0if (local_err) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_propagate(errp, local_err);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_restore;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0out_restore:<br>
-=C2=A0 =C2=A0 restore_context(h, saved_ctx);<br>
+=C2=A0 =C2=A0 restore_context(h, x64, saved_ctx);<br>
=C2=A0out_free:<br>
=C2=A0 =C2=A0 =C2=A0g_free(saved_ctx);<br>
=C2=A0out_cr3:<br>
diff --git a/hmp-commands.hx b/hmp-commands.hx<br>
index 8476277aa9c9..dd4006d3558a 100644<br>
--- a/hmp-commands.hx<br>
+++ b/hmp-commands.hx<br>
@@ -1064,7 +1064,7 @@ ERST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;-l: dump in kdump-compressed format, with lzo compression.\=
n\t\t\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;-s: dump in kdump-compressed format, with snappy compressio=
n.\n\t\t\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;-w: dump in Windows crashdump format (can be used instead o=
f ELF-dump converting),\n\t\t\t&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;=C2=A0 =C2=A0 for Windows x64 guests with vmcoreinfo driver only.=
\n\t\t\t&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;=C2=A0 =C2=A0 for Windows x86 and x64 guests with vmcoreinfo driv=
er only.\n\t\t\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;begin: the starting physical address.\n\t\t\t&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;length: the memory size, in bytes.&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.cmd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D hmp_d=
ump_guest_memory,<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000e4c36005dd2a8451--

