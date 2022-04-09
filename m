Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF814FAA27
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:26:56 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFnT-00081Y-OW
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFmM-0006wq-BR
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:25:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFmK-0001JX-SX
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:25:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id 2so11503772pjw.2
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xp0Ly26bosN1lAJcogGYMHrrlju0hVVbjd4oFqwAeh4=;
 b=S4SSOQW4DI3am01qVtmTi1Z+kKAqFSm0vQyQotB9CpnvvAS4qESE1jKJTLumfvnqST
 Vne+DdHgbDYCByemSgiL33ncLrcWhfmrXTYlwHVOpEr9GNMAeSWeNvDSGH9iZoixCQvt
 WeC/cZI/u9MrcY9wqHY6rp90fVUhvH7U5exGtIOByu2l/knLbiBpuxOu5MiC9sCBiFVP
 jBVzYMR6uz9znCcFTeEXq4rTjB69TK7Dy4xZsHzK9k0EdOyvAmxxliocgcxVDfXNDAIZ
 hjit7xD19ToEH3YTrlGCRM7/ZXiolZqoXRV4SuldKzDdpQfgWlGiovsQNL9XNj13qpPK
 2zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xp0Ly26bosN1lAJcogGYMHrrlju0hVVbjd4oFqwAeh4=;
 b=LGPrVmVPUw5acKdCnPtTyg9dsxr28GvgPtV4lSs0p4P8DH0ci+b2lxwyazC5DHZb/P
 adzghw/YX7ch8j4ZuZjI6vG2kvfg5APPo7WCCkQGXn3Nm7kKVMGcziTdo31t+rw1K+d8
 vt6HyVwm+RYgdInibhGC07m/Qz2ibROSdQhscjMQ5h6jNUFChgEbGWnXby/NKR0KVWmF
 Wv4AGp+WmPHZptInkEZ4SkrzcsK50onqnZzfDNKws11fpl29TsQfxwMKDVdl3X28GbYc
 1HLuEEqOy8tOaOgFu5kebukBbMRqIARG6Znqf5QXeY/dJZFlCaSVHxyAwrmbMZ6U4azL
 EVPg==
X-Gm-Message-State: AOAM5330SD24kS30whnkWF1DmywxV2iPW4yR+i/M7ciqJ5CSjJzk2UlG
 w4jfkhhVEgHBUuhhtRxkoPd/lA==
X-Google-Smtp-Source: ABdhPJzAkGkIdr2ptG/q+MNzRemRKGfvCvJ1/07UgwLV3YznuHrefX/pDFI73nsEw2ETCfFfTGV32w==
X-Received: by 2002:a17:90b:38cf:b0:1c9:c3e3:817 with SMTP id
 nn15-20020a17090b38cf00b001c9c3e30817mr28522572pjb.73.1649528743460; 
 Sat, 09 Apr 2022 11:25:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 129-20020a621687000000b0050579d13b1csm6200209pfw.137.2022.04.09.11.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:25:43 -0700 (PDT)
Message-ID: <caa2d196-4ae6-63ed-fe40-11afc777f503@linaro.org>
Date: Sat, 9 Apr 2022 11:25:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> The VSYNC command forces the ITS to synchronize all outstanding ITS
> operations for the specified vPEID, so that subsequent writse to

writes.


r~

