Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB9399DC2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:29:20 +0200 (CEST)
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojfE-0004zd-0H
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lojbv-0008Tq-Tb
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:25:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <li.zhang@ionos.com>)
 id 1lojbs-00070T-0d
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:25:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id l1so8218034ejb.6
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=h6Ua2yEXeghDj4R6ii7OflIvsUSEilnFg1lFBgZMZos=;
 b=BHmW3aA89UuZVWzwv5DkTl9raSBlgb0CpTRAC4mntbDDnMtnJBcM8IMrtmEf/43Uy+
 iiciPfMssDX5WYyGYG1ewUTQnvy35CAz+56dsRcyeJjOYjucwOyw6GptLQxyS4hiPk6k
 3NTkOb/UaT05z7rNm1/KNp6FZjjgzzNL2r3cpUW6hBbf+Ri0pewbOn5z0GbixuCfmgGY
 uR/1+SWzmPIEtxNvJiP1j3nrv5hLYWPVl+LHpFnQXnVfju2SxGq3hhfRnOfUQn0yW46p
 194U/BS6NVU4n0aI2vMWWlxTacODZHCRm190smfscYg12XJtObxDahRz9a1IGCzw3u+W
 hhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=h6Ua2yEXeghDj4R6ii7OflIvsUSEilnFg1lFBgZMZos=;
 b=LWighenbujw5dY3pp0V0KFt6Q1ZS5jri/isD7N3+PnhD91RfYQKfijKdpsLsmq9b3t
 aAiqEGMvrY3mr8BGMCjF5/0DFqMMYRjGpWr1yMkj/hWF+P5RGUHKxMZJ4toTfziA0ltd
 LNsszN6L3FMjLfUNIeGkMqlNiDypl/33NS9T89N3irEHkUwY2kg94fj0aw6fYuh1lUaZ
 VLee40DOdKp3QvEAtoiZrlEDf28gG73cpmzNDcRRWzQ39APo/9xu7gXZ1rCL52fh2QD3
 du8jvC2Y5UvOBTkzgvTEKATgGZLV5pOrcTLj8i4Cf5kkm3hM46q0iy0FAscF/TRT/i75
 Ip4Q==
X-Gm-Message-State: AOAM531HdjNY+Bbc0zVFwfQuhj+tMsM7wSyFH0Td8szT5Q16/utjWyyu
 RyC7/GGwOxHTToi3s2OdWsbwH8K+7O/WMsWDmgvQWzNy+nGPu56C
X-Google-Smtp-Source: ABdhPJz9T0DpVhPlxVwIpCTpQSHrh7BnATkp/FgYAN3UsK8onTgU7/L5qlcqQxE8rA7qPvjh+mFsvaRAL77WhGqwpiI=
X-Received: by 2002:a17:906:a95:: with SMTP id
 y21mr12561709ejf.522.1622712346314; 
 Thu, 03 Jun 2021 02:25:46 -0700 (PDT)
MIME-Version: 1.0
From: Li Zhang <li.zhang@ionos.com>
Date: Thu, 3 Jun 2021 11:25:35 +0200
Message-ID: <CAEM4iGGTcVydhHix-9=GJf6PHrZCdpx1iygV9vJ05bVNC0QN-g@mail.gmail.com>
Subject: Migration: multifd problems
To: QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f99f1e05c3d92883"
Received-SPF: permerror client-ip=2a00:1450:4864:20::629;
 envelope-from=li.zhang@ionos.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_PERMERROR=0.01, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f99f1e05c3d92883
Content-Type: text/plain; charset="UTF-8"

Hi all,

I tried live migration with multifd enabled. The guest on the source side
hangs there when it is migrated with the setting multifd-channels = 16.  It
works well when set multifd-channels as 2,4, 8.
Qemu version: qemu-6.0.50:
Latest commit:  commit c313e52e6459de2e9064767083a0c949c476e32b

Qemu command line:
source side:
qemu-system-x86_64 --machine pc,accel=kvm,usb=off,dump-guest-core=off -smp
40 -m 1024 --nographic \
    -device pci-bridge,id=pci_bridge1,bus=pci.0,chassis_nr=1 \
    -drive
