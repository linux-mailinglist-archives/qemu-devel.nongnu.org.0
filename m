Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CE6ECFAA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:52:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqwbF-00061Y-49; Mon, 24 Apr 2023 09:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pqwb4-000617-4m
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:51:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pqwb2-000650-AB
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:51:13 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19c473b9eso46343045e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682344270; x=1684936270;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BtKQwoCv0e8xCl8VUnSf38+zWNs0tN5+AskatxkHHM8=;
 b=BVfeRbL3v4AK48K3WhsQbY0+swrtlKdZxRlpHMtF+EI5VRTAzsTwtUnQ4etF28BmQm
 htbVJ7785ZnGqelqaIv0/lf8kMOt1llGMOB/K6ZbMl9rKDYO8Xy3qXYRmz5PildG40Tc
 tSuymYhqFjc/L0WOWO4F9DdAJgcovDR/WkQI0i5eFdygJY5G5LiHUV2be+E+jaW7JBmL
 +W4cDag3P5aWWPecyKVV7NuKpwn9p3xD4kpX+KsDw93mKNbDpUWCrsufIYTHTNxR8+RE
 h6A5KjqQ98wRG6bjg3UAMiktQh1OMZmxpfuw7YB7LGB5OoZV+OwHeqLjnz4v53ByK2Uq
 jOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682344270; x=1684936270;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtKQwoCv0e8xCl8VUnSf38+zWNs0tN5+AskatxkHHM8=;
 b=PAmY7epr4p8pRSWiGWwpCQP4GooKrU+qc6t3iZ8625+wLf9u42pqDLM7076QHl08vz
 IFK+mNba3rP15gCQl06Qua3zP2mqlZvDPJMPueXwHDB7AGJe0Rq3W6yoK30UXCnmNk+r
 vK96LFxv03F4DukdrSVCAB19sW+q0zMBaAxBA0QArPqv3yZybKCUIO0IPWv3Ow7Cx5LZ
 uXEtCPhIql4w6gzbbofr0m7qRN8x48BFaUS6rM/jX2FZFQ2uWJ7sCh6BE6sLD83lojTg
 RQN8DWMXTaseBkytZqEqQe0/XcY1mfT2naVEHPhWuFAS8iHA0RsLYK9vjzQa8SumeCTx
 FV4w==
X-Gm-Message-State: AAQBX9fRn2vjfJ3pFjbCswayabQpDWY5U3vfMASdTLmBuIdw5GLiNlBR
 0/08n7d9tfppmED08avKK/4=
X-Google-Smtp-Source: AKy350ZM2AlTdNcZK2XcWDq3EmcEpUhBpPbM+2DNs90QIn2SdzLHOMEJQaVKVHulEwj3d7s4+EPpVg==
X-Received: by 2002:a1c:7211:0:b0:3f1:6880:3308 with SMTP id
 n17-20020a1c7211000000b003f168803308mr8552987wmc.1.1682344270598; 
 Mon, 24 Apr 2023 06:51:10 -0700 (PDT)
Received: from [192.168.22.129] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb44000000b00304760c891asm3402769wrs.52.2023.04.24.06.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 06:51:10 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f1325cdb-9e0f-b955-7041-826fb6c78174@xen.org>
Date: Mon, 24 Apr 2023 14:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
Content-Language: en-US
To: Tim Smith <tismith@tibco.com>, Mark Syms <mark.syms@cloud.com>
Cc: mark.syms@citrix.com, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 tim.smith@citrix.com
References: <20230420110205.688689-1-mark.syms@citrix.com>
 <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
 <CAPYKksVtGyfv3TbAjLH1G=N6=pH-pH2-FTX5c3+E5PsOKo2aOQ@mail.gmail.com>
 <CALUK5G5T=8MkxaQxdeid_ypo1e4DJ-zBRAMb7D+dcHkVdJt2tQ@mail.gmail.com>
