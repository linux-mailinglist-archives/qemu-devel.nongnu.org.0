Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96D63204A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 12:21:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox4ps-0002WX-F0; Mon, 21 Nov 2022 06:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4pk-0002VZ-Tt
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:19:29 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox4ph-0002lc-PO
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 06:19:28 -0500
Received: by mail-wr1-x42a.google.com with SMTP id l14so459508wrw.13
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tv2Rno+pg7/dML64EIsJQLP4PGP/SLe3v5rzru3Lq9E=;
 b=yZyY5LOMI1HmRpbsifpfCK6YL+f28BHAJAJBL1ztlSw3jTTjfjzp9/n/V65vKbfHYj
 6m7bCbZWiIWN1i625Gy3mDDJ6gkjt7TZYZrc0nJu9hAolD8cK3NxpPfPal04rTBo88CS
 X4dbIppS5hdnqQHMXjXUd4KbOeehvdJn16uqX4cCfyQ2oz4UGjWkDU0C/fPHBrCVim1H
 fl4qeLyXy8JXe948asl0lzkwe26AyjiiKsWp64772UPgw4Zp+gYn3R5L/o0VQ7CrN+Q0
 EzQfpyLbVOPA0v5Ei51rUUf6hnLZB6VQaN8C/1kjPr08xNIJObgtkQ9AwR0pGey9E9+f
 HPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tv2Rno+pg7/dML64EIsJQLP4PGP/SLe3v5rzru3Lq9E=;
 b=eljQHv2G3Gj7rHgB1LJrd1hFUJnYHppLRfT3/3vv5yRVrAEjJhWr+m0jfriC0nUIXh
 k3YIzY5uIiNIZvNba7ekaEhco2NGTzjXffiE8AipOHvijiRzduEEqFlnjUadgOdsr3sd
 yhIDPA5470VfI+Rov+zJ3aFuPJDvXEsgN1qAcU7A2XdT3lfXmQD1k+aNhFd1wZePhvjt
 w7/YMboJV0BtkYXWrYrqJaB0iYAuGpIdYXHHUz7VrSfJJpSE/PZr3gnzkn2wV4yBLqaR
 fAgVPPcK2PpYlhrRwrQWXVBOcv4PYUVnMNV9w+YgKtVqs1ctpvbewck3TLJuM51HEtgt
 oDPg==
X-Gm-Message-State: ANoB5pkgiQLa0HKQ6AcyO5+F0eM56wCXgi+LnZ2wYrO/ghicHFdRHL9U
 S3Rjf8zNv1y1wmOtb8mw1MqGCA==
X-Google-Smtp-Source: AA0mqf62NE9rrSPlwDEeSWPdLeTSU1oLB0RdwRA8JzKyt+/ZihpwKKK+45nCrcOj+dwotNqCo2ILvg==
X-Received: by 2002:a5d:4ec3:0:b0:241:c33a:3e3d with SMTP id
 s3-20020a5d4ec3000000b00241c33a3e3dmr8075653wrv.651.1669029564172; 
 Mon, 21 Nov 2022 03:19:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d005aab31asm13590121wmq.40.2022.11.21.03.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 03:19:23 -0800 (PST)
Message-ID: <3538e27b-3360-d362-f74a-44fd380f753a@linaro.org>
Date: Mon, 21 Nov 2022 12:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 10/10] io: Tidy up fat-fingered parameter name
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: eblake@redhat.com, vsementsov@yandex-team.ru
References: <20221121085054.683122-1-armbru@redhat.com>
 <20221121085054.683122-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221121085054.683122-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 21/11/22 09:50, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   include/io/channel.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


