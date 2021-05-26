Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7702391E5B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:48:30 +0200 (CEST)
Received: from localhost ([::1]:36376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxdt-0003GJ-Ut
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borello.gabriele8@gmail.com>)
 id 1llxAx-0006Gp-Qu
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:18:35 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:34336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <borello.gabriele8@gmail.com>)
 id 1llxAv-00026r-Tt
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:18:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id w12so2483210edx.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=y/bk9X0Nel1BpyToP+hEeeeuxonHkXTGFm0/BUdm/PQ=;
 b=pmGqYipdcJGSUS44crChT8TYQZFAlFoKa+8g+4/lAWxC+sa5GLZdvsZXWHVO75vmg7
 XKyY5C0J8avxg7tOdOUSiCS0+Z2oN/FcCoz+vhF7ypsUQrfrslrgV4InNiUXNiZa270r
 /NmnltCiSAE3HWZeswc2CNlQwI5vJCEXtO96kh77lp3Owznb2cJrHQkESmCMrlluEMKJ
 M3cyFScE8zQBibf/1Dm9mvcQ4In5IzN7GN1mzdzmeCQLBPplEJdOkwUExvtAp0NSjwTM
 NsIrPqKwBmAomVRtNOAW4WyDnKXRurnAlWDaz6vkHoOgC4rz5//tSE5+O3m4Ni+vRF7s
 CBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=y/bk9X0Nel1BpyToP+hEeeeuxonHkXTGFm0/BUdm/PQ=;
 b=iwED/eU30NB2N2U8ib41YBr3deJ/kMsRi6PifJtachmG8c+jSkebZLStMNDUfSfo5q
 YAqvxAwO+equa3KNk5CsHE1hCCtZJcXJCSV7TstyWQKkON6ad877OXqUz9U0rwHl2s3g
 IQx+FkPziOj7eH62oMNMo2KN3ovlnuXRIW6idvlkC8q4Ry0pwuJImzGMxAoLcH8Oh9Cr
 XlTggNJYrZ1Nb6IKHmTx8cH1l0vgAhtQt46WYWDFGRVJqw1yX3TbZ1C2qZtlFNZTvdUl
 j1z2V1Z7Q4tj5IAQbtMU31QktfHIWar1j/iSvr1w5S8rUAxPgZl/EutUhrdwiVOf9h3u
 hpmQ==
X-Gm-Message-State: AOAM530HWHLpgDEidIyPYUH1bJqhH+pTbgP2qlc8kz3ZSD5hidgnjch1
 g4k3V1atSx8X62yo+LdvKt5JezsgMsE224Odh/AoD+G19KxJd58j05U=
X-Google-Smtp-Source: ABdhPJwTLNVZoqljpKcmd4UcDrE+uSEEbQf69FQ1LEI+CJuS7FfEjqOnZZm496VMQKQkGWU7eI2ZiFZDTHOquqSZHjk=
X-Received: by 2002:a05:6402:8c7:: with SMTP id
 d7mr22052807edz.298.1622049508812; 
 Wed, 26 May 2021 10:18:28 -0700 (PDT)
MIME-Version: 1.0
From: Gabriele Borello <borello.gabriele8@gmail.com>
Date: Wed, 26 May 2021 19:18:17 +0200
Message-ID: <CAH1_c8og7hQXSEaaxg5tUoom+OuT+ZmE_12kVmk5ARW8ozfwQA@mail.gmail.com>
Subject: P2P problem on QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c7ea5405c33ed4c7"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=borello.gabriele8@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DEAR_SOMETHING=1.973,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 26 May 2021 13:35:26 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c7ea5405c33ed4c7
Content-Type: text/plain; charset="UTF-8"

Dear Sir/Madame,
I am Gabriele Borello, an engineering student at the Polytechnic of Turin.
I am preparing my master's thesis at the Reds laboratories of HEIG-VD in
Yverdon-les-bains, Switzerland.
It is based on the creation of a simple computational storage that exploits
the advantages deriving from the NVMe protocol.

 The QEMU environment has been widely used for the validation phase and I
