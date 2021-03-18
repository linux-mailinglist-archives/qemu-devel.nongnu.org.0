Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F0340F79
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 22:00:45 +0100 (CET)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMzl7-0000Vy-2p
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 17:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMziy-0007tp-Kc; Thu, 18 Mar 2021 16:58:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzix-00089V-9y; Thu, 18 Mar 2021 16:58:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id p19so4370389wmq.1;
 Thu, 18 Mar 2021 13:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yv73SJW+hxtxAgQp0SVlbsnmDsxtX7rIwZHe6KoYWME=;
 b=ktbqVY8SeOj8VvXgevBQug5E/TI3dWNKboDxMUxELprT5PWX86GFD/d6nAuVuQKWvL
 RCOVEgT7IUWWnPgWabobcv5HTDI8oLJQFYkOL5t0aF0dACrSEBMH6ZKBxYGIgwDzyTj5
 OmMtsSXiMgU2TgIMH1dYgD+FHyUprB5MSOx4j/EtZHRHZxP26WcOxzEcr2FeUlvA1PWU
 RkkbsOBpNaqNtEJYwr3IRJ79JyEQcQqGs/my6Rr/kF8MEoZrkCztm0I3kIK5vLUoigFg
 qGKHLPH7q8moQgakYmKozJay/rl5ooebxJNsiJV+Xi6n+3iA7rejaFiig8uKHBlx7hwY
 ACBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yv73SJW+hxtxAgQp0SVlbsnmDsxtX7rIwZHe6KoYWME=;
 b=YbfRx6nodz0iV8sgKSW2grBwYwwE6qdSp6I9EhiDBPemAgLGNrED3PBwLF1tV+kmeW
 VMQow8sJygZi+6UFUN212lLBHZNEyEaRXC/qFtx8U3buAeSlcAdiiDAf5DRGxyLlPw+7
 VVt7HqR3e0Kt5KqfIFqfECGX/HQ69+hbglHjo7JECpmfnf7nb795C7WRNpYBWU11vNhH
 V/FPTDGYG9fm4cn0fM8gzAv1zX+1IOqf9sDBBD8NkKI8RvPaZM9AQN+U3DzR6o7WvorZ
 cokC91Geqn5122As/pRy6RGgsvhbiwAFc+7Zdv5yo0Q2PjVrt0kLYjUN74EXA2qGsz00
 4c+g==
X-Gm-Message-State: AOAM530HN7KyViuHAP+1S7ppbJ7TqBfvwT1n5LCj5wCJYAdqebx56KIC
 xx4+5zGk+8R5JlqxzV0/F6U=
X-Google-Smtp-Source: ABdhPJw8RceSA6vK3iagki9QdkQKi9I/mkwlRhKL9M8ZNWEVExSKylThnKSdNYCMTXs61MFNucYNwg==
X-Received: by 2002:a1c:b48a:: with SMTP id d132mr846405wmf.108.1616101109268; 
 Thu, 18 Mar 2021 13:58:29 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id t23sm4596080wra.50.2021.03.18.13.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 13:58:28 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 2/5] memory: Document flatview_for_each_range()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3c91ac00-3195-e42a-7c6d-7d5a579fe88c@amsat.org>
Date: Thu, 18 Mar 2021 21:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 6:48 PM, Peter Maydell wrote:
> Add a documentation comment describing flatview_for_each_range().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


