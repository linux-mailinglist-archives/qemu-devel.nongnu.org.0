Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6545031DB
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 01:27:01 +0200 (CEST)
Received: from localhost ([::1]:44292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfVLA-0001vk-AU
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 19:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfVKC-0001AO-CD
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 19:26:00 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfVKA-0001gt-OV
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 19:26:00 -0400
Received: by mail-pg1-x536.google.com with SMTP id q12so8896042pgj.13
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 16:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rhT+6cYDJ4GQ9ysGyz2ysTJ3wXN1C/GkTVgKgBRE1EY=;
 b=GnE+mpvjE0hfz5E045P+e+zVk2db+R2FfJr8yjNpbRf13oW0eFhcc/8c0VabM2MjSY
 eM7N0ZKNFFTJGZ7ks3jpXd5S4gfGo2IPHz6/qi1e73R3BznluBFNZAxTOb3ssVGvM6Mw
 sbWchAMyhRYjsY7Vf5OTXThnpNcvdqLEDh7Bg26LXhtOw6QJSC+mVPZhQy1uW+zyUwsm
 MtZPv3nLK+dnMg2PMHnEtpYI9kfdWaEHZYBBmL0ZTon5PR0hcsI4PtzCwzBjSQyNSknD
 PE+yfz22gHczL9qg92lpqBAde8B0gH4heOX5wpzscLH7T9dxOK1kGWmC1Mef8zLNX/yr
 e38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rhT+6cYDJ4GQ9ysGyz2ysTJ3wXN1C/GkTVgKgBRE1EY=;
 b=5E7Jv0gTwoCLGBc5nwmov5Z3n47sXA7FZ7XbXa96nxIDida0hcuVcgdBX1mbgdFYz7
 n5T0V4SoyPndBYQApgC098goColFsZr4gU++/tmzrtuHo+iyxB3uGumZZlbGkSSNKCbY
 MAy7+G1BDwJURE8nIJmRruJUrCfpmLAWdSuPKbtOC5id0kj5KP5InAgyKvwoY0aP32pv
 j2JxdrLzHqQKmHQohIOY6Sk92ncZMNfJOAxuF9Al27fogbH72y6DgsCNkGAood6GLP2m
 n9su4HLDKyMxAMUZf1EZoO1h3cMA19Ma19JCKG3/u1R/dR6SReIj0laHb664JQSNbF6K
 cXXQ==
X-Gm-Message-State: AOAM532PRvVW9NEEkm56vN6nO+n3OXB2c5A2cSZfCrBv01U1SCmKBSIX
 9dMKXHJS0o1dxVe7z+ZbMD5ijQ==
X-Google-Smtp-Source: ABdhPJwEeSE/6M0fGNXqKKnfCXnJp3+qqHnT3DyJCBm/yw2NPIi95upattJqQy6LHgjGIncH6v2LLw==
X-Received: by 2002:aa7:90d4:0:b0:4fd:acb9:8eac with SMTP id
 k20-20020aa790d4000000b004fdacb98eacmr1362423pfk.24.1650065157215; 
 Fri, 15 Apr 2022 16:25:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d141-20020a621d93000000b00505aa1026f1sm3863703pfd.51.2022.04.15.16.25.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 16:25:56 -0700 (PDT)
Message-ID: <799cd2bd-fd7e-1af4-6ccb-37741008a359@linaro.org>
Date: Fri, 15 Apr 2022 16:25:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 18/43] target/loongarch: Add system emulation
 introduction
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-19-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-19-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS                         |  8 +++++
>   docs/system/loongarch/loongson3.rst | 41 ++++++++++++++++++++++
>   target/loongarch/README             | 54 +++++++++++++++++++++++++++++
>   3 files changed, 103 insertions(+)
>   create mode 100644 docs/system/loongarch/loongson3.rst

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

