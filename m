Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD58386D78
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 01:02:53 +0200 (CEST)
Received: from localhost ([::1]:35272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1limGC-0004Tm-E5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 19:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1limDT-0002iV-Hf
 for qemu-devel@nongnu.org; Mon, 17 May 2021 19:00:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1limDR-0008Hn-9n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 19:00:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621292400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIXuUSddr6xmXEfyKLiAdNuVITjUL9FyDt3O70A4bko=;
 b=PxSRLFNugHo61hQ6ADyJ8I/6OPD4wixWvIQDnhO5diLulqRYNku6Dq7PwJ0LKW9IrYvnqm
 Z4DDhNFTtnYxSK9aIw80WFKGxvd6BRjTVvi/8s1Mkw+M03B5IuelN9LNAhJAqa4sb2PUZl
 va7cApmqD/HxZKKuPdkL2iRf/q9QvWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-pv50YtmNNxKpVzIPnMVKOA-1; Mon, 17 May 2021 18:59:56 -0400
X-MC-Unique: pv50YtmNNxKpVzIPnMVKOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3893719251A0;
 Mon, 17 May 2021 22:59:55 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C71260C04;
 Mon, 17 May 2021 22:59:53 +0000 (UTC)
Subject: Re: [PATCH v2] floppy: remove dead code related to formatting
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20210428022803.606814-1-alxndr@bu.edu>
From: John Snow <jsnow@redhat.com>
Message-ID: <ba0be31a-20b1-05d1-aac4-27dac59b2cb2@redhat.com>
Date: Mon, 17 May 2021 18:59:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428022803.606814-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/27/21 10:28 PM, Alexander Bulekov wrote:
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
> This removes fdctrl_format_sector, the unncessary setting/unsetting
> of the FD_STATE_FORMAT flag, and the fdctrl_handle_format_track function
> (which is just a stub).
> 
> Suggested-by: Hervé Poussineau <hpoussin@reactos.org>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
> 

Herve, does it look good to you? I feel bad about deleting code out of a 
device that badly needs attention, but it seems like this code was 
probably not operating correctly to begin with and I don't have the time 
to figure out how to implement it correctly.

> I ran through tests/qtest/fdc-test, and ran fdformat on a dummy disk -
> nothing exploded, but since I don't use floppies very often, more eyes
> definitely won't hurt. In particular, I'm not sure about the
> fdctrl_handle_format_track delete - that function has side-effects on
> both FDrive and FDCtrl, and it is certainly reachable. If deleting the
> whole thing seems wrong, I'll roll-back that change, and we can just
> remove the unreachable code..
> 

Yeah, I just had some reservations about allowing a stub to persist that 
touched state and didn't actually seem to invoke the routine it was 
meant to.

It's hard to audit the impact either way, and I don't have a good test 
suite to know what the ramifications are.

>   hw/block/fdc.c | 97 --------------------------------------------------
>   1 file changed, 97 deletions(-)
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index a825c2acba..d851d23cc0 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -657,7 +657,6 @@ enum {
>   
>   enum {
>       FD_STATE_MULTI  = 0x01,	/* multi track flag */
> -    FD_STATE_FORMAT = 0x02,	/* format flag */
>   };
>   
>   enum {
> @@ -826,7 +825,6 @@ enum {
>   };
>   
>   #define FD_MULTI_TRACK(state) ((state) & FD_STATE_MULTI)
> -#define FD_FORMAT_CMD(state) ((state) & FD_STATE_FORMAT)
>   
>   struct FDCtrl {
>       MemoryRegion iomem;
> @@ -1942,67 +1940,6 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
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
> @@ -2110,34 +2047,6 @@ static void fdctrl_handle_readid(FDCtrl *fdctrl, int direction)
>                (NANOSECONDS_PER_SECOND / 50));
>   }
>   
> -static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
> -{
> -    FDrive *cur_drv;
> -
> -    SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
> -    cur_drv = get_cur_drv(fdctrl);
> -    fdctrl->data_state |= FD_STATE_FORMAT;
> -    if (fdctrl->fifo[0] & 0x80)
> -        fdctrl->data_state |= FD_STATE_MULTI;
> -    else
> -        fdctrl->data_state &= ~FD_STATE_MULTI;
> -    cur_drv->bps =
> -        fdctrl->fifo[2] > 7 ? 16384 : 128 << fdctrl->fifo[2];
> -#if 0
> -    cur_drv->last_sect =
> -        cur_drv->flags & FDISK_DBL_SIDES ? fdctrl->fifo[3] :
> -        fdctrl->fifo[3] / 2;
> -#else
> -    cur_drv->last_sect = fdctrl->fifo[3];
> -#endif
> -    /* TODO: implement format using DMA expected by the Bochs BIOS
> -     * and Linux fdformat (read 3 bytes per sector via DMA and fill
> -     * the sector with the specified fill byte
> -     */
> -    fdctrl->data_state &= ~FD_STATE_FORMAT;
> -    fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
> -}
> -
>   static void fdctrl_handle_specify(FDCtrl *fdctrl, int direction)
>   {
>       fdctrl->timer0 = (fdctrl->fifo[1] >> 4) & 0xF;
> @@ -2330,7 +2239,6 @@ static const FDCtrlCommand handlers[] = {
>       { FD_CMD_SEEK, 0xff, "SEEK", 2, fdctrl_handle_seek },
>       { FD_CMD_SENSE_INTERRUPT_STATUS, 0xff, "SENSE INTERRUPT STATUS", 0, fdctrl_handle_sense_interrupt_status },
>       { FD_CMD_RECALIBRATE, 0xff, "RECALIBRATE", 1, fdctrl_handle_recalibrate },
> -    { FD_CMD_FORMAT_TRACK, 0xbf, "FORMAT TRACK", 5, fdctrl_handle_format_track },
>       { FD_CMD_READ_TRACK, 0xbf, "READ TRACK", 8, fdctrl_start_transfer, FD_DIR_READ },
>       { FD_CMD_RESTORE, 0xff, "RESTORE", 17, fdctrl_handle_restore }, /* part of READ DELETED DATA */
>       { FD_CMD_SAVE, 0xff, "SAVE", 0, fdctrl_handle_save }, /* part of READ DELETED DATA */
> @@ -2448,11 +2356,6 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
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


