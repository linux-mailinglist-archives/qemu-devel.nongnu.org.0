Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2617966C05E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHPxx-0001PO-KZ; Mon, 16 Jan 2023 08:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHPxv-0001Ot-Si
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:55:59 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHPxu-0006tm-9U
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:55:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so23669681wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ofgGDkYTi4BMMFg7q2x3etO2MP2ibDvaS77ZqFiY9a0=;
 b=AHjaLjOOTiF83kVHrXIFjTmnCn9vWC1I+6izgWPUa20BdILsuBsfvyi8PdyO9TIOtn
 GEfac5XiyajbEqvtM6VcJGuJGhAdCQwnqXYTAMKGA1znTuS2ty3zkUasQfuFj5cMi2f9
 xGvtRpckYdWGLXCtiVqsLT0BIPWfo+kN7HRt8YX3VMXxwUirQeLPRUFv9v65/0vVF/UA
 us0KRDTHfgDC3CW3OCjcd2ISU6gERJsDXZuYnDOmQThNgkPPbMCdoy9FvbK00iqUYxaZ
 9TbdOA7QcGBCnoqSrNz5IYYK24dEiW1DyyiHUKA+58zY47HXjc75YlgKX3V0SY0dqhP1
 AiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ofgGDkYTi4BMMFg7q2x3etO2MP2ibDvaS77ZqFiY9a0=;
 b=HjuBXq/yAEHuUvjQiHUY4sjoXtowSxiev4xP7x/A2Y8Qqd6E1HktfvkaU56SKerH1q
 xrl7zo5y9qcNRAXwa6bOTaET6XtsbVO758mmQ4DC/S6he2/b6aK5j9i/SwISnXs/5KdZ
 E+1qyx/Ge79yhlyHo+PATdImDCXiGrYXU9kqNqBBskjNGs929ajF2AnXP/Ik4kWcgAVl
 3QOaEADJ7X4igVq5qfRy1+UNbGU5+swwrV0vvB4H+6fZFz3UdVBN3cmZ3w6oxnFCSR9y
 EGE14nrV263ECV+CZ5AdPfF/SVpiCB4NUEyHv5TU6dBR/AjvFWyoRvf1VvYmNEvg1sRU
 27CA==
X-Gm-Message-State: AFqh2kqFBpVp/BIGhdYD7s6nrnTh0QDB+OpkbDHV1xVgAsdUTLWrCcbb
 q64zGA/MMVwjaoVxRM57Rsamxg==
X-Google-Smtp-Source: AMrXdXvd122VmbQUjkpJDJvUJWSvxdbIWWzOme+scXP5yoRqvLkkSlEYIhsQIeKFFQtbaawrASjkoQ==
X-Received: by 2002:a05:600c:2046:b0:3da:1357:4ca2 with SMTP id
 p6-20020a05600c204600b003da13574ca2mr14601472wmg.11.1673877356800; 
 Mon, 16 Jan 2023 05:55:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c2d0800b003dafcd9b750sm2451113wmf.43.2023.01.16.05.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 05:55:56 -0800 (PST)
Message-ID: <e2c4c128-09e1-a97d-83c7-bb580a676de8@linaro.org>
Date: Mon, 16 Jan 2023 14:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] tests/qtest/qom-test: Do not print tested properties
 by default
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215153036.422362-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 15/12/22 16:30, Thomas Huth wrote:
> We're still running into the problem that some logs are cut in the
> gitlab-CI since they got too big. The biggest part of the log is
> still the output of the qom-test. Let's stop printing the properties
> by default to get to a saner size here. The full output can still
> be enabled by setting V=2 (or higher) in the environment.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   v2: Use atoi() to do proper checking of the verbosity level
> 
>   tests/qtest/qom-test.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