am writing to you about a problem encountered for the implementation of a
peer-to-peer transfer using p2pmem-test (
https://github.com/sbates130272/p2pmem-test ).

The following kernel version was used: Linux 5.9.0-rc8 x86_64,
with the following QEMU settings:
sudo ./experimental_qemu/build/qemu-system-x86_64 -M pc -nographic
-no-reboot -object
memory-backend-file,id=pc.ram,size=3G,mem-path=/dev/shm/qemu-mem,share=on
-machine memory-backend=pc.ram -cpu host -m 3G -smp cpus=2 --enable-kvm
-kernel ./bzImage -drive file=./rootfs-target.img,if=ide,format=raw -drive
file=nvme.img,if=none,id=nvme0 -device
nvme,drive=nvme0,serial=d000000d,num_queues=8,cmb_size_mb=128 -drive
file=nvme1.img,if=none,id=nvme1 -device
nvme,drive=nvme1,serial=e000000e,num_queues=8,cmb_size_mb=128 -append
"console=ttyS0 root=/dev/sda rw panic=1 earlyprintk=serial,ttyS0,115200"
-trace events="${QEMU_TMP_DIR}"/events.

 The kernel was compiled by configuring peer-to-peer as described in the
p2pmem-test guide. Trying to run the command suggested in the p2pmem-test
guide ( ./p2pmem-test /dev/nvme0n1 /dev/nvme1n1 /dev/p2pmem0 -c 1 -s 4k),
we get a kernel panic.

We don't know where we went wrong. If you could give us feedback we would
be very grateful.

Thank you,
Best regards.

Gabriele

--000000000000c7ea5405c33ed4c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Dear Sir/Madame,</div>I am Gabriele Borello, an engin=
eering student at the Polytechnic of Turin. I am preparing my master&#39;s =
thesis at the Reds laboratories of HEIG-VD in Yverdon-les-bains, Switzerlan=
d.=C2=A0<div>It is based on the creation of a simple computational storage =
that exploits the advantages deriving from the NVMe protocol.<br></div><div=
><div><br></div><div>=C2=A0The QEMU environment has been widely used for th=
e validation phase and I am writing to you about a problem encountered for =
the implementation of a peer-to-peer transfer using p2pmem-test ( <a href=
=3D"https://github.com/sbates130272/p2pmem-test">https://github.com/sbates1=
30272/p2pmem-test</a> ).</div><div>=C2=A0</div><div>The following kernel ve=
rsion was used: Linux 5.9.0-rc8 x86_64,=C2=A0</div><div>with the following =
QEMU settings:=C2=A0</div><div>sudo ./experimental_qemu/build/qemu-system-x=
86_64 -M pc -nographic -no-reboot -object memory-backend-file,id=3Dpc.ram,s=
ize=3D3G,mem-path=3D/dev/shm/qemu-mem,share=3Don -machine memory-backend=3D=
pc.ram -cpu host -m 3G -smp cpus=3D2 --enable-kvm -kernel ./bzImage -drive =
file=3D./rootfs-target.img,if=3Dide,format=3Draw -drive file=3Dnvme.img,if=
=3Dnone,id=3Dnvme0 -device nvme,drive=3Dnvme0,serial=3Dd000000d,num_queues=
=3D8,cmb_size_mb=3D128 -drive file=3Dnvme1.img,if=3Dnone,id=3Dnvme1 -device=
 nvme,drive=3Dnvme1,serial=3De000000e,num_queues=3D8,cmb_size_mb=3D128 -app=
end &quot;console=3DttyS0 root=3D/dev/sda rw panic=3D1 earlyprintk=3Dserial=
,ttyS0,115200&quot; -trace events=3D&quot;${QEMU_TMP_DIR}&quot;/events.=C2=
=A0</div><div><br></div><div>=C2=A0The kernel was compiled by configuring p=
eer-to-peer as described in the p2pmem-test guide. Trying to run the comman=
d suggested in the p2pmem-test guide (<span style=3D"color:rgb(36,41,46);fo=
nt-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,A=
rial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;"><=
span style=3D"font-size:16px">=C2=A0</span>./p2pmem-test /dev/nvme0n1 /dev/=
nvme1n1 /dev/p2pmem0 -c 1 -s 4k</span>),=C2=A0 we get a kernel panic.=C2=A0=
</div><div><br></div><div>We don&#39;t know where we went wrong. If you cou=
ld give us feedback we would be very grateful.<br></div></div><div><br></di=
v><div>Thank you,</div><div>Best regards.</div><div><br></div><div>Gabriele=
</div></div>

--000000000000c7ea5405c33ed4c7--

