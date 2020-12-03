Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC06B2CD512
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 13:04:20 +0100 (CET)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kknLQ-0003FY-1X
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 07:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kknJv-0001zo-CV; Thu, 03 Dec 2020 07:02:47 -0500
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:41837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kknJt-0008UG-CP; Thu, 03 Dec 2020 07:02:47 -0500
Received: by mail-oo1-xc44.google.com with SMTP id i7so439353oot.8;
 Thu, 03 Dec 2020 04:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8r7wJUCsqf1xhyIe/a4veUmTxlicJaVn1iaJHUgIikA=;
 b=FgY60M1GffVUADMj5u8IuLYgOv0cMmANYReukQ90RWfqJjd3M5BqvnalxQZB273cIi
 UGmotfhz23tlGSDeH+1YNGLeQ57EuyT+WwPuH37sQNckFjS73ch1rkWxSEEqcFTTPvgE
 eh4L8e8mC3jyahBa2XgCxBmUg1WOiCn00eZCvuW2LzrGO5S4FN+EMFbvmViUAr+EBtme
 03nvmeqcgyety1a8czireeWeUgtYiKBgun92qaAXBvAHpGythg+FrqrrA/5/TFOmlvI2
 HsN1/KSHJ3fxEvy1UUko0chg73vZ5F1qgu/RRKIQscVpsf0K4vgnbecQ9+jsmg62XkMr
 CjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8r7wJUCsqf1xhyIe/a4veUmTxlicJaVn1iaJHUgIikA=;
 b=TfdI4zJjLNfkfO1VsTEsn9dVk3pwmtRAhOEzTL1qdbxkI3zisTCnGr2GcatGEOSolW
 Ppz17JTivvCXO6s65uxEg4HkpWiRCJwkazz8XN7ENsOA2xUfdzhgg98jvRvcFU3KQZZ9
 AIw/sAxTgrva4qIOwxYVrzJhv1xRce+X4QxWOAiQC/1wxs9KSiVjd+cb645+zRwHqBhA
 tLh1/z6se0F2WAy3okxp8oYCQw6fZrfxI3Sb0hi4sX/oo2Qa/54fenS+L0oqE5PrCBGU
 XkAXU6Gfy4L1o16SlC2btJKc08kzAnWxqDhwgpT5ic9gMsiBCTbaQRfsnr86XqhB+VZU
 OaHg==
X-Gm-Message-State: AOAM530cfh1hTI/wGn5fkMeTT7UPGhWA/pgIb1n/0191UPJt2HEyH1lN
 omTvr++GcKCddmill7B12607cF0mC0QwJmCMsRw=
X-Google-Smtp-Source: ABdhPJwohm0Uc6UMKgGrDAmSL68pFv/rnQs48XcRUcODwKjDamRw15hAB8l42fyPhEHgcPaIIR2RlGyOf4WQPp7dtpI=
X-Received: by 2002:a4a:abc9:: with SMTP id o9mr1856483oon.1.1606996963913;
 Thu, 03 Dec 2020 04:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-3-philmd@redhat.com>
 <CAKXe6SLWrP=Jg3mvasx1yF7wHJ1vvpR6+dVHqL4UM+_odbfkTg@mail.gmail.com>
 <3cdd898b-45db-eb58-2606-fad6c218c238@redhat.com>
