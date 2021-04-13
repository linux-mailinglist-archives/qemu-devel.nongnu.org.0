Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E20135E49A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:07:20 +0200 (CEST)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMVT-0002Os-Ia
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRl-0000x5-72; Tue, 13 Apr 2021 13:03:29 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMRj-0007Yo-R1; Tue, 13 Apr 2021 13:03:28 -0400
Received: by mail-wr1-x436.google.com with SMTP id j5so16201305wrn.4;
 Tue, 13 Apr 2021 10:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=Fe8ZWS5juovd1B2G7idj9b3WhtYnpA7nru8Rww+oAMjiXQbBqbXb8zVH66Mu8Tq4hP
 twUR2DCDwLnyRwI4ywtpH31IEZ7ctZZzwio2VjlZt4qKAu+rAhXmy7r5P6yvT+TNLos9
 gcXn3HyuEH9Ro+6Is10jxwN32mKtyrmtSYSLqXa2VrsA5cNHJVDnpfeYjiJ4Qj6aH9Kg
 ivs2OWtsMwCoJ2HS3eYV10PxpZ/Cyipcm8qwuxcl7hmTx5bU/Ec1JQz+mQ3VpO3BG53C
 Pz98HgR87mcqWEPby9c6mpv09UNP9GItxPMxeZYqA5g/rUJTK+UEEgcUXZ6k1joWPLzz
 cskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5srUk3qIIvcebuytWZ9xypNA7snM56pd7PVsHy2DEsE=;
 b=Dg7LsLWFet21u9jcpdnZQagOtosG3KPt3W7lXOorhnJGinljywHMbcMOHbHPH/SUpH
 ySpAop2zVx6muJtAKqV0P7DZOiw+kfi1iOXni6cCOlS5NZ2mg/BECLFLJ8nW6SLYaHl9
 fKrIayGZvaThx7hjomG0p87hiUPR6hA8qz8YJT6R/MUmRogiMU/rC87ppCWXpOYUNF5n
 nMBjISGLuEUVo6Jpk8gBKAhZZSSg35diThui0QPz8zhVRXnh4S8YOipl68iUQVDW8BNS
 h1ODTqLSu/tDrpJAzNQof6N2QqxVC3kgnvtcywg0HaDW3V7TYM4/SKmB8MFES+duKD+j
 Dycg==
X-Gm-Message-State: AOAM532cuy72SA3JiZxl/894awUjylj/RDY+0HClhDBNvUbnwErmbPdI
 rdAekYx3Fb2SAUDzCYh2S6P6xSdy3m4=
X-Google-Smtp-Source: ABdhPJwruCqRQjgVd10D0rGSLRLPQNIH+QNQ+GfvMjIQe9tDdiJ43cuzy7roxN5eKSBtlHE6HbLaFw==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr2914498wrq.10.1618333398748;
 Tue, 13 Apr 2021 10:03:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b12sm9150547wrn.18.2021.04.13.10.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:03:18 -0700 (PDT)
Subject: Re: [PATCH 09/13] target/arm: Move vfp_reg_ptr() to
 translate-neon.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <737339ce-636b-bd75-16b1-6080542400f8@amsat.org>
Date: Tue, 13 Apr 2021 19:03:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 6:07 PM, Peter Maydell wrote:
> The function vfp_reg_ptr() is used only in translate-neon.c.inc;
> move it there.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c          | 7 -------
>  target/arm/translate-neon.c.inc | 7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

