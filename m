Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9514F56F5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 09:53:12 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0TX-0008MC-1n
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 03:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc0Ro-0007PQ-O2
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:51:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc0Rl-0007Zu-2G
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649231480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZmyS7LXEmlkbjRPcFSt4gEMwI4VHSSujVWYJ2ucnLls=;
 b=a8XwpC5lCKj6rJcM9eXRhiNQPjfKZubfr75wTa9NHbcXQA6RR3xyevfnw6VBs18ltbxICb
 qsmGjyoOBzERvNukGM8LMEsdZd2MVtPxlZV4qMPXA0QvqM2o+9arbs3MFjgiW7kYsmlFas
 E87JpCpeLdsLYwt/XRqViim/3kppX3o=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-B4HMlBPNNtqX0DazPn5LBQ-1; Wed, 06 Apr 2022 03:51:18 -0400
X-MC-Unique: B4HMlBPNNtqX0DazPn5LBQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 b16-20020a253410000000b00633b9e71eecso1176834yba.14
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZmyS7LXEmlkbjRPcFSt4gEMwI4VHSSujVWYJ2ucnLls=;
 b=njpsazdkxEX11AOQINvHEjzClAQQ4ZFuHzKcJMOwyL9DtkUcmKOtdTOAGXxSO0PT8g
 sarCMLWjRL9SqavYZHuBgjrue1sdoFuh/6Nxlfv6QmQjlGzfmT8Fkj0Cnjh3hbEdY0NZ
 Sb+9UOH8+lEsNMXNK+jspRm7HlAE/lVxEMAIj3QO6MhhSDVQ64cwqTa68EZjMPAgLjxR
 OQtAYJvOUenHnx4XcKwNig5ZYyKnqC2LMixzQz2rD5hnoJkPV4ab1iiiG/cwIp9YRK8v
 CTqHKNluaQ+UkA6I5mOU5WFj8UMf1/Y+4O52R8Jl3S7Z+ZPiIF2vx849RwKsAYCpdo86
 6+PQ==
X-Gm-Message-State: AOAM531UVYsqzkWsh5tbDIcW93JiYr/93qT849M3V1J2LEg9BFxsUXyp
 nH1nUmeTpQojMXamuT4XPJUCHfCdKhssnLwK1V78PUG+nEgTqh/NJfPQJEilzp+6d582PTg09BX
 BO9ioGOrPZXbB7xKFD7KupJOQ6GeKS/I=
X-Received: by 2002:a81:6c8a:0:b0:2eb:55fa:f1e9 with SMTP id
 h132-20020a816c8a000000b002eb55faf1e9mr5982532ywc.15.1649231478142; 
 Wed, 06 Apr 2022 00:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDX4tEZd/eaT1t1zZ/4J4osFIg+DX/HtTISs+vbccw/Oaq/JguN2zD8FYSp7GNiRRYVR0WGkDH9r6RftpGQY8=
X-Received: by 2002:a81:6c8a:0:b0:2eb:55fa:f1e9 with SMTP id
 h132-20020a816c8a000000b002eb55faf1e9mr5982513ywc.15.1649231477867; Wed, 06
 Apr 2022 00:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
 <20220325195130.62090-4-viktor.prutyanov@redhat.com>
In-Reply-To: <20220325195130.62090-4-viktor.prutyanov@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 11:51:07 +0400
Message-ID: <CAMxuvazb7TBJFeAJkT57QtSD_eYw+Y0j3AE11=vNnHTtepgamw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] include/qemu: add 32-bit Windows dump structures
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
> These structures are required to produce 32-bit guest Windows Complete
> Memory Dump. Add 32-bit Windows dump header, CPU context and physical
> memory descriptor structures along with corresponding definitions.
>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Back when the initial support was introduced, I guess I thought those
structures were defined by the fwcfg driver. I realize they are
actually Windows structures. What's your reference for them? It's hard
to find a good source, it seemed it was reverse-engineered by various
projects.

