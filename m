Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A850DFD4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 14:21:20 +0200 (CEST)
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nixiQ-0006eW-Qv
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 08:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nixgB-0005po-J5
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:18:59 -0400
Received: from [187.72.171.209] (port=32280 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>) id 1nixg9-0007AB-Si
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 08:18:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 25 Apr 2022 09:17:51 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 8CC3D8000D6;
 Mon, 25 Apr 2022 09:17:51 -0300 (-03)
Message-ID: <ccd97ec9-4ed9-5132-0ba9-fbff105b8a70@eldorado.org.br>
Date: Mon, 25 Apr 2022 09:17:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/3] hw/audio/ac97: Remove unimplemented reset functions
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1650706617.git.balaton@eik.bme.hu>
 <cc6e99fd498a9ae358ebce787fc04ab6e8201879.1650706617.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>
In-Reply-To: <cc6e99fd498a9ae358ebce787fc04ab6e8201879.1650706617.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Apr 2022 12:17:51.0928 (UTC)
 FILETIME=[7C33DB80:01D8589E]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/04/2022 06:36, BALATON Zoltan wrote:
> The warm_reset() and cold_reset() functions are not implemented and do
> nothing so no point in calling them or keep around as dead code.
> Therefore remove them for now.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/audio/ac97.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
> index 6b1c12bece..6584aa749e 100644
> --- a/hw/audio/ac97.c
> +++ b/hw/audio/ac97.c
> @@ -222,16 +222,6 @@ static void po_callback(void *opaque, int free);
>   static void pi_callback(void *opaque, int avail);
>   static void mc_callback(void *opaque, int avail);
> 
> -static void warm_reset(AC97LinkState *s)
> -{
> -    (void)s;
> -}
> -
> -static void cold_reset(AC97LinkState *s)
> -{
> -    (void)s;
> -}
> -
>   static void fetch_bd(AC97LinkState *s, AC97BusMasterRegs *r)
>   {
>       uint8_t b[8];
> @@ -921,12 +911,7 @@ static void nabm_writel(void *opaque, uint32_t addr, uint32_t val)
>           dolog("BDBAR[%d] <- 0x%x (bdbar 0x%x)\n", GET_BM(index), val, r->bdbar);
>           break;
>       case GLOB_CNT:
> -        if (val & GC_WR) {
> -            warm_reset(s);
> -        }
> -        if (val & GC_CR) {
> -            cold_reset(s);
> -        }
> +        /* TODO: Handle WR or CR being set (warm/cold reset requests) */
>           if (!(val & (GC_WR | GC_CR))) {
>               s->glob_cnt = val & GC_VALID_MASK;
>           }
> --
> 2.30.4
> 

Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>