Organization: Xen Project
In-Reply-To: <CALUK5G5T=8MkxaQxdeid_ypo1e4DJ-zBRAMb7D+dcHkVdJt2tQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/04/2023 14:17, Tim Smith wrote:
> On Mon, Apr 24, 2023 at 1:08 PM Mark Syms <mark.syms@cloud.com> wrote:
>>
>> Copying in Tim who did the final phase of the changes.
>>
>> On Mon, 24 Apr 2023 at 11:32, Paul Durrant <xadimgnik@gmail.com> wrote:
>>>
>>> On 20/04/2023 12:02, mark.syms@citrix.com wrote:
>>>> From: Mark Syms <mark.syms@citrix.com>
>>>>
>>>> Ensure the PV ring is drained on disconnect. Also ensure all pending
>>>> AIO is complete, otherwise AIO tries to complete into a mapping of the
>>>> ring which has been torn down.
>>>>
>>>> Signed-off-by: Mark Syms <mark.syms@citrix.com>
>>>> ---
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Anthony Perard <anthony.perard@citrix.com>
>>>> CC: Paul Durrant <paul@xen.org>
>>>> CC: xen-devel@lists.xenproject.org
>>>>
>>>> v2:
>>>>    * Ensure all inflight requests are completed before teardown
>>>>    * RESEND to fix formatting
>>>> ---
>>>>    hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>>>>    1 file changed, 25 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
>>>> index 734da42ea7..d9da4090bf 100644
>>>> --- a/hw/block/dataplane/xen-block.c
>>>> +++ b/hw/block/dataplane/xen-block.c
>>>> @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>>>>
>>>>        dataplane->more_work = 0;
>>>>
>>>> +    if (dataplane->sring == 0) {
>>>> +        return done_something;
>>>> +    }
>>>> +
>>>
>>> I think you could just return false here... Nothing is ever going to be
>>> done if there's no ring :-)
>>>
>>>>        rc = dataplane->rings.common.req_cons;
>>>>        rp = dataplane->rings.common.sring->req_prod;
>>>>        xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
>>>> @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane >   void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>>>>    {
>>>>        XenDevice *xendev;
>>>> +    XenBlockRequest *request, *next;
>>>>
>>>>        if (!dataplane) {
>>>>            return;
>>>>        }
>>>>
>>>> +    /* We're about to drain the ring. We can cancel the scheduling of any
>>>> +     * bottom half now */
>>>> +    qemu_bh_cancel(dataplane->bh);
>>>> +
>>>> +    /* Ensure we have drained the ring */
>>>> +    aio_context_acquire(dataplane->ctx);
>>>> +    do {
>>>> +        xen_block_handle_requests(dataplane);
>>>> +    } while (dataplane->more_work);
>>>> +    aio_context_release(dataplane->ctx);
>>>> +
>>>
>>> I don't think we want to be taking new requests, do we?
>>>
> 
> If we're in this situation and the guest has put something on the
> ring, I think we should do our best with it.
> We cannot just rely on the guest to be well-behaved, because they're
> not :-( We're about to throw the
> ring away, so whatever is there would otherwise be lost.

We only throw away our mapping. The memory belongs to the guest and it
should ensure it does not submit requests after the state has left
'connected'

> This bit is
> here to try to handle guests which are
> less than diligent about their shutdown. We *should* always be past
> this fast enough when the disconnect()/connect()
> of XenbusStateConnected happens that all remains well (if not, we were
> in a worse situation before).
> 

What about a malicious guest that is piling requests into the ring. It 
could keep us in the loop forever, couldn't it?

>>>> +    /* Now ensure that all inflight requests are complete */
>>>> +    while (!QLIST_EMPTY(&dataplane->inflight)) {
>>>> +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
>>>> +            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
>>>> +                        request);
>>>> +        }
>>>> +    }
>>>> +
>>>
>>> I think this could possibly be simplified by doing the drain after the
>>> call to blk_set_aio_context(), as long as we set dataplane->ctx to
>>> qemu_get_aio_context(). Alos, as long as more_work is not set then it
>>> should still be safe to cancel the bh before the drain AFAICT.
> 
> I'm not sure what you mean by simpler? Possibly I'm not getting something.
> 

Sorry, I was referring to the need to do aio_context_acquire() calls but 
they are only around the disputed xen_block_handle_requests() call 
anyway, so there's no simplification in this bit.

> We have to make sure that any "aio_bh_schedule_oneshot_full()" which
> happens as a result of
> "blk_aio_flush()" has finished before any change of AIO context,
> because it tries to use the one which
> was current at the time of being called (I have the SEGVs to prove it
> :-)).

Ok, I had assumed that the issue was the context being picked up inside 
the xen_block_complete_aio() call.

> Whether that happens before or after
> "blk_set_aio_context(qemu_get_aio_context())" doesn't seem to be a
> change in complexity to me.
> 
> Motivation was to get as much as possible to happen in the way it
> "normally" would, so that future changes
> are less likely to regress, but as mentioned maybe I'm missing something.
> 
> The BH needs to be prevented from firing ASAP, otherwise the
> disconnect()/connect() which happens when
> XenbusStateConnected can have the bh fire from what the guest does
> next right in the middle of juggling
> contexts for the disconnect() (I have the SEGVs from that too...).
> 

So if you drop the ring drain then this patch should still stop the 
SEGVs, right?

   Paul


