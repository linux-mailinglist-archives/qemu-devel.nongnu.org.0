Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EA6BC774
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:40:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciDi-0002Ul-4p; Thu, 16 Mar 2023 03:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciDf-0002UR-RF
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:40:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciDe-0000Ov-BX
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:40:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t15so617191wrz.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678952412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yPpM3b6bQdra+j80d2dqrmIzRiNnB68bsBVegjrqSUM=;
 b=CLQwiBIpAvlcukhtV9Ce+0ic1FpThmRCoBb6+kHEo9wJZYlQLwrZ72hGdal2LDaHlG
 EGisZjNKc8HJVDJp4KkYEkh1KKJF1/grTdxn2SZvqBl9u1U6pdNIhKxw6hPxos//YXby
 cslEQz8FbW7OyVxt0rZk4Sf1gQcyi1YRdWficWzohsfU53ladPtgQOBL+eXZiqOHQ+bf
 1ss8ubedmcaYWtZdmYiTa4k56yTX8yjvK78nZtviNq/LymAPQrSTRVE6a1DuPzbs97k0
 GC4X8E5V4CwUmCHE20A4zAOBlMUAzjER+cSjtM8xjfqXDg0J0ffEO6hqlaRLWPwW/MVo
 Y7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952412;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yPpM3b6bQdra+j80d2dqrmIzRiNnB68bsBVegjrqSUM=;
 b=dm/CVTeVeneRw5ssW55EFLQwUzMXNB7o3+vA1Iw/RZJ5apGhUB1QIrS6Pc11PQ25UW
 OTfI+XKFpzb2/TA135+AiIF5VDnTj9DCwEd4kY8mLrDA8curjRZ/Jwz6LCFcYSJXe/zA
 0HmkuQCUAqeMUnr82VRWdw31bj2BHDN1DmrWgLVYMHp3faYWc2zufVT6VsPOIsHdRq7U
 SyEaaNFdrKhhu5zYxdyzTbGrOvjVjAxxcNGwibSO6gdT/mzBFlx2VGSb8BrZBjcqaFP9
 UfJCZZizoKIL3tG0aEiXkMnZkNf2NP5M6k9KBGqhWmcytq8rix4sQpRJvgkUOe8cvWQR
 7B3A==
X-Gm-Message-State: AO0yUKXRXFHV0qBDjEtiDlLw/sFMcGHDe1GDIzox1AsxWBXgR0g3+2kd
 diJHGlFDli/ilgL+Y69XlH+kBA==
X-Google-Smtp-Source: AK7set/9+zVPbNJ24ODVpzjxf2WU1J2ZuhhBbubGKW4Slv345jMm74PQ4/DZ3t4BVmAcCW5rls4TWg==
X-Received: by 2002:a5d:6988:0:b0:2c7:d6a:d7fa with SMTP id
 g8-20020a5d6988000000b002c70d6ad7famr3542476wru.25.1678952412613; 
 Thu, 16 Mar 2023 00:40:12 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a9-20020adfeec9000000b002cde626cd96sm6502432wrp.65.2023.03.16.00.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:40:12 -0700 (PDT)
Message-ID: <400fc050-ff7b-8433-101e-191e637860d5@linaro.org>
Date: Thu, 16 Mar 2023 08:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 02/14] qapi/schema: Use super()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316071325.492471-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

On 16/3/23 08:13, Markus Armbruster wrote:
> Commit 2cae67bcb5e (qapi: Use super() now we have Python 3) converted
> the code to super().  Shortly after, commit f965e8fea6a (qapi: New
> special feature flag "deprecated") neglected to use super().  Convert
> it now.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/schema.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


