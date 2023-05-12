Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89FA6FFF3F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 05:25:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxJP9-0001ZB-Qa; Thu, 11 May 2023 23:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJP7-0001Yw-CZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:25:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxJP5-0005Be-8i
 for qemu-devel@nongnu.org; Thu, 11 May 2023 23:25:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-30644c18072so6299275f8f.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 20:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683861909; x=1686453909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QRvAxaik4RZZnOAIdBo0G7KIfq+uDjkkRb8Z763Jb6A=;
 b=Dc43lHcLUj85llYqQud+FslcPLQWtpmYoG9bHh/7h2bb2uofJoqzIgZTzxV/0zaQPT
 zd9HF0XFUm1CIgjycuoG1h/zDpg+FcX89zB7NP5M2uCalz9X5b1MmTJXziXOvun3Kboq
 xuhu9+xYsI6L908a+LAdMjjzBiL0lhqEzrar9k43ySsTsSIpaupgvMenLKJjD6YIlQ7k
 dFtWkJPk9KInKChS3yrRYTS1iKc2nSC5EmqS+ULHG3PdMxzENgQ0e6kvbdrhEHHrC0a7
 ddnUNbbhGcmKwnQAdqf5hjqZj+4x69Txx1LYCb30HeZ153919Xjf3vWrrgj+3s8kXpcs
 WYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683861909; x=1686453909;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QRvAxaik4RZZnOAIdBo0G7KIfq+uDjkkRb8Z763Jb6A=;
 b=O/PeNO1PKr+SebhM10hxQb4eoRjiKsYPp1ntOCjz7eiUXMvVlFvcdlj7wgZ+KWZrZ8
 jzvfERBBi9Thf6OQLhErHRrxLz7DnfUKtjYdLaKShKi6dqyXRRz6Q8MK+rfOnzFh8WQS
 HikVUJbf+5gonzQHVc6pTna7MMgxz14Ao6Oxo8oc0eUNUTleG99kVcFSOCzLLYXCRZ12
 b2NJHwkHIkO1X499X9gqDJQSuasyQFTnWRgimPlsWn2QjSJOI93s32DKZmgeiWp/huy0
 qfZKtfPVa13hfpw+oe09bKtRmxuVX0f4shWzLIwo+j9ZzaDKvnJXSHRCnz8Edeef8p78
 G7FA==
X-Gm-Message-State: AC+VfDxCX0MGj6NDQ5OCgOdFGYYVZaqqnnQIKDD9OL8m37Rj1aGG4uGL
 dmjmGNHuz1cUnFkMj9FpE634Pg==
X-Google-Smtp-Source: ACHHUZ5tDP0CBBqwGA5U1ZPRc9X4vsdtqY5u98H4eghD9O2Uz+IFarrVulfwRkYR3y5ctb2bieELaQ==
X-Received: by 2002:a05:6000:c:b0:306:32fa:6737 with SMTP id
 h12-20020a056000000c00b0030632fa6737mr16062358wrx.8.1683861909666; 
 Thu, 11 May 2023 20:25:09 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 q5-20020adfea05000000b00307acec258esm7245437wrm.3.2023.05.11.20.25.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 20:25:09 -0700 (PDT)
Message-ID: <81ce7b34-99ff-0d50-8b15-177d0d7aae1a@linaro.org>
Date: Fri, 12 May 2023 05:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 12/19] cutils: Allow NULL str in qemu_strtosz
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: hreitz@redhat.com, armbru@redhat.com, richard.henderson@linaro.org
References: <20230512021033.1378730-1-eblake@redhat.com>
 <20230512021033.1378730-13-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512021033.1378730-13-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/5/23 04:10, Eric Blake wrote:
> All the other qemu_strto* and parse_uint allow a NULL str.  Having
> qemu_strtosz crash on qemu_strtosz(NULL, NULL, &value) is an easy fix
> that adds some consistency between our string parsers.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/unit/test-cutils.c | 3 +++
>   util/cutils.c            | 2 +-
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


