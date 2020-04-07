Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97981A09C2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 11:09:18 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLkEQ-0005HZ-25
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 05:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gokuljnpr@gmail.com>) id 1jLfsR-0007V6-7o
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:30:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gokuljnpr@gmail.com>) id 1jLfsP-0007vh-2F
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 00:30:19 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:39034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <gokuljnpr@gmail.com>)
 id 1jLfsK-0007pb-8A; Tue, 07 Apr 2020 00:30:12 -0400
Received: by mail-vs1-xe29.google.com with SMTP id u9so1382283vsp.6;
 Mon, 06 Apr 2020 21:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GmLopuJIQ4nQjftYY7trhXt8z4UnO5pT6+mjPRCkrQQ=;
 b=W2RWNBfTwaELfihmvshdgr0eoIWeJzy/UmNBoWSF1fecA4WSMla88xV1lvNfk/w49c
 Fy44WLAZlXoSubTq21hqNORQtUIftqFuEVDOHHJxE6RKdKelF1FnxX0YND/Onfa2es/g
 imxTcvpTUPBM1Z/vG1j/mfKwod0SDAI3flLbo0eGPpZQtCvVj02/rDaKjNA30cpfbCBS
 hYvmfngRA3m5zfdrAecvsd6F7UMrQOK4dGji6qE9Au3XiUzUScsOE9O3spmADctc0dZ+
 PFfzgDoAwHyDaalmMad+LRfehnYxwPnOk54XVpD4FIjYDA2zhP+zae8cK1jalS1FgniA
 JNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GmLopuJIQ4nQjftYY7trhXt8z4UnO5pT6+mjPRCkrQQ=;
 b=pT09XCsguK6TWOVFRqJoM6TrtPwW4PH6UbfPT4ngItM7Tlyx09NkA/YeKXJ4c4z6O/
 GtXMtZ4FkghrUAo0ClKpZNH6jhAuXXoWZ8Hv/c8I7zzcLbiouJLnpAIKyyPwoZ9/gV9k
 NqkbA8zqzy6S4M5GlPHSKZnru7bVPfPVehRRD+jBlol58XuSISoLEhrg81CP5KsTZLqR
 DPWffiJr87u1yQ8NFhufQx/wzvoqxNm+PKL5QPYyjNZ4XaO4L+NBJVt3i4fecVtIjgCd
 ijoFWcXNodBhIkjuOGxaxEXoiy3UJCcV+/qMadhGBboGVheoX/5Xr+mQM5Kc6TOR4Tpo
 OAcQ==
X-Gm-Message-State: AGi0PuYvJCWnol+j1O1n7lgHO5lC2MDTSqrM57ltz0j1muC7YW6tSWRF
 36OV9weJbF9VcK6l3SWyj5+iDhOUIS4jIYDL5sFe/qtCBas=
X-Google-Smtp-Source: APiQypKqaQr3K/i/FFOjHkUtZsCfRQKdSabGjIkuxCm8G0HUIQdqof37QSPVlWlf3kAW2JZ0tkwKvASrep+MCAXgbEk=
X-Received: by 2002:a05:6102:101a:: with SMTP id
 q26mr449478vsp.149.1586233810982; 
 Mon, 06 Apr 2020 21:30:10 -0700 (PDT)
MIME-Version: 1.0
From: gokul cg <gokuljnpr@gmail.com>
Date: Tue, 7 Apr 2020 09:59:59 +0530
Message-ID: <CAFP4jM8RpUXCxUN_J-Enkx_LZU67Vbn45voGBLHH3CG0ELi2Vg@mail.gmail.com>
Subject: X86: Abnormal variation in Freebsd VM launch time w.r.t freebsd guest
 config
To: qemu-discuss@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/mixed; boundary="000000000000d6330505a2abd6cb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::e29
X-Mailman-Approved-At: Tue, 07 Apr 2020 04:58:30 -0400
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

--000000000000d6330505a2abd6cb
Content-Type: multipart/alternative; boundary="000000000000d6330205a2abd6c9"

--000000000000d6330205a2abd6c9
Content-Type: text/plain; charset="UTF-8"

Hi Team,

We are observing abnormal variation in VM launch time w.r.t guest config.

