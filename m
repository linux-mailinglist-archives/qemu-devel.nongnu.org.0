Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1A507A12
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:17:14 +0200 (CEST)
Received: from localhost ([::1]:46222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtLe-0002id-2Z
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtJV-0001bv-By
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:15:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtJT-0007Ck-NO
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:15:00 -0400
Received: by mail-pj1-x102a.google.com with SMTP id md4so16317040pjb.4
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zKnUCqHVeFG8A6z5tyPjGGQpoRJ9Da4dEyIw20Sq7hg=;
 b=fqodW7J2v/I5TP/btLe4+42UYHJTKgnRS5uul6A4ilUAabgLzG9KxBTAiOzOoOoUWZ
 ILnPyv8FvrutweDY9/cxBQSQ/licy9B7DYC2UVcSvQUEVHaaVZJxrd+P5ioWoMsBWNcb
 zofST6e3W9AcBewOlX53A5lBBX+BKWkdsHzDy+eKJvRfJ30sqJANWv0/IicqctGWhKQp
 VRVAPM33ReuX4x6wmy/bJJvmHPR6vkyvRBtH20WIsLDRospiTbG2TVVXVi6DSTMlfYwg
 NazzRBIE+wxCXybCAL636vq7nYVgz6bwrnUrDBLp0WB/GrmAwpwCtReLmJu2ZK+e8pOF
 k1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zKnUCqHVeFG8A6z5tyPjGGQpoRJ9Da4dEyIw20Sq7hg=;
 b=dczkNnvuanzjdqZhx6GeDvPSntK+lcaPx7ayV+pf+gvaXhMRkgF1fftg1g2RTwvM9s
 sjUuG0Vav0tHW9iZqMiClWI8d5ZOyxf2NnMlGgXThd0bWyvhXq8rF9VNI6Wlgv3AcFyr
 8teMK2vXs9uRKePuskNyHd9AQ1KWstM50WUxCuaWrxP68KCPoJ/KzQ9H1ToWEUC2nS/2
 vYEEkEmGtpIKOnv2EI2Fl9SS4fL+40GqaDOoHt4Yl+wBEvIO+czX7AMp4dPYHjB4X1xi
 Y+YOTnq0tL4OFLMxsExDmqF13r6FlZ+2a8yjj1N9uO4np/q5lAKsuEiwC5n1LMymy7No
 qOxg==
X-Gm-Message-State: AOAM53361+fH4+cxAdZDSl1TvVv0Y5MQhqUQSBWT4RqeMyUYRd3D/Vhn
 BAfgsR9702hvYY9v+lDLdfdDNA==
X-Google-Smtp-Source: ABdhPJy97WfRDbE1xdOVvT3dfMuifX5rS2h+L3r5B6o+cWcRMxGKWOnejKoWf9GI3aIPTKZXDx/nNg==
X-Received: by 2002:a17:90b:1c8b:b0:1ca:1ff6:607b with SMTP id
 oo11-20020a17090b1c8b00b001ca1ff6607bmr105728pjb.244.1650395698311; 
 Tue, 19 Apr 2022 12:14:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 ay33-20020a056a00302100b00508374700b9sm16296241pfb.166.2022.04.19.12.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:14:57 -0700 (PDT)
Message-ID: <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
Date: Tue, 19 Apr 2022 12:14:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 22/25] tests/tcg: add float_convd test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, Eduardo Habkost <eduardo@habkost.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> This is a simple transliteration of the float_convs test but this time
> working with doubles. I'm used it to test the handling of vector
> registers in gdbstub but wasn't able to find a non-ugly way to
> automate it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/float_convd.c | 106 ++++
>   tests/tcg/aarch64/float_convd.ref | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/arm/float_convd.ref     | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/i386/float_convd.conf   | 988 ++++++++++++++++++++++++++++++
>   tests/tcg/x86_64/float_convd.ref  | 988 ++++++++++++++++++++++++++++++
>   5 files changed, 4058 insertions(+)
>   create mode 100644 tests/tcg/multiarch/float_convd.c
>   create mode 100644 tests/tcg/aarch64/float_convd.ref
>   create mode 100644 tests/tcg/arm/float_convd.ref
>   create mode 100644 tests/tcg/i386/float_convd.conf
>   create mode 100644 tests/tcg/x86_64/float_convd.ref

Is it worth adjusting the current file to float_conv.c.inc, with #define FLOAT 
{float,double} in float_conv{s,d}.c before #include?

But I suppose this is ok as-is.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

