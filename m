Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E753033A36C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 08:54:26 +0100 (CET)
Received: from localhost ([::1]:47058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLLZx-0003LP-H0
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 03:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1lLLYu-0002rq-D3; Sun, 14 Mar 2021 03:53:20 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:55352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1lLLYr-00008H-KE; Sun, 14 Mar 2021 03:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NgSE53qDvDEbtj9Yy9fNjCalKWNGHX6H0YyUEKu2ddo=; b=HuVMKdCS/c19yUcN8Q21Zj6cpm
 1IaTjlA9FLhekdrAVcGgwr8Z9YXywdMCS5Gt+kzKaLt6CXsDn43qMb1NtK8pQhWB/XPc6+sowlBRe
 CBMv1Vb1PZrXT8eFTyq1o63OTxI2PPUIV0zS5membm+YQz1PNana37Ixdf3NX/+vmERU=;
Received: from [2a01:e0a:11c:2310:1406:131:1040:784f]
 by iserv.reactos.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1lLLYk-0000b6-UI; Sun, 14 Mar 2021 07:53:11 +0000
Subject: Re: [PATCH] floppy: remove unused function fdctrl_format_sector
To: John Snow <jsnow@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-devel@nongnu.org
References: <20210108230137.8860-1-alxndr@bu.edu>
 <e5115c26-2017-831b-f341-206050266739@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <453fb830-673e-d2eb-47b6-41c8ed7bad42@reactos.org>
Date: Sun, 14 Mar 2021 08:53:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e5115c26-2017-831b-f341-206050266739@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/03/2021 à 07:45, John Snow a écrit :
> On 1/8/21 6:01 PM, Alexander Bulekov wrote:
>> fdctrl_format_sector was added in
>> baca51faff ("updated floppy driver: formatting code, disk geometry auto detect (Jocelyn Mayer)")
>>
>> The single callsite is guarded by a check:
>> fdctrl->data_state & FD_STATE_FORMAT
>>
>> However, the only place where the FD_STATE_FORMAT flag is set (in
>> fdctrl_handle_format_track) is closely followed by the same flag being
>> unset, with no possibility to call fdctrl_format_sector in between.
>>
> 
> Hm, was this code *ever* used? It's hard to tell when we go back into the old SVN history.
> 
> Does this mean that fdctrl_handle_format_track is also basically an incomplete stub method?
> 
> I'm in favor of deleting bitrotted code, but I wonder if we should take a bigger bite.
> 
> --js

The fdctrl_format_sector has been added in SVN revision 671 (baca51faff03df59386c95d9478ede18b5be5ec8), along with FD_STATE_FORMAT/FD_FORMAT_CMD.
As with current code, the only place where the FD_STATE_FORMAT flag was set (in fdctrl_handle_format_track) is closely followed by the same flag being unset, with no possibility to call 
fdctrl_format_sector in between.

I can however see the following comment:
            /* Bochs BIOS is buggy and don't send format informations
             * for each sector. So, pretend all's done right now...
             */
            fdctrl->data_state &= ~FD_STATE_FORMAT;

which was changed in SVN revision 2295 (b92090309e5ff7154e4c131438ee2d540e233955) to:
            /* TODO: implement format using DMA expected by the Bochs BIOS
             * and Linux fdformat (read 3 bytes per sector via DMA and fill
             * the sector with the specified fill byte
             */

This probably means that code may have worked without DMA (to be confirmed), but was disabled since its introduction due to a problem with Bochs BIOS.
Later, fdformat was also tested and not working.

Since then, lots of work has also been done in DMA handling. I especially think at bb8f32c0318cb6c6e13e09ec0f35e21eff246413, which fixed a similar problem with floppy drives on IBM 40p machine.
What happens when this flag unsetting is removed? Does fdformat now works?

I think that we should either fix the code, or remove more code (everything related to fdctrl_format_sector, FD_STATE_FORMAT, FD_FORMAT_CMD, maybe even fdctrl_handle_format_track).

Regards,

Hervé

> 
>> This removes fdctrl_format_sector and the unncessary setting/unsetting
>> of the FD_STATE_FORMAT flag.
>>
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>   hw/block/fdc.c | 68 --------------------------------------------------
>>   1 file changed, 68 deletions(-)
>>
>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>> index 3636874432..837dd819ea 100644
>> --- a/hw/block/fdc.c
>> +++ b/hw/block/fdc.c
>> @@ -1952,67 +1952,6 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>>       return retval;
>>   }
>> -static void fdctrl_format_sector(FDCtrl *fdctrl)
>> -{
>> -    FDrive *cur_drv;
>> -    uint8_t kh, kt, ks;
>> -
>> -    SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
>> -    cur_drv = get_cur_drv(fdctrl);
>> -    kt = fdctrl->fifo[6];
>> -    kh = fdctrl->fifo[7];
>> -    ks = fdctrl->fifo[8];
>> -    FLOPPY_DPRINTF("format sector at %d %d %02x %02x (%d)\n",
>> -                   GET_CUR_DRV(fdctrl), kh, kt, ks,
>> -                   fd_sector_calc(kh, kt, ks, cur_drv->last_sect,
>> -                                  NUM_SIDES(cur_drv)));
>> -    switch (fd_seek(cur_drv, kh, kt, ks, fdctrl->config & FD_CONFIG_EIS)) {
>> -    case 2:
>> -        /* sect too big */
>> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
>> -        fdctrl->fifo[3] = kt;
>> -        fdctrl->fifo[4] = kh;
>> -        fdctrl->fifo[5] = ks;
>> -        return;
>> -    case 3:
>> -        /* track too big */
>> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_EC, 0x00);
>> -        fdctrl->fifo[3] = kt;
>> -        fdctrl->fifo[4] = kh;
>> -        fdctrl->fifo[5] = ks;
>> -        return;
>> -    case 4:
>> -        /* No seek enabled */
>> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, 0x00, 0x00);
>> -        fdctrl->fifo[3] = kt;
>> -        fdctrl->fifo[4] = kh;
>> -        fdctrl->fifo[5] = ks;
>> -        return;
>> -    case 1:
>> -        fdctrl->status0 |= FD_SR0_SEEK;
>> -        break;
>> -    default:
>> -        break;
>> -    }
>> -    memset(fdctrl->fifo, 0, FD_SECTOR_LEN);
>> -    if (cur_drv->blk == NULL ||
>> -        blk_pwrite(cur_drv->blk, fd_offset(cur_drv), fdctrl->fifo,
>> -                   BDRV_SECTOR_SIZE, 0) < 0) {
>> -        FLOPPY_DPRINTF("error formatting sector %d\n", fd_sector(cur_drv));
>> -        fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM | FD_SR0_SEEK, 0x00, 0x00);
>> -    } else {
>> -        if (cur_drv->sect == cur_drv->last_sect) {
>> -            fdctrl->data_state &= ~FD_STATE_FORMAT;
>> -            /* Last sector done */
>> -            fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
>> -        } else {
>> -            /* More to do */
>> -            fdctrl->data_pos = 0;
>> -            fdctrl->data_len = 4;
>> -        }
>> -    }
>> -}
>> -
>>   static void fdctrl_handle_lock(FDCtrl *fdctrl, int direction)
>>   {
>>       fdctrl->lock = (fdctrl->fifo[0] & 0x80) ? 1 : 0;
>> @@ -2126,7 +2065,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
>>       SET_CUR_DRV(fdctrl, fdctrl->fifo[1] & FD_DOR_SELMASK);
>>       cur_drv = get_cur_drv(fdctrl);
>> -    fdctrl->data_state |= FD_STATE_FORMAT;
>>       if (fdctrl->fifo[0] & 0x80)
>>           fdctrl->data_state |= FD_STATE_MULTI;
>>       else
>> @@ -2144,7 +2082,6 @@ static void fdctrl_handle_format_track(FDCtrl *fdctrl, int direction)
>>        * and Linux fdformat (read 3 bytes per sector via DMA and fill
>>        * the sector with the specified fill byte
>>        */
>> -    fdctrl->data_state &= ~FD_STATE_FORMAT;
>>       fdctrl_stop_transfer(fdctrl, 0x00, 0x00, 0x00);
>>   }
>> @@ -2458,11 +2395,6 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
>>               /* We have all parameters now, execute the command */
>>               fdctrl->phase = FD_PHASE_EXECUTION;
>> -            if (fdctrl->data_state & FD_STATE_FORMAT) {
>> -                fdctrl_format_sector(fdctrl);
>> -                break;
>> -            }
>> -
>>               cmd = get_command(fdctrl->fifo[0]);
>>               FLOPPY_DPRINTF("Calling handler for '%s'\n", cmd->name);
>>               cmd->handler(fdctrl, cmd->direction);
>>
> 