A simple VM(2gb ram no passthrough device) creation takes usually 6sec
(Time from execution of 'virsh create guest.xml  to get print "Welcome to
FreeBSD"' ),but when we add a USB passthrough device launch time increased
to 18-19 sec and further increased to 39-44sec when we have increased guest
ram to 48Gb.

The increase in time is too high than  excepted. Hence this is marked as
performance blocker in our test.

Here is the table summarises our experiments .

--------------------------------------------------------------------------------------------|---------------------|--------------------
    Sl |  Case
                                  |  time taken to launch vm

--------------------------------------------------------------------------------------------|---------------------|--------------------
    1. | Freebsd 11 with 2gb  guest ram and no pci pass through
  |    6-7        sec
    2. | Freebsd 11 with 48gb guest ram and no pci pass through
|    6-7        sec
    3. | Freebsd 11 with 48gb guest ram and usb pci pass-through
|   39-44       sec
    4. | Freebsd 11 with 2gb guest ram and usb pci pass-through
|   18-19       sec


Attaching guest config:
            1. vm_2gb_usbpassthrough.xml       --- Feebsd with 2gb  RAM and
USB as pci pass through device
            2. vm_48gb_usbpassthrough.xml      --- Feebsd with 48gb RAM and
USB as pci pass through device
            3. vm_48gb_nopci.xml               --- Feebsd with 48gb RAM and
no pci device passed

Note : 1) This we have seen with legacy pci passthrough device not with
vfio. And we have not noticed any perfoance impact other than qemu-init/vm
laucn time .
  2). We are using "FreeBSD-11.2-RELEASE-amd64.qcow2"(changed to raw
format) image downloaded from
https://download.freebsd.org/ftp/releases/VM-IMAGES/11.2-RELEASE/amd64/Latest/
-> Then modified the settings to set console to serial refer to the link ->
https://www.freebsd.org/doc/handbook/serialconsole-setup.html
-> Changed the /boot/default/loader.conf
add the console="comconsole"
and then change the /etc/ttys

USB hub device details  :
------------------------------
root@root-node:/vm/vm# lspci -v -s 00:14.0
00:14.0 USB controller: Intel Corporation C610/X99 series chipset USB xHCI
Host Controller (rev 05) (prog-if 30 [XHCI])
            Subsystem: Intel Corporation C610/X99 series chipset USB xHCI
Host Controller
            Flags: medium devsel, IRQ 16, NUMA node 0
            Memory at 183fc0000000 (64-bit, non-prefetchable) [size=64K]
            Capabilities: [70] Power Management version 2
            Kernel driver in use: pci-stub
root@root-node:/vm/vm#

root@root-node:/vm/vm# virsh version
Compiled against library: libvirt 1.3.5
Using library: libvirt 1.3.5
Using API: QEMU 1.3.5
Running hypervisor: QEMU 2.7.0

root@root-node:/vm/vm# uname -a
Linux root-node 4.8.28-rt10-WR9.0.0.24_ovp #1 SMP Wed Feb 19 12:47:32 PST
2020 x86_64 x86_64 x86_64 GNU/Linux
root@root-node:/vm/vm#

Host CPU details :
            CPU model      : Haswell E
            microcode       : 0x3d
            cpu cores         : 6

 Have you ever faced similar issues ? is it a qemu bug ?
 Any suggestions to improve launch time with legacy passthrough ?

 Regards,
 Gokul

