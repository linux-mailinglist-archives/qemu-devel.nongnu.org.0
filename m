Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414460B4A7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:59:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1gO-0004Iz-RM; Mon, 24 Oct 2022 13:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1gE-0003ze-KS
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:07 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1on1g8-0002Rz-Bv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:56:06 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bk15so17390587wrb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PvK2zWtrjcLkeB2a5kHr+ZN/qbyI9SL0r4m02mqx39U=;
 b=haIYaYTUVjQ2/saHYiLM1t2YJkJiOBvUjuZI4f2alqA5tHPY/743w6dc3tPiUIilmw
 jNkNxt4RRK6IpbRJPb9GOxzqxBMujnUPj5TMr/1Yv941hqpzzzLxqRiFZbHYjKN1z5VQ
 d6D+eYmYQiLaJ+gylYs2ICEWWv9kWsGuJuNMD9MQ8Nm5UnPEBcpALhWnez1863r92Sw9
 FhPHpGCVOkpCFkFstMcbcO2qRLfEXW0ycgggmj6JhnJCwqnfQkPEWAjQRfSa/V6ZUs2g
 wd9mDb+Zi64rjB1DspUuo7kTRWxkyI+EHAF+elrk8xCFqjMVIpEgeM63P7r7H1zlXDPm
 KCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PvK2zWtrjcLkeB2a5kHr+ZN/qbyI9SL0r4m02mqx39U=;
 b=Hiuy28be6fZdvbYYEo1s4wJM2/GEv4z049ew0ipCx/T1aqhGN5Ar/nPW+e9Px6FJaj
 Kg2eq8ozXY3NZbW3FQ3PxsLxHOXQ+lYo5esEKtL34BhQRPixXLUhML5t2Jb5zdZLzy5r
 wzGCm8JxiJnM/xyLdfmKlQAdmui71JHENSidfAcRdqkiHSnPeU6oBzw+NGB4wGelCOCC
 ku5feZAYibXrmIqcqLjO0Oazh5aFCq4zOYnIDTkzrfLKXNm1f69D0XHpTzO5+KgI1X5a
 vyi50aohBBn/r1m6iOxbc7NiumYPSNkN5TFH7c5GpBT+g/U42V9kO0TLeaExfUCzkqJ0
 qFIw==
X-Gm-Message-State: ACrzQf3PflB8Z5JOKY7fmlb4xs2vlRVf7EKqyQ/v15vAzz2IIkwc3nq4
 r4ssQ9xRToqAEylNptG7rDVsCA==
X-Google-Smtp-Source: AMsMyM49QI0cNqLbS0ijtL/VGvUZC8xj3dsn9I4tiWekP9Fb920fMk13H0AJ44b7QiT3ZLu+mXr6Dw==
X-Received: by 2002:a05:6000:10d1:b0:236:755b:e038 with SMTP id
 b17-20020a05600010d100b00236755be038mr3236726wrx.153.1666634154167; 
 Mon, 24 Oct 2022 10:55:54 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a5d45c9000000b00236488f62d6sm212537wrs.79.2022.10.24.10.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 10:55:53 -0700 (PDT)
Message-ID: <b165bbb1-320b-c4ae-b49f-122634192695@linaro.org>
Date: Mon, 24 Oct 2022 19:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 10/29] target/m68k: Convert to tcg_ops restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/cpu.c       | 14 ++++++++++++++
>   target/m68k/translate.c | 10 ----------
>   2 files changed, 14 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


