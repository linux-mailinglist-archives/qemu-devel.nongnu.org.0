Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E34211C8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 16:44:37 +0200 (CEST)
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXPCl-0002Oy-7B
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 10:44:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP8j-0004zl-Vu
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:40:26 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXP8i-0007fp-Ct
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 10:40:25 -0400
Received: from [192.168.42.227] ([37.173.140.50]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1M3DeV-1mW2lH0EzF-003eMY; Mon, 04 Oct 2021 16:40:22 +0200
Message-ID: <a74b7a69-a9ef-9813-c75c-a74eee1a0099@vivier.eu>
Date: Mon, 4 Oct 2021 16:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/12] macfb: fix up 1-bit pixel encoding
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211002110007.30825-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:TVrA7Y8GMC6I1Y/htn14zF9kYkfkecnVLUInLGSgZMbLnglcSfn
 Em26VbhL5Bhu5peMzNqvZvNc2ill0UCiy3c67GGEPdgNCSDQoyXjwJ87lU+ISBPjjpHN8Vl
 RBaSFuT2eoQZyxAsFNR5cALXlQCnPpVFnie04G100Aqnf9dsEp8yNDOfcFsyVXD33wd02Ke
 z4K3spcRdnfvE2gU7gKLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0eEFL3wR87M=:/l3L0cvxwU+WXiER6duYGX
 DiBuZ1VIQJ0AtFvfjGhNTifjthasfXdXam9+K/zYD8Kv6I367fgt+htEhsg+8H9piVpeVbT7K
 tG3w6eVG2DhyE3QraNJP/+g4i4aDUWF45DLyZkHQMHAWG0VErw1HAtqbq0Pxy1D1Eze/kDlmV
 2zGMrh4rypyDc6+bhVnwOtKoqtdM6vz0RWb0pJ7s2W3A1Jn0pLg/wh1f49oz2O1nwl1cKMaWZ
 ng0caygWle8kXI/XzIF3QJAbsjLPnf1AsYcjKjvIjvJoAqsK+cg62jxiQ+eKzbaKTphvomk4u
 Pvfyd8Xy1kytQ2wMWDis8pI/gC8/E0Bl2hOrXFU6QKC/+r+K01mzGu9wB49WaujiIRMp7Jpgq
 fd7EI/H8GJTXJuvKqS2NoU3Yl4/MZAhpVtmnWPYV2FRmgeK9a2IE9wWCZwqv+/yBNf+orsINT
 eA1NF1Q/JXwJ3GsZeQNqqxVdaGpBh/3wl4YntpvyxArTXrgFHkCtt+9Zg+FhiHiX4qGtYKgqv
 8lW6o6hMa6NXJhTZqZQbqHRUg84WrwwbQxm8MYdxnpyKPQcQGQyvjt0O1T17qzqrDsHohYUgY
 gnVisiPs7RR8WwLP0OyLt28NIRnxyW+nbdyX5a6HjHBGApkD5m1d2CdQbqwSJB5i0wTzVTLbk
 OEBX4tl1x5SeC2GI/ZdnqCAukwdyXBFh+1xcrUe+/tjDmuR8JREadVTK6Lo9jdAbRWc5wpajB
 Sie1Y9yEEzRwgrXgfgXE9sD6Y9KT5zJZgQO3zw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
> The MacOS driver expects the RGB values for the pixel to be in entries 0 and 1
> of the colour palette.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/display/macfb.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 6a69334565..0c9e181b9b 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -128,7 +128,9 @@ static void macfb_draw_line1(MacfbState *s, uint8_t *d, uint32_t addr,
>       for (x = 0; x < width; x++) {
>           int bit = x & 7;
>           int idx = (macfb_read_byte(s, addr) >> (7 - bit)) & 1;
> -        r = g = b  = ((1 - idx) << 7);
> +        r = s->color_palette[idx * 3];
> +        g = s->color_palette[idx * 3 + 1];
> +        b = s->color_palette[idx * 3 + 2];
>           addr += (bit == 7);
>   
>           *(uint32_t *)d = rgb_to_pixel32(r, g, b);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

