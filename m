Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8C349471
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:46:11 +0100 (CET)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRFT-0006Z1-12
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRDd-000626-U5
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:44:19 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:42852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPRDb-0002DP-Sy
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 10:44:17 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so2131713ota.9
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UeEFkzKon8axZCg0Gd2znlx/26OmMaFaPTgPawK/AWY=;
 b=y683cLQZ8HePY0l6K8e4YjoD6A6ONZy5p09krJ9ec7WKnjilfOHbOM6LJCOknPOdok
 0wirgX+nZviapg1B6DloGCyOIL6APQ7EPJxJcecXyTrsHTBgScTWi/A2M2DZATl9iZBz
 cfaqw3CZNRGi8tf4q2pz15b0ChR3LObtT7CJEVCixMDCCPF33SQQFt8ZWOaaRhD+73XQ
 cTs7KnSKU0d10X/HyHBSL8zJrj7orXSDjl0xQy9AL+vC3xGB7maGHqaR70YQWamNSarv
 j18XN+TNjgiHJBb7So6IX2qkAlOhAaDaB/Lgu7xQIdn1ZHWXtJtE844BBXjvoadZNwGJ
 ZqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UeEFkzKon8axZCg0Gd2znlx/26OmMaFaPTgPawK/AWY=;
 b=jJttnJjBVOVrQ/1FqJs/ROaVO4o8mwDZDBDJCaY1DoS6BCY4pEtzCU4aa2aIue56lS
 BeG2XG1ROUI8E1wNQF3QpLCt7nm6X9y5hKW2OKdKFNh46GQsHYuhZHZOyb/7h9WIkPD/
 6c+4QGJFdjdRBCpXsGwBAtXf3hsPQ+BS4+uZMOUh+eqPCTW9IvCQw0g6qUwpKdkeaNz9
 UKPNrs5Cwgi8Nu5H9B1ddJw1FzJ4r1trTsgDimc0dtTZPEy7/ixXNMZYYAD0645nOw8Q
 QqfsxUGymYbZgRO2JJyobxlanK4IEGac5a1lZZOHDHdGTJuSXeuQ1i3qJdKN0ZbMuywZ
 JeFA==
X-Gm-Message-State: AOAM530q018H1kyBGQp/dGkGH00uW43r4i2EMv6+Qbsk6Rz+rHaREFJX
 59FL3u93SHfzY9tWIjII2AjrmQ==
X-Google-Smtp-Source: ABdhPJxieCFu8AanCdrjYUodPfiUQpOlE7e1L41NkM3sczXnNFZRH41HBFrX3JOXkgr2Bh4qoQP8rw==
X-Received: by 2002:a9d:7081:: with SMTP id l1mr7818189otj.358.1616683454675; 
 Thu, 25 Mar 2021 07:44:14 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 24sm1088810oiq.11.2021.03.25.07.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:44:14 -0700 (PDT)
Subject: Re: [PATCH 05/15] Hexagon (target/hexagon) change variables from int
 to bool when appropriate
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-6-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2de9075-576e-7c44-4495-733f22048525@linaro.org>
Date: Thu, 25 Mar 2021 08:44:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1616640610-17319-6-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:50 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu_bits.h  |  2 +-
>   target/hexagon/decode.c    | 80 +++++++++++++++++++++++-----------------------
>   target/hexagon/insn.h      | 21 ++++++------
>   target/hexagon/op_helper.c |  8 ++---
>   target/hexagon/translate.c |  6 ++--
>   target/hexagon/translate.h |  2 +-
>   6 files changed, 60 insertions(+), 59 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


