Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B322B066C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 14:27:12 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdCd5-0001dh-UZ
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 08:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCbG-0000i8-1g
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:25:18 -0500
Received: from indium.canonical.com ([91.189.90.7]:42060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdCbD-000235-RZ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 08:25:17 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdCbC-00077j-P3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:25:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6FCF2E80E8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 13:25:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 13:11:36 -0000
From: Thomas Huth <1626207@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hagbardcelin th-huth
X-Launchpad-Bug-Reporter: Celine (hagbardcelin)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160921173119.27130.58488.malonedeb@chaenomeles.canonical.com>
Message-Id: <160518669631.4526.12089137746942539956.malone@soybean.canonical.com>
Subject: [Bug 1626207] Re: -device usb-host failing with usbip_vudc-vhdi_hcd
 gadget
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 3f0fadd5b17e113b76b51462c115999673a5e44d
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:20:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1626207 <1626207@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1626207

Title:
  -device usb-host failing with usbip_vudc-vhdi_hcd gadget

Status in QEMU:
  Incomplete

Bug description:
  I must admit that I do not know if this is a Qemu or a Kernel issue,
  but I try reporting here:

  When I try to forward a copy of my USB mouse that I made with the new vir=
tual USB device controller in kernel 4.7 I get the following in my log:
  [  +0.703256] usb 1-4: reset full-speed USB device number 3 using xhci_hcd
  [  +1.020776] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.855013] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.859052] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.857000] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.000141] usb 7-3: USB disconnect, device number 10
  [  +0.153056] usb 1-4: reset full-speed USB device number 3 using xhci_hcd
  [  +0.703746] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.855001] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.855006] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.855005] usb usb7-port3: Cannot enable. Maybe the USB cable is bad?
  [  +0.000009] usb usb7-port3: unable to enumerate USB device

  the commands I use for makeing the virtual device are(after making a copy=
 of the report description of my real mouse in /root/usb/kingston_report_de=
sc):
          mkdir /sys/kernel/config/usb_gadget/winmouse
          cd /sys/kernel/config/usb_gadget/winmouse
          echo "0x047d" > idVendor
          echo "0x1020" > idProduct
          mkdir strings/0x409
          echo 2016 > strings/0x409/serialnumber
          echo Kensington > strings/0x409/manufacturer
          echo "Kensington Expert Mouse" > strings/0x409/product
          mkdir configs/c.1
          mkdir configs/c.1/strings/0x409
          mkdir functions/hid.usb2
          echo 2 > functions/hid.usb2/protocol
          echo 1 > functions/hid.usb2/subclass
          echo 4 > functions/hid.usb2/report_length
          cat /root/usb/kingston_report_desc > functions/hid.usb2/report_de=
sc
          echo 0xa0 > configs/c.1/bmAttributes
          echo 100 > configs/c.1/MaxPower

          ln -s functions/hid.usb2 configs/c.1
          echo usbip-vudc.2 > UDC

          usbip attach -r localhost -d usbip-vudc.2

  The virtual mouse then shows up as Bus7,Dev10 and I use the option
  -device usb-host,hostbus=3D7,hostaddr=3D10,id=3Dhostdev6,bus=3Dusb.0,port=
=3D2 in
  Qemu to attach it.

  This is Qemu 2.7.0 on kernel 4.7.4

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1626207/+subscriptions

