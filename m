Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70337567EFA
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 08:54:49 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8yvw-0005WJ-3m
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 02:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8yry-0002yY-1L
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:50:42 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8yrv-0004Gx-8m
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 02:50:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so9057739pjn.0
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=J9t/Tc6X/ZaQmv08CLJyrJyOIpKVvozkxBe9TjvpDE8=;
 b=UY1fKVZS0HC3eWMhyEUygwn2GvapgkPFBTx3/WqlDBGXpM4i6dvMELR0zkEbkxUkN4
 ctijkMQedqMNgpVFktPVFt13K6Gdfj+LlaxDjVmMNebl6R3fu2LL9JxfiyTYPA1Dplss
 0NEgeLuxEdizWr2ZkagR6Zkk4MysY4BJTz4bG5O5RBUmM6umZzNxi4kk/oyH4C9qwtJa
 I6ZS8tFczVMrkICuneQfrvlYahAdQX+1kbS6TgcKA1w61fHeujJ5pEztfPUJwkqR/VgC
 vpX6Xys8it1Od+h88DbdEyRkyF++J5TY1Rtk0JLJpihmFs8wsrjwTc/zdFpt1PlMq9gC
 sk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J9t/Tc6X/ZaQmv08CLJyrJyOIpKVvozkxBe9TjvpDE8=;
 b=UUM80ot2jnFG7aeMlXw9jONx9PMOnspNisRd6WhXblJI/rfdLLhwM1u6H3XZXgy9HS
 /NojCXTZWeaqIkvrTEYR10vpOpJOhQkQ+St4AtuwZlVXjPF3tdsYMMHliexU1FWYIw98
 hBr5jujepYvOQgxPmvWRJFW+p2hEDx8PJE+Qn/0biheAt6Ji0qIM0HVUjiDl69HWTGQL
 Gla7kCZPuN4Be86Qk9hMVrhkOZSZCcPVxE3e5I0VSetbEn8zxFQxXOHALUErlr/pnEEI
 tShbYrgtDZAV5qd5Yu2rWxWsLEGNP6kKe+DV6qjqS59DFkiC3wTsRd8IresQsR+VLvv/
 q0mA==
X-Gm-Message-State: AJIora9JDU5zjdFYAoplIdEdl0VYiW1Z/NTpCugF0VgoYSVcaIEesNLQ
 pV7LjwWt6TXEY+3GRLBgQc15GQ==
X-Google-Smtp-Source: AGRyM1syI3T0ofLZPcWfS6E66gvesf6xh84xLoaC3M61oIM8ESqMvRnGYJ4zOtYScEKz6jecU+co5A==
X-Received: by 2002:a17:90b:3e86:b0:1ec:f7e8:e4e4 with SMTP id
 rj6-20020a17090b3e8600b001ecf7e8e4e4mr48901272pjb.218.1657090236829; 
 Tue, 05 Jul 2022 23:50:36 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a170902f70e00b0016be14a776asm6134070plo.286.2022.07.05.23.50.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 23:50:36 -0700 (PDT)
Message-ID: <5948bf34-f510-728b-b779-04abb0a74899@linaro.org>
Date: Wed, 6 Jul 2022 12:20:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/2] Net patches
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20220706034706.36620-1-jasowang@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220706034706.36620-1-jasowang@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/6/22 09:17, Jason Wang wrote:
> The following changes since commit 39e19f5f67d925c60278a6156fd1776d04495a93:
> 
>    Merge tag 'pull-xen-20220705' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-07-05 22:13:51 +0530)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to a495eba03c31c96d6a0817b13598ce2219326691:
> 
>    ebpf: replace deprecated bpf_program__set_socket_filter (2022-07-06 11:39:09 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Ding Hui (1):
>        e1000: set RX descriptor status in a separate operation
> 
> Haochen Tong (1):
>        ebpf: replace deprecated bpf_program__set_socket_filter

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
>   ebpf/ebpf_rss.c | 2 +-
>   hw/net/e1000.c  | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> 
> 