--000000000000d6330205a2abd6c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div>Hi Team,</div><div>=C2=A0</div><div>We are observing abnorma=
l variation in VM launch time w.r.t guest config.</div><div><br></div><div>=
A simple VM(2gb ram no passthrough device) creation takes usually 6sec (Tim=
e from execution of &#39;virsh create guest.xml =C2=A0to get print &quot;We=
lcome to FreeBSD&quot;&#39; ),but when we add a USB passthrough device laun=
ch time increased to 18-19 sec and further increased to 39-44sec when we ha=
ve increased guest ram to 48Gb.</div><div>=C2=A0</div><div>The increase in =
time is too high than =C2=A0excepted. Hence this is marked as performance b=
locker in our test.</div><div>=C2=A0</div><div>Here is the table summarises=
 our experiments .</div><div>=C2=A0 =C2=A0 --------------------------------=
------------------------------------------------------------|--------------=
-------|--------------------</div><div>=C2=A0 =C2=A0 Sl | =C2=A0Case =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0time taken to launch vm</div><div>=C2=
=A0 =C2=A0 ----------------------------------------------------------------=
----------------------------|---------------------|--------------------</di=
v><div>=C2=A0 =C2=A0 1. | Freebsd 11 with 2gb =C2=A0guest ram and no pci pa=
ss through =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
6-7 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec</div><div>=C2=A0 =C2=A0 2. |=C2=A0<span =
style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium">Fr=
eebsd</span>=C2=A011 with 48gb guest ram and no pci pass through =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06-7 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sec</div><div>=C2=A0 =C2=A0 3. |=C2=A0<span style=3D"color:rgb(0,0,0);fo=
nt-family:-webkit-standard;font-size:medium">Freebsd</span>=C2=A011 with 48=
gb guest ram and usb pci pass-through =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 39-44 =C2=A0 =C2=A0 =C2=A0 sec</div><div>=C2=A0 =C2=A0 4. |=C2=A0<sp=
an style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium"=
>Freebsd</span>=C2=A011 with 2gb guest ram and usb pci pass-through =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 18-19 =C2=A0 =C2=A0 =C2=A0 sec<=
/div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0</div><div>Attaching guest co=
nfig:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1. vm_2gb_usbpass=
through.xml =C2=A0 =C2=A0 =C2=A0 --- Feebsd with 2gb =C2=A0RAM and USB as p=
ci pass through device</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
2. vm_48gb_usbpassthrough.xml =C2=A0 =C2=A0 =C2=A0--- Feebsd with 48gb RAM =
and USB as pci pass through device</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 3. vm_48gb_nopci.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --- Feebsd with 48gb RAM and no pci device passed</div><div><br>=
</div><div>Note : 1) This we have seen with legacy pci passthrough device n=
ot with vfio. And we have not noticed any perfoance impact other than qemu-=
init/vm laucn time .</div><div><span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span> =C2=A0 2). We are using &quot;FreeBSD-11.2-RE=
LEASE-amd64.qcow2&quot;(changed to raw format) image downloaded from <a hre=
f=3D"https://download.freebsd.org/ftp/releases/VM-IMAGES/11.2-RELEASE/amd64=
/Latest/">https://download.freebsd.org/ftp/releases/VM-IMAGES/11.2-RELEASE/=
amd64/Latest/</a></div><div><span class=3D"gmail-Apple-tab-span" style=3D"w=
hite-space:pre">		</span>-&gt; Then modified the settings to set console to=
 serial refer to the link -&gt; <a href=3D"https://www.freebsd.org/doc/hand=
book/serialconsole-setup.html">https://www.freebsd.org/doc/handbook/serialc=
onsole-setup.html</a></div><div><span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">		</span>-&gt; Changed the /boot/default/loader.conf</=
div><div><span class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">		<=
/span>add the console=3D&quot;comconsole&quot;</div><div><span class=3D"gma=
il-Apple-tab-span" style=3D"white-space:pre">		</span>and then change the /=
etc/ttys</div><div><br></div><div>USB hub device details =C2=A0:</div><div>=
------------------------------</div><div>root@root-node:/vm/vm# lspci -v -s=
 00:14.0</div><div>00:14.0 USB controller: Intel Corporation C610/X99 serie=
s chipset USB xHCI Host Controller (rev 05) (prog-if 30 [XHCI])</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Subsystem: Intel Corporation C610=
/X99 series chipset USB xHCI Host Controller</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Flags: medium devsel, IRQ 16, NUMA node 0</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Memory at 183fc0000000 (64-bit, n=
on-prefetchable) [size=3D64K]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Capabilities: [70] Power Management version 2</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Kernel driver in use: pci-stub</div><div>ro=
ot@root-node:/vm/vm#</div><div>=C2=A0</div><div>root@root-node:/vm/vm# virs=
h version</div><div>Compiled against library: libvirt 1.3.5</div><div>Using=
 library: libvirt 1.3.5</div><div>Using API: QEMU 1.3.5</div><div>Running h=
ypervisor: QEMU 2.7.0</div><div>=C2=A0</div><div>root@root-node:/vm/vm# una=
me -a</div><div>Linux root-node 4.8.28-rt10-WR9.0.0.24_ovp #1 SMP Wed Feb 1=
9 12:47:32 PST 2020 x86_64 x86_64 x86_64 GNU/Linux</div><div>root@root-node=
:/vm/vm#</div><div>=C2=A0</div><div>Host CPU details :</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU model =C2=A0 =C2=A0 =C2=A0: Haswell E</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 microcode =C2=A0 =C2=A0 =
=C2=A0 : 0x3d</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu cores=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 6</div><div><br></div><div>=C2=A0Have you ev=
er faced similar issues ? is it a qemu bug ?</div><div>=C2=A0Any suggestion=
s=C2=A0to improve launch time with legacy passthrough ?</div><div><br></div=
><div>=C2=A0Regards,</div><div>=C2=A0Gokul</div></div></div></div></div></d=
iv>

--000000000000d6330205a2abd6c9--

--000000000000d6330505a2abd6cb
Content-Type: text/xml; charset="US-ASCII"; name="vm_2gb_usbpassthrough.xml"
Content-Disposition: attachment; filename="vm_2gb_usbpassthrough.xml"
Content-Transfer-Encoding: base64
Content-ID: <f_k8pej82d0>
X-Attachment-Id: f_k8pej82d0

