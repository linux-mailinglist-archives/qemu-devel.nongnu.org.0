Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE60C4211BF
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:43:43 +0200 (CEST)
Received: from localhost ([::1]:53874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPBu-0008TB-VG
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP9S-0006K7-2U
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:41:10 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP9P-0008K2-Po
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:41:09 -0400
Received: from [192.168.42.227] ([37.173.140.50]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1M3DBb-1mW2m70FJt-003hXc; Mon, 04 Oct 2021 16:41:06 +0200
Message-ID: <16de4082-e69a-aa7c-d409-6b644d60d6ff@vivier.eu>
Date: Mon, 4 Oct 2021 16:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/12] macfb: fix 24-bit RGB pixel encoding
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211002110007.30825-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Pp9YrKa0TexR5IMgq7kN3Y0RjzHbjLmcbof4i0x9bhPfxABWpAF
 KkHfSWf60jX2sQAyoi3x6xm+9n/s07nKDS2k5AbWqdYFhkprzvbJC3A1fBFSQtoAEdNtY0A
 vLk6QHVHO2AEVUBpwr4yJnAHqilQ+j35dGpiS2Qyc9tCW2kS1yiC4d9YG1DyPL8EriQ6inX
 rmh3kWiT1Fem1A/vUlb+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:78DRcD0Ckb0=:Lrpko61LlCm0dVjE9ciqP7
 KFt/PP8Wbq5l0hr/z6rdX8kIyJiBSAE303ye2qJXUEXYlRkRqVljPplw1PWnslkVoHiZN7XDK
 pSO/6L2d6Dx701MVWaKgJ2xYK4YPJHTVeK6TWQRrUUN8tAK5vFRhPLL4pIF+SSxRpEW+Nb5vH
 Mtqh2pw7ua7138IqUip5yCAPVjX1PMGY+gyNBIcZXXneAdAOSostYRwr7eUNxTr+dnxt+uJx/
 y+mn+x453h/xsTu8qIeZwrFgOsBgr/QqyHe5X4V7bwwWZvAFiFh5bWSA2GVWwcbFgm4SkSJDn
 Gx0YQwy4+CS9+5ZRRPzSx2VZEKGUutBJS5yOaVZ9BKy9mglf6dyIDPppwfJjGDfm2QsrTCBgF
 fzx8DlUlEDERinshLEv14MPGSqDr8Se0V9KRtfp8OEbx3Pgh2TAfZuSgu+6f+1GQOH1VLdUQn
 zhZuSYB1NGU1/CpURXix7Z+nBVYwssBRkWo5fQCCGw+3ziYeMTjTaenXXMZ5ncQF9xJUxrH1n
 8LjV/wSecyFggm+Qw/zlrOzYdwKVEkz7KkfZMleKw7fNnSn9fTPNa37Q3oE7aPVhxO7/wcS+o
 +yU1v3A5mKH25f/vK58Kz93HGz/k92v+Y4/1OAMxwTe1qW6Es2HpA8OntPVhG0r7P/HM7bVmq
 Lr9+HaumOpnuIieUH0p6uY/r3jyEX6hIrxAuKI9yUlGQ6D/7W5GdytYSkr08I8DX2R3/7/vjq
 s+B5vDcrWC3Q0bOwT2KNJAg+4oWXDGMtW/bOEA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 02/10/2021 13:00, Mark Cave-Ayland wrote:
> According to Apple Technical Note HW26: "Macintosh Quadra Built-In Video" the
> in-built framebuffer encodes each 24-bit pixel into 4 bytes. Adjust the 24-bit
> RGB pixel encoding accordingly which agrees with the encoding expected by MacOS
> when changing into 24-bit colour mode.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 0c9e181b9b..29f6ad8eba 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -224,10 +224,10 @@ static void macfb_draw_line24(MacfbState *s, uint8_t *d, uint32_t addr,
>       int x;
>   
>       for (x = 0; x < width; x++) {
> -        r = macfb_read_byte(s, addr);
> -        g = macfb_read_byte(s, addr + 1);
> -        b = macfb_read_byte(s, addr + 2);
> -        addr += 3;
> +        r = macfb_read_byte(s, addr + 1);
> +        g = macfb_read_byte(s, addr + 2);
> +        b = macfb_read_byte(s, addr + 3);
> +        addr += 4;
>   
>           *(uint32_t *)d = rgb_to_pixel32(r, g, b);
>           d += 4;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

