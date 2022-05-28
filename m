Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C400536C36
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 12:03:02 +0200 (CEST)
Received: from localhost ([::1]:45224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nutHh-0007hv-3f
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 06:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nut9h-0003jY-R9
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:54:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nut9f-0008Ir-8t
 for qemu-devel@nongnu.org; Sat, 28 May 2022 05:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YBReQsA+NbP74uH2RBEgleHURp3w/a/Fk6kPcYokKN4=; b=1L3+aI50YVhs4YkttgPfwbPMAm
 JA/E8uTl/x2ECv8zJymg0ExuGvEeTmIsC6RrXxZUernaqvQhuU0AYKnHsJaMZJn4Tnu9J8No0WM9Y
 So2hzsNpoQz7Fmd2O1qjnuikfysD6A1B9LF5ag+YlQoz2s6UyaylO47ri/WSfsLJVE2XBAHX/C01D
 rAqJzO3lPq+SiKjcXrHm6PdgjTFlWkisARCRKwDlcPKKdz2KpfjglUUrQJ94EgPfAyhzxI0pN0UgW
 a/faOD58Jp2IN6p3bg39OiPPUqroU/hRlh4XyCjLyry0OzoWS3u7wybVBBYezhf8qg+2lWIVPKtJi
 Fiugh0d6AuSAxVd0p2ilvbvjHCx45JNdrhL8fm4TZa8VtpWuxKEJbl59KNgusuSmzmPiPuoXhk7Td
 HN8T3jr/Yy8DcCeEgEJXH3OB2N29VLYK7OvpEnjW7TKPWRptJZFBLqHUkAkWCcYLuAvC3BQwk47Uh
 QSXAJcKWxBnAhdZVkdAxbJC2bf5tixZwGtDN7W0+glkKQqjvZoQjeQ8otNGjzguQUiWYqajPzKvqi
 Evpzw0laUd8LZsPnqPQGe+GrA4WGKdS8fgUuumwsMgeTxBiizokh3UTGVi6wo4RLnParPGTI4ww8G
 h9yxCCt/8ZVAyWipwntWubZkpQfkSPuiU5kIEnwkE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nut8Z-0003Ye-6E; Sat, 28 May 2022 10:53:39 +0100
Message-ID: <35740c8b-cc7a-b3fd-e5e0-b1330d7f4e9e@ilande.co.uk>
Date: Sat, 28 May 2022 10:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>
References: <20220528094134.16513-1-deller@gmx.de>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220528094134.16513-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/3] hppa: Fix serial port pass-through
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

On 28/05/2022 10:41, Helge Deller wrote:

> This series fixes the SeaBIOS-hppa firmware and the serial ports setup code in
> qemu so that it reflects the real hardware and allows serial port pass-through
> from the host to guests.
> 
> Tested with Linux guests.
> 
> v2: Changes suggested by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> - Split out hppa_hardware.h restoration to an own patch
> - Drop unneccesary checks for serial_hd(x)
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> Helge Deller (3):
>    New SeaBIOS-hppa version 6
>    hppa: Sync contents of hppa_hardware.h header file with SeaBIOS-hppa
>    hppa: Fix serial port assignments and pass-through
> 
>   hw/hppa/hppa_hardware.h   |  10 ++++++++--
>   hw/hppa/machine.c         |  22 ++++++++--------------
>   pc-bios/hppa-firmware.img | Bin 719040 -> 719368 bytes
>   roms/seabios-hppa         |   2 +-
>   4 files changed, 17 insertions(+), 17 deletions(-)

Looks good to me :)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