file=./CentOS.raw,if=none,id=drive-virtio-disk0,format=raw,cache=none,aio=native
\
    -device
virtio-blk-pci,scsi=off,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=0
\
    -serial telnet:localhost:4444,server,nowait

Destination side:
qemu-system-x86_64  --machine pc,accel=kvm,usb=off,dump-guest-core=off -smp
40 -m 1024 --nographic \
    -device pci-bridge,id=pci_bridge1,bus=pci.0,chassis_nr=1 \
    -drive
file=./CentOS.raw,if=none,id=drive-virtio-disk0,format=raw,cache=none,aio=native
\
    -device
virtio-blk-pci,scsi=off,drive=drive-virtio-disk0,id=virtio-disk0,bootindex=0
\
    -serial telnet:localhost:4444,server,nowait \
    -incoming tcp:10.43.16.29:4446,server,wait

Setting of migration:
# migrate_set_capability multifd on
# migrate_set_parameter multifd-channels 16
# migrate_set_parameter max-bandwidth 4G

Any ideas?

Thanks
Li

--000000000000f99f1e05c3d92883
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div><br></div><div>I tried live migration wi=
th multifd enabled. The guest on the source side hangs there when it is mig=
rated with the setting=C2=A0multifd-channels=C2=A0=3D 16.=C2=A0 It works we=
ll when set multifd-channels as 2,4, 8.=C2=A0</div><div>Qemu version: qemu-=
6.0.50:=C2=A0</div><div>Latest commit:=C2=A0 commit c313e52e6459de2e9064767=
083a0c949c476e32b</div><div><br></div><div>Qemu command line:=C2=A0</div><d=
iv>source side:=C2=A0</div><div>qemu-system-x86_64 --machine pc,accel=3Dkvm=
,usb=3Doff,dump-guest-core=3Doff -smp 40 -m 1024 --nographic \<br>=C2=A0 =
=C2=A0 -device pci-bridge,id=3Dpci_bridge1,bus=3Dpci.0,chassis_nr=3D1 \<br>=
=C2=A0 =C2=A0 -drive file=3D./CentOS.raw,if=3Dnone,id=3Ddrive-virtio-disk0,=
format=3Draw,cache=3Dnone,aio=3Dnative \<br>=C2=A0 =C2=A0 -device virtio-bl=
k-pci,scsi=3Doff,drive=3Ddrive-virtio-disk0,id=3Dvirtio-disk0,bootindex=3D0=
 \<br>=C2=A0 =C2=A0 -serial telnet:localhost:4444,server,nowait<br></div><d=
iv><br></div><div>Destination side:=C2=A0</div><div>qemu-system-x86_64 =C2=
=A0--machine pc,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff -smp 40 -m 1024=
 --nographic \<br>=C2=A0 =C2=A0 -device pci-bridge,id=3Dpci_bridge1,bus=3Dp=
ci.0,chassis_nr=3D1 \<br>=C2=A0 =C2=A0 -drive file=3D./CentOS.raw,if=3Dnone=
,id=3Ddrive-virtio-disk0,format=3Draw,cache=3Dnone,aio=3Dnative \<br>=C2=A0=
 =C2=A0 -device virtio-blk-pci,scsi=3Doff,drive=3Ddrive-virtio-disk0,id=3Dv=
irtio-disk0,bootindex=3D0 \<br>=C2=A0 =C2=A0 -serial telnet:localhost:4444,=
server,nowait \<br>=C2=A0 =C2=A0 -incoming tcp:<a href=3D"http://10.43.16.2=
9:4446">10.43.16.29:4446</a>,server,wait<br></div><div><br></div><div>Setti=
ng of migration:=C2=A0</div><div># migrate_set_capability multifd on<br># m=
igrate_set_parameter multifd-channels 16<br># migrate_set_parameter max-ban=
dwidth 4G<br></div><div>=C2=A0</div><div>Any ideas?=C2=A0</div><div><br></d=
iv><div>Thanks</div><div>Li</div></div>

--000000000000f99f1e05c3d92883--

