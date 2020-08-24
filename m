Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5124F1FE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 06:43:08 +0200 (CEST)
Received: from localhost ([::1]:44980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kA4K3-0005hd-Ca
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 00:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kpiq@gmx.us>) id 1kA2Pd-0004W8-SI
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 22:40:45 -0400
Received: from mout.gmx.net ([212.227.17.21]:39051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kpiq@gmx.us>) id 1kA2Pb-00066Z-Ef
 for qemu-devel@nongnu.org; Sun, 23 Aug 2020 22:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1598236839;
 bh=X4/kREf+LOCzcnClJVUgDg/Z0fr6MBz0joNwLMKeHU0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=AxeCHBhqIKcrkfieW2ajNFKDvtuxXshI2Y/jlvCuKh4kIgoficNDgu7Np4D8tNUrK
 rDmUKafp24bkdX9FAoqihWrmhySxk5Nxgc2BF+5zfCbvO++YF0FR+ohunURSrdy/H1
 4gOD3yYszsrlEwCakFunj2Y1ihbq76/RDyu3cqfA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [24.171.217.155] ([24.171.217.155]) by web-mail.gmx.net
 (3c-app-mailcom-bs08.server.lan [172.19.170.176]) (via HTTP); Mon, 24 Aug
 2020 04:40:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-3bf6c693-675f-4587-a673-717b058ceb06-1598236839217@3c-app-mailcom-bs08>
From: Pedro Serrano <kpiq@gmx.us>
To: qemu-devel@nongnu.org
Subject: unknown fs driver type 'virtiofs'
Content-Type: text/html; charset=UTF-8
Date: Mon, 24 Aug 2020 04:40:39 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:YCB1wHltTnfWl8FeIY5R/u7BIzrNLWtzCqvye2PUEbp0kCf3XSWxU0B0jZRfIpDfmB0S+
 htbQFNUpXGwEMTmBDUjlJgPCYISiqUdY78zCveMKN/v0cMKC3+Xkg0511hIyfThS/iQX53RGktw5
 MOASl42wQ0PSNFGgwbgKQNE3TFV/DFGXcQ0dEQroU+oftFalT03L8Q6AFZibkXsh6sEVbZMlCvUd
 YRcijhzgy8wmPUfH625id5L25SI6u5ZSb5jRQeZt0yjH/g26d+j+Ubb9Ik4AXmTz/67kqNEl2Nev
 o8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ojiEf5SY0K8=:9caeCiMGnqDRtdoFlkalGo
 gWzHtgBOhA7yHcAkTwLq7pLhhAFHwhi7QIvhkS6NfGx9gUTs0fR+WszcjdomBr++g7j52AJA+
 a48tfYbPwBBrjuxCOQ39a9fWb8qm1pMqCF7zymNCoVNe8UODMz4WoLGz8dOn0NZZC/2LNVIsB
 NM2zIUfJEWrbRQzBBvkv62jXOqzABGw8GJ+8Hw3I59XKvjK9G6p73v70R7NiYTzYU8xGiADAI
 N6+ENdJ/pUFNkMF4tHuQAtXhr2fWf89evcxQY1mHRUtK2k7YjrisEawD5JmA0PvuC/UuZP0+V
 DXKprqjmIaCWrh8s9Am2Vv6WsFFXLBZ3EY/Ysjch8eNIQ2zGYvCOhHt9u48TB/5j6lvpr9YiI
 y0lDkqQA93wV4qtna4cMmCZ7sDImir1ISFgjaXlVMf+dVzDpe/5RS7o+GmoW5TPV64Es+bL7z
 uvmk9ciFZAAM/uy2q/vaAeU1+OsVX2LVvZ2p+GRgxThhy+8Gp9ITC7CSC1Kqh6anR5k+0OWvS
 BBDxBNfYJkbhfjJIzAiH1iZNywBBQ8JfrO5YdSvqpeG7OyGQYMiGBsrxRsXKcyq0SScfvo/Ub
 zjTnW6DAFC3StX0W8Cr+TX4lqZrrNqItVtTKBJFh//YysD/4wy21GnKzK4OPotvwYYYiqdgWs
 jNA7dkP4NYqAeDrelpO/TTQC4euJKk1sXQ9P36njTLcsAlA==
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=kpiq@gmx.us;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/23 22:40:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Aug 2020 00:41:16 -0400
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
Cc: stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

<html><head></head><body><div style=3D"font-family: Verdana;font-size: 12.=
0px;"><pre>Folks

The instructions posted on <a href=3D"http://blog.vmsplice.net/2020/04/vir=
tio-fs-has-landed-in-qemu-50.html" target=3D"_blank">http://blog.vmsplice.=
net/2020/04/virtio-fs-has-landed-in-qemu-50.html</a> are simple and I foll=
owed them.

I&#39;ve updated my Debian Buster QEMU and LIBVIRT packages to all the new=
est buster-backports versions, and am running on:

Linux ps01ubx 5.7.0-0.bpo.2-amd64 #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-=
30) x86_64 GNU/Linux

