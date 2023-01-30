Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B7681FCF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:44:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdp1-0002hk-73; Mon, 30 Jan 2023 18:44:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdoz-0002hU-VS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:21 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdoy-0002i2-Db
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:44:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11263357wmb.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gZ5qB9SjRN0f2WBP0aK2YwNuU8J7QUbPhxKJpY+HuUQ=;
 b=NJfrqJm1moPuucABJ/HBzYfod3+r3mXS3YEDsAFcNpS91vqzlX9BJdtR89ido3AqzY
 aFmSLmh91ansx7Crnjfxv006V3kOTVuLK41gcZ7V8TRQG77vn2suhSFkoPPISzQ6T45l
 KLq61USnfeszoLn9W7xP1e/GVaQ0/5XxBnPEv5N6UlpkRsx8/XXgFr7l3aAtcj3K833l
 TKHYfAonrvkUmr2ADQWzr9NaAJ7EYK2giuVGXyXOzgO25G7HewJcgDZsUbf7hXPzyUtu
 OGAsm0dB+6MGBfUdbGQRuepDPGxEZ5puXi/qmYychvapktZWyfaDRYxHTMiflU/jJasA
 UJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gZ5qB9SjRN0f2WBP0aK2YwNuU8J7QUbPhxKJpY+HuUQ=;
 b=heE8dKjT4+vJzcLRJAdFch03IMaAiEiv4SjbO4DSy1dxBa5XknDdZqNxnMM4cLwYzo
 b7f50afpgpXZzbBcF50O3+PsGjy9+fH0bhjSBmQD53Q+nKtmUcUGCZiNedis73o3mPEG
 lHDovpxjIbryQACa9QUk97WqpOAEYFfzZm7VjNrOMe77Vs79SQRcSVP2GfliESiF1I9/
 tRL63d01WccFfPR7LwdhrF1O1bsTEe/vex/ADjTuMwBfaiJ6XmgZjN/a2QxJLPhzzJEb
 86Ozn3mXYfn7Bf78/6WAh+DhradG9outScKQAfzLOCt5F16oa0B70EIHeNRyObeiSQRh
 Wh7A==
X-Gm-Message-State: AO0yUKVPyuI6V8H5YKDTThr3/Tpyx0mj6fwtqjkkmTPNzGXVYTnChCCf
 Sd/FZp8IyLV+/p/rSyDJjOoskjKUOdCF546l
X-Google-Smtp-Source: AK7set8qnKy1WsqG3eS1CRNaRdkdt++QVPfs3DUrasWMc+Kh6BlPdCBre9G2chw5hjwNHo8jnn0ZzQ==
X-Received: by 2002:a05:600c:b93:b0:3dc:5965:2c35 with SMTP id
 fl19-20020a05600c0b9300b003dc59652c35mr5175269wmb.24.1675122259022; 
 Mon, 30 Jan 2023 15:44:19 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c430c00b003dc492e4430sm8560767wme.28.2023.01.30.15.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:44:18 -0800 (PST)
Message-ID: <dcb3784a-f5d3-d932-d7bf-d211b7283572@linaro.org>
Date: Tue, 31 Jan 2023 00:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 17/27] target/arm: Don't use tcg_temp_local_new_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> Since tcg_temp_new_* is now identical, use those.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-sve.c | 6 +++---
>   target/arm/translate.c     | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


