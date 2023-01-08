Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB1866130B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELLR-0001xl-Jd; Sat, 07 Jan 2023 21:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s228040u@st.go.tuat.ac.jp>)
 id 1pELLO-0001xQ-3T
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:23:30 -0500
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <s228040u@st.go.tuat.ac.jp>)
 id 1pELLH-0005F5-5m
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:23:29 -0500
Received: by mail-ua1-x932.google.com with SMTP id l13so1230983uai.8
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st-go-tuat-ac-jp.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C/DNgiWeoQElXNIjrJbu9yIZgOvQK9ffbMinN8He+tA=;
 b=znOknWFqmw4yPGOanzbo0hzie9DLmvI0Kw57taW0Mk2sT4qogkTjgEIvIy9Zw9T8Qz
 ASq9wCUoXniKX7ClJ2Rtlef//buC3y+YfdVcdtMFmCpULuc0n8jbuUpFx0mpLsf1KS6P
 CVMLl2XK82kDBaSrW5895vt6rSkVF8CYRmp6aMoWJ2b2fj8lLnQN8pkOgX92wS9PMVga
 0HEsjA2mrPK+B3uqAR0f+3EAn1IsRc5+qJOWv30A7jxDNdZiMI6Y96UWvTRobJTFPsb5
 tvErQeJyI3I53M+VWhLJcIxLzmoapzCB/FWY/1BS1UrfNiDOv9Uc1SfIyKAovhC0NAWc
 Dokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C/DNgiWeoQElXNIjrJbu9yIZgOvQK9ffbMinN8He+tA=;
 b=JE3JYMw1HdMJ8srlznVoqXFwn54PjV3JB/3ujm9TaCFG/xyg6n+z3nptPoA9TCC/z/
 9MlgMV+5fjLU4z4eK++MnZyz/S5oYclYNCH3jo3g/+t/L/IxiETVcvkwRZyQsljn8hf+
 var2T9DsUKS6FRu60qqGaBMXzgRKXBixTq+iHxF3ujZeZNcdaxPk0gJH3hebCRaAc1Tf
 SOqz83/4DwLL23kSbRWCG/Sc8pki3P5Ei/IctOobIbAT/mO3qS9wsAWHXMpubcFl0wHC
 3a3xGQaaETbhXr+Ly3gpwvWajI7tD8N3xt3QGoBjOwfT9wyViNi5WUHNrV+C3CMFlYSN
 dUHA==
X-Gm-Message-State: AFqh2kp6Zr/mnzVfM0VKPWAUSp2RNfEtwdg8CTzp8nlAEqoHLDzyMgd0
 bsssuiVmJq6R8uRbASxT0jrBYNRUaxyZwmNvm2rj48V3pHRcHRZv
X-Google-Smtp-Source: AMrXdXuMZvpbciyUonyiolDrzbB4BXx0UngLB7+X145jmJKtM3qijkCCSV5Q5eJhJ5g4q5oaDcocYVqTnxAeLmlqjkY=
X-Received: by 2002:a05:6130:2ac:b0:573:d2a:e6cf with SMTP id
 q44-20020a05613002ac00b005730d2ae6cfmr3008541uac.36.1673144600630; Sat, 07
 Jan 2023 18:23:20 -0800 (PST)
MIME-Version: 1.0
From: Kei IKEDA <s228040u@st.go.tuat.ac.jp>
Date: Sun, 8 Jan 2023 11:23:09 +0900
Message-ID: <CANPJ4po4sXZ9F3zbmpup4MmHamZG7GPf0AdDhWhDy=HNpRQyAg@mail.gmail.com>
Subject: Postcopy migration failed with "qemu-system-x86_64:
 postcopy_ram_listen_thread: loadvm failed: -5"
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000942f0805f1b7555e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::932;
 envelope-from=s228040u@st.go.tuat.ac.jp; helo=mail-ua1-x932.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000942f0805f1b7555e
Content-Type: text/plain; charset="UTF-8"

Hi!

I am experimenting with post-copy by modifying qemu-6.0.0 in my research.
I transfer a VM between two machines but it fails most of the time with
these error messages.

```
qemu-system-x86_64: postcopy_ram_listen_thread: loadvm failed: -5


qemu-system-x86_64: error while loading state for instance 0x0 of device
'kvm-tpr-opt'

qemu-system-x86_64: load of migration failed: Operation not permitted
```

I checked that it does not happen in vanilla qemu-6.0.0 post-copy migration
so my modifying causes this error.

I want to fix this error but I don't know what these error messages mean.

If anyone knows what the situation is with this error, please let me know.

Thanks.

---Experiment information---
machine
 HPE ProLiant DL360 Gen10
