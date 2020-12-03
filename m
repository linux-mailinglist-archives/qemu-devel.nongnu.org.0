Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D43A2CD481
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 12:26:32 +0100 (CET)
Received: from localhost ([::1]:44498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmkp-0004gj-Cj
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 06:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kkmgT-0002GU-BS; Thu, 03 Dec 2020 06:22:01 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kkmgR-0002ts-7u; Thu, 03 Dec 2020 06:22:00 -0500
Received: by mail-oi1-x242.google.com with SMTP id t205so1755677oib.12;
 Thu, 03 Dec 2020 03:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TkCKq3GfyecdCwe+Ob2sTC7DxC7yUIQ+ABXUM/+V/oI=;
 b=iIWPGCOd9RJ2Ve9GrzqEeRWuwT1DIxaUqLlklmEFNCMTmcbTsxODjeEjRmdwiONS7j
 cjLHK/3JvFMcfXSYCKUnsbjZrGdM53A3uBlVOiXo/GhNrYW8CaAj9PhsMle2JPBuGTvB
 ZDzF3/RS1DfxLHAQ8xJZFilPyvmzCHoGHch6iev3yV9hbVSX8m1iOXAGrSEtNDhXpVrt
 2GOnE9f7MSazR0R6ykx2x79Xxo6PuizNMvVUz7+9oLfXX1ebFySGQ52YSBZTqXsOIVM4
 4IRRrZVXdi0nQwBK0e3GTF0AC97WBufb5/fw6ogCrOeafvZgWoqeTOpoCrIIcihU4oJI
 LBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TkCKq3GfyecdCwe+Ob2sTC7DxC7yUIQ+ABXUM/+V/oI=;
 b=nPmp8tTouWQQ28D7cLEiu72KaMA/jzkCFiAeD7Vs9H/h6POZTM7g3AP9HWQMK3rSxT
 MRBzOT/7Z8SZ/9Sz1qBH893AlbaDc/9IZDXf5h6I0b1a91LeUhxZiV85hzlEbELySx8J
 wK6LCZ61xS+QVQkM4jlEEZEaXRT+wn54OyJClwYYEqFeAVHQceCaJPSFAlGtX82sR9tM
 pitfV9cvwRCCbTyw3tPokLut54YlLs4/Axyjk9soweMPiy6nNaBs03buI3AjaXqV5HSP
 cKaNZ31PAO1TzDrGbUp0Vd6/xBcrLoiTez+T5nEbN5MiRoDC+FkNdkpgnyKh31mUvasg
 hCiQ==
X-Gm-Message-State: AOAM531rVJyAcDApwLeNT7ni5mzqif2zOhE+5IjAMYVn8dqzLjsaS3lU
 0UFisDQEd+4LQUQmWgRctJnMTXk4KPJNHGt4wLg=
X-Google-Smtp-Source: ABdhPJwTjN70+gaXLreP1kfjuG05AVvFuzvovljXEHrMgrmc9HSaFNFavNv+aPk6vjLfsG13n5slEJ9EiCjqDm6VRFU=
X-Received: by 2002:a54:4d8f:: with SMTP id y15mr1488442oix.150.1606994517593; 
 Thu, 03 Dec 2020 03:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20201201191026.4149955-1-philmd@redhat.com>
 <20201201191026.4149955-3-philmd@redhat.com>
In-Reply-To: <20201201191026.4149955-3-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 3 Dec 2020 19:21:21 +0800
Message-ID: <CAKXe6SLWrP=Jg3mvasx1yF7wHJ1vvpR6+dVHqL4UM+_odbfkTg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/scsi/megasas: Assert cdb_len is valid in
 megasas_handle_scsi()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=liq3ea@gmail.com; helo=mail-oi1-x242.google.com
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
=9C=882=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:13=E5=86=99=E9=81=93=
=EF=BC=9A
>
> cdb_len can not be zero... (or less than 6) here, else we have a
> out-of-bound read first in scsi_cdb_length():
>
>  71 int scsi_cdb_length(uint8_t *buf)
>  72 {
>  73     int cdb_len;
>  74
>  75     switch (buf[0] >> 5) {

Hi Philippe,

Here I not read the spec. Just guest from your patch, this 'buf[0]>>5'
indicates/related with the cdb length, right?

So here(this patch) you  just want to ensure the 'buf[0]>>5' and the
'cdb_len' is consistent.

But I don't  think here is a 'out-of-bound' read issue.


The 'buf' is from here 'cdb'.
static int megasas_handle_scsi(MegasasState *s, MegasasCmd *cmd,
                               int frame_cmd)
{

    cdb =3D cmd->frame->pass.cdb;

'cmd->frame->pass.cdb' is an array in heap and  its data is mmaped
from the guest.

The guest can put any data in 'pass.cdb' which 'buf[0]>>5' can be 0 or
less than 6.

So every read of this 'pass.cdb'[0~15] is valid. Not an oob.




>  76     case 0:
>  77         cdb_len =3D 6;
>  78         break;
>
> Then another out-of-bound read when the size returned by
> scsi_cdb_length() is used.

Where is this?

So I think your intention is to ensure  'cdb_len' is consistent with
'cdb[0]>>5'.

Please correct me if I'm wrong.

Thanks,
Li Qiang

>
> Figured out after reviewing:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg757937.html
>
> And reproduced fuzzing:
>
>   qemu-fuzz-i386: hw/scsi/megasas.c:1679: int megasas_handle_scsi(Megasas=
State *, MegasasCmd *, int):
>   Assertion `len > 0 && cdb_len >=3D len' failed.
>   =3D=3D1689590=3D=3D ERROR: libFuzzer: deadly signal
>       #8 0x7f7a5d918e75 in __assert_fail (/lib64/libc.so.6+0x34e75)
>       #9 0x55a1b95cf6d4 in megasas_handle_scsi hw/scsi/megasas.c:1679:5
>       #10 0x55a1b95cf6d4 in megasas_handle_frame hw/scsi/megasas.c:1975:2=
4
>       #11 0x55a1b95cf6d4 in megasas_mmio_write hw/scsi/megasas.c:2132:9
>       #12 0x55a1b981972e in memory_region_write_accessor softmmu/memory.c=
:491:5
>       #13 0x55a1b981972e in access_with_adjusted_size softmmu/memory.c:55=
2:18
>       #14 0x55a1b981972e in memory_region_dispatch_write softmmu/memory.c=
:1501:16
>       #15 0x55a1b97f0ab0 in flatview_write_continue softmmu/physmem.c:275=
9:23
>       #16 0x55a1b97ec3f2 in flatview_write softmmu/physmem.c:2799:14
>       #17 0x55a1b97ec3f2 in address_space_write softmmu/physmem.c:2891:18
>       #18 0x55a1b985c7cd in cpu_outw softmmu/ioport.c:70:5
>       #19 0x55a1b99577ac in qtest_process_command softmmu/qtest.c:481:13
>
> Inspired-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> Inspired-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/scsi/megasas.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
> index 1a5fc5857db..f5ad4425b5b 100644
> --- a/hw/scsi/megasas.c
> +++ b/hw/scsi/megasas.c
> @@ -1667,6 +1667,7 @@ static int megasas_handle_scsi(MegasasState *s, Meg=
asasCmd *cmd,
>  {
>      uint8_t *cdb;
>      int target_id, lun_id, cdb_len;
> +    int len =3D -1;
>      bool is_write;
>      struct SCSIDevice *sdev =3D NULL;
>      bool is_logical =3D (frame_cmd =3D=3D MFI_CMD_LD_SCSI_IO);
> @@ -1676,6 +1677,10 @@ static int megasas_handle_scsi(MegasasState *s, Me=
gasasCmd *cmd,
>      lun_id =3D cmd->frame->header.lun_id;
>      cdb_len =3D cmd->frame->header.cdb_len;
>
> +    if (cdb_len > 0) {
> +        len =3D scsi_cdb_length(cdb);
> +    }
> +    assert(len > 0 && cdb_len >=3D len);
>      if (is_logical) {
>          if (target_id >=3D MFI_MAX_LD || lun_id !=3D 0) {
>              trace_megasas_scsi_target_not_present(
> --
> 2.26.2
>
>

