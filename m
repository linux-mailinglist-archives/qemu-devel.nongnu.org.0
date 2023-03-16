Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106C96BCFD7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:46:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmzn-00080y-3L; Thu, 16 Mar 2023 08:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcmzl-00080W-GW
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:46:13 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcmzj-0001Yk-Ab
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:46:13 -0400
Received: by mail-wm1-x32a.google.com with SMTP id ay8so1172703wmb.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678970769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zs3yBWyZ6pxKeX6fkrOZWkDOV57a6Sjnx53NOR/bwWY=;
 b=HU8JrAO/MV9vx9IW2uBrNHJPcFtA0xSZyHeliN4lUvdCE8cm8qo0EkTuggia4mxNg9
 frVvWzuHLFqVBZeHSKq1ax6CQZ8GrdSZmxn8jLg9qSWJ4jLeqtO6Wf4L4AIEUqBwwA/j
 jyBa5Io/8OHWnWT3mKibYw0+EdaqF/1Y6Blx5xJNoJtR+JQvUnYqQdZvqmnIZ7VvYEF0
 CMK+/K1NFPunWJ12z1HcJPuSb8ZU2mhV2/zDH9hkXTEHJenaH6JKXD/a5C4I30X1ZMRd
 DVjT/52H/mtcok62yWtTSaGXTRA6PD8S34buOQPO7LCLvEeeeGZFVo77r/EVYPaV1wKs
 ha6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678970769;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zs3yBWyZ6pxKeX6fkrOZWkDOV57a6Sjnx53NOR/bwWY=;
 b=KdtUTQLcE8SqisSLNRfhr2/hZAAmhttTsnay64nN4IEpoHBwmvgnD6osfkCDrMNJsF
 sIaNlQyaFAVJyoBZ5oK8zn4WNL2mSpa5a3Z9RU5qpS0ev9cnSLuIt/AFzkN5k8/YLar0
 Rs/Ar9tlZvSt/qLpV9RLviigWlh5OLwXSO8bH3+uYd+L/sFaXwdtkbaZHYoEoxbyL8SA
 F3I08uKZboE2bzGg6VS/XLsDzx1mSaUidznX2bkRBdmeT8iC29Mu4kCE/SCjOCRU0qyh
 izCszMUqmUtpXDLh3SoykBTijvCJbCIagZw9nEovOE00vOOHm3ibgdVTCz8xuw4kpjLP
 wVSA==
X-Gm-Message-State: AO0yUKXzp2IRQxdWfCg3fZ2LNKueQZeB8IvMDuvhWCC85x31csnX7fn8
 VnPyK5ZrBPehf0Edk0s0dO9fyg==
X-Google-Smtp-Source: AK7set/XvzihDn8ert2Wu1sg7SpcpjeKEPQTF5qEswMoYVfn1WfGRhpc2/LmlNsZFdXveQp7yfNzuA==
X-Received: by 2002:a05:600c:450c:b0:3ed:1f98:670f with SMTP id
 t12-20020a05600c450c00b003ed1f98670fmr6373658wmo.20.1678970769666; 
 Thu, 16 Mar 2023 05:46:09 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b003ed61b8fcdfsm1234357wmb.17.2023.03.16.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:46:09 -0700 (PDT)
Message-ID: <e43d9dde-1eed-b8ae-6d37-b1ee1b65a569@linaro.org>
Date: Thu, 16 Mar 2023 13:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] igb: Save the entire Tx context descriptor
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20230316122847.11003-1-akihiko.odaki@daynix.com>
 <d60df663-51e0-67bf-0888-cfd78acec7d2@linaro.org>
 <693992ff-cc77-c697-35f3-6ad3a94427bf@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <693992ff-cc77-c697-35f3-6ad3a94427bf@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/3/23 13:40, Akihiko Odaki wrote:
> On 2023/03/16 21:36, Philippe Mathieu-Daudé wrote:
>> On 16/3/23 13:28, Akihiko Odaki wrote:
>>> The current implementation of igb uses only part of a advanced Tx
>>> context descriptor because it misses some features and sniffs the trait
>>> of the packet instead of respecting the packet type specified in the
>>> descriptor. However, we will certainly need the entire Tx context
>>> descriptor when we update igb to respect these ignored fields. Save the
>>> entire Tx context descriptor to prepare for such a change.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>> ---
>>>   hw/net/igb.c      |  6 ++++--
>>>   hw/net/igb_core.c | 17 ++++++++++-------
>>>   hw/net/igb_core.h |  3 +--
>>>   3 files changed, 15 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/net/igb.c b/hw/net/igb.c
>>> index 0792626322..50239a7cb1 100644
>>> --- a/hw/net/igb.c
>>> +++ b/hw/net/igb.c
>>> @@ -499,8 +499,10 @@ static const VMStateDescription igb_vmstate_tx = {
>>>       .version_id = 1,
>>
>> Don't we need to increment the vmstate version? See
>> https://qemu-project.gitlab.io/qemu/devel/migration.html#versions
> 
> This device is added only a week ago so it shouldn't need version bump. 
> That is also why I tagged this change "for 8.0".

Well it is cheaper than dealing with partially backported commits...
Also could be a better example for future developers IMHO. My 2 cents.

