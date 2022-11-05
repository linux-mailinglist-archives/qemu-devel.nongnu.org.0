Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DDB61DC51
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMlT-0005qk-AJ; Sat, 05 Nov 2022 13:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMlQ-0005px-9t
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMlO-0007F4-GX
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:15:23 -0400
Received: by mail-wr1-x433.google.com with SMTP id bk15so10836986wrb.13
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nSmb/VmjDRAl3Yci7BZQR8dDWf4lkxjHGYWLcl2VVcg=;
 b=rpzDO+RhyssPe+p+Pn/Jtn6xcE1vF69cqCXgk6Avxk++OPTTg1kP+Wad9WJLlm8zut
 sNCnKJEsmUelCYvG7mdNqDbpaJY1C7AS4bzGQ0FHE2tOmVL9CbvdvErfPIr/C8OkEz+1
 bdHbxExSCrQ+l6NLtOjJB4Zu8wl6zVkVNJoP02/2ln+BO8Kbi7q2E4v4arP4qYPmara0
 o1+R5P7mCqsdkLKJKb67KmM8CCM/n+MSWsBcf5OxbfZdqJTgTQuwLkh5mAeOv9T/fbH8
 lh3NVYZxxUSBqTwv3BGJhxbyhArebLbTGEfYoQ/Ph4FtM5KSsm7vYiuO+WPjtG1bwY8J
 5Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSmb/VmjDRAl3Yci7BZQR8dDWf4lkxjHGYWLcl2VVcg=;
 b=c6HuM+2tN3QoAky9YaVtHE09uUDsH+WQymVhzheIUnsfxXGapBgcxpzTM3ZP7U46wD
 lhESOvli4txqIu4dv1w/VUUabpM9MMDEf+I2dONM5Tt13sqg/+RRA74Tzlb6ZzbIPa0b
 Ov56Oy3souz6sThTq3iKjWD7x8JfPejaSDInu/jP4rKL1N590veb+5j40dItWsZzxWoO
 7nK8Nvfayg2WathEq8k2b40JUsqlJnzT1yUYPKvEd7G6nZFJeesVs1GhtJdhP2Q5Su94
 9CTnaCd9ExDYPSfflK4b9bxlnptt6GSMZTEcWB8zwSgsbrmp9uS9DZmFFRNGd19BAxVg
 S+cA==
X-Gm-Message-State: ACrzQf3Z6GsI5jf4uJe5E0qM3AgIFq3+Mj+PMezCDfPoWtCtOmW7z8C7
 xzZlzzsvyoqNPbklcM2TMThT9Q==
X-Google-Smtp-Source: AMsMyM5jWg7lOrQj+GU7tdjC/QinDixKsKReXg4fx3kHtMAmXH08ttLW/SHnySbSfguN980eWQsuWA==
X-Received: by 2002:a05:6000:887:b0:21e:24a0:f302 with SMTP id
 ca7-20020a056000088700b0021e24a0f302mr25325311wrb.466.1667668521089; 
 Sat, 05 Nov 2022 10:15:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bp4-20020a5d5a84000000b0023677081f3asm2605422wrb.42.2022.11.05.10.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:15:20 -0700 (PDT)
Message-ID: <1fba9ffd-1019-da85-68e4-36e2d35d8538@linaro.org>
Date: Sat, 5 Nov 2022 18:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 13/30] qapi dump: Elide redundant has_FOO in generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 4/11/22 17:06, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/dump.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   dump/dump.c            | 4 ++--
>   scripts/qapi/schema.py | 1 -
>   2 files changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


