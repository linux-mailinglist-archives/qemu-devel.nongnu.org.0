Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C36571117
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 06:09:06 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB7Cr-0002Xy-V9
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 00:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB72j-0000z4-D0
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:58:37 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB72h-0007MU-Bf
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:58:36 -0400
Received: by mail-pg1-x52a.google.com with SMTP id bf13so6458702pgb.11
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tuoPvCzXvRjl8V760xXzMecdmXiF7OZ/4fa/J0wHIY4=;
 b=CGF5H3Pc1uz4jnJ9EG3oambVzvr8dNcC7YZUMIvOyrl0wJP4hbmTOU3JcEkmcSuiwn
 lZTAjO7E/Ykg9NNS4Ec2BGt7gBByNSmSQkI1EMMqZ/mHJUZTUUA/UKA+v6alzkDtpyNW
 a1TR2Cj7JxybLorvhZ3Lt6+ROOVrpQliL9CE7IwXAOf8sZK+7jbL9QOuBNRZd6+1qrbP
 lTGJAjUZj3eKs/TW7WZK36C0ZWcAPOQvQklvK+o66p+PNNK29fQVryv9f9CubXaGBLkI
 Du6uVkmvak0WxszLN7M/XH4t7iBjSoooHZpGDozbGdiAGjTX+33TnQfUgT8ZwpbT35q5
 2Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tuoPvCzXvRjl8V760xXzMecdmXiF7OZ/4fa/J0wHIY4=;
 b=5tY6ecHtM6YHFaMzpNHCBUB+x//0TDLczvtldzluksqMPBf0qYIwdG2DFRd0aUCpTo
 cCtQgJIK8aFMK6sHY105q5/d8HDdlceslGqi8nrTxGDEPYaUQ8E/cXD8ErBqU452sME7
 rfnWgKuyv1UdvjVvRO1m9clX7BazrZI63f24vD7neGV+/ww3tCCLcwEFPq62GgJyKq1r
 WaubWv92DAS3SaL67JnGEdr1Jw7G0g3s9nItODYkG28YxiEA9ApaL8AAkz87HFkojevn
 KfkW/zMXolnjM62UYprdFFh6WqvE8Vp1DiTn+2mc5GRs2NdwCSMF8fAj5wSQydj9dMMi
 tmtg==
X-Gm-Message-State: AJIora/2NjA19WiKjMZohnbUyvWt0Lr0U8F9qEuAJyzrnMyJFW1MyaYq
 R9tbJHlEueBFWH+ro6JTeZea0g==
X-Google-Smtp-Source: AGRyM1vOFir+hvACmFQMCuWXcMz6dpGvPBrTnUtE64j7MzX19uJZ+owKmBCkDQ5NNFM4O6Y13agtTA==
X-Received: by 2002:a63:d449:0:b0:40d:7553:aef6 with SMTP id
 i9-20020a63d449000000b0040d7553aef6mr18954213pgj.16.1657598313670; 
 Mon, 11 Jul 2022 20:58:33 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 k10-20020aa7998a000000b0052ab0a7375fsm5509824pfh.209.2022.07.11.20.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:58:33 -0700 (PDT)
Message-ID: <961ab5ef-e1c4-9705-36a6-dfed179ab643@linaro.org>
Date: Tue, 12 Jul 2022 09:28:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 03/12] tests/vm: switch CentOS 8 to CentOS 8 Stream
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Daniel Berrange <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220708153503.18864-1-jsnow@redhat.com>
 <20220708153503.18864-4-jsnow@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220708153503.18864-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 7/8/22 21:04, John Snow wrote:
> The old CentOS image didn't work anymore because it was already EOL at
> the beginning of 2022.
> 
> Signed-off-by: John Snow<jsnow@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   tests/vm/centos | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

