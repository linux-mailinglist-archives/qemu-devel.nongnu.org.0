Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F45537AD4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:53:57 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nveuC-0004kt-DU
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nves2-0002ZU-At
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:51:45 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nverx-0004Iz-3g
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:51:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gd1so2797407pjb.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZvzQrzGqX0fJW9mWiWfNdI5A2ruzfhQVGGg4PFZYL8Y=;
 b=5LTfDx+bkaTCFM5Negv4ttvuFWwAThetWZq9GeHLSuU8N31iQe1v8qXouG9NSNS0T6
 Ldm0sm18jhB1MBs9eYRRV7f1xbyELfqCVplUXoMX5P8rOuax3m7DbYSS3HH2p+0C2wXA
 25cTRL8bfAHIi1ohekGqUvVk5YCD0/RQk4GlG7kF6iC+nDlmqLXH48VoPgZx8eQzyXfE
 XX4R12kZTezWJnw+cM1ZBL/I6AzA0V/7qEI9H850um38DokHxOMHJ2mbMcpGIq2TUcBZ
 UuCPKXlnmfjHYemIDioZETjyYo67acLvfOdphzCFSLNjKWFn7fWOPl6fUo4D5TWaxJNI
 9pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZvzQrzGqX0fJW9mWiWfNdI5A2ruzfhQVGGg4PFZYL8Y=;
 b=0pMtLklliM78iSgCOPB+9HAeoG3GTxDmrAUX9tUnKsOnuRO2i+07RTF5hVHLBnQylX
 SbXhTtq0LVG+TyTdMeAsJ6iGOHnjgUCGXiYxSVXwpbuCRuqloi5eBpksXNSCXrLHXAXU
 zigrYGSHpZiwXlM35XyC6wO/EaOsT0HfAOnj/CTNYUrylByim6K8IF7zW5bGXewinBcW
 lg+Q28AFK3k26kTxcYaza3eD6ZndkUF2kupbvinkU58h9j68I3sZmXgYY1OoozPq2hOf
 0GUaWP4+yL19yWDdJdwuNkOY5QPPeI3XXmyk7cxI2jbOnLBxu+EGtTTMLm34n/ImLWi8
 +T3g==
X-Gm-Message-State: AOAM530rgf1QGBdBzA0G95RHIxMA4e/B7d7RTW2YCBFpJKrjJhrDOnY9
 gEkWHXCQ6F7mTHdaVBn3rtgegQ==
X-Google-Smtp-Source: ABdhPJwTiynlgnZijOQCrJvfmuzkL14Lu9xuJdj0+djeOHFAyAPupu8F5badEOZlrtCuCzbEYSTGWw==
X-Received: by 2002:a17:902:7b8f:b0:162:467:db7c with SMTP id
 w15-20020a1709027b8f00b001620467db7cmr43791860pll.140.1653915094829; 
 Mon, 30 May 2022 05:51:34 -0700 (PDT)
Received: from [10.255.89.136] ([139.177.225.249])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170902e5cd00b001624dab05edsm9341931plf.8.2022.05.30.05.51.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 05:51:34 -0700 (PDT)
Message-ID: <e870424d-da27-b369-7406-27f7f2983428@bytedance.com>
Date: Mon, 30 May 2022 20:47:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Re: [PATCH 3/3] virtio_balloon: Introduce memory recover
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, mst@redhat.com,
 naoya.horiguchi@nec.com, akpm@linux-foundation.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 peterx@redhat.com, qemu-devel@nongnu.org
References: <20220520070648.1794132-1-pizhenwei@bytedance.com>
 <20220520070648.1794132-4-pizhenwei@bytedance.com>
 <612e42f7-1a97-9b01-2d45-d4661911e7a8@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <612e42f7-1a97-9b01-2d45-d4661911e7a8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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



