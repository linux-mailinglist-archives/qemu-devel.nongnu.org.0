Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F2D579378
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 08:49:51 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDh3G-0006IV-1J
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 02:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDh0Y-0003ed-05
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:47:03 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDh0S-0000Ps-Ac
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:46:58 -0400
Received: by mail-il1-x130.google.com with SMTP id w9so3675690ilg.1
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 23:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HXNxm3OftiCMHrZzuz/awZ7SNtrJyptqkAKGZXQFF8A=;
 b=Tq59Lmf776v5IBMY4x1Pp4e52c8AJsOqYh5EnE2YUw8/MJX0trgAS7mj4XOVHXmz/Y
 CVKPAv1toq0izZlD/pDkMocu78anYpRm3a9w8w3kNy3mExvdMERNJuQoJa8FB/eg4mCf
 rsKbplnZNRWU0yGxKXFcG//WnQOGv4Yj8rL5fQic5lfF2kBMyTZSORj8+SCIaHEagM64
 og3mv+Y9lkOt60c0yPpvTDf+SLpRGL8zfPsGgLTtcwjwxdse9a0LEFixebZoXiBaKBkV
 UnARuEQTJ4aqsoERmErQZG6SNStk5SppfAZYJjMYKFYPJG1iUsR+cCaUIdi3MEd8xFIc
 77JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HXNxm3OftiCMHrZzuz/awZ7SNtrJyptqkAKGZXQFF8A=;
 b=vx64bC1+1PtsbbBfcoCnaf3D0J1xiRsaizcP671UAwjPHY7T5+mkun0xvAql3ymTIr
 9BuZmI4E9ueBFeffBQgbhkEBGubLHB9oIB/t1Iq3pzBVYY4+0Gg9amTIjx6IocgIwLin
 0ZUSO4cw0ABxcpjQZz+N0c1yYmkR8lb7FoXaS+k4yGI+/6vI4BIPRGwjJpiL6Ew6R/H4
 Xp+sa1f1xD8YFH0HKKsxNG8tlTQGyYO9EUv4RlMMiIYRPX+ebaB/Haz+ZiCqEnFV+ain
 YDsTMFe7ewV3VtnrhjuzDe6drqPKFZJj3G8r5k+uud4OYCtKn2wStlG1QEJ+gU+JV3tk
 U4Xg==
X-Gm-Message-State: AJIora/rzVr2HAntFfwM7NPr28uI1lzsTY9DCoqNQPU+2IsT8KKyCGIh
 ueV+UUYLe8uHGDZMI9rqRKIVFw==
X-Google-Smtp-Source: AGRyM1spjvVPuwPnJ/XIiR32QNKku2GuzNQSxF3e3inqWBwN46W83gwTYgnt/rX0V+Wp9zi5IJ0AYA==
X-Received: by 2002:a05:6e02:1d95:b0:2dc:4746:6a2d with SMTP id
 h21-20020a056e021d9500b002dc47466a2dmr14385759ila.322.1658213214851; 
 Mon, 18 Jul 2022 23:46:54 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a026f5b000000b0033ec45fb044sm6299200jae.47.2022.07.18.23.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 23:46:54 -0700 (PDT)
Message-ID: <a36bbd80-f830-51bd-5aac-b430572259d3@linaro.org>
Date: Tue, 19 Jul 2022 12:16:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/5] target/loongarch/cpu: Fix cpu_class_by_name
 function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
 <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715060740.1500628-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/22 11:37, Xiaojuan Yang wrote:
> In loongarch_cpu_class_by_name(char *cpu_model) function,
> the argument cpu_model already has the suffix '-loongarch-cpu',
> so we should remove the LOONGARCH_CPU_TYPE_NAME(cpu_model) macro.
> And add the assertion that 'cpu_model' resolves to a class of the
> appropriate type.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This patch causes tests to fail, e.g.

   TEST    float_convd on loongarch64

qemu-loongarch64: unable to find CPU model 'la464'

make[1]: *** [/home/rth/qemu/src/tests/tcg/multiarch/Makefile.target:29: run-float_convd] 
Error 1


What caused you assume that all cpu models are already suffixed?


r~

