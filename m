Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D740C666
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:27:58 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUxB-00022S-It
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQUuu-00015t-7q
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:25:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQUus-0007au-3E
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:25:35 -0400
Received: by mail-pg1-x534.google.com with SMTP id w7so2674333pgk.13
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2Zm/p4tdrTrcHrTVxHBnRzBk/p/UqhypAALAske00Qs=;
 b=BrY8z/8u04kT/yrkzfpQ2YSrbrAL0QwUmaORdD3aGYiB7i0QOfX3esATkBD/zsin2B
 4BSNIizCRO4CL6VGbaRknSGXGo5so//PTtZzSK49ewlf6Us1vTrggKXEOKspp8N/mUtH
 FadiRPbPacboGZFJ0+kQZgs6kRyBrZ/3NfNCcDBSFhxApsmFaX9ZBzhLBkWaNS5W6rvx
 MLQ29ftXKrgyotRKD/IPk+rkZUQ3nnET+lgcDmlZLoP4uf9vfkfc0AEK9YMbyxLmmEFM
 uA/WFqmoZh2e5sFenbwifLnQuv8FHZgEOlqN/Bgs6FHWjPtuNuERwjzB4iOONBcdOQrg
 lc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Zm/p4tdrTrcHrTVxHBnRzBk/p/UqhypAALAske00Qs=;
 b=rkq2oupGnPaPbERoq7iIXrlCD4ora9HhPgMi2nXWbETUjhFAYGa4W0un1yvXWq21WE
 2RaxRA4+91pDWmMc6Z28UOe0YBYlXbdOrHK8HqXW6XN1rdkrJpUSlXBUiDy9qcMPLSRu
 SiEdNMQ+tBH6BGuIFY5idv8/AN1XigVY3pGbRJ71WbMTKIr0m7T1dxx0GC1eQo6g62Eu
 qx9utC+Civ84HkkKgff1hzNnRXzadKDaWqe59dtwuvTRgE18gPbR6imHjTF5ZpKjKT72
 H0J86IlopyBes47AoPYnUozjKBvGHIWi6zrRY11SMk+dgTNGU2E38Nd2mNu0BRh7lowK
 KauQ==
X-Gm-Message-State: AOAM531ZwCOeT420QT5Az8D68xlRcoehLXjzqa3yGdHZiIizzMtNPypP
 TVw94p9elaMtEmL5yRkKZFTPqQ==
X-Google-Smtp-Source: ABdhPJxEA24O6KiHh6OcDbLxFmD3qCDVGMJCyEaI2GASl/mM4ajraxY1e+YZWfXIjdkDLgFq6ejrWA==
X-Received: by 2002:a63:da0a:: with SMTP id c10mr20533476pgh.255.1631712331327; 
 Wed, 15 Sep 2021 06:25:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm25443pfg.109.2021.09.15.06.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 06:25:30 -0700 (PDT)
Subject: Re: [PATCH 1/2] gitlab: skip the check-patch job on the upstream repo
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-2-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <295d1a9a-0c10-3621-71b4-f3ec060e5d55@linaro.org>
Date: Wed, 15 Sep 2021 06:25:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915125452.1704899-2-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 5:54 AM, Daniel P. Berrangé wrote:
> The check-patch job is intended to be used by contributors or
> subsystem maintainers to see if there are style mistakes. The
> false positive rate is too high to be used in a gating scenario
> so should not run it on the upstream repo ever.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   .gitlab-ci.d/static_checks.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

