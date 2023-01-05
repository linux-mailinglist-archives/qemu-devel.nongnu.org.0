Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD4E65F6F4
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYZd-0008Vj-SW; Thu, 05 Jan 2023 17:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYZb-0008V0-I3
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:18:55 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYZZ-0003i8-Nr
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:18:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d4so29512481wrw.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=84171z9O0Y8+A01wJGmWuBdBlu/6eWqKuFC6e1F5aNg=;
 b=wBfoeQlTLUcKHmX/kmluVtCCBKvBF+byqC+7YSU8/XC4D0mMU9M6WjIdaUN3aNE9BE
 SLFPVb+HT9QiWCNQgZyfnclZpEWkBcosNPseFbPtLYTSw6qXU21lExBVfS53U1xu/xqd
 uULEWFdO0tOJ/PNvpAznG5zbJBaWKrWYyXsbvOBvPhBTnJ4Wk7dLE4HkFhjBQZuT9GVb
 mwDSKtEYEY57fNr4j8cyOPoFRb6t3kUlWQbe8Iu8QRLPvXlzN1uNGebXuwgC4QSciI6B
 yR8Qls0QCDnKawHJ+nxDnR2XCGYd9O/yjCXWya0Wb6sRZLCmlKuUQih0bm9W42uCq4LH
 188Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=84171z9O0Y8+A01wJGmWuBdBlu/6eWqKuFC6e1F5aNg=;
 b=njgdl1Nl2FZOjiKu9ODXzKyPqtwY1MSOKyoRCDYiUUwqLFXt7wyXVElO0uhgFlH+9O
 DS/YwILZBSleY4/JA04jS1sLWvZos2bzXl4+5yxls2eW8mQ9+QpEi4CzQkPtBvS/tth3
 N6z/F9YUzNZ0HJZnZ3YwQBvLW1jazm42Giq9ZFswR18tfBIbFmYdlaVRp1XNGWvcbrPt
 Oi149BIQhjhd2EE3pfGUyUmi3BSkPhGepQlEYMnA1nAI6/RAUjxdxd9ksZr0wVbBxQlj
 hClx7R3x1PWktNW82FhJsE9eZGjtR83/nPefJ4fzxV1gqTeDgX9JGK2Z5JgyRljMM/tB
 4zwg==
X-Gm-Message-State: AFqh2kpMvN6Rvoz5EArxp9rzLOpMw0nDBBSe2CYWVW1b7145zpK22/FY
 S4rLXIgBepdulUK1OamhxXhw4w==
X-Google-Smtp-Source: AMrXdXsItgcnP9+9bRoKrgJI41ssX77/4f/ZuRFuDklDuuXZW6/IfBB4z/LglX5cZh1cHAx2zsK1wA==
X-Received: by 2002:adf:eb08:0:b0:242:e73:f636 with SMTP id
 s8-20020adfeb08000000b002420e73f636mr43147442wrn.4.1672957131801; 
 Thu, 05 Jan 2023 14:18:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0023c8026841csm37369637wrx.23.2023.01.05.14.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:18:51 -0800 (PST)
Message-ID: <8e0c3bb3-2312-7abd-1962-58b7783e5ee8@linaro.org>
Date: Thu, 5 Jan 2023 23:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 32/40] target/arm: Move "midr" to class property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> With the movement of the property, we can remove the field
> from the cpu entirely, using only the class.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h      |  1 -
>   hw/arm/xilinx_zynq.c  |  9 ++++++---
>   hw/intc/armv7m_nvic.c |  2 +-
>   target/arm/cpu.c      | 18 ++++++++++++++++--
>   target/arm/helper.c   | 14 ++++++++------
>   5 files changed, 31 insertions(+), 13 deletions(-)

Lovely.

Perhaps later arm_class_prop_uint64_ofs() can grow into a generic
QOM TYPE macro.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