In-Reply-To: <3cdd898b-45db-eb58-2606-fad6c218c238@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 3 Dec 2020 20:02:08 +0800
Message-ID: <CAKXe6S+PBsDWdR-FbCgwCcnGPJJ-uZdyOCHOjHLKo3b7N2+hBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Hannes Reinecke <hare@suse.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B412=E6=
=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:37=E5=86=99=E9=81=93=
=EF=BC=9A
>
> Hi Li,
>
> On 12/3/20 12:21 PM, Li Qiang wrote:
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B41=
2=E6=9C=882=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:13=E5=86=99=E9=
=81=93=EF=BC=9A
> >>
> >> cdb_len can not be zero... (or less than 6) here, else we have a
> >> out-of-bound read first in scsi_cdb_length():
> >>
> >>  71 int scsi_cdb_length(uint8_t *buf)
> >>  72 {
> >>  73     int cdb_len;
> >>  74
> >>  75     switch (buf[0] >> 5) {
> >
> > Hi Philippe,
> >
> > Here I not read the spec.
>
> Neither did I...
>
> > Just guest from your patch, this 'buf[0]>>5'
> > indicates/related with the cdb length, right?
>
> This is my understanding too.
>
> > So here(this patch) you  just want to ensure the 'buf[0]>>5' and the
> > 'cdb_len' is consistent.
> >
> > But I don't  think here is a 'out-of-bound' read issue.
> >
> >
> > The 'buf' is from here 'cdb'.
> > static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
> >                                int frame_cmd)
> > {
> >
> >     cdb =3D cmd->frame->pass.cdb;
> >
> > 'cmd->frame->pass.cdb' is an array in heap and  its data is mmaped
> > from the guest.
> >
> > The guest can put any data in 'pass.cdb' which 'buf[0]>>5' can be 0 or
> > less than 6.
> >
> > So every read of this 'pass.cdb'[0~15] is valid. Not an oob.
>
> OK maybe not OOB but infoleak?

No. We refer 'infoleak' in qemu situation if the guest can get some
memory(not the guest itself, but the qemu's process memory) from the
qemu.

However here the 'cdb' is actually mmaped from guest. It can be anything.
I think here it is just no use data.


Thanks,
Li Qiang

>
> >>  76     case 0:
> >>  77         cdb_len =3D 6;
> >>  78         break;
> >>
> >> Then another out-of-bound read when the size returned by
> >> scsi_cdb_length() is used.
> >
> > Where is this?
>
> IIRC scsi_req_parse_cdb().
>
> >
> > So I think your intention is to ensure  'cdb_len' is consistent with
> > 'cdb[0]>>5'.
> >
> > Please correct me if I'm wrong.
>
> I'll recheck and go back to you during January.
>
> Regards,
>
> Phil.
>
> >>
> >> Figured out after reviewing:
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg757937.html
> >>
> >> And reproduced fuzzing:
> >>
> >>   qemu-fuzz-i386: hw/scsi/megasas.c:1679: int megasas_handle_scsi(Mega=
sasState *, MegasasCmd *, int):
> >>   Assertion `len > 0 && cdb_len >=3D len' failed.
> >>   =3D=3D1689590=3D=3D ERROR: libFuzzer: deadly signal
> >>       #8 0x7f7a5d918e75 in __assert_fail (/lib64/libc.so.6+0x34e75)
> >>       #9 0x55a1b95cf6d4 in megasas_handle_scsi hw/scsi/megasas.c:1679:=
5
> >>       #10 0x55a1b95cf6d4 in megasas_handle_frame hw/scsi/megasas.c:197=
5:24
> >>       #11 0x55a1b95cf6d4 in megasas_mmio_write hw/scsi/megasas.c:2132:=
9
> >>       #12 0x55a1b981972e in memory_region_write_accessor softmmu/memor=
y.c:491:5
> >>       #13 0x55a1b981972e in access_with_adjusted_size softmmu/memory.c=
:552:18
> >>       #14 0x55a1b981972e in memory_region_dispatch_write softmmu/memor=
y.c:1501:16
> >>       #15 0x55a1b97f0ab0 in flatview_write_continue softmmu/physmem.c:=
2759:23
> >>       #16 0x55a1b97ec3f2 in flatview_write softmmu/physmem.c:2799:14
> >>       #17 0x55a1b97ec3f2 in address_space_write softmmu/physmem.c:2891=
:18
> >>       #18 0x55a1b985c7cd in cpu_outw softmmu/ioport.c:70:5
> >>       #19 0x55a1b99577ac in qtest_process_command softmmu/qtest.c:481:=
13
> >>
> >> Inspired-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> >> Inspired-by: Alexander Bulekov <alxndr@bu.edu>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/scsi/megasas.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> >> index 1a5fc5857db..f5ad4425b5b 100644
> >> --- a/hw/scsi/megasas.c
> >> +++ b/hw/scsi/megasas.c
> >> @@ -1667,6 +1667,7 @@ static int megasas_handle_scsi(MegasasState *s, =
MegasasCmd *cmd,
> >>  {
> >>      uint8_t *cdb;
> >>      int target_id, lun_id, cdb_len;
> >> +    int len =3D -1;
> >>      bool is_write;
> >>      struct SCSIDevice *sdev =3D NULL;
> >>      bool is_logical =3D (frame_cmd =3D=3D MFI_CMD_LD_SCSI_IO);
> >> @@ -1676,6 +1677,10 @@ static int megasas_handle_scsi(MegasasState *s,=
 MegasasCmd *cmd,
> >>      lun_id =3D cmd->frame->header.lun_id;
> >>      cdb_len =3D cmd->frame->header.cdb_len;
> >>
> >> +    if (cdb_len > 0) {
> >> +        len =3D scsi_cdb_length(cdb);
> >> +    }
> >> +    assert(len > 0 && cdb_len >=3D len);
> >>      if (is_logical) {
> >>          if (target_id >=3D MFI_MAX_LD || lun_id !=3D 0) {
> >>              trace_megasas_scsi_target_not_present(
> >> --
> >> 2.26.2
> >>
> >>
> >
>

