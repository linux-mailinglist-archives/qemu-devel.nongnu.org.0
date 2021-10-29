Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EE5440345
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:33:45 +0200 (CEST)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXdG-0002yU-B8
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXFA-0002IC-H3
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXF8-0004yY-N5
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:08:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id l1so3653370pfu.5
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y4sswQavUPkEjII4KJhuBJXC37ej+vgwVbv868xOZRU=;
 b=wVtpj/x6mHFj8hOJucW+nDgp70tNq5EtCIWahi/HNy1ajjJn7ooA1blyimKnr5EFrS
 +UZytikLQjSSK1p9kp8D4zftMU/yTyaoKPPaN0Ob01kZXd6HKxB7bENq8LWPP7r4LfhD
 ok3gWRz2t6GaIqIxMAwTqQybx1NHIsMSW0hnSiGhmreNIYf+LIlxWswAbzK5Smx6yYF8
 HIOBfqm4z/aof1HBFLumHbkOOjMraoW1Ok/PZzcgQNxTYSJ9oa9S1GVcFE1gcDA6H0KQ
 Q2DBANpmVlv3aXwGZmjXTjkZSxZONGlXAlGPoTZJjMSqqn1VQtED6BfH1mvD8md83ZVE
 npwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y4sswQavUPkEjII4KJhuBJXC37ej+vgwVbv868xOZRU=;
 b=z78zQCrNP2lbT00Q5sAicIcoCMMsW53etILjvb4RWHw7MkLhrmvjD49glo1FyVQSM2
 Fnodmc0BzfbN2TwQvK4gmE3MkqDCZ2Mr9o88sKuHCpsLBVOaqW+mtSfUEnCvka7WGYKB
 btmgNKA6/rP20KA7+D9sWODMHkhIbRgemjT7qwH51uMp7vlOanbt/aHZ2XbDh8lJK+SB
 UZwEblyP5TH+jT1NRZ9ULpojfON+se90xlSytY9ZwmP1s7sGI5e754ZmnoacQ76yF6hd
 Yz1wxDi5YDTvOeV/JWd6xEKoEyc8Teqtrygukn0kV/3upOCQXWmESURPzm409WMzp7xT
 t7cQ==
X-Gm-Message-State: AOAM531ItcczjBUWXHntI+i06WB7rvDhob3qVQW8M2qQ5x6wKFgJD2ZS
 O0OrhTyyb2K4wWFmoXJ1JKl8fQ==
X-Google-Smtp-Source: ABdhPJznRMnp2FbgR4ga/ZQA8QhUPivPsVw+HoQ4TxavyMz/hLzpWJFjwnBezJrZSALrNYFn8gS0lw==
X-Received: by 2002:a05:6a00:c8a:b0:47b:ff6e:4cf3 with SMTP id
 a10-20020a056a000c8a00b0047bff6e4cf3mr12655876pfv.50.1635534525213; 
 Fri, 29 Oct 2021 12:08:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id l4sm8438826pfc.121.2021.10.29.12.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:08:44 -0700 (PDT)
Subject: Re: [PATCH v4 26/30] Hexagon HVX (target/hexagon) import instruction
 encodings
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-27-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e29732e7-9e71-e9e6-0ca9-9211f9b706c3@linaro.org>
Date: Fri, 29 Oct 2021 12:08:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-27-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:11 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/decode.c                      |   4 +
>   target/hexagon/imported/allextenc.def        |  20 +
>   target/hexagon/imported/encode.def           |   1 +
>   target/hexagon/imported/mmvec/encode_ext.def | 794 +++++++++++++++++++++++++++
>   4 files changed, 819 insertions(+)
>   create mode 100644 target/hexagon/imported/allextenc.def
>   create mode 100644 target/hexagon/imported/mmvec/encode_ext.def

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

