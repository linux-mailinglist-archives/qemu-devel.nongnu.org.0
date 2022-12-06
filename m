Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4358B6449F9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 18:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2bRw-0001Oo-Dq; Tue, 06 Dec 2022 12:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2bRu-0001OX-Gw
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:09:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2bRs-0006xc-Uy
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 12:09:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id m19so11669589wms.5
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oO+Zeqz+k83QOPseG6xH7rEx8USj/QkvZCSDU7H+EWs=;
 b=UMKIZfHl47j6fjZGaFAaPMlRcHChZdxSzdc7DDjKby/Kaa9M5eBBZ7oUa68CX1f8D9
 0wrnbgvBTaxHkno8QpbqmFfWruML8NAO36ldQ4UoSuoGF6l38vkIrQQ9/WrmeCJsmQcq
 eTC2fvHF1uFWT9EkLZdZfIszoiy19DkibfzD394T4TRmVZ3FG0JWFW5NBuQc6xCsDfVK
 euSLgpcvnuteY3tEE68h+1B4YsIvFhF6vlRrJvxSzCN6F5oigUCnuocHXjHOnlwAKNkP
 t6qE6k72fLHCOLqPA1hKqbGepeAEaXEqcjEUyin/SBuIBV95V0P+V4YLiGcTXdz4l1XT
 K4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oO+Zeqz+k83QOPseG6xH7rEx8USj/QkvZCSDU7H+EWs=;
 b=JSNPE/Dv5FA7dX/spaN2Px1deWEGSkB7rEJFWvJOSdfy9qZ1wAPZZY4EX+oo+e0bQX
 EkC6Jf/rnDOEgZDhnya2vmeUre7fOkLu9ctNe9IUYVjKGVbaZSERcTj4VKb0LlSQbuDN
 6y70Wyfy7i5Vn2DUnFDyTgqb+JmecbIY5kXUy5mqvxdt7UAzpew1dVd+MCqQ9ueDcxYC
 ANKVB9xlvl0yRvHzDDIbPKF9sblb/5OXU4HfQiPkt06T/gMkrG/qQZZrhw6DcGKrvaFg
 Lk3bVCLxhzAIKO4L+ugNF944+LwvenMMu4U6pl1qYqv0fCPhXXQJiLovHCdK4OyGkihE
 bOkg==
X-Gm-Message-State: ANoB5pnxcTpN5BDL5zFlQNvB32c5JARXIj15SSzNaNurFvDK9l2md/EM
 ddN+/g+JPJ4+QjEKOUjTeV5vSA==
X-Google-Smtp-Source: AA0mqf4VMIBPviCUtZveDvjyf+Y8lLxZVKsABnkhXH8YK3KCZXDmgNX8k2WPsNWAjfKwxYr0f0RqMQ==
X-Received: by 2002:a05:600c:a15:b0:3cf:7126:1fd0 with SMTP id
 z21-20020a05600c0a1500b003cf71261fd0mr60730246wmp.14.1670346579309; 
 Tue, 06 Dec 2022 09:09:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm25362646wms.44.2022.12.06.09.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 09:09:38 -0800 (PST)
Message-ID: <3cee55bd-9ab6-ffaa-9abc-877f60f8f036@linaro.org>
Date: Tue, 6 Dec 2022 18:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 02/11] exec: Restrict hwaddr.h to sysemu/
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
 <20210517111111.1068153-3-f4bug@amsat.org>
 <5d1a9740-df5c-fa6e-8c67-1dcd7174df66@suse.de>
 <34f8c636-6963-8974-39e7-497167c5119a@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <34f8c636-6963-8974-39e7-497167c5119a@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 6/12/22 16:38, Claudio Fontana wrote:
> On 12/6/22 15:53, Claudio Fontana wrote:
>> On 5/17/21 13:11, Philippe Mathieu-Daudé wrote:
>>> Guard declarations within hwaddr.h against inclusion
>>> from user-mode emulation.
>>>
>>> To make it clearer this header is sysemu specific,
>>> move it to the sysemu/ directory.
>>
>> Hi Philippe,
>>
>> do we need include/exec/sysemu/... .h
>>
>> as opposed to just use the existing
>>
>> include/sysemu/
>>
>> ?
> 
> ...and I would if anything go include/sysemu/exec/ not include/exec/sysemu ,
> 
> to highlight first that it is part of the sysemu build, when trying to reason about what gets built for sysemu vs anything else.

While refreshing this series I moved these files directly in 
include/sysemu/. Do you think the exec/ subdirectory {help|meaning}ful?

