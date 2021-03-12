Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8CE33862C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:46:37 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbZE-0001h4-ES
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbXx-0000v7-Ju
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:45:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lKbXv-0006zh-2P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615531511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mh6ryeki5Oe0oo7ZFG+gji7q4IM+Q7wxxn1EVZ9Fwe0=;
 b=AjqzyN9Ke+VpgziU7SKlCZ0COA77iHx1M2vy75aXaLJWkoXgBFnrfFcn6wnWliYxW2UUSb
 lfe4Nf3XAI4J3Pd4miygOZLM2+bvBqd4BxMtAnkh24mCa0KjLP5cJ18Y885xhhE7A98bJH
 I9WC+8e1CoJz5mmttpzIDqE47TxGQw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-GFgrhjJQOKeuITdRT_L4Xg-1; Fri, 12 Mar 2021 01:45:09 -0500
X-MC-Unique: GFgrhjJQOKeuITdRT_L4Xg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEFA9814256;
 Fri, 12 Mar 2021 06:45:07 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B533060CCB;
 Fri, 12 Mar 2021 06:45:06 +0000 (UTC)
Subject: Re: [PATCH] floppy: remove unused function fdctrl_format_sector
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210108230137.8860-1-alxndr@bu.edu>
From: John Snow <jsnow@redhat.com>
Message-ID: <e5115c26-2017-831b-f341-206050266739@redhat.com>
Date: Fri, 12 Mar 2021 01:45:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210108230137.8860-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 "open list:Floppy" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 6:01 PM, Alexander Bulekov wrote:
> fdctrl_format_sector was added in
> baca51faff ("updated floppy driver: formatting code, disk geometry auto detect (Jocelyn Mayer)")
> 
> The single callsite is guarded by a check:
> fdctrl->data_state & FD_STATE_FORMAT
> 
> However, the only place where the FD_STATE_FORMAT flag is set (in
> fdctrl_handle_format_track) is closely followed by the same flag being
> unset, with no possibility to call fdctrl_format_sector in between.
> 

Hm, was this code *ever* used? It's hard to tell when we go back into 
the old SVN history.

Does this mean that fdctrl_handle_format_track is also basically an 
incomplete stub method?

I'm in favor of deleting bitrotted code, but I wonder if we should take 
a bigger bite.

--js

> This removes fdctrl_format_sector and the unncessary setting/unsetting
> of the FD_STATE_FORMAT flag.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   hw/block/fdc.c | 68 --------------------------------------------------
>   1 file changed, 68 deletions(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index 3636874432..837dd819ea 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1952,67 +1952,6 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>       return retval;
>   }
>   
> -static void fdctrl_format_sector(FDCtrl *fdctrl)
> -{
> -    FDrive *cur_drv;
> -    uint8_t kh, kt, ks;
> -
> -    SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
> -    cur_drv = get_cur_drv(fdctrl);
> -    kt = fdctrl->fifo[6];
> -    kh = fdctrl->fifo[7];
> -    ks = fdctrl->fifo[8];
> -    FLOPPY_DPRINTF("format sector at %d %d %02x %02x (%d)\n",
> -                   GET_CUR_DRV(fdctrl), kh, kt, ks,
> -                   fd_sector_calc(kh, kt, ks, cur_drv->last_sect,
> -                                  NUM_SIDES(cur_drv)));
> -    switch (fd_seek(cur_drv, kh, kt, ks, fdctrl->config & FD_CONFIG_EIS)) {
> -    case 2:
> -        /* sect too big */
> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
> -        fdctrl->fifo[3] = kt;
> -        fdctrl->fifo[4] = kh;
> -        fdctrl->fifo[5] = ks;
> -        return;
> -    case 3:
> -        /* track too big */
> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_EC, 0x00);
> -        fdctrl->fifo[3] = kt;
> -        fdctrl->fifo[4] = kh;
> -        fdctrl->fifo[5] = ks;
> -        return;
> -    case 4:
> -        /* No seek enabled */
> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
> -        fdctrl->fifo[3] = kt;
> -        fdctrl->fifo[4] = kh;
> -        fdctrl->fifo[5] = ks;
> -        return;
> -    case 1:
> -        fdctrl->status0 |= FD_SR0_SEEK;
> -        break;
> -    default:
> -        break;
> -    }
> -    memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
> -    if (cur_drv->blk == NULL ||
> -        blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
> -                   BDRV_SECTOR_SIZE, 0) < 0) {
> -        FLOPPY_DPRINTF("error formatting sector %d\n", fd_sector(cur_drv));
> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM | FD_SR0_SEEK, 0x00, 0x00);
> -    } else {
> -        if (cur_drv->sect == cur_drv->last_sect) {
> -            fdctrl->data_state &= ~FD_STATE_FORMAT;
> -            /* Last sector done */
> -            fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
> -        } else {
> -            /* More to do */
> -            fdctrl->data_pos = 0;
> -            fdctrl->data_len = 4;
> -        }
> -    }
> -}
> -
>   static void fdctrl_handle_lock(FDCtrl *fdctrl, int direction)
>   {
>       fdctrl->lock = (fdctrl->fifo[0] & 0x80) ? 1 : 0;
> @@ -2126,7 +2065,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
>   
>       SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
>       cur_drv = get_cur_drv(fdctrl);
> -    fdctrl->data_state |= FD_STATE_FORMAT;
>       if (fdctrl->fifo[0] & 0x80)
>           fdctrl->data_state |= FD_STATE_MULTI;
>       else
> @@ -2144,7 +2082,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
>        * and Linux fdformat (read 3 bytes per sector via DMA and fill
>        * the sector with the specified fill byte
>        */
> -    fdctrl->data_state &= ~FD_STATE_FORMAT;
>       fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
>   }
>   
> @@ -2458,11 +2395,6 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
>               /* We have all parameters now, execute the command */
>               fdctrl->phase = FD_PHASE_EXECUTION;
>   
> -            if (fdctrl->data_state & FD_STATE_FORMAT) {
> -                fdctrl_format_sector(fdctrl);
> -                break;
> -            }
> -
>               cmd = get_command(fdctrl->fifo[0]);
>               FLOPPY_DPRINTF("Calling handler for '%s'\n", cmd->name);
>               cmd->handler(fdctrl, cmd->direction);
> 


