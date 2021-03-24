Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A00A3472E2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:42:49 +0100 (CET)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyAC-0005zt-6q
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOy8n-0005Ud-5w
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:41:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:42736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOy8k-00022j-7k
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:41:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOy8i-0001AS-3m
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:41:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1AEAE2E8055
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:41:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Mar 2021 07:31:22 -0000
From: P J P <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve fuzzer qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr mark-cave-ayland mauro-cascella pjps
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: P J P (pjps)
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
Message-Id: <161657108250.32717.5311086901810004029.malone@soybean.canonical.com>
Subject: [Bug 1909247] Re: QEMU: use after free vulnerability in esp_do_dma()
 in hw/scsi/esp.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: ff668b90288a9c331e6728be40dee873397e3654
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1909247 <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 17 March, 2021, 10:26:36 pm IST, Cheolwoo Myung <cwmyung@snu.=
ac.kr> wrote: =

> Hello  PJP, Mauro
>
> Of course. you can post the details with our reproducers. =

> I'm glad it helped you.
>
> Thank you.
> - Cheolwoo Myung
>


2021=EB=85=84 3=EC=9B=94 17=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 10:30, =
P J P <pjp@fedoraproject.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
>On Monday, 15 March, 2021, 07:54:30 pm IST, Mauro Matteo Cascella <mcascel=
l@redhat.com> wrote: =

>>JFYI, CVE-2020-35506 was assigned to a very similar (if not the same)
>>issue, see https://bugs.launchpad.net/qemu/+bug/1909247.
>
> * From the QEMU command lines below they do look similar.
>  =

> * CVE bug above does not link to an upstream fix/patch. Maybe it's not fi=
xed yet?
>
>
>On Mon, Mar 15, 2021 at 6:58 AM P J P <pjp@fedoraproject.org> wrote:
> >On Monday, 15 March, 2021, 11:11:14 am IST, Cheolwoo Myung <cwmyung@snu.=
ac.kr> wrote:
> >Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in am53c=
974 emulator of QEMU enabled ASan.
> >
> ># To reproduce this issue, please run the QEMU process with the followin=
g command line.
> >$ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=
=3Ddisk,format=3Draw \
> >  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk -drive >id=
=3DSysDisk,if=3Dnone,file=3D./disk.img
> >
> >
> > Using hypervisor fuzzer, hyfuzz, I found a stack buffer overflow issue =
in am53c974 emulator of QEMU enabled ASan.
> >
> ># To reproduce this issue, please run the QEMU process with the followin=
g command line.
> >$ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=
=3Ddisk,format=3Draw \
> >  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk -drive >id=
=3DSysDisk,if=3Dnone,file=3D./disk.img
> >

* I was able to reproduce these issues against the latest upstream git sour=
ce
  and following patch helps to fix above two issues.
=3D=3D=3D
$ git diff hw/scsi/
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index c3d3dab05e..4a6f208069 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -98,6 +98,7 @@ static void esp_pci_handle_abort(PCIESPState *pci, uint32=
_t val)
     trace_esp_pci_dma_abort(val);
     if (s->current_req) {
         scsi_req_cancel(s->current_req);
+        s->async_len =3D 0;
     }
 }
 =

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 507ab363bc..99bee7bc66 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -564,7 +564,7 @@ static void esp_do_dma(ESPState *s)
     int to_device =3D ((s->rregs[ESP_RSTAT] & 7) =3D=3D STAT_DO);
     uint8_t buf[ESP_CMDFIFO_SZ];
 =

-    len =3D esp_get_tc(s);
+    len =3D MIN(esp_get_tc(s), sizeof(buf));
     if (s->do_cmd) {
         /*
=3D=3D=3D


> >Using hypervisor fuzzer, hyfuzz, I found a heap buffer overflow issue in=
 am53c974 emulator of QEMU enabled ASan.
> >
> ># To reproduce this issue, please run the QEMU process with the followin=
g command line.
> >$ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=
=3Ddisk,format=3Draw \
> >  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk -drive >id=
=3DSysDisk,if=3Dnone,file=3D./disk.img

* This heap OOB access issue seems to occur because

   static void do_busid_cmd(...)
     ...
     buf =3D (uint8_t *)fifo8_pop_buf(&s->cmdfifo, cmdlen, &n); <=3D=3D

'buf' points towards an end of the 32 byte buffer allocated via

   static void esp_init(Object *obj)
     ...
     fifo8_create(&s->cmdfifo, ESP_CMDFIFO_SZ(=3D32));  <=3D=3D

and the OOB access could occur at numerous places, one of which is

scsi_req_new
 -> scsi_req_parse_cdb
  -> memcpy(cmd->buf, buf, cmd->len);  <=3D=3D buf=3D27, cmd->len=3D6 <=3D =
27+6 exceeds limit 32.


* This one is quite tricky to fix. Because 'buf[]' is accessed at various
  places with hard coded index values. It's not easy to check access
  against 's->cmdfifo' object.


@Cheolwoo: is it okay with you if we post above details and your reproducer=
s on the upstream bug

  -> https://bugs.launchpad.net/qemu/+bug/1909247

It'll help to discuss/prepare a proper fix patch.


Thank you.
---
  -P J P
http://feedmug.com

** Attachment added: "hw-esp-oob-issues.zip"
   https://bugs.launchpad.net/qemu/+bug/1909247/+attachment/5480385/+files/=
hw-esp-oob-issues.zip

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  New

Bug description:
  A use-after-free vulnerability was found in the am53c974 SCSI host bus
  adapter emulation of QEMU. It could occur in the esp_do_dma() function
  in hw/scsi/esp.c while handling the 'Information Transfer' command
  (CMD_TI). A privileged guest user may abuse this flaw to crash the
  QEMU process on the host, resulting in a denial of service or
  potential code execution with the privileges of the QEMU process.

  This issue was reported by Cheolwoo Myung (Seoul National University).

  Original report:
  Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
  am53c974 emulator of QEMU enabled ASan.

  It occurs while transferring information, as it does not check the
  buffer to be transferred.

  A malicious guest user/process could use this flaw to crash the QEMU
  process resulting in DoS scenario.

  To reproduce this issue, please run the QEMU with the following command
  line.

  # To enable ASan option, please set configuration with the following
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please find attached the disk images to reproduce this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909247/+subscriptions