Otherwise lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  include/qemu/win_dump_defs.h | 107 +++++++++++++++++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>
> diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.h
> index 5a5e5a5e09..73a44e2408 100644
> --- a/include/qemu/win_dump_defs.h
> +++ b/include/qemu/win_dump_defs.h
> @@ -11,11 +11,22 @@
>  #ifndef QEMU_WIN_DUMP_DEFS_H
>  #define QEMU_WIN_DUMP_DEFS_H
>
> +typedef struct WinDumpPhyMemRun32 {
> +    uint32_t BasePage;
> +    uint32_t PageCount;
> +} QEMU_PACKED WinDumpPhyMemRun32;
> +
>  typedef struct WinDumpPhyMemRun64 {
>      uint64_t BasePage;
>      uint64_t PageCount;
>  } QEMU_PACKED WinDumpPhyMemRun64;
>
> +typedef struct WinDumpPhyMemDesc32 {
> +    uint32_t NumberOfRuns;
> +    uint32_t NumberOfPages;
> +    WinDumpPhyMemRun32 Run[86];
> +} QEMU_PACKED WinDumpPhyMemDesc32;
> +
>  typedef struct WinDumpPhyMemDesc64 {
>      uint32_t NumberOfRuns;
>      uint32_t unused;
> @@ -33,6 +44,39 @@ typedef struct WinDumpExceptionRecord {
>      uint64_t ExceptionInformation[15];
>  } QEMU_PACKED WinDumpExceptionRecord;
>
> +typedef struct WinDumpHeader32 {
> +    char Signature[4];
> +    char ValidDump[4];
> +    uint32_t MajorVersion;
> +    uint32_t MinorVersion;
> +    uint32_t DirectoryTableBase;
> +    uint32_t PfnDatabase;
> +    uint32_t PsLoadedModuleList;
> +    uint32_t PsActiveProcessHead;
> +    uint32_t MachineImageType;
> +    uint32_t NumberProcessors;
> +    union {
> +        struct {
> +            uint32_t BugcheckCode;
> +            uint32_t BugcheckParameter1;
> +            uint32_t BugcheckParameter2;
> +            uint32_t BugcheckParameter3;
> +            uint32_t BugcheckParameter4;
> +        };
> +        uint8_t BugcheckData[20];
> +    };
> +    uint8_t VersionUser[32];
> +    uint32_t reserved0;
> +    uint32_t KdDebuggerDataBlock;
> +    union {
> +        WinDumpPhyMemDesc32 PhysicalMemoryBlock;
> +        uint8_t PhysicalMemoryBlockBuffer[700];
> +    };
> +    uint8_t reserved1[3200];
> +    uint32_t RequiredDumpSpace;
> +    uint8_t reserved2[92];
> +} QEMU_PACKED WinDumpHeader32;
> +
>  typedef struct WinDumpHeader64 {
>      char Signature[4];
>      char ValidDump[4];
> @@ -81,25 +125,49 @@ typedef struct WinDumpHeader64 {
>      uint8_t reserved[4018];
>  } QEMU_PACKED WinDumpHeader64;
>
> +typedef union WinDumpHeader {
> +    struct {
> +        char Signature[4];
> +        char ValidDump[4];
> +    };
> +    WinDumpHeader32 x32;
> +    WinDumpHeader64 x64;
> +} WinDumpHeader;
> +
>  #define KDBG_OWNER_TAG_OFFSET64             0x10
>  #define KDBG_MM_PFN_DATABASE_OFFSET64       0xC0
>  #define KDBG_KI_BUGCHECK_DATA_OFFSET64      0x88
>  #define KDBG_KI_PROCESSOR_BLOCK_OFFSET64    0x218
>  #define KDBG_OFFSET_PRCB_CONTEXT_OFFSET64   0x338
>
> +#define KDBG_OWNER_TAG_OFFSET           KDBG_OWNER_TAG_OFFSET64
> +#define KDBG_MM_PFN_DATABASE_OFFSET     KDBG_MM_PFN_DATABASE_OFFSET64
> +#define KDBG_KI_BUGCHECK_DATA_OFFSET    KDBG_KI_BUGCHECK_DATA_OFFSET64
> +#define KDBG_KI_PROCESSOR_BLOCK_OFFSET  KDBG_KI_PROCESSOR_BLOCK_OFFSET64
> +#define KDBG_OFFSET_PRCB_CONTEXT_OFFSET KDBG_OFFSET_PRCB_CONTEXT_OFFSET6=
4
> +
>  #define VMCOREINFO_ELF_NOTE_HDR_SIZE    24
> +#define VMCOREINFO_WIN_DUMP_NOTE_SIZE64 (sizeof(WinDumpHeader64) + \
> +                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
> +#define VMCOREINFO_WIN_DUMP_NOTE_SIZE32 (sizeof(WinDumpHeader32) + \
> +                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
>
>  #define WIN_CTX_X64 0x00100000L
> +#define WIN_CTX_X86 0x00010000L
>
>  #define WIN_CTX_CTL 0x00000001L
>  #define WIN_CTX_INT 0x00000002L
>  #define WIN_CTX_SEG 0x00000004L
>  #define WIN_CTX_FP  0x00000008L
>  #define WIN_CTX_DBG 0x00000010L
> +#define WIN_CTX_EXT 0x00000020L
>
>  #define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN_C=
TX_FP)
>  #define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
>
> +#define WIN_CTX32_FULL (WIN_CTX_X86 | WIN_CTX_CTL | WIN_CTX_INT | WIN_CT=
X_SEG)
> +#define WIN_CTX32_ALL (WIN_CTX32_FULL | WIN_CTX_FP | WIN_CTX_DBG | WIN_C=
TX_EXT)
> +
>  #define LIVE_SYSTEM_DUMP    0x00000161
>
>  typedef struct WinM128A {
> @@ -107,6 +175,40 @@ typedef struct WinM128A {
>      int64_t high;
>  } QEMU_ALIGNED(16) WinM128A;
>
> +typedef struct WinContext32 {
> +    uint32_t ContextFlags;
> +
> +    uint32_t Dr0;
> +    uint32_t Dr1;
> +    uint32_t Dr2;
> +    uint32_t Dr3;
> +    uint32_t Dr6;
> +    uint32_t Dr7;
> +
> +    uint8_t  FloatSave[112];
> +
> +    uint32_t SegGs;
> +    uint32_t SegFs;
> +    uint32_t SegEs;
> +    uint32_t SegDs;
> +
> +    uint32_t Edi;
> +    uint32_t Esi;
> +    uint32_t Ebx;
> +    uint32_t Edx;
> +    uint32_t Ecx;
> +    uint32_t Eax;
> +
> +    uint32_t Ebp;
> +    uint32_t Eip;
> +    uint32_t SegCs;
> +    uint32_t EFlags;
> +    uint32_t Esp;
> +    uint32_t SegSs;
> +
> +    uint8_t ExtendedRegisters[512];
> +} QEMU_ALIGNED(16) WinContext32;
> +
>  typedef struct WinContext64 {
>      uint64_t PHome[6];
>
> @@ -176,4 +278,9 @@ typedef struct WinContext64 {
>      uint64_t LastExceptionFromRip;
>  } QEMU_ALIGNED(16) WinContext64;
>
> +typedef union WinContext {
> +    WinContext32 x32;
> +    WinContext64 x64;
> +} WinContext;
> +
>  #endif /* QEMU_WIN_DUMP_DEFS_H */
> --
> 2.35.1
>


