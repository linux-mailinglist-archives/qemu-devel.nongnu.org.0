Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231754DDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:59:58 +0200 (CEST)
Received: from localhost ([::1]:60618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lM4-0003N1-Ek
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1lHE-0000VH-PR
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:54:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1lHD-00015c-28
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 From:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=31nD444C5MiVccAV9DjYaIAtFACKh5zvrDLM8HFckTI=; b=fcn87YpXaFUpBIgmTGzvJ1Y+5p
 eF9TWjECAsXEDpqeayuiOf5AVDlmGVldKLxMo8UJwljm/365VquchY0p/6zIlBTiyv9RpJR9dpIC4
 nSOnJtjdOdvP9izQ0XOjBF9TQh1ZydDSZWLpuuDOveKqT1nIeaSZQ/QE47i/9CIDU5fNlMG8fvFRR
 z26wzqW9wPsq1s062lYmxwhJHdSTs+Q5O7PEd1vdtt+XdfCHFMP9JzMdp+QdQGucLazKYednrLqSf
 XPhOO25hLcbB+ppQXNLlFZ8T/v6ERDQfSyzs2I45tDhF9mQJrD9hZMs/Hbf6LoK47A8PQidwX7dVV
 j4mt0PbZ+R9u7s74b4XsxPYnGPPPWL5PVNFTX1vtO3aPDvhQ96ijyQHwzeeQuWyU0Ovo9vsGOcwVl
 IMv/yRPxoP39XpUOLc35WNjYDIu/UhThxPsOtXnCdD9ZZTVguJU7tTisfoRRb1go8fLjCNeb3P5aD
 3EhPDHpqiM4PLHsdXGY1tD86Zn3gsLDPmzNhmvZWVtFYieEk0lPl8zsHhGeEZHFCRcKl8vhDbIs+T
 gfHeu/zxpaCwA4DXaVHAflUori2aJZ01sYT36VNZd1z+Wgc+tFJ7Pmsp6ngL/qHz4GuTsadOzHVc7
 D8lhRNO8XVwNEUlFOYU9jqDPozzSoSs/WsvS32Nnc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o1lFz-0002Tg-KU; Thu, 16 Jun 2022 09:53:43 +0100
Message-ID: <e4c8ced1-3ef4-8956-ead5-91110d3cb38c@ilande.co.uk>
Date: Thu, 16 Jun 2022 09:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Howard Spoelstra <hsp.cat7@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Corrupted display changing screen colour depth in
 qemu-system-ppc/MacOS
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,

Howard pointed me off-list to a corrupted screen display issue experienced when 
changing the screen colour depth in MacOS under qemu-system-ppc. I was able to 
reproduce it here, and noticed from the output that the issue was likely due to the 
host display not updating its depth accordingly.

After it was confirmed to me that this was working in QEMU 6.2, I was able to 
eventually bisect the problem down to this commit:


cb8962c146b2633a4b04562281de9b2703bba849 is the first bad commit
commit cb8962c146b2633a4b04562281de9b2703bba849
Author: Marc-André Lureau <marcandre.lureau@redhat.com>
Date:   Tue Feb 15 00:13:37 2022 +0400

     ui: do not create a surface when resizing a GL scanout

     qemu_console_resize() will create a blank surface and replace the
     current scanout with it if called while the current scanout is
     GL (texture or dmabuf).

     This is not only very costly, but also can produce glitches on the
     display/listener side.

     Instead, compare the current console size with the fitting console
     functions, which also works when the scanout is GL.

     Note: there might be still an unnecessary surface creation on calling
     qemu_console_resize() when the size is actually changing, but display
     backends currently rely on DisplaySurface details during
     dpy_gfx_switch() to handle various resize aspects. We would need more
     refactoring to handle resize without DisplaySurface, this is left for a
     future improvement.

     Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
     Message-Id: <20220214201337.1814787-4-marcandre.lureau@redhat.com>
     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

  ui/console.c | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)


Some more background: the screen in qemu-system-ppc's MacOS is controlled via a 
custom driver written by Ben which uses the Bochs VBE registers to change the screen 
width/height/depth. The code used to do this can be found at 
https://gitlab.com/qemu-project/QemuMacDrivers/-/blob/master/QemuVGADriver/src/QemuVga.c#L354.

Looking at the changes in cb8962c146 my guess would be that either the updated check 
in qemu_console_resize() should also check to see if the surface depth is unchanged 
before exiting early, or that there is an extra update required in the VGA device 
when changing just the screen colour depth by itself.


ATB,

Mark.

