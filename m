Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E6C64A6C5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 19:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4nM0-0003Mt-7I; Mon, 12 Dec 2022 13:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLl-0003Jy-B8
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:16:27 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4nLj-0001pv-D0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 13:16:25 -0500
Received: by mail-ed1-x52a.google.com with SMTP id m19so14122864edj.8
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 10:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9p4byX3++Cf1+SpIqTXhJwc7DzO6pMq7djF+WL4kjM=;
 b=VR4oSxyjLKvIY3Bwbi3Y9aDHszImGj/Kno9Hdc7IqvfVm/pcmq+Wvyxx/A8kFmZMD1
 ejGb0S1asTZGFgcPydnQBFryVZBe5iORXghpu1ztuSSkE+mj32L6G7Xi4G0H5NXqLIbj
 Qyk3y1FgHa0nI6R46mHzXJ84ZNNhzXXr8uDfzdeoBaQEVtufzhhDwfViudYdyRqjbsFW
 6dlTm/NaEUE1nDgyLS9SgVLGM6r+KemIN5EN77JbXB2UAe133pWZ3bb1H0EXknxxYSIk
 uVFp53V52k+9bcEHSkYEJDyDNqGl1vwsoyFZhJZPj2YFvkIXetnrWJ0ooh9AVLxpRfiI
 HrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9p4byX3++Cf1+SpIqTXhJwc7DzO6pMq7djF+WL4kjM=;
 b=aAxUQAakNvPQx51Vu1J2Vl6iar4EmBZ2AmVa9fQApzQwNGck0jLwCBT86TN83ubh15
 ZSjP89Mo7jCaVl+ZIonpCeKGhhPtWJ3x3kUe2xpRouBcD5nhhbCm2/ayb3mYA6NcOmJj
 73XKS8CunmtC3mV4JqMp5R1oEFkkTUOWYeYfb5AWLYHtKZSFwrOxE5B/TWXSUYom54fM
 Md7xcvT3YaS32KfAnKEyxIvwc3zwu4ep769I9htiNKXyUo+cUfQ0p5rTxdNsiIDFvMpD
 CEV1oJNCrnSMfhRvVOoNRLyJEZ5O2HmWsrZ81lLcCXy3fz9MAiQUuhALDkXNBouR5BVV
 Uk3Q==
X-Gm-Message-State: ANoB5pkxnYvaxPkKIV5NodT2//7AB8QSMH/3ZaKlvruE8rYI3NCQJHwR
 befw+pm765iGGzMQBESdgDps2zoWeWDflWe4+nc=
X-Google-Smtp-Source: AA0mqf5tpX28pub+IQKWYrk9VQb5wkAjCtab0FoLo8I+MeN3F75rjD17UlCOMynPhQ7zA5bfrULucQ==
X-Received: by 2002:a05:6402:d46:b0:46a:d5ee:7664 with SMTP id
 ec6-20020a0564020d4600b0046ad5ee7664mr14034723edb.6.1670868977587; 
 Mon, 12 Dec 2022 10:16:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ky4-20020a170907778400b007c0ac4e6b6esm3620961ejc.143.2022.12.12.10.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 10:16:17 -0800 (PST)
Message-ID: <c698d37d-6890-82f8-dcf2-d1892f210e17@linaro.org>
Date: Mon, 12 Dec 2022 19:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] MAINTAINERS: Add MIPS-related docs and configs to the
 MIPS architecture section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221212171252.194864-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212171252.194864-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 18:12, Thomas Huth wrote:
> docs/system/target-mips.rst and configs/targets/mips* are not covered
> in our MAINTAINERS file yet, so let's add them now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


