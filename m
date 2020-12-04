Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18862CE721
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 05:52:03 +0100 (CET)
Received: from localhost ([::1]:54928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl34c-0007Gp-Cs
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 23:52:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kl33d-0006de-3w; Thu, 03 Dec 2020 23:51:01 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kl33b-0006QS-58; Thu, 03 Dec 2020 23:51:00 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so4056728otl.11;
 Thu, 03 Dec 2020 20:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JCAuoiRToVKiQzQJ02k2diwjhJp7/7hdwEICAtHGaaY=;
 b=sP5hkrDgAccg3b4jVNeFVXLDvVGSh5kdXwoZY5kMALn6jttHxAJxi5fs+kGzto2LiC
 QIrMsN/BAg5Hp6MCTpFgctUNmqXqMujwr1YK++2U8i6GIA9F0XA5ygpyhBJJRh5IP0vU
 N75TttQrjbQDgx26xPt9TAXiezuY6J7uiNtLTnlf7Gf5PvwsbGY80KpSNMHy6TVi7tRt
 l8pzbWNRR1upxT0yaeTV8gnt2mvGJLk4guW4Kd+0QkckLU/QQKEKfOjQLfZ1Muua2e+r
 GkfN0XLToh70B3+GSV4nUXAp0qSE3Cj69X1sBh51PkcUvW9lN63rVoNeOZn9im11Jf+E
 iQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JCAuoiRToVKiQzQJ02k2diwjhJp7/7hdwEICAtHGaaY=;
 b=LCsO4kx4tJJaePpXLV5rODPDGcLXOisobLufMwls0tMsqI4VVXYYDHzbOCFUpYtdxS
 ZqMUOf2yJcpwsL478pb3D2gi9pLRQE0MdPVTh78chfrio5wFw1LnmY+N4Hyg8SWfe06b
 ZaVnhjhwiRzJnW+gyzb45Tzl5bTrIllape0EMJjN0svGYpff5nU9M/0vfQMTCQXlnZyC
 d0JaoGt+1tevQtr5wJLLQgmL1UmBPdUM/VqwZeTmw1fC0DEGqgEqw09I3lgqCjY3VNrA
 FkLb/TUwo4wFY8P9DtALo26sxLaEzROG9iraMkE5htES1iks6ZSbrRn60CY49FKs90dY
 ecYA==
X-Gm-Message-State: AOAM533dNFQ0J03Vr070c2nZNdIJHBxsdQBiItU4sV5EgrxVS1+eOViq
 aa4p3GXaLgTfzUcvpcGIA2Fv/zkDCXhfz1y7MYY=
X-Google-Smtp-Source: ABdhPJwdqnMMvNc1QgAkRHDgSJTBv5hvY53UWoB/gYXY4AZ2ms8acqN0tXlOul6FWSklxEh/IuxFxpuZTArMReKe9sc=
X-Received: by 2002:a9d:2643:: with SMTP id a61mr2214475otb.353.1607057457459; 
 Thu, 03 Dec 2020 20:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-3-philmd@redhat.com>
 <CAKXe6SLWrP=Jg3mvasx1yF7wHJ1vvpR6+dVHqL4UM+_odbfkTg@mail.gmail.com>
 <3cdd898b-45db-eb58-2606-fad6c218c238@redhat.com>
 <CAKXe6S+PBsDWdR-FbCgwCcnGPJJ-uZdyOCHOjHLKo3b7N2+hBA@mail.gmail.com>
 <ea3554e3-52a0-30b6-9159-94472fc2f256@redhat.com>
In-Reply-To: <ea3554e3-52a0-30b6-9159-94472fc2f256@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Fri, 4 Dec 2020 12:50:21 +0800
Message-ID: <CAKXe6SKDaj-VdMRGZayrck=42MSBJYMtu-=3p17RnDZr52+ryA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x342.google.com
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
=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:38=E5=86=99=E9=81=93=
=EF=BC=9A
>
> On 12/3/20 1:02 PM, Li Qiang wrote:
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=B41=
2=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:37=E5=86=99=E9=
=81=93=EF=BC=9A
> >>
> >> Hi Li,
> >>
> >> On 12/3/20 12:21 PM, Li Qiang wrote:
> >>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2020=E5=B9=
=B412=E6=9C=882=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:13=E5=86=99=
=E9=81=93=EF=BC=9A
> >>>>
> >>>> cdb_len can not be zero... (or less than 6) here, else we have a
> >>>> out-of-bound read first in scsi_cdb_length():
> >>>>
> >>>>  71 int scsi_cdb_length(uint8_t *buf)
> >>>>  72 {
> >>>>  73     int cdb_len;
> >>>>  74
> >>>>  75     switch (buf[0] >> 5) {
> >>>
> >>> Hi Philippe,
> >>>
> >>> Here I not read the spec.
> >>
> >> Neither did I...
> >>
> >>> Just guest from your patch, this 'buf[0]>>5'
> >>> indicates/related with the cdb length, right?
> >>
> >> This is my understanding too.
> >>
> >>> So here(this patch) you  just want to ensure the 'buf[0]>>5' and the
> >>> 'cdb_len' is consistent.
> >>>
> >>> But I don't  think here is a 'out-of-bound' read issue.
> >>>
> >>>
> >>> The 'buf' is from here 'cdb'.
> >>> static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
> >>>                                int frame_cmd)
> >>> {
> >>>
> >>>     cdb =3D cmd->frame->pass.cdb;
> >>>
> >>> 'cmd->frame->pass.cdb' is an array in heap and  its data is mmaped
> >>> from the guest.
> >>>
> >>> The guest can put any data in 'pass.cdb' which 'buf[0]>>5' can be 0 o=
r
> >>> less than 6.
> >>>
> >>> So every read of this 'pass.cdb'[0~15] is valid. Not an oob.
> >>
> >> OK maybe not OOB but infoleak?
> >
> > No. We refer 'infoleak' in qemu situation if the guest can get some
> > memory(not the guest itself, but the qemu's process memory) from the
> > qemu.
> >
> > However here the 'cdb' is actually mmaped from guest. It can be anythin=
g.
> > I think here it is just no use data.
>
> 'pass.cdb'[0~15] is allocated. If it gets filled with only
> 1 byte: 0x04, then scsi_cdb_length() returns buflen =3D 16
> while only 1 byte is filled, so callers will read 1 byte
> set and 15 random bytes.

Yes but no harm.

>
> You are saying this is not an "INFOleak" because the
> leaked memory is allocated on the heap, so nothing critical /
> useful gets stored there?

Yes, 'cmd->frame' is totally mapped from guest in here:

'cmd->frame =3D pci_dma_map(pcid, frame, &frame_size_p, 0);'

What's the data in 'cdb' is not important from security perspective.




>
> While this might not be a security problem, this still produces
> unpredictable code behavior, so deserve to be fixed.

Yes I agree this. If we follow the exact hardware spec we need to
check how hardware handle this issue.
However as there is no harmful occurs, I think it's enough to focus
the origin issue--"g_mamloc overflow because scsi_cdb_length return
-1"


Thanks,
Li Qiang

>
> >>
> >>>>  76     case 0:
> >>>>  77         cdb_len =3D 6;
> >>>>  78         break;
> >>>>
> >>>> Then another out-of-bound read when the size returned by
> >>>> scsi_cdb_length() is used.
> >>>
> >>> Where is this?
> >>
> >> IIRC scsi_req_parse_cdb().
> >>
> >>>
> >>> So I think your intention is to ensure  'cdb_len' is consistent with
> >>> 'cdb[0]>>5'.
> >>>
> >>> Please correct me if I'm wrong.
> >>
> >> I'll recheck and go back to you during January.
> >>
> >> Regards,
> >>
> >> Phil.
> >>
> >>>>
> >>>> Figured out after reviewing:
> >>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg757937.html
> >>>>
> >>>> And reproduced fuzzing:
> >>>>
> >>>>   qemu-fuzz-i386: hw/scsi/megasas.c:1679: int megasas_handle_scsi(Me=
gasasState *, MegasasCmd *, int):
> >>>>   Assertion `len > 0 && cdb_len >=3D len' failed.
> >>>>   =3D=3D1689590=3D=3D ERROR: libFuzzer: deadly signal
> >>>>       #8 0x7f7a5d918e75 in __assert_fail (/lib64/libc.so.6+0x34e75)
> >>>>       #9 0x55a1b95cf6d4 in megasas_handle_scsi hw/scsi/megasas.c:167=
9:5
> >>>>       #10 0x55a1b95cf6d4 in megasas_handle_frame hw/scsi/megasas.c:1=
975:24
> >>>>       #11 0x55a1b95cf6d4 in megasas_mmio_write hw/scsi/megasas.c:213=
2:9
> >>>>       #12 0x55a1b981972e in memory_region_write_accessor softmmu/mem=
ory.c:491:5
> >>>>       #13 0x55a1b981972e in access_with_adjusted_size softmmu/memory=
.c:552:18
> >>>>       #14 0x55a1b981972e in memory_region_dispatch_write softmmu/mem=
ory.c:1501:16
> >>>>       #15 0x55a1b97f0ab0 in flatview_write_continue softmmu/physmem.=
c:2759:23
> >>>>       #16 0x55a1b97ec3f2 in flatview_write softmmu/physmem.c:2799:14
> >>>>       #17 0x55a1b97ec3f2 in address_space_write softmmu/physmem.c:28=
91:18
> >>>>       #18 0x55a1b985c7cd in cpu_outw softmmu/ioport.c:70:5
> >>>>       #19 0x55a1b99577ac in qtest_process_command softmmu/qtest.c:48=
1:13
> >>>>
> >>>> Inspired-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> >>>> Inspired-by: Alexander Bulekov <alxndr@bu.edu>
> >>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >>>> ---
> >>>>  hw/scsi/megasas.c | 5 +++++
> >>>>  1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> >>>> index 1a5fc5857db..f5ad4425b5b 100644
> >>>> --- a/hw/scsi/megasas.c
> >>>> +++ b/hw/scsi/megasas.c
> >>>> @@ -1667,6 +1667,7 @@ static int megasas_handle_scsi(MegasasState *s=
, MegasasCmd *cmd,
> >>>>  {
> >>>>      uint8_t *cdb;
> >>>>      int target_id, lun_id, cdb_len;
> >>>> +    int len =3D -1;
> >>>>      bool is_write;
> >>>>      struct SCSIDevice *sdev =3D NULL;
> >>>>      bool is_logical =3D (frame_cmd =3D=3D MFI_CMD_LD_SCSI_IO);
> >>>> @@ -1676,6 +1677,10 @@ static int megasas_handle_scsi(MegasasState *=
s, MegasasCmd *cmd,
> >>>>      lun_id =3D cmd->frame->header.lun_id;
> >>>>      cdb_len =3D cmd->frame->header.cdb_len;
> >>>>
> >>>> +    if (cdb_len > 0) {
> >>>> +        len =3D scsi_cdb_length(cdb);
> >>>> +    }
> >>>> +    assert(len > 0 && cdb_len >=3D len);
> >>>>      if (is_logical) {
> >>>>          if (target_id >=3D MFI_MAX_LD || lun_id !=3D 0) {
> >>>>              trace_megasas_scsi_target_not_present(
> >>>> --
> >>>> 2.26.2
> >>>>
> >>>>
> >>>
> >>
> >
>

