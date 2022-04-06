Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969024F62B6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 17:17:52 +0200 (CEST)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc7Pr-0002be-AE
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 11:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vprutyan@redhat.com>)
 id 1nc7OJ-0001br-Im
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vprutyan@redhat.com>)
 id 1nc7OH-0006eG-62
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649258171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMzcOUYqszA+5wyWvy6j8EWEdUuaC9DLYtGJbl5+6yk=;
 b=X/W2KR/Wi5HnQcR8ki4IilBJl3NV/ICRX+W5BIHUXDp4rlLGiekWxCRoi59JdiaaqQg9mU
 Ju0YcphMcD9p/RXaVEHkFI2VXZ1l4VMazt/Dd4hYsRVt2AczUNSzolHSJi7Tx6VTog/b8Q
 Feqsrgwc/rU62ikaHoQbUWHvrgWMgCE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-G2fOEJGyN6Oc-H3HLcjgqg-1; Wed, 06 Apr 2022 11:16:11 -0400
X-MC-Unique: G2fOEJGyN6Oc-H3HLcjgqg-1
Received: by mail-yb1-f197.google.com with SMTP id
 h8-20020a25e208000000b00628c0565607so2041657ybe.0
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 08:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jMzcOUYqszA+5wyWvy6j8EWEdUuaC9DLYtGJbl5+6yk=;
 b=kZ3Kw5h7lrKSRt3BrMhki9gIent4g0wBumihc6s4NUoO7iE6yioB9rQvHWp1ejWQWs
 9hL4VGwdzpiH5BFmXzQUwNu4yeCCMnxh3TnEV7mDJlHN7UAsLCNq6WSe7DhLu/KPy0YL
 aYTiYHk+vwj8aVcSBut7ixWbUQTl3CGGVC7Skcm+N0BVIWRXvicmRwq/XzYibQIU9IyO
 YM7XEwqGgDhvHlEuEhwLaGStdYiOjdeTIDYEDbyA9RMrZdbvzOtq4CwdB/UbYcGbYaxH
 im8IFh9s3ROoQ2gzyU4Y9n9jl47U1CbqA9ZroCOOtpkiiHSYHJsbXuLuZdzshCvXe6AM
 so+A==
X-Gm-Message-State: AOAM5320dzDV6ZyT1lgzyiBPZo8gCqqP5llyqIal38g7k2xe3MCDTt1G
 EP+vaUtXs+qw1dO7/PYtgSl6v+n9l1NAOqNv0dYcd6Z7NfiWhZLmK53Bi/iR692os2XxdHi3mE3
 e6TF1t8m0goGpPfKgVEI5uzWPZfqMBVk=
X-Received: by 2002:a25:20b:0:b0:63d:7c9b:e74f with SMTP id
 11-20020a25020b000000b0063d7c9be74fmr6786071ybc.378.1649258160104; 
 Wed, 06 Apr 2022 08:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX2nxIdnWMIpBbTqRVHufcgqGLIITuWAga/DHix6rf8RbbuSbWcnmPm9yaDzFjDr0t2uIYG9bX3Olq9vkRu44=
X-Received: by 2002:a25:20b:0:b0:63d:7c9b:e74f with SMTP id
 11-20020a25020b000000b0063d7c9be74fmr6786045ybc.378.1649258159754; Wed, 06
 Apr 2022 08:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
 <20220325195130.62090-4-viktor.prutyanov@redhat.com>
 <CAMxuvazb7TBJFeAJkT57QtSD_eYw+Y0j3AE11=vNnHTtepgamw@mail.gmail.com>
In-Reply-To: <CAMxuvazb7TBJFeAJkT57QtSD_eYw+Y0j3AE11=vNnHTtepgamw@mail.gmail.com>
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Date: Wed, 6 Apr 2022 18:15:49 +0300
Message-ID: <CAEzbHW9WcBkCQ8MaV3VmFRL8yfrP_OLQNtxQo13pTVpn=eQE3w@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] include/qemu: add 32-bit Windows dump structures
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vprutyan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vprutyan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Apr 6, 2022 at 10:51 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Fri, Mar 25, 2022 at 11:51 PM Viktor Prutyanov
> <viktor.prutyanov@redhat.com> wrote:
> >
> > These structures are required to produce 32-bit guest Windows Complete
> > Memory Dump. Add 32-bit Windows dump header, CPU context and physical
> > memory descriptor structures along with corresponding definitions.
> >
> > Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Back when the initial support was introduced, I guess I thought those
> structures were defined by the fwcfg driver. I realize they are
> actually Windows structures. What's your reference for them? It's hard
> to find a good source, it seemed it was reverse-engineered by various
> projects.

The various structures presented here have different sources of varying
degrees of completeness.

