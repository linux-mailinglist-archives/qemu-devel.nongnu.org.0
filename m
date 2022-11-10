Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3C5623F11
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 10:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4BT-0000qr-6L; Thu, 10 Nov 2022 04:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4BI-0000pL-Cq
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:49:10 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ot4BG-000765-4A
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 04:49:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y16so1408551wrt.12
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jje1C4K/zXKN5iJL9lZsRcgf7RKyxPFh6FBeR3r8PA=;
 b=FaX7bCAJlcw2KpOPOI68qh1q6yMtM+yDOJFnz/QWCKwkuMzW1FnUJTQq9NUJGUZtRV
 Pz2YGkQoKaoQ421If2OSgNO6P8QV3J+TpOCE2B0vrSZplIWj367T0t9SRLDJXw887Y1Y
 Sr1cw1wm6zhXjNrynDuRJDa7gEgchZ7kopAfGUFvkpjcU9xM0zIrMJ2IFz/UaRcT9IsD
 k137pRvAXDH0aQ8oIwN1gObaK3RbUP99PwHRuhVVQl9LSQlzaG0h0tDTua7Zns769Ayg
 CnK2hqqUGGiR3eEKjgiYrm5Odi6KEP6UCxPGn8djodkf7j/fUKQDX9yhLhQuDpMcykH7
 Do/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2jje1C4K/zXKN5iJL9lZsRcgf7RKyxPFh6FBeR3r8PA=;
 b=LBy2TKmx5iNFEzV0ieDAm0sjkEDbEK7KQtdqIACBR7cbMRkVdzkX9IKL5HNpp6mo6y
 pIwP2Inw7r3whBDeoH/crPtmXE1ezlrvmJnlD1HNjqWZXfb0p47+SfNUqD8hSiXYnhhR
 MBtqDJDZAubHxKe7M+cXyY5C/n6A/cC69yYhq7udWEZ8DPBqbEhNVHFeI1yGqI/7jNiT
 WLKKSxN2v86LdcyPQ1Oqj1E0Qf4idk+s0Ro4sdGUJC8MzvJ5vyvXG2Hj/UPOp0cVSFzV
 week5t+JhGSK1D9XcBhX48xUwfccgP/CJghZf/jRCU12p3/pIc8AXamTXWW7VUyeqatd
 Euxw==
X-Gm-Message-State: ACrzQf34zOWKvdJiq7MUeKiRJfqdm1+xWe7cehaA3LWkkl6N81V0pzzf
 KBTWNOKD65rB2Q51I+fXTsvlow==
X-Google-Smtp-Source: AMsMyM6/lGrjsf5QY12TZazxogbGhxULNpW7V1QO+W2kymSpfFFcG3xLAcng58KiN9pKmLhdqxgewA==
X-Received: by 2002:adf:eb04:0:b0:236:dd5e:e3a2 with SMTP id
 s4-20020adfeb04000000b00236dd5ee3a2mr33673835wrn.94.1668073743946; 
 Thu, 10 Nov 2022 01:49:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a5d484b000000b002383fc96509sm15549409wrs.47.2022.11.10.01.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 01:49:03 -0800 (PST)
Message-ID: <208d1191-6852-c74c-2a06-d65a6a657f4d@linaro.org>
Date: Thu, 10 Nov 2022 10:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221109173750.201615-1-thuth@redhat.com>
 <b81930e5-9df7-a80a-5db4-09290a3b71f3@linaro.org>
 <87wn83jr54.fsf@pond.sub.org>
 <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cee224a9-b107-9bf1-66d5-b631d5a88345@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/11/22 09:35, Thomas Huth wrote:
> On 10/11/2022 06.49, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> On 9/11/22 18:37, Thomas Huth wrote:
>>>> If configuring with "--disable-system --disable-user 
>>>> --enable-guest-agent"
>>>> the linking currently fails with:
>>>>
>>>> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
>>>> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined 
>>>> reference to `qmp_command_name'

>>>> Let's make sure that we also compile and link the required files if
>>>> the system emulators have not been enabled.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> I wonder for how long this has been broken.
>>
>> Should we add such a configuration to CI?
> 
> Some month ago, I'd say: Sure! ... but considering that gitlab now 
> limits the available CI minutes and that apparently nobody really cares 
> about this configuration (otherwise someone would have complained about 
> this earlier), I think it's not that important to have a separate CI 
> test for this configuration.

We could eventually add a job restricted to qemu-project CI (not in
forks).

