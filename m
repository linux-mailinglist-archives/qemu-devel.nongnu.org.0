Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65B347BED1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:23:23 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdEo-0003KL-RQ
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdCH-0001aO-70
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:20:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdCE-0006xj-IU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640085641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSBCFHpJQxGULL/P9/bj9InC7QEA9Kn8x2ZAE1P0B+c=;
 b=SqhOwWOXCKPUkhkGBO1h5iiHE83V7RTLvBPo62eiGlnLBz6Ldx/9l5S1Z9iz7qg4P540ZC
 lXaatxDRq2uJYMBrQbpafG3ucVLBPVFgIn/dDp7I+Hbw80WB+4t0jikn56S/hAjH6tZnvk
 1cAWp/iy59usBP3FFvUCHlMdXW1ourU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-jF88jOVxPQGQrZU0Xc0lTQ-1; Tue, 21 Dec 2021 06:20:39 -0500
X-MC-Unique: jF88jOVxPQGQrZU0Xc0lTQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 f20-20020a056402355400b003f81df0975bso9099754edd.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xSBCFHpJQxGULL/P9/bj9InC7QEA9Kn8x2ZAE1P0B+c=;
 b=RxuVnwb7JmCaNoO+OtJWf1J41nFQ6IFX9IpNmRffIXQkCt1duQTJp1Uakrg/mG0+l8
 8YPUvJNYMGPB+1Tjb9g2Q3PW5u4LjdwmVbNBkajI55U4tWaap/n6B4yYkr3ltHqhs0wt
 CHOxYysBzu0b4FMd08TqrTkpOwynhrGt6QgjiXaKjvGEQaKzFYziY6Gfh9zUmkj2R9xW
 UP/qL+2RnuQVh9pW6eOXBi6YCPs5MbkC3E5eiDRw4d9CjI01O80CZy/w6eFj1+rH7nNw
 fz4fagIA/bojZ5V8x3DG2y2TGVeYqBU2HhoNTnib1PIy3uVfJOez/xhoWBmfgX6XRfnU
 +OHA==
X-Gm-Message-State: AOAM532/xoPu3IrlJ5PNuvYJv1id68hOiOceu6zeSFc6hHczoS95Bb2C
 JKTb/z8urmiPDQIbCfuqtmqkVOL5d/GZk6JRJ3uomOyVc/39SgNcxEETWSpKyFY98TtvkULssh6
 2wavoMahejUgbspo=
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr2786929edd.79.1640085638650; 
 Tue, 21 Dec 2021 03:20:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNQ0WlIg2yvhy4FAZ+ElGRiqZBqKPMv6iUXgON//eeK+eR/YAEJ8rZ2N/BUhz5uhas9Aea0Q==
X-Received: by 2002:a05:6402:2686:: with SMTP id
 w6mr2786907edd.79.1640085638401; 
 Tue, 21 Dec 2021 03:20:38 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id hs11sm2801411ejc.153.2021.12.21.03.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:20:38 -0800 (PST)
Message-ID: <f8d9d1d4-a53f-b891-0f5e-5b0d9a0ed82e@redhat.com>
Date: Tue, 21 Dec 2021 12:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] scsi-generic: replace logical block count of response of
 READ CAPACITY
To: Claudio Fontana <cfontana@suse.de>, pbonzini@redhat.com, fam@euphon.net
References: <20211120101512.7770-1-lma@suse.com>
 <8ac2bf20-1dc4-7153-4287-ca01bd84d213@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <8ac2bf20-1dc4-7153-4287-ca01bd84d213@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hannes Reinecke <hare@suse.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Claudio,

On 12/21/21 10:48, Claudio Fontana wrote:
> Hi Paolo, Hannes,
> 
> any thoughts on the following issue?
> 
> Introduction:
> 
> When using SAN storage for providing block devices to guests, configured as SCSI-passthrough devices, increasing the space available in the VM is a use case.
> 
> To do it, it is currently necessary to:
> 
> 1) expand storage on the actual SAN,
> 2) run a "virsh blockresize" or equivalent command to make QEMU aware of the new size, and finally
> 3) do a "rescan-scsi-bus.sh" or equivalent operation in the guest to make the running guest aware of the increased disk size.
> 
> The problem:
> 
> As of now, the administrator needs to make sure that step 3 won't be done before step 2 has been executed, or the resulting state will be inconsistent.
> In practice this creates organizational issues to try to sync up host/storage admins and guest OS admin, and is therefore error prone (due to these human factors).
> 
> The proposal:
> 
> The patch I replied to here from Ma Lin tries to avoid the inconsistent state, by having "rescan-scsi-bus.sh" still report the old size in the guest until QEMU itself is aware of the new disk size.
> 
> The patch:
> 
> Before the patch, the SCSI READ_CAPACITY command in the guest os directly receives the unmodified response from the storage backend.
> 
> After the patch, QEMU intercepts the READ_CAPACITY response and replaces the maximum LBA with the information which is saved in QEMU.
> 
> This means: after resizing the storage on the SAN backend, the host administrator must explicitly notify about CAPACITY HAS CHANGED by issuing a block resize command through QMP or libvirt,
> even for SCSI passthrough disks.
> 
> Any ideas on this patch or on possible alternatives?

