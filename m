Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7B63D3BA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:47:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Kch-0002MS-Lh; Wed, 30 Nov 2022 05:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KcX-0002K6-IL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:47:20 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KcV-0006IE-SA
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:47:17 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g12so26386404wrs.10
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9hB4hoILLf8G+7Qb/GWw6Q4Uu7/9Ww/CZmK2f22fJ4=;
 b=ZDmPCc0zNSBzKvKGFnOrgu73d1QvYnYmszQ36KzFvkR+UxFCFvUJRJEza25hdhIMX0
 f0HNyvIAwVsClTd1+233eaE+h0P6OeNRDn+USD7JZtQ4+k8l0pFLtuhrYXK95hSqq8Wp
 58rL1xLE9v35BI8Seo8u2f5RLdE6FdJ+1sozurDHas0wrl/nUinUywc/eGmVKH/syG3V
 f5QIopy++OHi06excYq/Qq1nUrnshsddxt0NovNVZVJV47ibIwLw1MY7T4az1cbK8Yyc
 7mHeAYEAc17Qv8+ZCMNzaOEKgEjfCCDYeybSUPnNaFyGfcTi86cCX70F/XoR53dvu6cC
 pJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9hB4hoILLf8G+7Qb/GWw6Q4Uu7/9Ww/CZmK2f22fJ4=;
 b=VnRRyZPPd1LMaTnDimd93agcaxB25n6e/RWdQEHvyEIktjpcOcSgHT7CVDcCTBOiB8
 9xH2e2rajea49K7tiS5eHT1XVybireOTjc8VzSH1LxpYTK55ilLZ57ZVLiyQLcEz6LOI
 xw0f4TWcAPppyQDeO0jPK8ZTD/wlhR7hBDCmqTBWdfsKvrYj0ERJDtXRR3IKoXWuWJG3
 t8m16ThWut8LLlRC5/42mfxAZ102B4FqJNzSuW42Vz4QIB27APIbi6T7F5LsnRi6wKE7
 BPtJSI6ZpmXLxxBc8j0U+e8bwNv9Psh+GREkOLr8UhYC1KCCYdFdRRARpRs7MgeQ3epQ
 kgCQ==
X-Gm-Message-State: ANoB5pmj7xBXM5fXEHXokzTpCwlLjpvpYhpkCXE8ovBe41ql13kOadAL
 YpjrCnYW9oABopypDzNumt5fcdBjDr/FScCC
X-Google-Smtp-Source: AA0mqf49slD8da7g6ZyVHQCVB9Kt02+ZBmR1+iNqdG6q8ZvoKHLQcEQLyIMtbxdh4DUa2EBLSYK2ZQ==
X-Received: by 2002:adf:e581:0:b0:241:e715:394e with SMTP id
 l1-20020adfe581000000b00241e715394emr24161654wrm.160.1669805231510; 
 Wed, 30 Nov 2022 02:47:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020adfff88000000b0023677fd2657sm1187129wrr.52.2022.11.30.02.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:47:11 -0800 (PST)
Message-ID: <5da96cac-27ab-9c58-5029-1a41157d85c0@linaro.org>
Date: Wed, 30 Nov 2022 11:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v4] hw/loongarch/virt: Add cfi01 pflash device
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221130100647.398565-1-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221130100647.398565-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 30/11/22 11:06, Xiaojuan Yang wrote:
> Add cfi01 pflash device for LoongArch virt machine
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/loongarch/Kconfig        |  1 +
>   hw/loongarch/acpi-build.c   | 18 +++++++++++
>   hw/loongarch/virt.c         | 62 +++++++++++++++++++++++++++++++++++++
>   include/hw/loongarch/virt.h |  5 +++
>   4 files changed, 86 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


