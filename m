Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA1671FEA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9di-0002iO-TI; Wed, 18 Jan 2023 09:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI9df-0002i7-NJ
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:42:07 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI9dc-0003yo-Sj
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:42:07 -0500
Received: by mail-wr1-x436.google.com with SMTP id k8so19674400wrc.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QTEPhCHuZMUs32bgdgwpfNjhfEqVajCiI14X8fYOygE=;
 b=KornspLLv20RtTQnJu1V3oDzu4hC3oGmGJ9CjQiFgrP9iugFIcPPCuaVkpktd0osX2
 +el5CGejOpd/KdbwuDjwTRuB2feeAC81xRsko41A9CMJ2T8CnOx2XuX/mHF0NxsX4LHE
 aCQJNc2qOW6zXsU5LszU9DcBs6ycGL94CU5O2uM9kUDvFGK5rp+YLB16vaXIQW+dKQXh
 PvdIpqI9nkZAVheCmLJPl0pF6va+hvUJKeoXiEJlpkz0d/LfEEMNCwlt+/76CbgTuuMJ
 wfAjMecDdoPZLTR5s3D2GT+wUcYpPy0liMSZlEQbyx/So5AZL38fWhqkSDZyRxE8kzJJ
 WyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTEPhCHuZMUs32bgdgwpfNjhfEqVajCiI14X8fYOygE=;
 b=o1gpkOsepcg21vrhzVxbE9ni9OPI+28+ikk57LLSEhqiYjK6cVusSb2piPq+oBUfec
 A87p2v+5JzeYSmvaJyMaysYuo0QKFin0FCP0NemBAgAxLGLxPXnKPA6wuFfFBaM7Kbm4
 g30sBt9YmRKgWY1ArmeLWILXIW7eAMXhomWE730cg4EfaNNdOKiox3O2Lj1j3CDaQs8C
 yFOq441jst1izuxLcNWLb55t4OkEeuuhpNMS00JP9wsM7jiI0QZBhDyTJE3utH42xgO7
 70wkaZ9OB59vswoW1gHIWqvSTxWgQwx3Gwc6r9uu6RzytQFCMlQzgYGhGBAfUtf59s30
 ivcQ==
X-Gm-Message-State: AFqh2krikthVplRiq+YaI1VaPbH4l2OcXnxVSbARaBq2oZO0wuxZbbCv
 b+uUsCjlQFR5Sn6BlHSL1V3nlg==
X-Google-Smtp-Source: AMrXdXu7KCj2yX14/2u+QeC8VXUqb75B1GKnYK3YL7J6We1liLMPSjhdGf9S/oCC1No5jBP+JkYXQg==
X-Received: by 2002:a5d:4591:0:b0:2bc:7fdd:923e with SMTP id
 p17-20020a5d4591000000b002bc7fdd923emr6558648wrq.22.1674052923084; 
 Wed, 18 Jan 2023 06:42:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm31441675wrx.97.2023.01.18.06.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:42:02 -0800 (PST)
Message-ID: <35cc7ec6-2b04-64bc-7546-522c09494035@linaro.org>
Date: Wed, 18 Jan 2023 15:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qtest/qom-test: Stop spamming the test log
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230118122557.1668860-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118122557.1668860-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 18/1/23 13:25, Thomas Huth wrote:
> We are still facing the issues that our test logs in the gitlab CI
> are too big (and thus cut off). A huge part is still caused by the
> qom-test that prints the path and name of each object it looks at
> by default. That's too much. Let's be silent by default, and only
> print the object path+name when running with V=2 (and the properties
> only with V=3 and higher).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/qom-test.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