OS
 Linux 5.11.22 with Ubuntu 22.04.1 LTS
Startup command
 source side
  ```
  sudo /home/work/qemu-6.0.0/build/x86_64-softmmu/qemu-system-x86_64 -cpu
host -smp 8 -m 16G -enable-kvm -drive
if=virtio,file=/var/nfs/migrate/64G.qcow2,cache=none -monitor stdio -qmp
tcp:localhost:4445,server,nowait -net nic -netdev
bridge,helper=/usr/lib/qemu/qemu-bridge-helper,id=hn0 -device
virtio-net-pci,netdev=hn0,id=br0,mac=00:16:3e:33:ad:7d -net
user,smb=/var/nfs/migrate,hostfwd=tcp::5557-:22,hostfwd=tcp::8000-:11211
 ```
 destination side
  ```
  sudo /home/kei/work/qeme-6.0.0/build/x86_64-softmmu/qemu-system-x86_64
-cpu host -smp 8 -m 16G -enable-kvm -drive
if=virtio,file=/var/nfs/migrate/64G.qcow2,cache=none -monitor stdio
-incoming tcp:0:4444 -qmp tcp:0:4446,server,nowait -net nic -netdev
bridge,helper=/usr/lib/qemu/qemu-bridge-helper,id=hn0 -device
virtio-net-pci,netdev=hn0,id=br0,mac=00:16:3e:33:ad:7d -net
user,smb=/var/nfs/migrate,hostfwd=tcp::5557-:22,hostfwd=tcp::8000-:11211
  ```
---------------------------------------

--000000000000942f0805f1b7555e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi!<br><br></div>I am experimenting with post-co=
py by modifying qemu-6.0.0 in my research.<br></div><div>I transfer a VM be=
tween two machines but it fails most of the time with these error messages.=
<br></div><div><br>```<br>qemu-system-x86_64: postcopy_ram_listen_thread: l=
oadvm failed: -5 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>qemu-system-x86_64: error while loading state for instanc=
e 0x0 of device &#39;kvm-tpr-opt&#39; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>qemu-system-x86_64: load of migra=
tion failed: Operation not permitted=C2=A0 <br>```<br><br></div><div>I chec=
ked that it does not happen in vanilla qemu-6.0.0 post-copy migration so my=
 modifying causes this error.<br><br></div><div>I want to fix this error bu=
t I don&#39;t know what these error messages mean.<br><br></div><div>If any=
one knows what the situation is with this error, please let me know.<br><br=
></div><div>Thanks.<br><br></div><div>---Experiment information---<br></div=
><div>machine<br>=C2=A0HPE ProLiant DL360 Gen10<br></div><div>OS<br></div><=
div>=C2=A0Linux 5.11.22 with Ubuntu 22.04.1 LTS<br></div><div>Startup comma=
nd<br></div><div>=C2=A0source side<br>=C2=A0 ```<br>=C2=A0 sudo /home/work/=
qemu-6.0.0/build/x86_64-softmmu/qemu-system-x86_64 -cpu host -smp 8 -m 16G =
-enable-kvm -drive if=3Dvirtio,file=3D/var/nfs/migrate/64G.qcow2,cache=3Dno=
ne -monitor stdio -qmp tcp:localhost:4445,server,nowait -net nic -netdev br=
idge,helper=3D/usr/lib/qemu/qemu-bridge-helper,id=3Dhn0 -device virtio-net-=
pci,netdev=3Dhn0,id=3Dbr0,mac=3D00:16:3e:33:ad:7d -net user,smb=3D/var/nfs/=
migrate,hostfwd=3Dtcp::5557-:22,hostfwd=3Dtcp::8000-:11211<br>=C2=A0```<br>=
</div><div>=C2=A0destination side<br>=C2=A0 ```<br>=C2=A0 sudo /home/kei/wo=
rk/qeme-6.0.0/build/x86_64-softmmu/qemu-system-x86_64 -cpu host -smp 8 -m 1=
6G -enable-kvm -drive if=3Dvirtio,file=3D/var/nfs/migrate/64G.qcow2,cache=
=3Dnone -monitor stdio -incoming tcp:0:4444 -qmp tcp:0:4446,server,nowait -=
net nic -netdev bridge,helper=3D/usr/lib/qemu/qemu-bridge-helper,id=3Dhn0 -=
device virtio-net-pci,netdev=3Dhn0,id=3Dbr0,mac=3D00:16:3e:33:ad:7d -net us=
er,smb=3D/var/nfs/migrate,hostfwd=3Dtcp::5557-:22,hostfwd=3Dtcp::8000-:1121=
1<br>=C2=A0 ```<br>---------------------------------------<br></div></div>

--000000000000942f0805f1b7555e--