PGRvbWFpbiB0eXBlPSdrdm0nIHhtbG5zOnFlbXU9J2h0dHA6Ly9saWJ2aXJ0Lm9yZy9zY2hlbWFz
L2RvbWFpbi9xZW11LzEuMCc+Cgk8bmFtZT5GcmVlYnNkPC9uYW1lPgoJPHRpdGxlPkdlbmVyaWMg
YnNkICBndWVzdDwvdGl0bGU+Cgk8ZGVzY3JpcHRpb24+R2VuZXJhdGVkIGJ5IGxpYnZpcnQteG1s
LWV4YW1wbGVzLnB5LjwvZGVzY3JpcHRpb24+Cgk8bWVtb3J5IHVuaXQ9J0dpQic+MjwvbWVtb3J5
PgoJPHZjcHUgcGxhY2VtZW50PSdzdGF0aWMnPjE8L3ZjcHU+Cgk8b3M+CgkJPHR5cGUgYXJjaD0n
eDg2XzY0JyBtYWNoaW5lPSdwYyc+aHZtPC90eXBlPgoJPC9vcz4KCTxmZWF0dXJlcz4KCQk8YWNw
aS8+Cgk8L2ZlYXR1cmVzPgoJPGNwdSBtb2RlPSdjdXN0b20nPgoJCTx0b3BvbG9neSBzb2NrZXRz
PScxJyBjb3Jlcz0nMScgdGhyZWFkcz0nMScvPgoJPC9jcHU+Cgk8Y2xvY2sgb2Zmc2V0PSd2YXJp
YWJsZScgYWRqdXN0bWVudD0nMCcgYmFzaXM9J3V0Yyc+CgkJPHRpbWVyIG5hbWU9J3J0YycgdGlj
a3BvbGljeT0nY2F0Y2h1cCcvPgoJPC9jbG9jaz4KCTxkZXZpY2VzPgoJCTxlbXVsYXRvcj4vdXNy
L2Jpbi9rdm08L2VtdWxhdG9yPgoJCTxkaXNrIHR5cGU9J2ZpbGUnIGRldmljZT0nZGlzayc+CgkJ
CTxkcml2ZXIgbmFtZT0ncWVtdScgdHlwZT0ncmF3JyBjYWNoZT0nZGlyZWN0c3luYycgaW89J3Ro
cmVhZHMnLz4KCQkJPHNvdXJjZSBmaWxlPScvdm0vdm0vRnJlZUJTRC0xMS4yLVJFTEVBU0UtYW1k
NjQtMi5yYXcnLz4KCQkJPHRhcmdldCBkZXY9J3ZkYScgYnVzPSd2aXJ0aW8nLz4KCQkJPHNlcmlh
bD5WREE8L3NlcmlhbD4KCQkJPGJvb3Qgb3JkZXI9JzEnLz4KCQkJPGFsaWFzIG5hbWU9J3ZpcnRp
by1kaXNrMCcvPgoJCQk8YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0nMHgwMDAwJyBidXM9JzB4
MDAnIHNsb3Q9JzB4MDUnIGZ1bmN0aW9uPScweDAnLz4KCQk8L2Rpc2s+CgkJPGNvbnRyb2xsZXIg
dHlwZT0ncGNpJyBpbmRleD0nMCcgbW9kZWw9J3BjaS1yb290Jz4KCQkJPGFsaWFzIG5hbWU9J3Bj
aS4wJy8+CgkJPC9jb250cm9sbGVyPgoJCTxjb250cm9sbGVyIHR5cGU9J2lkZScgaW5kZXg9JzAn
PgoJCQk8YWxpYXMgbmFtZT0naWRlMCcvPgoJCQk8YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0n
MHgwMDAwJyBidXM9JzB4MDAnIHNsb3Q9JzB4MDEnIGZ1bmN0aW9uPScweDEnLz4KCQk8L2NvbnRy
b2xsZXI+CgkJPGNvbnRyb2xsZXIgdHlwZT0ndmlydGlvLXNlcmlhbCcgaW5kZXg9JzAnPgoJCQk8
YWxpYXMgbmFtZT0ndmlydGlvLXNlcmlhbDAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21h
aW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDA0JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9j
b250cm9sbGVyPgoJCTxpbnRlcmZhY2UgdHlwZT0nYnJpZGdlJz4KCQkJPG1hYyBhZGRyZXNzPSdm
YTpkYTo4MzpmYzplYzpkYicvPgoJCQk8c291cmNlIGJyaWRnZT0ndmlyYnIwJy8+CgkJCTx0YXJn
ZXQgZGV2PSd2bmV0MCcvPgoJCQk8bW9kZWwgdHlwZT0ndmlydGlvJy8+CgkJCTxsaW5rIHN0YXRl
PSd1cCcvPgoJCQk8Ym9vdCBvcmRlcj0nMycvPgoJCQk8YWxpYXMgbmFtZT0nbmV0MCcvPgoJCQk8
YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0nMHgwMDAwJyBidXM9JzB4MDAnIHNsb3Q9JzB4MDMn
IGZ1bmN0aW9uPScweDAnLz4KCQk8L2ludGVyZmFjZT4KCgkJPGNoYW5uZWwgdHlwZT0ndW5peCc+
CgkJCTx0YXJnZXQgdHlwZT0ndmlydGlvJyBuYW1lPSdkZWZhdWx0Jy8+CgkJCTxhbGlhcyBuYW1l
PSdjaGFubmVsMCcvPgoJCQk8YWRkcmVzcyB0eXBlPSd2aXJ0aW8tc2VyaWFsJyBjb250cm9sbGVy
PScwJyBidXM9JzAnIHBvcnQ9JzEnLz4KCQk8L2NoYW5uZWw+CgkJPGNoYW5uZWwgdHlwZT0ndW5p
eCc+CgkJCTx0YXJnZXQgdHlwZT0ndmlydGlvJyBuYW1lPSdvcmcucWVtdS5ndWVzdF9hZ2VudC4w
Jy8+CgkJCTxhbGlhcyBuYW1lPSdjaGFubmVsMScvPgoJCQk8YWRkcmVzcyB0eXBlPSd2aXJ0aW8t
c2VyaWFsJyBjb250cm9sbGVyPScwJyBidXM9JzAnIHBvcnQ9JzInLz4KCQk8L2NoYW5uZWw+CgkJ
PG1lbWJhbGxvb24gbW9kZWw9J3ZpcnRpbyc+CgkJCTxhbGlhcyBuYW1lPSdiYWxsb29uMCcvPgoJ
CQk8YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0nMHgwMDAwJyBidXM9JzB4MDAnIHNsb3Q9JzB4
MDYnIGZ1bmN0aW9uPScweDAnLz4KCQk8L21lbWJhbGxvb24+CgoJCTxzZXJpYWwgdHlwZT0ncHR5
Jz4KCQkJPHRhcmdldCBwb3J0PScwJy8+CgkJPC9zZXJpYWw+CgkJPGNvbnNvbGUgdHlwZT0ncHR5
Jz4KCQkJPHRhcmdldCB0eXBlPSdzZXJpYWwnIHBvcnQ9JzAnLz4KCQk8L2NvbnNvbGU+Cgk8L2Rl
dmljZXM+CiAgICA8cWVtdTpjb21tYW5kbGluZT4KICAgIDxxZW11OmFyZyB2YWx1ZT0nLWRldmlj
ZScvPgogICAgPHFlbXU6YXJnIHZhbHVlPSdrdm0tcGNpLWFzc2lnbixob3N0PTAwMDA6MDA6MTQu
MCcvPgogICAgPC9xZW11OmNvbW1hbmRsaW5lPgo8L2RvbWFpbj4=
--000000000000d6330505a2abd6cb
Content-Type: text/xml; charset="US-ASCII"; name="vm_48gb_nopci.xml"
Content-Disposition: attachment; filename="vm_48gb_nopci.xml"
Content-Transfer-Encoding: base64
Content-ID: <f_k8pej83m1>
X-Attachment-Id: f_k8pej83m1

