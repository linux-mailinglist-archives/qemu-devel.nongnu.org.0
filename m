Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DD4DB0A6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:11:35 +0100 (CET)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTR8-0008IQ-No
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:11:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUTAT-0002OJ-RH
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUTAQ-0006OF-H5
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647435257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/XO4QmElQ/gHXYKXfTA5jVngnW/iyXDD3/Nou4q7VY=;
 b=bR9qFwH9UvZqKknH3CRGbFTiy53PoFSLL82zXIj6ipe4uF5IqfSZwXDpxnQtI0HdfX/X05
 9twZvJqH3cFzWstD+Nr5EbfGkHz825ah41GBnEfLCfSEl7VHRP6ivQfTsiekeWVh0XZWkC
 Uw47k1Q+Lk4QDZV5J5KTJJu4qOFMnFY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-LF4sAl95OWKQ6dRszL8jEw-1; Wed, 16 Mar 2022 08:54:16 -0400
X-MC-Unique: LF4sAl95OWKQ6dRszL8jEw-1
Received: by mail-qt1-f200.google.com with SMTP id
 e28-20020ac8415c000000b002c5e43ca6b7so1394217qtm.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q/XO4QmElQ/gHXYKXfTA5jVngnW/iyXDD3/Nou4q7VY=;
 b=5as7auk2P/aN+gZ6dawcaNlpsNli67CghLL2pkV6ZZF2421olTt+eRW+7M0xB7yVv0
 o2YHfIjhLmglhxWkxhim/62VCi5Q5uZXXW1R4ZKRmh4/6YAdvWzHTIMZYEgHftpvAuSB
 sn4D4Cec+kdVp55Mv7zqiHfY/Mfo8UhCmIhQT1GuxlGZCi7x5kzCm205M41hQrc7V/b7
 rbiPmdJ4ToxJLNPNGiMjEe9F64tmeujwDwacOBgh6v5NcUkpfQcZV2FZDGV/ETmZLlXi
 68KXudd6aX3U8Exm/JG4eNrNGAVPL7YGcNLXfq8s866FLOM7RlkwW+eFEZH+7BLeHJ6G
 rdpg==
X-Gm-Message-State: AOAM5332j/kTEDvk31EiGUQF997ow8JrwaQs8oJW/GY/FsPL8FgJP3z5
 bHIylza4/a1oembXqyWBFjH61dd9Om8POqRROz2LhirjkGrYzVKSxBkVRUHYmb1KbzlM61RM+a7
 fWD6rOLeWgJnfe7Y=
X-Received: by 2002:a05:620a:4489:b0:67d:7291:39de with SMTP id
 x9-20020a05620a448900b0067d729139demr17096855qkp.735.1647435255603; 
 Wed, 16 Mar 2022 05:54:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPGLfVPll2xbkuyc9EtxRqTw9MCFzGw889FdWyiPQYoJeikBqN6dj7/KovzHMGKoNwMjm+gA==
X-Received: by 2002:a05:620a:4489:b0:67d:7291:39de with SMTP id
 x9-20020a05620a448900b0067d729139demr17096840qkp.735.1647435255260; 
 Wed, 16 Mar 2022 05:54:15 -0700 (PDT)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm1295773qtd.44.2022.03.16.05.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:54:14 -0700 (PDT)
Message-ID: <24ff2028-6c5e-7906-5d2d-15bcb33b70fe@redhat.com>
Date: Wed, 16 Mar 2022 13:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 21/50] block/block-backend.c: assertions for block-backend
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220304164711.474713-1-kwolf@redhat.com>
 <20220304164711.474713-22-kwolf@redhat.com>
 <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <c005130e-10f0-b575-4493-2080ba08494b@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

How did you trigger this? What is the call stack?
From a first look, all callers of blk_all_next also call
GLOBAL_STATE_CODE, except qmp_* functions.

That would be useful to understand if we need to change the function
assertion and classification, or the caller is breaking some invariants.

Thank you,
Emanuele

