Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCD43B3B02
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 04:58:49 +0200 (CEST)
Received: from localhost ([::1]:41182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwc3M-0001Uw-6l
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 22:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwc2Z-0000px-3M
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwc2W-0005O4-As
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624589874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oewcJS6b6bI3UJJ20goedaPpcjnKh1wUFIQshlCObeU=;
 b=NN3EIlyEXPVIYeTnGiJiopXABNjHVjF2z9wGayRoPPftWlxaFmlRdH+fjKVTBs/dqGp9oV
 2t2zRfn0HpyVrLe+IAN+uGtk5tb9l3eOSH/v5YRunesZ4UfwQgBPYyxXC5jWDIK60JXJ1Q
 8O0/2odOdiYHpztL/eGTP3myVlC4xo8=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-7-bZmCzyOkOhbf5JTDZjbw-1; Thu, 24 Jun 2021 22:57:52 -0400
X-MC-Unique: 7-bZmCzyOkOhbf5JTDZjbw-1
Received: by mail-pj1-f69.google.com with SMTP id
 r17-20020a17090aa091b029016eedf1dd17so5971094pjp.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 19:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oewcJS6b6bI3UJJ20goedaPpcjnKh1wUFIQshlCObeU=;
 b=kk6PjDjje9cqEYxcraIxcYiosQpB8Aj5cBtmc7G4rnPY++8kYHI9pAO5egQsrJBa+/
 fvnfhMqDd+2p+9FGEBaQbBikML0D3/wxrNpLPNz9l1ATQXMc+xz8fwEGRUfzAv5bpnma
 aq2q+Qfp1E/HZPFYFIbTr9NAu1owp6CmWfuvPkhWd/2ceYEsN8TkUGf6qnHiwsrrv8NF
 zcFfSk3uFPbTXuwLDzVaPBJNqbjMsM9fegTSwXA5v8YZt++9SXoV+clg0srK/brjYrI3
 ThI3y/NhNS7cHsXT456WS3opvwGUaTexxBQkS2CZv2YmyAxvOa0TiPHicdKmUw1DVK1B
 Cwvw==
X-Gm-Message-State: AOAM530xs4nGj38TErsEszkbggV7KVs614uuIK4VOE73lA2HZtqwtyoD
 X/rwQUmNYNaLvtgxYQTtdWfFcfX6WTFLUwP9vf05qVC9orH08c3ZkWDEs1OQT3+XORmBh9XS+hA
 UvGTgoVz++yS2gt94Qmk7fJ/o3GlDcIPAAzAAzVOQ/wSVXpMUuOEz0gW30dsFuj3tHg0=
X-Received: by 2002:a17:90a:7d06:: with SMTP id
 g6mr8644594pjl.91.1624589870840; 
 Thu, 24 Jun 2021 19:57:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU4vB1Zs0b9HuxYDuIXr/ZKn9r74LUNgWza0+t6OcWzcCIvy0ZiZ2BWFNq63DKtrpEl7B9fg==
X-Received: by 2002:a17:90a:7d06:: with SMTP id
 g6mr8644565pjl.91.1624589870525; 
 Thu, 24 Jun 2021 19:57:50 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n14sm3771076pjo.15.2021.06.24.19.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 19:57:50 -0700 (PDT)
Subject: Re: [PATCH qemu] hw/net/vmxnet3: Remove g_assert_not_reached() when
 VMXNET3_REG_ICR is written
To: Qiang Liu <cyruscyliu@gmail.com>
References: <162441284292.15618.4627728437912000813-0@git.sr.ht>
 <CAAKa2jm_4noz=rVc-vW6-4q-HsJtLoZXUZJfoHprjpLmYgb1EA@mail.gmail.com>
 <baf2e00f-b8ed-920b-2bcb-f5aecbdd20e7@redhat.com>
 <CAAKa2jnfJ4p_9nKHvjy_fWZ0-GRS_8ed=pBLW9rLNsBFDqO+zg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ba484747-8ddc-1d14-2dac-61212a373e0b@redhat.com>
Date: Fri, 25 Jun 2021 10:57:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAKa2jnfJ4p_9nKHvjy_fWZ0-GRS_8ed=pBLW9rLNsBFDqO+zg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/25 上午10:19, Qiang Liu 写道:
> Hi,
> On Wed, Jun 23, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2021/6/23 上午10:26, Qiang Liu 写道:
>>> From: cyruscyliu <cyruscyliu@gmail.com>
>>>
>>> A malicious guest user can write VMXNET3_REG_ICR to crash QEMU. This
>>> patch remove the g_aasert_not_reached() there and make the access pass.
>>>
>>> Fixes: 786fd2b0f87 ("VMXNET3 device implementation")
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/309
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1913923
>>>
>>> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
>>
>> Do we need to warn about the unimplemented register?
> If we remove the case branch, it will go to the default branch which
> can warn users if
> VMXNET_DEBUG_CB_ENABLED is defined, so there is no need to warn this
> unimplemented register. Am I right?
> ```
> vmxnet3_io_bar1_write(...
>      default:
>          VMW_CBPRN("Unknown Write to BAR1 [%" PRIx64 "] = %" PRIx64 ", size %d",
>                    addr, val, size);
>          break;
> ```


Right.

I've queued this patch.

Thanks


>> Thanks
>>
>>
>>> ---
>>>    hw/net/vmxnet3.c | 7 -------
>>>    1 file changed, 7 deletions(-)
>>>
>>> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
>>> index eff299f629..a388918479 100644
>>> --- a/hw/net/vmxnet3.c
>>> +++ b/hw/net/vmxnet3.c
>>> @@ -1786,13 +1786,6 @@ vmxnet3_io_bar1_write(void *opaque,
>>>            vmxnet3_set_variable_mac(s, val, s->temp_mac);
>>>            break;
>>>
>>> -    /* Interrupt Cause Register */
>>> -    case VMXNET3_REG_ICR:
>>> -        VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
>>> -                  val, size);
>>> -        g_assert_not_reached();
>>> -        break;
>>> -
>>>        /* Event Cause Register */
>>>        case VMXNET3_REG_ECR:
>>>            VMW_CBPRN("Write BAR1 [VMXNET3_REG_ECR] = %" PRIx64 ", size %d",
>>> --
>>> 2.30.2
>>>