As for WinContext*, WIN_CTX_* definitions, they are fully available as
I386_CONTEXT, AMD64_CONTEXT, CONTEXT_* definitions in the Wine project:
https://github.com/wine-mirror/wine/blob/master/include/winnt.h

As for the Complete Memory Dump header, the main fully open source of
this structure is the Volatility project:
https://github.com/volatilityfoundation/volatility/blob/master/volatility/p=
lugins/overlays/windows/crash_vtypes.py

Besides of that, this information can be revealed experimentally by
comparing dumps between them and by analyzing manually constructed
dumps in WinDbg and noticing which of the data is available and which
is not. It is also possible because some fields of the header are also
presented as debug symbols provided by Microsoft in PDB and because
WinDbg sometimes provides verbose output on error. For example, this is
how the logic of win_dump.c was made.

So that, no reverse-engineering at least from my side is involved, all
of the information was obtained from scattered but open sources.

>
> Otherwise lgtm,
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Best regards,
Viktor Prutyanov

> > ---
> >  include/qemu/win_dump_defs.h | 107 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >
> > diff --git a/include/qemu/win_dump_defs.h b/include/qemu/win_dump_defs.=
h
> > index 5a5e5a5e09..73a44e2408 100644
> > --- a/include/qemu/win_dump_defs.h
> > +++ b/include/qemu/win_dump_defs.h
> > @@ -11,11 +11,22 @@
> >  #ifndef QEMU_WIN_DUMP_DEFS_H
> >  #define QEMU_WIN_DUMP_DEFS_H
> >
> > +typedef struct WinDumpPhyMemRun32 {
> > +    uint32_t BasePage;
> > +    uint32_t PageCount;
> > +} QEMU_PACKED WinDumpPhyMemRun32;
> > +
> >  typedef struct WinDumpPhyMemRun64 {
> >      uint64_t BasePage;
> >      uint64_t PageCount;
> >  } QEMU_PACKED WinDumpPhyMemRun64;
> >
> > +typedef struct WinDumpPhyMemDesc32 {
> > +    uint32_t NumberOfRuns;
> > +    uint32_t NumberOfPages;
> > +    WinDumpPhyMemRun32 Run[86];
> > +} QEMU_PACKED WinDumpPhyMemDesc32;
> > +
> >  typedef struct WinDumpPhyMemDesc64 {
> >      uint32_t NumberOfRuns;
> >      uint32_t unused;
> > @@ -33,6 +44,39 @@ typedef struct WinDumpExceptionRecord {
> >      uint64_t ExceptionInformation[15];
> >  } QEMU_PACKED WinDumpExceptionRecord;
> >
> > +typedef struct WinDumpHeader32 {
> > +    char Signature[4];
> > +    char ValidDump[4];
> > +    uint32_t MajorVersion;
> > +    uint32_t MinorVersion;
> > +    uint32_t DirectoryTableBase;
> > +    uint32_t PfnDatabase;
> > +    uint32_t PsLoadedModuleList;
> > +    uint32_t PsActiveProcessHead;
> > +    uint32_t MachineImageType;
> > +    uint32_t NumberProcessors;
> > +    union {
> > +        struct {
> > +            uint32_t BugcheckCode;
> > +            uint32_t BugcheckParameter1;
> > +            uint32_t BugcheckParameter2;
> > +            uint32_t BugcheckParameter3;
> > +            uint32_t BugcheckParameter4;
> > +        };
> > +        uint8_t BugcheckData[20];
> > +    };
> > +    uint8_t VersionUser[32];
> > +    uint32_t reserved0;
> > +    uint32_t KdDebuggerDataBlock;
> > +    union {
> > +        WinDumpPhyMemDesc32 PhysicalMemoryBlock;
> > +        uint8_t PhysicalMemoryBlockBuffer[700];
> > +    };
> > +    uint8_t reserved1[3200];
> > +    uint32_t RequiredDumpSpace;
> > +    uint8_t reserved2[92];
> > +} QEMU_PACKED WinDumpHeader32;
> > +
> >  typedef struct WinDumpHeader64 {
> >      char Signature[4];
> >      char ValidDump[4];
> > @@ -81,25 +125,49 @@ typedef struct WinDumpHeader64 {
> >      uint8_t reserved[4018];
> >  } QEMU_PACKED WinDumpHeader64;
> >
> > +typedef union WinDumpHeader {
> > +    struct {
> > +        char Signature[4];
> > +        char ValidDump[4];
> > +    };
> > +    WinDumpHeader32 x32;
> > +    WinDumpHeader64 x64;
> > +} WinDumpHeader;
> > +
> >  #define KDBG_OWNER_TAG_OFFSET64             0x10
> >  #define KDBG_MM_PFN_DATABASE_OFFSET64       0xC0
> >  #define KDBG_KI_BUGCHECK_DATA_OFFSET64      0x88
> >  #define KDBG_KI_PROCESSOR_BLOCK_OFFSET64    0x218
> >  #define KDBG_OFFSET_PRCB_CONTEXT_OFFSET64   0x338
> >
> > +#define KDBG_OWNER_TAG_OFFSET           KDBG_OWNER_TAG_OFFSET64
> > +#define KDBG_MM_PFN_DATABASE_OFFSET     KDBG_MM_PFN_DATABASE_OFFSET64
> > +#define KDBG_KI_BUGCHECK_DATA_OFFSET    KDBG_KI_BUGCHECK_DATA_OFFSET64
> > +#define KDBG_KI_PROCESSOR_BLOCK_OFFSET  KDBG_KI_PROCESSOR_BLOCK_OFFSET=
64
> > +#define KDBG_OFFSET_PRCB_CONTEXT_OFFSET KDBG_OFFSET_PRCB_CONTEXT_OFFSE=
T64
> > +
> >  #define VMCOREINFO_ELF_NOTE_HDR_SIZE    24
> > +#define VMCOREINFO_WIN_DUMP_NOTE_SIZE64 (sizeof(WinDumpHeader64) + \
> > +                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
> > +#define VMCOREINFO_WIN_DUMP_NOTE_SIZE32 (sizeof(WinDumpHeader32) + \
> > +                                         VMCOREINFO_ELF_NOTE_HDR_SIZE)
> >
> >  #define WIN_CTX_X64 0x00100000L
> > +#define WIN_CTX_X86 0x00010000L
> >
> >  #define WIN_CTX_CTL 0x00000001L
> >  #define WIN_CTX_INT 0x00000002L
> >  #define WIN_CTX_SEG 0x00000004L
> >  #define WIN_CTX_FP  0x00000008L
> >  #define WIN_CTX_DBG 0x00000010L
> > +#define WIN_CTX_EXT 0x00000020L
> >
> >  #define WIN_CTX64_FULL  (WIN_CTX_X64 | WIN_CTX_CTL | WIN_CTX_INT | WIN=
_CTX_FP)
> >  #define WIN_CTX64_ALL   (WIN_CTX64_FULL | WIN_CTX_SEG | WIN_CTX_DBG)
> >
> > +#define WIN_CTX32_FULL (WIN_CTX_X86 | WIN_CTX_CTL | WIN_CTX_INT | WIN_=
CTX_SEG)
> > +#define WIN_CTX32_ALL (WIN_CTX32_FULL | WIN_CTX_FP | WIN_CTX_DBG | WIN=
_CTX_EXT)
> > +
> >  #define LIVE_SYSTEM_DUMP    0x00000161
> >
> >  typedef struct WinM128A {
> > @@ -107,6 +175,40 @@ typedef struct WinM128A {
> >      int64_t high;
> >  } QEMU_ALIGNED(16) WinM128A;
> >
> > +typedef struct WinContext32 {
> > +    uint32_t ContextFlags;
> > +
> > +    uint32_t Dr0;
> > +    uint32_t Dr1;
> > +    uint32_t Dr2;
> > +    uint32_t Dr3;
> > +    uint32_t Dr6;
> > +    uint32_t Dr7;
> > +
> > +    uint8_t  FloatSave[112];
> > +
> > +    uint32_t SegGs;
> > +    uint32_t SegFs;
> > +    uint32_t SegEs;
> > +    uint32_t SegDs;
> > +
> > +    uint32_t Edi;
> > +    uint32_t Esi;
> > +    uint32_t Ebx;
> > +    uint32_t Edx;
> > +    uint32_t Ecx;
> > +    uint32_t Eax;
> > +
> > +    uint32_t Ebp;
> > +    uint32_t Eip;
> > +    uint32_t SegCs;
> > +    uint32_t EFlags;
> > +    uint32_t Esp;
> > +    uint32_t SegSs;
> > +
> > +    uint8_t ExtendedRegisters[512];
> > +} QEMU_ALIGNED(16) WinContext32;
> > +
> >  typedef struct WinContext64 {
> >      uint64_t PHome[6];
> >
> > @@ -176,4 +278,9 @@ typedef struct WinContext64 {
> >      uint64_t LastExceptionFromRip;
> >  } QEMU_ALIGNED(16) WinContext64;
> >
> > +typedef union WinContext {
> > +    WinContext32 x32;
> > +    WinContext64 x64;
> > +} WinContext;
> > +
> >  #endif /* QEMU_WIN_DUMP_DEFS_H */
> > --
> > 2.35.1
> >
>


