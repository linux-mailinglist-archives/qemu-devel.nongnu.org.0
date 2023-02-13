Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB769499F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 16:00:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRaIU-0007Rg-LX; Mon, 13 Feb 2023 09:59:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRaII-0007Qa-Hu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:59:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRaIF-0000Ar-SE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:59:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id co8so8786354wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H+vG9NKIamVI0r52cKjKpboAVj2cmG9wZOmwYOLxCdQ=;
 b=DH21emMP4ln41qu1s3Qnmacq4fxMqS4dHcrFCUX7Gljpitzv1LSel/5pCu/Ktj1GzV
 E2QZalmuaMxIbq0BnW4gvz6UnmgJ9ZtjIiuklsJYXYYx5geVeR8q5IZ4SlOvLd4ASCdB
 X4itmN589k2ak16tOX70RfuPG/+6rIl8QraXL+I+kp5JoU7//i0Lc0P2OKYLKwDJn7fy
 A6Ak85KNBd4nziE0dsTPwEMkVE6xekzwcP/xFSejpa5pR6OVQssjIBbx+x+ZSbHP1GLN
 Eg+Bc7cI63TS9XMnxHkJlRwaMFUJd09Vuk7WD5zDN9zz1a+ckb9nkXUChIGOi0XH0NTB
 1DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+vG9NKIamVI0r52cKjKpboAVj2cmG9wZOmwYOLxCdQ=;
 b=7nYlr7zHTQHDEwq3NLws7rCivLT0HvhshC3lcBdj2YIZ3QAPGK8ai3INp+SjKmVru2
 JJ9bxEgVXaAWmmeQayJ4CshZ9FDhS1kwdyfM9hCVSgwtjcfKvk0c8sqh20s0SDpEKhtu
 pwnR4pN6wGwO9euUOhmmpTCvHMna/zIJYgWJHeessa6pWzVN6bqg9t5DibpU1EhQ+EwM
 wOn+Uid+n8kncccK0ATRF1SiopTLqmho2N2EWGUvTOMDiFLvI12XHz5HbYscMz1di7ub
 tDuFKnsQCPSw72d0WW5cO+FWpUAMWo1BXbFytQysXZjK1Ck1rRbdnVfyaY+KNwZYquzQ
 7dkg==
X-Gm-Message-State: AO0yUKWYzxGZkaOkRx+QSzaSVGADw3dUORnXiYWIuRT2vDMrIUOShYL5
 J9HYxliV3hV5eECcl+JdC+Zvzw==
X-Google-Smtp-Source: AK7set+Enx2NHrXZUzihViGCyajMFdWHQTy+36ptYXwC2ApvbWfJBAyzItlsRl/bOZcBLqqAPxQC3A==
X-Received: by 2002:adf:e5ce:0:b0:2c5:4d97:4a23 with SMTP id
 a14-20020adfe5ce000000b002c54d974a23mr6688992wrn.70.1676300338304; 
 Mon, 13 Feb 2023 06:58:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q1-20020a05600000c100b002c54d8b89efsm6708138wrx.26.2023.02.13.06.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:58:57 -0800 (PST)
Message-ID: <b19dbcdd-1246-f7d1-2d8f-8f9e2978d2d0@linaro.org>
Date: Mon, 13 Feb 2023 15:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Peter Xu <peterx@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
 <ad4783ee-20ce-06d2-7c2f-1f915bd684d0@eik.bme.hu>
 <413edbc1-8af1-4b0e-70ab-41d49f1bbbcd@eik.bme.hu>
 <fcd09b07-c0ac-d617-8503-a5ecef947cfe@redhat.com> <Y+pM+H1PvTUUHrhx@x1n>
 <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7ae34a52-13a5-05e0-3cea-10a9fb89ec1c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/2/23 15:47, BALATON Zoltan wrote:
> On Mon, 13 Feb 2023, Peter Xu wrote:
>> On Mon, Feb 13, 2023 at 12:41:29PM +0100, Thomas Huth wrote:
>>> On 07/02/2023 17.33, BALATON Zoltan wrote:
>>>> On Tue, 31 Jan 2023, BALATON Zoltan wrote:
>>>>> On Thu, 19 Jan 2023, BALATON Zoltan wrote:
>>>>>> Currently -d guest_errors enables logging of different invalid 
>>>>>> actions
>>>>>> by the guest such as misusing hardware, accessing missing features or
>>>>>> invalid memory areas. The memory access logging can be quite verbose
>>>>>> which obscures the other messages enabled by this debug switch so
>>>>>> separate it by adding a new -d memaccess option to make it 
>>>>>> possible to
>>>>>> control it independently of other guest error logs.
>>>>>>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>
>>>>> Ping? Could somebody review and pick it up please?
>>>>
>>>> Ping?
>>>
>>> Patch makes sense to me and looks fine, so:
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> ... I think this should go via one of the "Memory API" maintainers 
>>> branches?
>>> Paolo? Peter? David?
>>
>> Paolo normally does the pull, I assume that'll still be the case.  The
>> patch looks good to me if Phil's comment will be addressed on merging 
>> with
>> the old mask, which makes sense to me:
> 
> Keeping the old mask kind of defies the purpose. I've tried to explain 
> that in the commit message but now that two of you did not get it maybe 
> that message needs to be clarified instead?

Is your use case memaccess enabled and guest-errors disabled?