Am 16/03/2022 um 13:44 schrieb Philippe Mathieu-Daudé:
> Hi,
> 
> On 4/3/22 17:46, Kevin Wolf wrote:
>> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>
>> All the global state (GS) API functions will check that
>> qemu_in_main_thread() returns true. If not, it means
>> that the safety of BQL cannot be guaranteed, and
>> they need to be moved to I/O.
> 
> I'm getting this crash:
> 
> $ qemu-system-i386
> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
> block-backend.c, line 552.
> Abort trap: 6
> 
> Assertion failed: (qemu_in_main_thread()), function blk_all_next, file
> block-backend.c, line 552.
> qemu-system-i386 was compiled with optimization - stepping may behave
> oddly; variables may not be available.
> Process 76914 stopped
> * thread #1, queue = 'com.apple.main-thread', stop reason = hit program
> assert
>     frame #4: 0x000000010057c2d4 qemu-system-i386`blk_all_next.cold.1 at
> block-backend.c:552:5 [opt]
>    549    */
>    550   BlockBackend *blk_all_next(BlockBackend *blk)
>    551   {
> -> 552       GLOBAL_STATE_CODE();
>    553       return blk ? QTAILQ_NEXT(blk, link)
>    554                  : QTAILQ_FIRST(&block_backends);
>    555   }
> Target 1: (qemu-system-i386) stopped.
> 
> Bisected to this patch:
> 
> 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 is the first bad commit
> 
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Message-Id: <20220303151616.325444-9-eesposit@redhat.com>
>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> ---
>>   block/block-backend.c  | 78 ++++++++++++++++++++++++++++++++++++++++++
>>   softmmu/qdev-monitor.c |  2 ++
>>   2 files changed, 80 insertions(+)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 462e18facf..4476b61b8b 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -239,6 +239,7 @@ static void blk_root_activate(BdrvChild *child,
>> Error **errp)
>>     void blk_set_force_allow_inactivate(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->force_allow_inactivate = true;
>>   }
>>   @@ -357,6 +358,8 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t
>> perm, uint64_t shared_perm)
>>   {
>>       BlockBackend *blk;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       blk = g_new0(BlockBackend, 1);
>>       blk->refcnt = 1;
>>       blk->ctx = ctx;
>> @@ -394,6 +397,8 @@ BlockBackend *blk_new_with_bs(BlockDriverState
>> *bs, uint64_t perm,
>>   {
>>       BlockBackend *blk = blk_new(bdrv_get_aio_context(bs), perm,
>> shared_perm);
>>   +    GLOBAL_STATE_CODE();
>> +
>>       if (blk_insert_bs(blk, bs, errp) < 0) {
>>           blk_unref(blk);
>>           return NULL;
>> @@ -422,6 +427,8 @@ BlockBackend *blk_new_open(const char *filename,
>> const char *reference,
>>       uint64_t perm = 0;
>>       uint64_t shared = BLK_PERM_ALL;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       /*
>>        * blk_new_open() is mainly used in .bdrv_create implementations
>> and the
>>        * tools where sharing isn't a major concern because the BDS
>> stays private
>> @@ -499,6 +506,7 @@ static void drive_info_del(DriveInfo *dinfo)
>>     int blk_get_refcnt(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk ? blk->refcnt : 0;
>>   }
>>   @@ -509,6 +517,7 @@ int blk_get_refcnt(BlockBackend *blk)
>>   void blk_ref(BlockBackend *blk)
>>   {
>>       assert(blk->refcnt > 0);
>> +    GLOBAL_STATE_CODE();
>>       blk->refcnt++;
>>   }
>>   @@ -519,6 +528,7 @@ void blk_ref(BlockBackend *blk)
>>    */
>>   void blk_unref(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (blk) {
>>           assert(blk->refcnt > 0);
>>           if (blk->refcnt > 1) {
>> @@ -539,6 +549,7 @@ void blk_unref(BlockBackend *blk)
>>    */
>>   BlockBackend *blk_all_next(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk ? QTAILQ_NEXT(blk, link)
>>                  : QTAILQ_FIRST(&block_backends);
>>   }
>> @@ -547,6 +558,8 @@ void blk_remove_all_bs(void)
>>   {
>>       BlockBackend *blk = NULL;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       while ((blk = blk_all_next(blk)) != NULL) {
>>           AioContext *ctx = blk_get_aio_context(blk);
>>   @@ -570,6 +583,7 @@ void blk_remove_all_bs(void)
>>    */
>>   BlockBackend *blk_next(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk ? QTAILQ_NEXT(blk, monitor_link)
>>                  : QTAILQ_FIRST(&monitor_block_backends);
>>   }
>> @@ -636,6 +650,7 @@ static void bdrv_next_reset(BdrvNextIterator *it)
>>     BlockDriverState *bdrv_first(BdrvNextIterator *it)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       bdrv_next_reset(it);
>>       return bdrv_next(it);
>>   }
>> @@ -673,6 +688,7 @@ bool monitor_add_blk(BlockBackend *blk, const char
>> *name, Error **errp)
>>   {
>>       assert(!blk->name);
>>       assert(name && name[0]);
>> +    GLOBAL_STATE_CODE();
>>         if (!id_wellformed(name)) {
>>           error_setg(errp, "Invalid device name");
>> @@ -700,6 +716,8 @@ bool monitor_add_blk(BlockBackend *blk, const char
>> *name, Error **errp)
>>    */
>>   void monitor_remove_blk(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>> +
>>       if (!blk->name) {
>>           return;
>>       }
>> @@ -726,6 +744,7 @@ BlockBackend *blk_by_name(const char *name)
>>   {
>>       BlockBackend *blk = NULL;
>>   +    GLOBAL_STATE_CODE();
>>       assert(name);
>>       while ((blk = blk_next(blk)) != NULL) {
>>           if (!strcmp(name, blk->name)) {
>> @@ -760,6 +779,7 @@ static BlockBackend
>> *bdrv_first_blk(BlockDriverState *bs)
>>    */
>>   bool bdrv_has_blk(BlockDriverState *bs)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return bdrv_first_blk(bs) != NULL;
>>   }
>>   @@ -770,6 +790,7 @@ bool bdrv_is_root_node(BlockDriverState *bs)
>>   {
>>       BdrvChild *c;
>>   +    GLOBAL_STATE_CODE();
>>       QLIST_FOREACH(c, &bs->parents, next_parent) {
>>           if (c->klass != &child_root) {
>>               return false;
>> @@ -819,6 +840,7 @@ BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
>>    */
>>   BlockBackendPublic *blk_get_public(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return &blk->public;
>>   }
>>   @@ -827,6 +849,7 @@ BlockBackendPublic *blk_get_public(BlockBackend
>> *blk)
>>    */
>>   BlockBackend *blk_by_public(BlockBackendPublic *public)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return container_of(public, BlockBackend, public);
>>   }
>>   @@ -838,6 +861,8 @@ void blk_remove_bs(BlockBackend *blk)
>>       ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>>       BdrvChild *root;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       notifier_list_notify(&blk->remove_bs_notifiers, blk);
>>       if (tgm->throttle_state) {
>>           BlockDriverState *bs = blk_bs(blk);
>> @@ -872,6 +897,7 @@ void blk_remove_bs(BlockBackend *blk)
>>   int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error
>> **errp)
>>   {
>>       ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>> +    GLOBAL_STATE_CODE();
>>       bdrv_ref(bs);
>>       blk->root = bdrv_root_attach_child(bs, "root", &child_root,
>>                                          BDRV_CHILD_FILTERED |
>> BDRV_CHILD_PRIMARY,
>> @@ -895,6 +921,7 @@ int blk_insert_bs(BlockBackend *blk,
>> BlockDriverState *bs, Error **errp)
>>    */
>>   int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs,
>> Error **errp)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return bdrv_replace_child_bs(blk->root, new_bs, errp);
>>   }
>>   @@ -905,6 +932,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t
>> perm, uint64_t shared_perm,
>>                    Error **errp)
>>   {
>>       int ret;
>> +    GLOBAL_STATE_CODE();
>>         if (blk->root && !blk->disable_perm) {
>>           ret = bdrv_child_try_set_perm(blk->root, perm, shared_perm,
>> errp);
>> @@ -921,6 +949,7 @@ int blk_set_perm(BlockBackend *blk, uint64_t perm,
>> uint64_t shared_perm,
>>     void blk_get_perm(BlockBackend *blk, uint64_t *perm, uint64_t
>> *shared_perm)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       *perm = blk->perm;
>>       *shared_perm = blk->shared_perm;
>>   }
>> @@ -931,6 +960,7 @@ void blk_get_perm(BlockBackend *blk, uint64_t
>> *perm, uint64_t *shared_perm)
>>    */
>>   int blk_attach_dev(BlockBackend *blk, DeviceState *dev)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (blk->dev) {
>>           return -EBUSY;
>>       }
>> @@ -956,6 +986,7 @@ int blk_attach_dev(BlockBackend *blk, DeviceState
>> *dev)
>>   void blk_detach_dev(BlockBackend *blk, DeviceState *dev)
>>   {
>>       assert(blk->dev == dev);
>> +    GLOBAL_STATE_CODE();
>>       blk->dev = NULL;
>>       blk->dev_ops = NULL;
>>       blk->dev_opaque = NULL;
>> @@ -969,6 +1000,7 @@ void blk_detach_dev(BlockBackend *blk,
>> DeviceState *dev)
>>    */
>>   DeviceState *blk_get_attached_dev(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk->dev;
>>   }
>>   @@ -997,6 +1029,8 @@ BlockBackend *blk_by_dev(void *dev)
>>   {
>>       BlockBackend *blk = NULL;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       assert(dev != NULL);
>>       while ((blk = blk_all_next(blk)) != NULL) {
>>           if (blk->dev == dev) {
>> @@ -1014,6 +1048,7 @@ BlockBackend *blk_by_dev(void *dev)
>>   void blk_set_dev_ops(BlockBackend *blk, const BlockDevOps *ops,
>>                        void *opaque)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->dev_ops = ops;
>>       blk->dev_opaque = opaque;
>>   @@ -1035,6 +1070,7 @@ void blk_set_dev_ops(BlockBackend *blk, const
>> BlockDevOps *ops,
>>    */
>>   void blk_dev_change_media_cb(BlockBackend *blk, bool load, Error
>> **errp)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (blk->dev_ops && blk->dev_ops->change_media_cb) {
>>           bool tray_was_open, tray_is_open;
>>           Error *local_err = NULL;
>> @@ -1126,6 +1162,7 @@ static void blk_root_resize(BdrvChild *child)
>>     void blk_iostatus_enable(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->iostatus_enabled = true;
>>       blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
>>   }
>> @@ -1142,16 +1179,19 @@ bool blk_iostatus_is_enabled(const
>> BlockBackend *blk)
>>     BlockDeviceIoStatus blk_iostatus(const BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk->iostatus;
>>   }
>>     void blk_iostatus_disable(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->iostatus_enabled = false;
>>   }
>>     void blk_iostatus_reset(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (blk_iostatus_is_enabled(blk)) {
>>           blk->iostatus = BLOCK_DEVICE_IO_STATUS_OK;
>>       }
>> @@ -1358,6 +1398,7 @@ int blk_pwrite_zeroes(BlockBackend *blk, int64_t
>> offset,
>>     int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return bdrv_make_zero(blk->root, flags);
>>   }
>>   @@ -1567,6 +1608,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk,
>> int64_t offset,
>>     void blk_aio_cancel(BlockAIOCB *acb)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       bdrv_aio_cancel(acb);
>>   }
>>   @@ -1723,6 +1765,7 @@ int blk_flush(BlockBackend *blk)
>>   void blk_drain(BlockBackend *blk)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           bdrv_ref(bs);
>> @@ -1743,6 +1786,8 @@ void blk_drain_all(void)
>>   {
>>       BlockBackend *blk = NULL;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       bdrv_drain_all_begin();
>>         while ((blk = blk_all_next(blk)) != NULL) {
>> @@ -1762,6 +1807,7 @@ void blk_drain_all(void)
>>   void blk_set_on_error(BlockBackend *blk, BlockdevOnError on_read_error,
>>                         BlockdevOnError on_write_error)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->on_read_error = on_read_error;
>>       blk->on_write_error = on_write_error;
>>   }
>> @@ -1845,6 +1891,7 @@ void blk_error_action(BlockBackend *blk,
>> BlockErrorAction action,
>>   bool blk_supports_write_perm(BlockBackend *blk)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           return !bdrv_is_read_only(bs);
>> @@ -1865,6 +1912,7 @@ bool blk_is_writable(BlockBackend *blk)
>>   bool blk_is_sg(BlockBackend *blk)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (!bs) {
>>           return false;
>> @@ -1880,12 +1928,14 @@ bool blk_enable_write_cache(BlockBackend *blk)
>>     void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       blk->enable_write_cache = wce;
>>   }
>>     void blk_activate(BlockBackend *blk, Error **errp)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (!bs) {
>>           error_setg(errp, "Device '%s' has no medium", blk->name);
>> @@ -1936,6 +1986,7 @@ void blk_eject(BlockBackend *blk, bool eject_flag)
>>   int blk_get_flags(BlockBackend *blk)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           return bdrv_get_flags(bs);
>> @@ -2005,6 +2056,7 @@ void *blk_blockalign(BlockBackend *blk, size_t
>> size)
>>   bool blk_op_is_blocked(BlockBackend *blk, BlockOpType op, Error **errp)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (!bs) {
>>           return false;
>> @@ -2016,6 +2068,7 @@ bool blk_op_is_blocked(BlockBackend *blk,
>> BlockOpType op, Error **errp)
>>   void blk_op_unblock(BlockBackend *blk, BlockOpType op, Error *reason)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           bdrv_op_unblock(bs, op, reason);
>> @@ -2025,6 +2078,7 @@ void blk_op_unblock(BlockBackend *blk,
>> BlockOpType op, Error *reason)
>>   void blk_op_block_all(BlockBackend *blk, Error *reason)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           bdrv_op_block_all(bs, reason);
>> @@ -2034,6 +2088,7 @@ void blk_op_block_all(BlockBackend *blk, Error
>> *reason)
>>   void blk_op_unblock_all(BlockBackend *blk, Error *reason)
>>   {
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         if (bs) {
>>           bdrv_op_unblock_all(bs, reason);
>> @@ -2093,6 +2148,7 @@ static int blk_do_set_aio_context(BlockBackend
>> *blk, AioContext *new_context,
>>   int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
>>                           Error **errp)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk_do_set_aio_context(blk, new_context, true, errp);
>>   }
>>   @@ -2129,6 +2185,7 @@ void blk_add_aio_context_notifier(BlockBackend
>> *blk,
>>   {
>>       BlockBackendAioNotifier *notifier;
>>       BlockDriverState *bs = blk_bs(blk);
>> +    GLOBAL_STATE_CODE();
>>         notifier = g_new(BlockBackendAioNotifier, 1);
>>       notifier->attached_aio_context = attached_aio_context;
>> @@ -2151,6 +2208,8 @@ void
>> blk_remove_aio_context_notifier(BlockBackend *blk,
>>       BlockBackendAioNotifier *notifier;
>>       BlockDriverState *bs = blk_bs(blk);
>>   +    GLOBAL_STATE_CODE();
>> +
>>       if (bs) {
>>           bdrv_remove_aio_context_notifier(bs, attached_aio_context,
>>                                            detach_aio_context, opaque);
>> @@ -2171,11 +2230,13 @@ void
>> blk_remove_aio_context_notifier(BlockBackend *blk,
>>     void blk_add_remove_bs_notifier(BlockBackend *blk, Notifier *notify)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       notifier_list_add(&blk->remove_bs_notifiers, notify);
>>   }
>>     void blk_add_insert_bs_notifier(BlockBackend *blk, Notifier *notify)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       notifier_list_add(&blk->insert_bs_notifiers, notify);
>>   }
>>   @@ -2238,6 +2299,7 @@ int blk_save_vmstate(BlockBackend *blk, const
>> uint8_t *buf,
>>                        int64_t pos, int size)
>>   {
>>       int ret;
>> +    GLOBAL_STATE_CODE();
>>         if (!blk_is_available(blk)) {
>>           return -ENOMEDIUM;
>> @@ -2257,6 +2319,7 @@ int blk_save_vmstate(BlockBackend *blk, const
>> uint8_t *buf,
>>     int blk_load_vmstate(BlockBackend *blk, uint8_t *buf, int64_t pos,
>> int size)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (!blk_is_available(blk)) {
>>           return -ENOMEDIUM;
>>       }
>> @@ -2266,6 +2329,7 @@ int blk_load_vmstate(BlockBackend *blk, uint8_t
>> *buf, int64_t pos, int size)
>>     int blk_probe_blocksizes(BlockBackend *blk, BlockSizes *bsz)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (!blk_is_available(blk)) {
>>           return -ENOMEDIUM;
>>       }
>> @@ -2275,6 +2339,7 @@ int blk_probe_blocksizes(BlockBackend *blk,
>> BlockSizes *bsz)
>>     int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (!blk_is_available(blk)) {
>>           return -ENOMEDIUM;
>>       }
>> @@ -2288,6 +2353,7 @@ int blk_probe_geometry(BlockBackend *blk,
>> HDGeometry *geo)
>>    */
>>   void blk_update_root_state(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       assert(blk->root);
>>         blk->root_state.open_flags    = blk->root->bs->open_flags;
>> @@ -2300,6 +2366,7 @@ void blk_update_root_state(BlockBackend *blk)
>>    */
>>   bool blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk->root_state.detect_zeroes;
>>   }
>>   @@ -2309,17 +2376,20 @@ bool
>> blk_get_detect_zeroes_from_root_state(BlockBackend *blk)
>>    */
>>   int blk_get_open_flags_from_root_state(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk->root_state.open_flags;
>>   }
>>     BlockBackendRootState *blk_get_root_state(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return &blk->root_state;
>>   }
>>     int blk_commit_all(void)
>>   {
>>       BlockBackend *blk = NULL;
>> +    GLOBAL_STATE_CODE();
>>         while ((blk = blk_all_next(blk)) != NULL) {
>>           AioContext *aio_context = blk_get_aio_context(blk);
>> @@ -2344,6 +2414,7 @@ int blk_commit_all(void)
>>   /* throttling disk I/O limits */
>>   void blk_set_io_limits(BlockBackend *blk, ThrottleConfig *cfg)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       throttle_group_config(&blk->public.throttle_group_member, cfg);
>>   }
>>   @@ -2352,6 +2423,7 @@ void blk_io_limits_disable(BlockBackend *blk)
>>       BlockDriverState *bs = blk_bs(blk);
>>       ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
>>       assert(tgm->throttle_state);
>> +    GLOBAL_STATE_CODE();
>>       if (bs) {
>>           bdrv_ref(bs);
>>           bdrv_drained_begin(bs);
>> @@ -2367,12 +2439,14 @@ void blk_io_limits_disable(BlockBackend *blk)
>>   void blk_io_limits_enable(BlockBackend *blk, const char *group)
>>   {
>>       assert(!blk->public.throttle_group_member.throttle_state);
>> +    GLOBAL_STATE_CODE();
>>       throttle_group_register_tgm(&blk->public.throttle_group_member,
>>                                   group, blk_get_aio_context(blk));
>>   }
>>     void blk_io_limits_update_group(BlockBackend *blk, const char *group)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       /* this BB is not part of any group */
>>       if (!blk->public.throttle_group_member.throttle_state) {
>>           return;
>> @@ -2440,11 +2514,13 @@ static void blk_root_drained_end(BdrvChild
>> *child, int *drained_end_counter)
>>     void blk_register_buf(BlockBackend *blk, void *host, size_t size)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       bdrv_register_buf(blk_bs(blk), host, size);
>>   }
>>     void blk_unregister_buf(BlockBackend *blk, void *host)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       bdrv_unregister_buf(blk_bs(blk), host);
>>   }
>>   @@ -2469,11 +2545,13 @@ int coroutine_fn
>> blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
>>     const BdrvChild *blk_root(BlockBackend *blk)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       return blk->root;
>>   }
>>     int blk_make_empty(BlockBackend *blk, Error **errp)
>>   {
>> +    GLOBAL_STATE_CODE();
>>       if (!blk_is_available(blk)) {
>>           error_setg(errp, "No medium inserted");
>>           return -ENOMEDIUM;
>> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
>> index 01f3834db5..ff14af8396 100644
>> --- a/softmmu/qdev-monitor.c
>> +++ b/softmmu/qdev-monitor.c
>> @@ -971,6 +971,8 @@ BlockBackend *blk_by_qdev_id(const char *id, Error
>> **errp)
>>       DeviceState *dev;
>>       BlockBackend *blk;
>>   +    GLOBAL_STATE_CODE();
>> +
>>       dev = find_device_state(id, errp);
>>       if (dev == NULL) {
>>           return NULL;
> 