lsmod&#124;grep virtio
virtiofs &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 32768 &nbsp;0
virtio_ring &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;36864 &nbsp;1 virtiof=
s
virtio &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 16384 &nbsp=
;1 virtiofs
fuse &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;139264 =
&nbsp;4 virtiofs

dpkg -l gir1.2-libvirt-glib-1.0:amd64 ipxe-qemu libvirglrenderer0:amd64 li=
bvirt-clients libvirt-daemon libvirt-daemon-system libvirt-glib-1.0-0:amd6=
4 libvirt0:amd64 python3-libvirt qemu qemu-block-extra qemu-system-common =
qemu-system-data qemu-system-gui:amd64 qemu-system-x86 qemu-utils
Desired=3DUnknown/Install/Remove/Purge/Hold
&#124; Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWai=
t/Trig-pend
&#124;/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
&#124;&#124;/ Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Version &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Architecture Desc
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=
=3D=3D
ii &nbsp;gir1.2-libvirt-glib-1.0:amd64 1.0.0-1 &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64 &nbsp; &nbsp; &nbsp=
; &nbsp;GObj
ii &nbsp;ipxe-qemu &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; 1.0.0+git-20190125.36a4c85-1 all &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;PXE&nbsp;
ii &nbsp;libvirglrenderer0:amd64 &nbsp; &nbsp; &nbsp; 0.7.0-2 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64 &nbs=
p; &nbsp; &nbsp; &nbsp;virt
ii &nbsp;libvirt-clients &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
5.0.0-4+deb10u1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64 &nbs=
p; &nbsp; &nbsp; &nbsp;Prog
ii &nbsp;libvirt-daemon &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;5.0.0-4+deb10u1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64=
 &nbsp; &nbsp; &nbsp; &nbsp;Virt
ii &nbsp;libvirt-daemon-system &nbsp; &nbsp; &nbsp; &nbsp; 5.0.0-4+deb10u1=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64 &nbsp; &nbsp; &nbsp=
; &nbsp;Libv
ii &nbsp;libvirt-glib-1.0-0:amd64 &nbsp; &nbsp; &nbsp;1.0.0-1 &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64 &nbs=
p; &nbsp; &nbsp; &nbsp;libv
ii &nbsp;libvirt0:amd64 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;5.0.0-4+deb10u1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;amd64=
 &nbsp; &nbsp; &nbsp; &nbsp;libr
ii &nbsp;python3-libvirt &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
5.0.0-1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;amd64 &nbsp; &nbsp; &nbsp; &nbsp;libv
ii &nbsp;qemu &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;1:5.0-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; amd64 &nbsp; &nbsp; &nbsp; &nbsp;fast
ii &nbsp;qemu-block-extra &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
1:5.0-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amd64 &nbsp; &n=
bsp; &nbsp; &nbsp;extr
ii &nbsp;qemu-system-common &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1:5.0=
-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amd64 &nbsp; &nbsp; =
&nbsp; &nbsp;QEMU
ii &nbsp;qemu-system-data &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
1:5.0-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; all &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;QEMU
ii &nbsp;qemu-system-gui:amd64 &nbsp; &nbsp; &nbsp; &nbsp; 1:5.0-14~bpo10+=
1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amd64 &nbsp; &nbsp; &nbsp; &nb=
sp;QEMU
ii &nbsp;qemu-system-x86 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
1:5.0-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; amd64 &nbsp; &n=
bsp; &nbsp; &nbsp;QEMU
ii &nbsp;qemu-utils &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;1:5.0-14~bpo10+1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
amd64 &nbsp; &nbsp; &nbsp; &nbsp;QEMU

Whenever I add a filesystem to the vm xml (virsh edit vm) virt-manager spi=
ts out an error message.  Because virt-manager doesn&#39;t have a &quot;vi=
rtiofs&quot; line in the drop-down choices I first choose &quot;PATH&quot;=
 and then try to change the XML.

    &lt;filesystem type=3D&#39;mount&#39; accessmode=3D&#39;passthrough&#3=
9;&gt;
      &lt;driver type=3D&#39;virtiofs&#39;/&gt;</pre>

<div>&nbsp;</div>

<div>The result is similar, whether I use virt-manager or virsh edit vm:</=
div>

<div>&nbsp;</div>

<div>virtio-manager replies:&nbsp;unknown fs driver type &#39;virtiofs&#39=
;</div>

<div>virsh edit vm does not let me save the file.&nbsp; &nbsp;It replies:&=
nbsp; &nbsp;
<div>error: XML document failed to validate against schema: Unable to vali=
date doc against /usr/share/libvirt/schemas/domain.rng<br/>
Extra element devices in interleave<br/>
Element domain failed to validate content</div>

<div>Failed. Try again? [y,n,i,f,?]:&nbsp;</div>
</div>

<div>&nbsp;</div>

<div>What am I doing wrong?</div>

<div>&nbsp;</div>

<div>Regards</div>

<div>&nbsp;</div>

<div>Pedro Serrano</div>

<div>&nbsp;</div>

<div>&nbsp;</div></div></body></html>

