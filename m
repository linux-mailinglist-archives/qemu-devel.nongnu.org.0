Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478B2DC2EF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:18:28 +0100 (CET)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYZN-00026W-L9
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYWL-0000hP-Fx
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:15:17 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYWJ-0003Ty-8w
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:15:17 -0500
Received: by mail-oi1-x22c.google.com with SMTP id d189so27821024oig.11
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QXN6MjN8Ea2iNpDuLmu/O57nxAWwa8JZF33A19pTEZQ=;
 b=N2NP7fe3W12zw5MSm/4M47qXaG4ChsJslBglVbVObvDEQrIajjb7oihQuxe1cgo8HM
 4qErdxWAeUqTrHwcPrpCpBhyq/Nmu3UfceRCrM7d7VxyxveL8z34BO5ABuU3KSkmU7Gs
 5J1Asp9VTjdJdDWhnGV+yL2olFhijOF/yKKZr/X9Uhgbl8cN4ezsbwRX+uGCbn2JQgWQ
 a84DjbemWgOzmm69B/uDmrtQ1wHf/ftFnQTOVGD/yL5VAnBR6nftn9hpW/aS/Tp6U3Nm
 EV1ilQBzKVw8/GNy9AhE3m+laWnYwLcy7o0fZ0MF4weq9K0R5PRAj6P6UfCKgaK+5Zso
 vMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXN6MjN8Ea2iNpDuLmu/O57nxAWwa8JZF33A19pTEZQ=;
 b=EGdojpxtbcAk7aEb3xtTlg+zrfs/EDkf7bSDbwmwcrRIQNTjq9UA9OvDvI0OOZodtn
 /p+BvAwx1dmL1ZFiprGPDsjYUwzRaNBxEZOKj5C1q+Zo7oQqaonFymJMSNIQ18EnfU5+
 EheAjMGYxaJ6MI7Wm0l0GFdg0VmeaTcSPzjxyqposzNoSNJ4u+EIagdK16l2lYnXWKVO
 Ms3HwdqMrUWt3mbVRIupfYcyj3t8EQvQQ3fcBM1VtQiJl2M7LeaSgp08IG/PGpFxfg9R
 uRc4ufBlx9b95PFjiXxALuIqknLXNFmaNUMEsgqZkIJfqBpzewX5+aW5v3hV3zp28v2G
 kEOg==
X-Gm-Message-State: AOAM530n4PxsGJoL30dd16QI4S7l4xXqd/jOJV/TBlG1zxvAgUBsiYqn
 yBMIlvyTWKARl+9OQ9rUc54OgA==
X-Google-Smtp-Source: ABdhPJxztdjWvQcqH3qDDgsYDRb/ksyUwGGrou8BbUiYcma0FswXdGtNsC2gRZ0kPjBTRK2OpShqNw==
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2264426oia.148.1608131714038; 
 Wed, 16 Dec 2020 07:15:14 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm578851oou.4.2020.12.16.07.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:15:13 -0800 (PST)
Subject: Re: [RFC v2 01/15] target/riscv: reformat @sh format encoding for
 B-extension
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8de8cf1-b888-79e1-93ba-7c157b012930@linaro.org>
Date: Wed, 16 Dec 2020 09:15:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