PGRvbWFpbiB0eXBlPSdrdm0nIHhtbG5zOnFlbXU9J2h0dHA6Ly9saWJ2aXJ0Lm9yZy9zY2hlbWFz
L2RvbWFpbi9xZW11LzEuMCc+Cgk8bmFtZT5GcmVlYnNkPC9uYW1lPgoJPHRpdGxlPkdlbmVyaWMg
YnNkICBndWVzdDwvdGl0bGU+Cgk8ZGVzY3JpcHRpb24+R2VuZXJhdGVkIGJ5IGxpYnZpcnQteG1s
LWV4YW1wbGVzLnB5LjwvZGVzY3JpcHRpb24+Cgk8bWVtb3J5IHVuaXQ9J0dpQic+NDg8L21lbW9y
eT4KCTx2Y3B1IHBsYWNlbWVudD0nc3RhdGljJz4xPC92Y3B1PgoJPG9zPgoJCTx0eXBlIGFyY2g9
J3g4Nl82NCcgbWFjaGluZT0ncGMnPmh2bTwvdHlwZT4KCTwvb3M+Cgk8ZmVhdHVyZXM+CgkJPGFj
cGkvPgoJPC9mZWF0dXJlcz4KCTxjcHUgbW9kZT0nY3VzdG9tJz4KCQk8dG9wb2xvZ3kgc29ja2V0
cz0nMScgY29yZXM9JzEnIHRocmVhZHM9JzEnLz4KCTwvY3B1PgoJPGNsb2NrIG9mZnNldD0ndmFy
aWFibGUnIGFkanVzdG1lbnQ9JzAnIGJhc2lzPSd1dGMnPgoJCTx0aW1lciBuYW1lPSdydGMnIHRp
Y2twb2xpY3k9J2NhdGNodXAnLz4KCTwvY2xvY2s+Cgk8ZGV2aWNlcz4KCQk8ZW11bGF0b3I+L3Vz
ci9iaW4va3ZtPC9lbXVsYXRvcj4KCQk8ZGlzayB0eXBlPSdmaWxlJyBkZXZpY2U9J2Rpc2snPgoJ
CQk8ZHJpdmVyIG5hbWU9J3FlbXUnIHR5cGU9J3JhdycgY2FjaGU9J2RpcmVjdHN5bmMnIGlvPSd0
aHJlYWRzJy8+CgkJCTxzb3VyY2UgZmlsZT0nL3ZtL3ZtL0ZyZWVCU0QtMTEuMi1SRUxFQVNFLWFt
ZDY0LTIucmF3Jy8+CgkJCTx0YXJnZXQgZGV2PSd2ZGEnIGJ1cz0ndmlydGlvJy8+CgkJCTxzZXJp
YWw+VkRBPC9zZXJpYWw+CgkJCTxib290IG9yZGVyPScxJy8+CgkJCTxhbGlhcyBuYW1lPSd2aXJ0
aW8tZGlzazAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScw
eDAwJyBzbG90PScweDA1JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9kaXNrPgoJCTxjb250cm9sbGVy
IHR5cGU9J3BjaScgaW5kZXg9JzAnIG1vZGVsPSdwY2ktcm9vdCc+CgkJCTxhbGlhcyBuYW1lPSdw
Y2kuMCcvPgoJCTwvY29udHJvbGxlcj4KCQk8Y29udHJvbGxlciB0eXBlPSdpZGUnIGluZGV4PScw
Jz4KCQkJPGFsaWFzIG5hbWU9J2lkZTAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49
JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDAxJyBmdW5jdGlvbj0nMHgxJy8+CgkJPC9jb250
cm9sbGVyPgoJCTxjb250cm9sbGVyIHR5cGU9J3ZpcnRpby1zZXJpYWwnIGluZGV4PScwJz4KCQkJ
PGFsaWFzIG5hbWU9J3ZpcnRpby1zZXJpYWwwJy8+CgkJCTxhZGRyZXNzIHR5cGU9J3BjaScgZG9t
YWluPScweDAwMDAnIGJ1cz0nMHgwMCcgc2xvdD0nMHgwNCcgZnVuY3Rpb249JzB4MCcvPgoJCTwv
Y29udHJvbGxlcj4KCQk8aW50ZXJmYWNlIHR5cGU9J2JyaWRnZSc+CgkJCTxtYWMgYWRkcmVzcz0n
ZmE6ZGE6ODM6ZmM6ZWM6ZGInLz4KCQkJPHNvdXJjZSBicmlkZ2U9J3ZpcmJyMCcvPgoJCQk8dGFy
Z2V0IGRldj0ndm5ldDAnLz4KCQkJPG1vZGVsIHR5cGU9J3ZpcnRpbycvPgoJCQk8bGluayBzdGF0
ZT0ndXAnLz4KCQkJPGJvb3Qgb3JkZXI9JzMnLz4KCQkJPGFsaWFzIG5hbWU9J25ldDAnLz4KCQkJ
PGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDAz
JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9pbnRlcmZhY2U+CgoJCTxjaGFubmVsIHR5cGU9J3VuaXgn
PgoJCQk8dGFyZ2V0IHR5cGU9J3ZpcnRpbycgbmFtZT0nZGVmYXVsdCcvPgoJCQk8YWxpYXMgbmFt
ZT0nY2hhbm5lbDAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ndmlydGlvLXNlcmlhbCcgY29udHJvbGxl
cj0nMCcgYnVzPScwJyBwb3J0PScxJy8+CgkJPC9jaGFubmVsPgoJCTxjaGFubmVsIHR5cGU9J3Vu
aXgnPgoJCQk8dGFyZ2V0IHR5cGU9J3ZpcnRpbycgbmFtZT0nb3JnLnFlbXUuZ3Vlc3RfYWdlbnQu
MCcvPgoJCQk8YWxpYXMgbmFtZT0nY2hhbm5lbDEnLz4KCQkJPGFkZHJlc3MgdHlwZT0ndmlydGlv
LXNlcmlhbCcgY29udHJvbGxlcj0nMCcgYnVzPScwJyBwb3J0PScyJy8+CgkJPC9jaGFubmVsPgoJ
CTxtZW1iYWxsb29uIG1vZGVsPSd2aXJ0aW8nPgoJCQk8YWxpYXMgbmFtZT0nYmFsbG9vbjAnLz4K
CQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScw
eDA2JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9tZW1iYWxsb29uPgoKCQk8c2VyaWFsIHR5cGU9J3B0
eSc+CgkJCTx0YXJnZXQgcG9ydD0nMCcvPgoJCTwvc2VyaWFsPgoJCTxjb25zb2xlIHR5cGU9J3B0
eSc+CgkJCTx0YXJnZXQgdHlwZT0nc2VyaWFsJyBwb3J0PScwJy8+CgkJPC9jb25zb2xlPgoJPC9k
ZXZpY2VzPgo8L2RvbWFpbj4=
--000000000000d6330505a2abd6cb
Content-Type: text/xml; charset="US-ASCII"; name="vm_48gb_usbpassthrough.xml"
Content-Disposition: attachment; filename="vm_48gb_usbpassthrough.xml"
Content-Transfer-Encoding: base64
Content-ID: <f_k8pej84b2>
X-Attachment-Id: f_k8pej84b2