I am not an SCSI expert, but Lin's description and yours sound
coherent to me.

One minor nitpick below.

> On 11/20/21 11:15 AM, Lin Ma wrote:
>> While using SCSI passthrough, Following scenario makes qemu doesn't
>> realized the capacity change of remote scsi target:
>> 1. online resize the scsi target.
>> 2. issue 'rescan-scsi-bus.sh -s ...' in host.
>> 3. issue 'rescan-scsi-bus.sh -s ...' in vm.
>>
>> In above scenario I used to experienced errors while accessing the
>> additional disk space in vm. I think the reasonable operations should
>> be:
>> 1. online resize the scsi target.
>> 2. issue 'rescan-scsi-bus.sh -s ...' in host.
>> 3. issue 'block_resize' via qmp to notify qemu.
>> 4. issue 'rescan-scsi-bus.sh -s ...' in vm.
>>
>> The errors disappear once I notify qemu by block_resize via qmp.
>>
>> So this patch replaces the number of logical blocks of READ CAPACITY
>> response from scsi target by qemu's bs->total_sectors. If the user in
>> vm wants to access the additional disk space, The administrator of
>> host must notify qemu once resizeing the scsi target.
>>
>> Bonus is that domblkinfo of libvirt can reflect the consistent capacity
>> information between host and vm in case of missing block_resize in qemu.
>> E.g:
>> ...
>>     <disk type='block' device='lun'>
>>       <driver name='qemu' type='raw'/>
>>       <source dev='/dev/sdc' index='1'/>
>>       <backingStore/>
>>       <target dev='sda' bus='scsi'/>
>>       <alias name='scsi0-0-0-0'/>
>>       <address type='drive' controller='0' bus='0' target='0' unit='0'/>
>>     </disk>
>> ...
>>
>> Before:
>> 1. online resize the scsi target.
>> 2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
>> 3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
>> 4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
>> Capacity:       4.000 GiB
>> Allocation:     0.000 B
>> Physical:       8.000 GiB
>>
>> 5. guest:~ # lsblk /dev/sda
>> NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
>> sda      8:0    0   8G  0 disk
>> └─sda1   8:1    0   2G  0 part
>>
>> After:
>> 1. online resize the scsi target.
>> 2. host:~  # rescan-scsi-bus.sh -s /dev/sdc
>> 3. guest:~ # rescan-scsi-bus.sh -s /dev/sda
>> 4  host:~  # virsh domblkinfo --domain $DOMAIN --human --device sda
>> Capacity:       4.000 GiB
>> Allocation:     0.000 B
>> Physical:       8.000 GiB
>>
>> 5. guest:~ # lsblk /dev/sda
>> NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
>> sda      8:0    0   4G  0 disk
>> └─sda1   8:1    0   2G  0 part
>>
>> Signed-off-by: Lin Ma <lma@suse.com>
>> ---
>>  hw/scsi/scsi-generic.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
>> index 0306ccc7b1..343b51c2c0 100644
>> --- a/hw/scsi/scsi-generic.c
>> +++ b/hw/scsi/scsi-generic.c
>> @@ -315,11 +315,17 @@ static void scsi_read_complete(void * opaque, int ret)
>>      if (r->req.cmd.buf[0] == READ_CAPACITY_10 &&
>>          (ldl_be_p(&r->buf[0]) != 0xffffffffU || s->max_lba == 0)) {
>>          s->blocksize = ldl_be_p(&r->buf[4]);
>> -        s->max_lba = ldl_be_p(&r->buf[0]) & 0xffffffffULL;
>> +        BlockBackend *blk = s->conf.blk;
>> +        BlockDriverState *bs = blk_bs(blk);
>> +        s->max_lba = bs->total_sectors - 1;

I'd add a refresh_max_lba() helper:

 static void refresh_max_lba(SCSIDevice *s)
 {
     BlockBackend *blk = s->conf.blk;
     BlockDriverState *bs = blk_bs(blk);
     uint64_t max_lba = bs->total_sectors - 1;

     if (max_lba != s->max_lba) {
         trace_scsi_generic_max_lba_refreshed(s->max_lba, max_lba);
         s->max_lba = max_lba;
     }
 }

Otherwise, to the best of my knowledge:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> +        stl_be_p(&r->buf[0], s->max_lba);
>>      } else if (r->req.cmd.buf[0] == SERVICE_ACTION_IN_16 &&
>>                 (r->req.cmd.buf[1] & 31) == SAI_READ_CAPACITY_16) {
>>          s->blocksize = ldl_be_p(&r->buf[8]);
>> -        s->max_lba = ldq_be_p(&r->buf[0]);
>> +        BlockBackend *blk = s->conf.blk;
>> +        BlockDriverState *bs = blk_bs(blk);
>> +        s->max_lba = bs->total_sectors - 1;
>> +        stq_be_p(&r->buf[0], s->max_lba);
>>      }
>>      blk_set_guest_block_size(s->conf.blk, s->blocksize);
>>  
>>
> 
> 


