Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955125C9EF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 22:05:16 +0200 (CEST)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDvTv-0001aM-1y
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 16:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDvSr-00018Z-KE
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 16:04:09 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:32902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDvSp-0005yE-MA
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 16:04:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id m6so4553073wrn.0
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 13:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VxzcOFwvfxWFMxA2FklTQ1ssgqomY69A9vmyuWDxiOI=;
 b=sjOgHuv+SydbN0POXx4zokYkQ9j8ZO+BmrVQ5bWmLkjpTvwlEV/mmp5mj7uJVqSgh8
 4hWGKnugvwcTNb2TjXW9PwEB7Xp5oHYLlCfKLLBfhtuJJ0WLZ7EH8J87VeTbd1h3Tz0p
 Rr/7fafssXFOAKk8N9sQfgh2Egz8DDQFa2OnronJQZmHylgXMBSHH7kSFH5jiB0MbzR3
 2/n5kUOcek8pkjJnvcUK5HCeATKoSivbdfUkInu5ifdWXjtyrw7KXyIA9eu0zoYg5v83
 jwv9oRpB153ayZvJSYmw6v7Y7htKBE9ngRUUYOBpe1ADpmMCSRpV4HbG5z+3rqnzPfUz
 kahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VxzcOFwvfxWFMxA2FklTQ1ssgqomY69A9vmyuWDxiOI=;
 b=bWL3UGfQfhfo0lQepyrEgKhu9uihi8kx9mDEV/YdFvSHzY3faxhDAOcjYXnSWQtv8k
 xY89YdJyq81KlTY8/Q39XdCPr5SvUqTwPALVCZxqfGJ2MdFeTQMd4vO38Fd9ZWZw+nZT
 XM8/36oCVzxZU7202kBTYgutoPr6vsqDmbYqwDO/WT/rL6B9z3LAZlac9h1d9js65Mma
 b1LVDmCWYYpvz7WQ+V9HF3heJF1IUMePVZdjBBcHiqEj4bVF8/VLYHIEGNV7FbgijE8n
 7Ck7CvyFBhGrNOlYyw+eXc80i7sjUa4pv9ClISfcPMk319lJjCXqjEfhXVbC/ZbRHRgm
 /xCA==
X-Gm-Message-State: AOAM53032FIWSTEXpAAFm8yRyISdEaMyhR6vcw99foryb66E60BVxzYm
 mkcz7+GVbJvB+Q88uS6iZ0A=
X-Google-Smtp-Source: ABdhPJzcu8UFS2tZ6/c0TNfXNkdoJ/832VNkUuFXqjsa6ZYZfeTFRSiRtiOu0S7zqCnwIxBDt8csPw==
X-Received: by 2002:adf:f189:: with SMTP id h9mr4153527wro.122.1599163446011; 
 Thu, 03 Sep 2020 13:04:06 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id v3sm6125863wmh.6.2020.09.03.13.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 13:04:05 -0700 (PDT)
Subject: Re: [PATCH] decodetree: Improve identifier matching
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200903192334.1603773-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9ce75e9-187c-1a39-6bc6-58f2bae3512f@amsat.org>
Date: Thu, 3 Sep 2020 22:04:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903192334.1603773-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-2.403,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/20 9:23 PM, Richard Henderson wrote:
> Only argument set members have to be C identifiers, everything
> else gets prefixed during conversion to C.  Some places just
> checked the leading character, and some places matched a leading
> character plus a C identifier.
> 
> Convert everything to match full identifiers, including the
> [&%@&] prefix, and drop the full C identifier requirement.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  tests/decode/succ_ident1.decode |  7 +++++
>  scripts/decodetree.py           | 46 +++++++++++++++++++++------------
>  2 files changed, 37 insertions(+), 16 deletions(-)
>  create mode 100644 tests/decode/succ_ident1.decode

