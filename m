Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3DE54E0F5
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:43:25 +0200 (CEST)
Received: from localhost ([::1]:33622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oqK-0002Zc-PH
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1olD-0007zi-E1
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:38:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1ol8-0004Ms-V9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HS7IotA5XXxW8x1ooi0MIG9MkNGCCMXrK1xqd0zWYbo=; b=yXhBbqvEeQYU3WuCuZw0H/As9T
 eH4B51MGfUwIiwgU3uTSoWmpjWekO3xuwqfmqXZMTgzcyLOOigZTr67/dY3Vv/aGxOOHfF8z4WUgS
 D8s8Hqzixh1DgyUy81GtE5txKPMfRlhE6tiC/btIfRdZf/loF8wz5FcRzNbQSvNteUDX4PO3ueHQa
 JcoTrTW3Q3zr2N1hjApG55QKprRXuqPA9poCaXJqIcREiNK+PGRGJicAjgi/2EKWblRYj5Zdn9fsa
 MOBhhcIoh3dauiRj3dwPf3N1KjTGi3PF5w++KP7pCN52/KqLACpcwOggrwmZmHBTqrVQ9yhZNPXKo
 VrVxtBH+/gmgdPFrom+LycXFbqNrMw36A3+YSKYOTzjvVpGH6yDN41J4AXLS9Xz53fCRvyGSrVnu+
 m+PHE//qnaIbBX+pPN9dNLIWtPxhkUf7CKBRX05gEDylbQjG2xVidwSKEiTsyahyp0Wh+8dAzZJzx
 JV280QUUzUliAg4W6r1U2oU1E6klMCGkApgNRgqFC3RhhhhmIqndof/QQvBRHoTyb1mqbqoVCMicf
 lR8BY6eJwyZ3/tibiElYQ5bPTn6+2zYkl6aAIHX5RqM5UunXRk9wQC7HQE8RoDcoMCfHvrDKqK8h/
 /K7Dm/KixDsgYlSAba3QfGb12Ba0nOTULRlfeCdz4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1ojw-0003ZH-Tj; Thu, 16 Jun 2022 13:36:53 +0100
Message-ID: <b93a1312-2272-d7b4-5a45-d04a7fd35840@ilande.co.uk>
Date: Thu, 16 Jun 2022 13:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
References: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
 <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220616120715.uksbwjynvb6usjhu@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2022 13:07, Gerd Hoffmann wrote:

> On Thu, Jun 16, 2022 at 09:54:46AM +0100, Mark Cave-Ayland wrote:
>> Hi all,
>>
>> Howard pointed me off-list to a corrupted screen display issue experienced
>> when changing the screen colour depth in MacOS under qemu-system-ppc. I was
>> able to reproduce it here, and noticed from the output that the issue was
>> likely due to the host display not updating its depth accordingly.
>>
>> After it was confirmed to me that this was working in QEMU 6.2, I was able
>> to eventually bisect the problem down to this commit:
>>
>>
>> cb8962c146b2633a4b04562281de9b2703bba849 is the first bad commit
>> commit cb8962c146b2633a4b04562281de9b2703bba849
>> Author: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Date:   Tue Feb 15 00:13:37 2022 +0400
>>
>>      ui: do not create a surface when resizing a GL scanout
>>
>>      qemu_console_resize() will create a blank surface and replace the
>>      current scanout with it if called while the current scanout is
>>      GL (texture or dmabuf).
>>
>>      This is not only very costly, but also can produce glitches on the
>>      display/listener side.
>>
>>      Instead, compare the current console size with the fitting console
>>      functions, which also works when the scanout is GL.
>>
>>      Note: there might be still an unnecessary surface creation on calling
>>      qemu_console_resize() when the size is actually changing, but display
>>      backends currently rely on DisplaySurface details during
>>      dpy_gfx_switch() to handle various resize aspects. We would need more
>>      refactoring to handle resize without DisplaySurface, this is left for a
>>      future improvement.
>>
>>      Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>      Message-Id: <20220214201337.1814787-4-marcandre.lureau@redhat.com>
>>      Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>
>>   ui/console.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>>
>> Some more background: the screen in qemu-system-ppc's MacOS is controlled
>> via a custom driver written by Ben which uses the Bochs VBE registers to
>> change the screen width/height/depth. The code used to do this can be found
>> at https://gitlab.com/qemu-project/QemuMacDrivers/-/blob/master/QemuVGADriver/src/QemuVga.c#L354.
>>
>> Looking at the changes in cb8962c146 my guess would be that either the
>> updated check in qemu_console_resize() should also check to see if the
>> surface depth is unchanged before exiting early, or that there is an extra
>> update required in the VGA device when changing just the screen colour depth
>> by itself.
> 
> Can you try ditch the QEMU_ALLOCATED_FLAG check added by the commit?

Commit cb8962c146 drops the QEMU_ALLOCATED_FLAG check: if I add it back in with the 
following diff on top then everything works again:

diff --git a/ui/console.c b/ui/console.c
index 365a2c14b8..decae4287f 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2400,11 +2400,12 @@ static void vc_chr_open(Chardev *chr,

  void qemu_console_resize(QemuConsole *s, int width, int height)
  {
-    DisplaySurface *surface;
+    DisplaySurface *surface = qemu_console_surface(s);

      assert(s->console_type == GRAPHIC_CONSOLE);

-    if (qemu_console_get_width(s, -1) == width &&
+    if (surface && (surface->flags & QEMU_ALLOCATED_FLAG) &&
+        qemu_console_get_width(s, -1) == width &&
          qemu_console_get_height(s, -1) == height) {
          return;
      }

> Which depth changes triggers this?  Going from direct color to a
> paletted mode?

A quick test suggests anything that isn't 32-bit colour is affected. With logging 
enabled I see the following when selecting from the 3 available colour depths in the 
Monitors Control Panel:

- 256 colours (8-bit color), corrupted

vga_vbe_write index 0x4, val 0x0
vga_vbe_write index 0x3, val 0x8
vga_vbe_write index 0x1, val 0x280
vga_vbe_write index 0x2, val 0x1e0
vga_vbe_write index 0x5, val 0x0
vga_vbe_write index 0x6, val 0x280
vga_vbe_write index 0x7, val 0x3c0
vga_vbe_write index 0x8, val 0x0
vga_vbe_write index 0x9, val 0x0
vga_vbe_write index 0x4, val 0x61
vga_std_write_io addr 0x3c8, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x1
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x2
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x3
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x4
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x5
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x6
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x7
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x8
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x9
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xa
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xb
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xd
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xe
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xf
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x10
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x11
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x12
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x13
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x14
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x15
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x16
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x17
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x18
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x19
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x1a
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x1b
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x1c
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x1d
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x1e
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x1f
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x20
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x21
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x22
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x23
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x24
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x25
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x26
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x27
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x28
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x29
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x2a
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x2b
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x2c
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x2d
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x2e
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x2f
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x30
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x31
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x32
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x34
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x35
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x36
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x37
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x38
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x39
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x3a
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x3b
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x3c
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x3d
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x3e
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x3f
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x40
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x41
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x42
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x43
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x44
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x45
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x46
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x47
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x48
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x49
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x4a
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x4b
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x4c
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x4d
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x4e
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x4f
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x50
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x51
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x52
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x53
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x54
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x55
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x56
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x57
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x58
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x59
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x5a
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x5b
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x5c
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x5d
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x5e
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x5f
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x60
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x61
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x62
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x63
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x64
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x65
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x67
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x68
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x69
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x6a
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x6b
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x6c
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x6d
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x6e
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x6f
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x70
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x71
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x72
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x73
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x74
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x75
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x76
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x77
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x78
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x79
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x7a
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x7b
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x7c
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x7d
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x7e
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x7f
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x80
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x81
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x82
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x83
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x84
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x85
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x86
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x87
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x88
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x89
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x8a
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x8b
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x8c
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x8d
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x8e
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x8f
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x90
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x91
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x92
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x93
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x94
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x95
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x96
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x97
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x98
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0x9a
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0x9b
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0x9c
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0x9d
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0x9e
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0x9f
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xa0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xa1
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xa2
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xa3
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xa4
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xa5
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xa6
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xa7
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xa8
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xa9
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xaa
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xab
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xac
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xad
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xae
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xaf
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xb0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xb1
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xb2
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xb3
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xb4
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xb5
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xb6
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xb7
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xb8
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xb9
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xba
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xbb
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xbc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xbd
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xbe
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xbf
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xc0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xc1
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xc2
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xc3
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xc4
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xc5
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xc6
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xc7
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xc8
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xc9
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xca
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xcb
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xcc
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xcd
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xce
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xcf
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xd0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xd1
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xd2
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xff
vga_std_write_io addr 0x3c8, val 0xd3
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xcc
vga_std_write_io addr 0x3c8, val 0xd4
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x99
vga_std_write_io addr 0x3c8, val 0xd5
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x66
vga_std_write_io addr 0x3c8, val 0xd6
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x33
vga_std_write_io addr 0x3c8, val 0xd7
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xd8
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xd9
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xda
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xdb
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xdc
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xdd
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xde
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xdf
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe0
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe1
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe2
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe3
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe4
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe5
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe6
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe7
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe8
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xe9
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xea
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c8, val 0xeb
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c8, val 0xec
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c8, val 0xed
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c8, val 0xee
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c8, val 0xef
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c8, val 0xf0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c8, val 0xf1
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c8, val 0xf2
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c8, val 0xf3
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c8, val 0xf4
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c8, val 0xf5
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c9, val 0xee
vga_std_write_io addr 0x3c8, val 0xf6
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c9, val 0xdd
vga_std_write_io addr 0x3c8, val 0xf7
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c9, val 0xbb
vga_std_write_io addr 0x3c8, val 0xf8
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c9, val 0xaa
vga_std_write_io addr 0x3c8, val 0xf9
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c9, val 0x88
vga_std_write_io addr 0x3c8, val 0xfa
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c9, val 0x77
vga_std_write_io addr 0x3c8, val 0xfb
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c9, val 0x55
vga_std_write_io addr 0x3c8, val 0xfc
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c9, val 0x44
vga_std_write_io addr 0x3c8, val 0xfd
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c9, val 0x22
vga_std_write_io addr 0x3c8, val 0xfe
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c9, val 0x11
vga_std_write_io addr 0x3c8, val 0xff
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0
vga_std_write_io addr 0x3c9, val 0x0

- Thousands of colours (15-bit color), corrupted

vga_vbe_write index 0x4, val 0x0
vga_vbe_write index 0x3, val 0xf
vga_vbe_write index 0x1, val 0x280
vga_vbe_write index 0x2, val 0x1e0
vga_vbe_write index 0x5, val 0x0
vga_vbe_write index 0x6, val 0x280
vga_vbe_write index 0x7, val 0x3c0
vga_vbe_write index 0x8, val 0x0
vga_vbe_write index 0x9, val 0x0
vga_vbe_write index 0x4, val 0x61

- Millions of colours (32-bit color), works

vga_vbe_write index 0x4, val 0x0
vga_vbe_write index 0x3, val 0x20
vga_vbe_write index 0x1, val 0x280
vga_vbe_write index 0x2, val 0x1e0
vga_vbe_write index 0x5, val 0x0
vga_vbe_write index 0x6, val 0x280
vga_vbe_write index 0x7, val 0x3c0
vga_vbe_write index 0x8, val 0x0
vga_vbe_write index 0x9, val 0x0
vga_vbe_write index 0x4, val 0x61


ATB,

Mark.

