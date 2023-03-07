Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FAA6AE35F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYhw-000679-Ik; Tue, 07 Mar 2023 09:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYhu-00066l-H5
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:54:26 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZYhr-0003kx-UY
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:54:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso7353910wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678200862;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zdxSf6SnonAAwLmy54FpkIbxFn6Qi3VVeANxs4vZxrg=;
 b=bibefQLATF40wYnR5zViShOZ89NAvBfsEeNNinDWOv5sbqm//7xkftpPqmOYl5jh/3
 q2r0COCaVa6QuJ/q3xNydDdH3MYKZlRpobyfxVBdZuZgRECwq/4XDVghXE9glnLo2L+l
 Pe4Lr5sAbI6XGtbP/HGuKYVoxhcG94Z6ei3LXeEG+CtqyPe28dmoJ7oBvZD1hOpqUjJ8
 Tx6Fj660MUZVLfF/eJ/WTgh0JmdRUl87WwduKkXLwbagPAEmcDwVJWEu5IRw4wWp2rjX
 5ZxIHk6zJwBTW36hiHXdiuf8tifDQhYoN/4aIKJID2iSF7o92pc1hOPhNjxmpRwlTBz/
 +QnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200862;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdxSf6SnonAAwLmy54FpkIbxFn6Qi3VVeANxs4vZxrg=;
 b=rhYLN0SeY5U9xbWI50sLp59nxUV5tzN7IkWUQNZ8+6euIvJ/1AsHhNbWHFp21SOFvp
 I6xCsWrV3au8VIyI3Lf8muGwTUezkpt2eIQdnpGXAvj5miyBLRnSq5kCkvkLj/K7ragm
 kdmVEUeP3nyHvB0Q0PLP21obDyC4ZXsEImwJmAT0WbCz1hfv/k2ulAcpfNecJRl8mycS
 QKHAYN5O12Ab+Tp1DEAIiW4TwC2AFYdqH4ZoOlIcndypsTOhpjF5dwipkeh6Ey0kM+B/
 1zKRoXjUsKL27hJg6zC4n5uVWToXT8vUOYady+/okKsVkq3Sh55M5ORQ4+B42huNVw3x
 9XCA==
X-Gm-Message-State: AO0yUKUiYEBXOZZzDUHE4ALkun/nJ04yOnJt4gnZ2ZzUKDCA/bdd5N8w
 x52/RYRcqKBBHsZbFZc/5MI=
X-Google-Smtp-Source: AK7set8iCKTQBnGbDNjKai95sv5yqanRu3s4h7W0GOaj7zxXgfCOXEduXIziA7ZdHqZF4BIIyAlBCw==
X-Received: by 2002:a05:600c:4751:b0:3eb:2e66:8 with SMTP id
 w17-20020a05600c475100b003eb2e660008mr13423737wmo.35.1678200862386; 
 Tue, 07 Mar 2023 06:54:22 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b003e4326a6d53sm18436678wmq.35.2023.03.07.06.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:54:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <f121c025-2203-70b7-c20d-aed40b88faa4@xen.org>
Date: Tue, 7 Mar 2023 14:54:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 12/25] hw/xen: Add foreignmem operations to allow
 redirection to internal emulation
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-13-dwmw2@infradead.org>
 <470e51bf-5159-fd32-93b5-03f5bdf5f050@xen.org>
 <bac842b0b1ea81e5aee922f3864bf57b99c515d4.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <bac842b0b1ea81e5aee922f3864bf57b99c515d4.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 14:48, David Woodhouse wrote:
> On Tue, 2023-03-07 at 14:40 +0000, Paul Durrant wrote:
>>
>>> -
>>> -#define xenforeignmemory_unmap(h, p, s) munmap(p, s * XC_PAGE_SIZE)
>>> -
>>
>> Actually, probably best 'static inline' that, or at least put brackets
>> round the 'p' and 's' for safety.
>>
> That's the one we're *removing* :)
> 

D'oh... so we are :-)

>> With either one of those options chosen...
>>
>> Reviewed-by: Paul Durrant <paul@xen.org>
> 
> Taking that anyway.


