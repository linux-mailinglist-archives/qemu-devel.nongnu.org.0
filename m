Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5761356A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTb8-0004FR-54; Mon, 31 Oct 2022 08:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTb5-0004Ed-Nw
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:08:55 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTb4-0003Nn-0H
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:08:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id p16so1436165wmc.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DBjVtxZ+wHjdKuTsvI1g5CLD6lyRmqYU1lJ3qz9q0ig=;
 b=KGRqjA5DfR+ppG0HCNsbCgm1J04GM5xe61BM9jhJu95BgrjHSw1Q+JBHwos3XTTfPO
 e8yyCYJz7LISUlV1tFebUpH/QrqjTiaH/UcOIx8QksoxX8pY4DUmTz1sanx78EBvAi+C
 NVts0vuNwtX21qAF6GweMUGNqapFawHzer73z9pf+2W3UXQAHSAhZ61jK85cysJEEp8f
 8oOWnZBBG4ZBNqqzoVSMfw13AxfxcG9pLc3yblZe34XC893plkkcFkNIWtj/YtrY2bjb
 1YYXkuCkbaRtP6eBZppPiCMBk5mWlDeSrkShfEJfIW6jgIYhqdJDMuF5TYNln7Bh6CRz
 U2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DBjVtxZ+wHjdKuTsvI1g5CLD6lyRmqYU1lJ3qz9q0ig=;
 b=FmcXOOhRPQWtH73zh4h8GXXj7ntwpe8TRru3m1/nUqKtzyL+DHwgfofCTdBxseq2jj
 zCu88evl/0Il0/4ZZCTDATyAxvD9JrFb9lPHyPvJJLEj6k+cr3BG7UNfyY6n2K4BUmBd
 qvNyymyB5zCDy7dUoqX3sZwV57pnInulIz+R+vhsqImqQsVEppRJoYdAp8ZSm58gZwJz
 y3LYy5gUvKqxsMXQDpNpfpz3sNdQW0wvgeLAs1luUSZHaene+EBUPTUiXq5JQK3EG1Uw
 YopiB8xZZHb3D/SmSk4bY+u3xqPcCqAxHjiYPqKNAB4hBR503vGFMS6MTdISm728wy4n
 bwPQ==
X-Gm-Message-State: ACrzQf1IPtxyN64Dt2PA7RHxDeG9VdBZPhmLbjgf14lu5sE9nd+AmNuZ
 1mlm6LIPr/KDgexQ8lz8hcRIfw==
X-Google-Smtp-Source: AMsMyM4oTqIaT0NSE0CnIq2mDM8aUCG3SroRvxe1/L4YPDjTjP6r7+gNy3ZjMSEI6sLr58kc9SgjGA==
X-Received: by 2002:a05:600c:314f:b0:3c6:f3fa:cfec with SMTP id
 h15-20020a05600c314f00b003c6f3facfecmr17616682wmo.68.1667218132421; 
 Mon, 31 Oct 2022 05:08:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfed47000000b002366f9bd717sm8494423wro.45.2022.10.31.05.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 05:08:51 -0700 (PDT)
Message-ID: <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
Date: Mon, 31 Oct 2022 13:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/10/22 16:54, Peter Maydell wrote:
> On Tue, 4 Oct 2022 at 14:33, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>> The MSC is in the address map like most other stuff, and thus there is
>>> no restriction on whether it can be accessed by other things than CPUs
>>> (DMAing to it would be silly but is perfectly possible).
>>>
>>> The intent of the code is "pass this transaction through, but force
>>> it to be Secure/NonSecure regardless of what it was before". That
>>> should not involve a change of the requester type.
>>
>> Should we assert (or warn) when the requester_type is unspecified?
> 
> Not in the design of MemTxAttrs that's currently in git, no:
> in that design it's perfectly fine for something generating
> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> to meaning a bunch of things including "not secure").

In tz_mpc_handle_block():

static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs 
attrs)
{
     /* Handle a blocked transaction: raise IRQ, capture info, etc */
     if (!s->int_stat) {

         s->int_info1 = addr;
         s->int_info2 = 0;
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
                                   attrs.requester_id & 0xffff);
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
                                   ~attrs.secure);
         s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
                                   tz_mpc_cfg_ns(s, addr));


Should we check whether the requester is MTRT_CPU?


