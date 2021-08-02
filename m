Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD03DD33C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:46:06 +0200 (CEST)
Received: from localhost ([::1]:49934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAUWL-00013a-F5
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAUV8-0008TU-QE; Mon, 02 Aug 2021 05:44:50 -0400
Received: from relay64.bu.edu ([128.197.228.104]:48350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mAUV6-0005AS-Mw; Mon, 02 Aug 2021 05:44:50 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1729hkFw020818
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 2 Aug 2021 05:43:48 -0400
Date: Mon, 2 Aug 2021 05:43:46 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.2 3/3] hw/sd/sdcard: Rename Write Protect Group
 variables
Message-ID: <20210802094346.pwbanu4sypqrxqqc@mozz.bu.edu>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210728181728.2012952-4-f4bug@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210728 2017, Philippe Mathieu-Daudé wrote:
> 'wp_groups' holds a bitmap, rename it as 'wp_group_bmap'.
> 'wpgrps_size' is the bitmap size (in bits), rename it as
> 'wp_group_bits'.
> 
> Patch created mechanically using:
> 
>   $ sed -i -e s/wp_groups/wp_group_bmap/ \
>            -e s/wpgrps_size/wp_group_bits/ hw/sd/sd.c
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

-Alex

> ---
>  hw/sd/sd.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 273af75c1be..75dcd3f7f65 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -116,8 +116,8 @@ struct SDState {
>      int32_t state;    /* current card state, one of SDCardStates */
>      uint32_t vhs;
>      bool wp_switch;
> -    unsigned long *wp_groups;
> -    int32_t wpgrps_size;
> +    unsigned long *wp_group_bmap;
> +    int32_t wp_group_bits;
>      uint64_t size;
>      uint32_t blk_len;
>      uint32_t multi_blk_cnt;
> @@ -567,10 +567,10 @@ static void sd_reset(DeviceState *dev)
>      sd_set_cardstatus(sd);
>      sd_set_sdstatus(sd);
>  
> -    g_free(sd->wp_groups);
> +    g_free(sd->wp_group_bmap);
>      sd->wp_switch = sd->blk ? !blk_is_writable(sd->blk) : false;
> -    sd->wpgrps_size = sect;
> -    sd->wp_groups = bitmap_new(sd->wpgrps_size);
> +    sd->wp_group_bits = sect;
> +    sd->wp_group_bmap = bitmap_new(sd->wp_group_bits);
>      memset(sd->function_group, 0, sizeof(sd->function_group));
>      sd->erase_start = INVALID_ADDRESS;
>      sd->erase_end = INVALID_ADDRESS;
> @@ -673,7 +673,7 @@ static const VMStateDescription sd_vmstate = {
>          VMSTATE_UINT32(card_status, SDState),
>          VMSTATE_PARTIAL_BUFFER(sd_status, SDState, 1),
>          VMSTATE_UINT32(vhs, SDState),
> -        VMSTATE_BITMAP(wp_groups, SDState, 0, wpgrps_size),
> +        VMSTATE_BITMAP(wp_group_bmap, SDState, 0, wp_group_bits),
>          VMSTATE_UINT32(blk_len, SDState),
>          VMSTATE_UINT32(multi_blk_cnt, SDState),
>          VMSTATE_UINT32(erase_start, SDState),
> @@ -803,8 +803,8 @@ static void sd_erase(SDState *sd)
>          if (sdsc) {
>              /* Only SDSC cards support write protect groups */
>              wpnum = sd_addr_to_wpnum(erase_addr);
> -            assert(wpnum < sd->wpgrps_size);
> -            if (test_bit(wpnum, sd->wp_groups)) {
> +            assert(wpnum < sd->wp_group_bits);
> +            if (test_bit(wpnum, sd->wp_group_bmap)) {
>                  sd->card_status |= WP_ERASE_SKIP;
>                  continue;
>              }
> @@ -820,7 +820,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>  
>      wpnum = sd_addr_to_wpnum(addr);
>  
> -    for (i = 0; i < 32 && wpnum < sd->wpgrps_size - 1;
> +    for (i = 0; i < 32 && wpnum < sd->wp_group_bits - 1;
>                  i++, wpnum++, addr += WPGROUP_SIZE) {
>          if (addr >= sd->size) {
>              /*
> @@ -829,7 +829,7 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>               */
>              continue;
>          }
> -        if (test_bit(wpnum, sd->wp_groups)) {
> +        if (test_bit(wpnum, sd->wp_group_bmap)) {
>              ret |= (1 << i);
>          }
>      }
> @@ -869,7 +869,7 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
>  
>  static inline bool sd_wp_addr(SDState *sd, uint64_t addr)
>  {
> -    return test_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
> +    return test_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
>  }
>  
>  static void sd_lock_command(SDState *sd)
> @@ -897,7 +897,7 @@ static void sd_lock_command(SDState *sd)
>              sd->card_status |= LOCK_UNLOCK_FAILED;
>              return;
>          }
> -        bitmap_zero(sd->wp_groups, sd->wpgrps_size);
> +        bitmap_zero(sd->wp_group_bmap, sd->wp_group_bits);
>          sd->csd[14] &= ~0x10;
>          sd->card_status &= ~CARD_IS_LOCKED;
>          sd->pwd_len = 0;
> @@ -1348,7 +1348,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>              }
>  
>              sd->state = sd_programming_state;
> -            set_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
> +            set_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
>              /* Bzzzzzzztt .... Operation complete.  */
>              sd->state = sd_transfer_state;
>              return sd_r1b;
> @@ -1370,7 +1370,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
>              }
>  
>              sd->state = sd_programming_state;
> -            clear_bit(sd_addr_to_wpnum(addr), sd->wp_groups);
> +            clear_bit(sd_addr_to_wpnum(addr), sd->wp_group_bmap);
>              /* Bzzzzzzztt .... Operation complete.  */
>              sd->state = sd_transfer_state;
>              return sd_r1b;
> -- 
> 2.31.1
> 