On 5/30/22 15:48, David Hildenbrand wrote:
> 
>> +
>>   struct virtio_balloon {
>>   	struct virtio_device *vdev;
>>   	struct virtqueue *inflate_vq, *deflate_vq, *stats_vq, *free_page_vq;
>> @@ -126,6 +133,16 @@ struct virtio_balloon {
>>   	/* Free page reporting device */
>>   	struct virtqueue *reporting_vq;
>>   	struct page_reporting_dev_info pr_dev_info;
>> +
>> +	/* Memory recover VQ - VIRTIO_BALLOON_F_RECOVER */
>> +	struct virtqueue *recover_vq;
>> +	spinlock_t recover_vq_lock;
>> +	struct notifier_block memory_failure_nb;
>> +	struct list_head corrupted_page_list;
>> +	struct list_head recovered_page_list;
>> +	spinlock_t recover_page_list_lock;
>> +	struct __virtio_balloon_recover in_vbr;
>> +	struct work_struct unpoison_memory_work;
> 
> I assume we want all that only with CONFIG_MEMORY_FAILURE.
> 

Sorry, I missed this.

>>   };
>>   
>>   static const struct virtio_device_id id_table[] = {
>> @@ -494,6 +511,198 @@ static void update_balloon_size_func(struct work_struct *work)
>>   		queue_work(system_freezable_wq, work);
>>   }
>>   
>> +/*
>> + * virtballoon_memory_failure - notified by memory failure, try to fix the
>> + *                              corrupted page.
>> + * The memory failure notifier is designed to call back when the kernel handled
>> + * successfully only, WARN_ON_ONCE on the unlikely condition to find out any
>> + * error(memory error handling is a best effort, not 100% coverd).
>> + */
>> +static int virtballoon_memory_failure(struct notifier_block *notifier,
>> +				      unsigned long pfn, void *parm)
>> +{
>> +	struct virtio_balloon *vb = container_of(notifier, struct virtio_balloon,
>> +						 memory_failure_nb);
>> +	struct page *page;
>> +	struct __virtio_balloon_recover *out_vbr;
>> +	struct scatterlist sg;
>> +	unsigned long flags;
>> +	int err;
>> +
>> +	page = pfn_to_online_page(pfn);
>> +	if (WARN_ON_ONCE(!page))
>> +		return NOTIFY_DONE;
>> +
>> +	if (PageHuge(page))
>> +		return NOTIFY_DONE;
>> +
>> +	if (WARN_ON_ONCE(!PageHWPoison(page)))
>> +		return NOTIFY_DONE;
>> +
>> +	if (WARN_ON_ONCE(page_count(page) != 1))
>> +		return NOTIFY_DONE;
> 
> Relying on the page_count to be 1 for correctness is usually a bit
> shaky, for example, when racing against isolate_movable_page() that
> might temporarily bump upo the refcount.
> 

The memory notifier is designed to call the chain if a page gets result 
MF_RECOVERED only:
      if (result == MF_RECOVERED)
          blocking_notifier_call_chain(&mf_notifier_list, pfn, NULL);


>> +
>> +	get_page(page); /* balloon reference */
>> +
>> +	out_vbr = kzalloc(sizeof(*out_vbr), GFP_KERNEL);
> 
> Are we always guaranteed to be able to use GFP_KERNEL out of MCE
> context? (IOW, are we never atomic?)
> 
>> +	if (WARN_ON_ONCE(!out_vbr))
>> +		return NOTIFY_BAD;
>> +
>> +	spin_lock(&vb->recover_page_list_lock);
>> +	balloon_page_push(&vb->corrupted_page_list, page);
>> +	spin_unlock(&vb->recover_page_list_lock);
>> +
>> +	out_vbr->vbr.cmd = VIRTIO_BALLOON_R_CMD_RECOVER;
> 
> This makes me wonder if we should have a more generic guest->host
> request queue, similar to what e.g., virtio-mem uses, instead of adding
> a separate VIRTIO_BALLOON_VQ_RECOVER vq.
> 

I'm OK with either one, I'll follow your decision! :D

>> +	set_page_pfns(vb, out_vbr->pfns, page);
>> +	sg_init_one(&sg, out_vbr, sizeof(*out_vbr));
>> +
>> +	spin_lock_irqsave(&vb->recover_vq_lock, flags);
>> +	err = virtqueue_add_outbuf(vb->recover_vq, &sg, 1, out_vbr, GFP_KERNEL);
>> +	if (unlikely(err)) {
>> +		spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
>> +		return NOTIFY_DONE;
>> +	}
>> +	virtqueue_kick(vb->recover_vq);
>> +	spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static int recover_vq_get_response(struct virtio_balloon *vb)
>> +{
>> +	struct __virtio_balloon_recover *in_vbr;
>> +	struct scatterlist sg;
>> +	unsigned long flags;
>> +	int err;
>> +
>> +	spin_lock_irqsave(&vb->recover_vq_lock, flags);
>> +	in_vbr = &vb->in_vbr;
>> +	memset(in_vbr, 0x00, sizeof(*in_vbr));
>> +	sg_init_one(&sg, in_vbr, sizeof(*in_vbr));
>> +	err = virtqueue_add_inbuf(vb->recover_vq, &sg, 1, in_vbr, GFP_KERNEL);
>> +	if (unlikely(err)) {
>> +		spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
>> +		return err;
>> +	}
>> +
>> +	virtqueue_kick(vb->recover_vq);
>> +	spin_unlock_irqrestore(&vb->recover_vq_lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void recover_vq_handle_response(struct virtio_balloon *vb, unsigned int len)
>> +{
>> +	struct __virtio_balloon_recover *in_vbr;
>> +	struct virtio_balloon_recover *vbr;
>> +	struct page *page;
>> +	unsigned int pfns;
>> +	u32 pfn0, pfn1;
>> +	__u8 status;
>> +
>> +	/* the response is not expected */
>> +	if (unlikely(len != sizeof(struct __virtio_balloon_recover)))
>> +		return;
>> +
>> +	in_vbr = &vb->in_vbr;
>> +	vbr = &in_vbr->vbr;
>> +	if (unlikely(vbr->cmd != VIRTIO_BALLOON_R_CMD_RESPONSE))
>> +		return;
>> +
>> +	/* to make sure the contiguous balloon PFNs */
>> +	for (pfns = 1; pfns < VIRTIO_BALLOON_PAGES_PER_PAGE; pfns++) {
>> +		pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns - 1]);
>> +		pfn1 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[pfns]);
>> +		if (pfn1 - pfn0 != 1)
>> +			return;
> 
> Yeah, we really shouldn't be dealing with (legacy) 4k PFNs here, but
> instead, proper ranges I guess.
> 

MST also pointed out this, I explained in this link:
https://lkml.org/lkml/2022/5/26/942

Rather than page reporting style, virtio-mem style should be fine. Ex,
struct virtio_memory_recover {
         __virtio64 addr;
         __virtio32 length;
         __virtio16 padding[2];
};

>> +	}
>> +
>> +	pfn0 = virtio32_to_cpu(vb->vdev, in_vbr->pfns[0]);
>> +	if (!pfn_valid(pfn0))
>> +		return;
>> +
>> +	pfn1 = -1;
>> +	spin_lock(&vb->recover_page_list_lock);
>> +	list_for_each_entry(page, &vb->corrupted_page_list, lru) {
>> +		pfn1 = page_to_pfn(page);
>> +		if (pfn1 == pfn0)
>> +			break;
>> +	}
>> +	spin_unlock(&vb->recover_page_list_lock);
>> +
>> +	status = vbr->status;
>> +	switch (status) {
>> +	case VIRTIO_BALLOON_R_STATUS_RECOVERED:
>> +		if (pfn1 == pfn0) {
>> +			spin_lock(&vb->recover_page_list_lock);
>> +			list_del(&page->lru);
>> +			balloon_page_push(&vb->recovered_page_list, page);
> 
> We rather not reuse actual balloon functions in !balloon context. Just
> move the page to the proper list directly.
> 

OK.

>> +			spin_unlock(&vb->recover_page_list_lock);
>> +			queue_work(system_freezable_wq, &vb->unpoison_memory_work);
>> +			dev_info_ratelimited(&vb->vdev->dev, "recovered pfn 0x%x", pfn0);
> 
> Well, not yet. Shouldn't this go into unpoison_memory_func() ?
> 

OK.

[...]

> 
>>   
>> +out_unregister_reporting:
>> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
>> +		page_reporting_unregister(&vb->pr_dev_info);
>>   out_unregister_oom:
>>   	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
>>   		unregister_oom_notifier(&vb->oom_nb);
>> @@ -1082,6 +1319,11 @@ static void virtballoon_remove(struct virtio_device *vdev)
>>   		destroy_workqueue(vb->balloon_wq);
>>   	}
>>   
>> +	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_RECOVER)) {
> 
> Could the notifier already have been triggered and we might be using the
> device before already fully initialized from the notifier and might end
> up leaking memory here that we allocated?
> 
>> +		unregister_memory_failure_notifier(&vb->memory_failure_nb);
>> +		cancel_work_sync(&vb->unpoison_memory_work);
>> +	}
>> +
> 
> Could we be leaking memory from the virtballoon_remove() path?
> 

Yes, I'll fix the possible memory leak here.

Thanks a lot.

-- 
zhenwei pi

