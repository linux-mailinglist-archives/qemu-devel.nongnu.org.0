Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE461E2BD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 15:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orgyi-0000BM-NT; Sun, 06 Nov 2022 09:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1orgyg-0000AD-03
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 09:50:26 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1orgya-0003fH-Vs
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 09:50:25 -0500
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 1E4AD3F054
 for <qemu-devel@nongnu.org>; Sun,  6 Nov 2022 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1667746214;
 bh=7gb3VSCSgXAACtC0/WGTQfqJiRGPocu9SSWNwiMoT8k=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=PcM5vt2gbV8GP83G/xPfcA6d+UUMJSOwphd9eDYOdvtSVJ4UTIe7TWq38JlUjCHah
 3eSPyxcjfe7T1bfS5KHXYBeLbi3EJw+IkhK9Nzp1lgVq5JRUdo5TQMwl/xbzJI7WQp
 QwiXdRIMERrvKRJOrlElspwt40Tk00AbrvpipkYAN/6lNlmQ6KOqB4HWuudwSwoAk3
 xM1TxTF6cbh8Bw7oGyLKjZgo/C5DYK0HqbRREAP1N/kQV96om4S+ncNV5kdIM/Pcsj
 NZiLP+DtmW0pet5szTqgWmNmvI5wNoc+vrLWi+3I6Zeq63vQcpjjth5JFgYvhXqp/x
 tY9eRRTgrkUAw==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 028E640C89
 for <qemu-devel@nongnu.org>; Sun,  6 Nov 2022 14:50:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Nov 2022 14:41:55 -0000
From: Thomas Huth <1034423@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 8mabmzqcnyc1g4i7tjyvuprzli-contact-clubl5mz6ldresgvtiayqw6wzb janitor owentuz
 th-huth
X-Launchpad-Bug-Reporter: Owen Tuz (owentuz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20120808150403.6400.41896.malonedeb@chaenomeles.canonical.com>
Message-Id: <166774571600.49452.13517255266164667433.malone@dale.canonical.com>
Subject: [Bug 1034423] Re: Guests running OpenIndiana (and relatives) fail to
 boot on AMD hardware
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83f7123b02a2b50a64bc29e7e35197179a885279"; Instance="production"
X-Launchpad-Hash: ba4ac8efa3d65f08f0989ccd95cb014ebbff22d0
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1034423 <1034423@bugs.launchpad.net>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This bug tracker here is not used anymore. Could you please open a new
ticket here:

https://gitlab.com/qemu-project/qemu/-/issues

Thanks!

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1034423

Title:
  Guests running OpenIndiana (and relatives) fail to boot on AMD
  hardware

Status in QEMU:
  Expired

Bug description:
  First observed with OpenSolaris 2009.06, and also applies to the
  latest OpenIndiana release.

  Version: qemu-kvm 1.1.1

  Hardware:

  2 x AMD Opteron 6128 8-core processors, 64GB RAM.

  These guests boot on equivalent Intel hardware.

  To reproduce:

  qemu-kvm -nodefaults -m 512 -cpu host -vga cirrus -usbdevice tablet
  -vnc :99 -monitor stdio -hda drive.img -cdrom oi-
  dev-151a5-live-x86.iso -boot order=3Ddc

  I've tested with "-vga std" and various different emulated CPU types,
  to no effect.

  What happens:

  GRUB loads, and offers multiple boot options, but none work. Some kind
  of kernel panic flies by very fast before restarting the VM, and
  careful use of the screenshot button reveals that it reads as follows:

  panic[cpu0]/thread=3Dfec22de0: BAD TRAP: type=3D8 (#df Double fault)
  rp=3Dfec2b48c add r=3D0

  #df Double fault
  pid=3D0, pc=3D0xault
  pid=3D0, pc=3D0xfe800377, sp=3D0xfec40090, eflags=3D0x202
  cr0: 80050011<pg,wp,et,pe> cr4:b8<pge,pae,pse,de>
  cr2: 0cr3: ae2f000
                gs:            1b0    fs:              0   es:         160 =
  ds:          160
               edi:                0  esi:              0 ebp:             =
0 esp: fec2b4c4
               ebx: c0010015 edx:              0 ecx:             0 eax: fe=
c40400
               trp:                 8  err:              0 eip: fe800377  c=
s:           158
               efl:             202 usp: fec40090  ss:           160
  tss.tss_link:     0x0
  tss.tss_esp0:   0x0
  tss.tss_ss0:     0x160
  tss.tss_esp1:   0x0
  tss.tss_ss1:      0x0
  tss.tss esp2:     0x0
  tss.tss_ss2:      0x0
  tss.tss_cr3:       0xae2f000
  tss.tss_eip:       0xfec40400
  tss.tss_eflags:  0x202
  tss.tss_eax:      0xfec40400
  tss.tss_ebx:      0xc0010015
  tss.tss_ecx:      0xc0010000
  tss.tss_edx:      0x0
  tss.tss_esp:      0xfec40090

  Warning - stack not written to the dumpbuf
  fec2b3c8 unix:due+e4 (8, fec2b48c, 0, 0)
  fec2b478 unix:trap+12fa (fec2b48c, 0, 0)
  fec2b48c unix:_cmntrap+7c (1b0, 0, 160, 160, 0)

  If there's any more, I haven't managed to catch it.

  Solaris 11 does not seem to suffer from the same issue, although the
  first message that appears at boot (after the version info) is "trap:
  Unkown trap type 8 in user mode". Could be related?

  As always, thanks in advance and please let me know if I can help to
  test, or provide any more information.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1034423/+subscriptions