PGRvbWFpbiB0eXBlPSdrdm0nIHhtbG5zOnFlbXU9J2h0dHA6Ly9saWJ2aXJ0Lm9yZy9zY2hlbWFz
L2RvbWFpbi9xZW11LzEuMCc+Cgk8bmFtZT5GcmVlYnNkPC9uYW1lPgoJPHRpdGxlPkdlbmVyaWMg
YnNkICBndWVzdDwvdGl0bGU+Cgk8ZGVzY3JpcHRpb24+R2VuZXJhdGVkIGJ5IGxpYnZpcnQteG1s
LWV4YW1wbGVzLnB5LjwvZGVzY3JpcHRpb24+Cgk8bWVtb3J5IHVuaXQ9J0dpQic+NDg8L21lbW9y
eT4KCTx2Y3B1IHBsYWNlbWVudD0nc3RhdGljJz4xPC92Y3B1PgoJPG9zPgoJCTx0eXBlIGFyY2g9
J3g4Nl82NCcgbWFjaGluZT0ncGMnPmh2bTwvdHlwZT4KCTwvb3M+Cgk8ZmVhdHVyZXM+CgkJPGFj
cGkvPgoJPC9mZWF0dXJlcz4KCTxjcHUgbW9kZT0nY3VzdG9tJz4KCQk8dG9wb2xvZ3kgc29ja2V0
cz0nMScgY29yZXM9JzEnIHRocmVhZHM9JzEnLz4KCTwvY3B1PgoJPGNsb2NrIG9mZnNldD0ndmFy
aWFibGUnIGFkanVzdG1lbnQ9JzAnIGJhc2lzPSd1dGMnPgoJCTx0aW1lciBuYW1lPSdydGMnIHRp
Y2twb2xpY3k9J2NhdGNodXAnLz4KCTwvY2xvY2s+Cgk8ZGV2aWNlcz4KCQk8ZW11bGF0b3I+L3Vz
ci9iaW4va3ZtPC9lbXVsYXRvcj4KCQk8ZGlzayB0eXBlPSdmaWxlJyBkZXZpY2U9J2Rpc2snPgoJ
CQk8ZHJpdmVyIG5hbWU9J3FlbXUnIHR5cGU9J3JhdycgY2FjaGU9J2RpcmVjdHN5bmMnIGlvPSd0
aHJlYWRzJy8+CgkJCTxzb3VyY2UgZmlsZT0nL3ZtL3ZtL0ZyZWVCU0QtMTEuMi1SRUxFQVNFLWFt
ZDY0LTIucmF3Jy8+CgkJCTx0YXJnZXQgZGV2PSd2ZGEnIGJ1cz0ndmlydGlvJy8+CgkJCTxzZXJp
YWw+VkRBPC9zZXJpYWw+CgkJCTxib290IG9yZGVyPScxJy8+CgkJCTxhbGlhcyBuYW1lPSd2aXJ0
aW8tZGlzazAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScw
eDAwJyBzbG90PScweDA1JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9kaXNrPgoJCTxjb250cm9sbGVy
IHR5cGU9J3BjaScgaW5kZXg9JzAnIG1vZGVsPSdwY2ktcm9vdCc+CgkJCTxhbGlhcyBuYW1lPSdw
Y2kuMCcvPgoJCTwvY29udHJvbGxlcj4KCQk8Y29udHJvbGxlciB0eXBlPSdpZGUnIGluZGV4PScw
Jz4KCQkJPGFsaWFzIG5hbWU9J2lkZTAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49
JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDAxJyBmdW5jdGlvbj0nMHgxJy8+CgkJPC9jb250
cm9sbGVyPgoJCTxjb250cm9sbGVyIHR5cGU9J3ZpcnRpby1zZXJpYWwnIGluZGV4PScwJz4KCQkJ
PGFsaWFzIG5hbWU9J3ZpcnRpby1zZXJpYWwwJy8+CgkJCTxhZGRyZXNzIHR5cGU9J3BjaScgZG9t
YWluPScweDAwMDAnIGJ1cz0nMHgwMCcgc2xvdD0nMHgwNCcgZnVuY3Rpb249JzB4MCcvPgoJCTwv
Y29udHJvbGxlcj4KCQk8aW50ZXJmYWNlIHR5cGU9J2JyaWRnZSc+CgkJCTxtYWMgYWRkcmVzcz0n
ZmE6ZGE6ODM6ZmM6ZWM6ZGInLz4KCQkJPHNvdXJjZSBicmlkZ2U9J3ZpcmJyMCcvPgoJCQk8dGFy
Z2V0IGRldj0ndm5ldDAnLz4KCQkJPG1vZGVsIHR5cGU9J3ZpcnRpbycvPgoJCQk8bGluayBzdGF0
ZT0ndXAnLz4KCQkJPGJvb3Qgb3JkZXI9JzMnLz4KCQkJPGFsaWFzIG5hbWU9J25ldDAnLz4KCQkJ
PGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScweDAz
JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9pbnRlcmZhY2U+CgoJCTxjaGFubmVsIHR5cGU9J3VuaXgn
PgoJCQk8dGFyZ2V0IHR5cGU9J3ZpcnRpbycgbmFtZT0nZGVmYXVsdCcvPgoJCQk8YWxpYXMgbmFt
ZT0nY2hhbm5lbDAnLz4KCQkJPGFkZHJlc3MgdHlwZT0ndmlydGlvLXNlcmlhbCcgY29udHJvbGxl
cj0nMCcgYnVzPScwJyBwb3J0PScxJy8+CgkJPC9jaGFubmVsPgoJCTxjaGFubmVsIHR5cGU9J3Vu
aXgnPgoJCQk8dGFyZ2V0IHR5cGU9J3ZpcnRpbycgbmFtZT0nb3JnLnFlbXUuZ3Vlc3RfYWdlbnQu
MCcvPgoJCQk8YWxpYXMgbmFtZT0nY2hhbm5lbDEnLz4KCQkJPGFkZHJlc3MgdHlwZT0ndmlydGlv
LXNlcmlhbCcgY29udHJvbGxlcj0nMCcgYnVzPScwJyBwb3J0PScyJy8+CgkJPC9jaGFubmVsPgoJ
CTxtZW1iYWxsb29uIG1vZGVsPSd2aXJ0aW8nPgoJCQk8YWxpYXMgbmFtZT0nYmFsbG9vbjAnLz4K
CQkJPGFkZHJlc3MgdHlwZT0ncGNpJyBkb21haW49JzB4MDAwMCcgYnVzPScweDAwJyBzbG90PScw
eDA2JyBmdW5jdGlvbj0nMHgwJy8+CgkJPC9tZW1iYWxsb29uPgoKCQk8c2VyaWFsIHR5cGU9J3B0
eSc+CgkJCTx0YXJnZXQgcG9ydD0nMCcvPgoJCTwvc2VyaWFsPgoJCTxjb25zb2xlIHR5cGU9J3B0
eSc+CgkJCTx0YXJnZXQgdHlwZT0nc2VyaWFsJyBwb3J0PScwJy8+CgkJPC9jb25zb2xlPgoJPC9k
ZXZpY2VzPgogICAgPHFlbXU6Y29tbWFuZGxpbmU+CiAgICA8cWVtdTphcmcgdmFsdWU9Jy1kZXZp
Y2UnLz4KICAgIDxxZW11OmFyZyB2YWx1ZT0na3ZtLXBjaS1hc3NpZ24saG9zdD0wMDAwOjAwOjE0
LjAnLz4KICAgIDwvcWVtdTpjb21tYW5kbGluZT4KPC9kb21haW4+
--000000000000d6330505a2abd6cb--

