Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC7F51EDD4
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 15:32:15 +0200 (CEST)
Received: from localhost ([::1]:54538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnh1C-0003UU-8g
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 09:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nngzH-0002km-CZ
 for qemu-devel@nongnu.org; Sun, 08 May 2022 09:30:15 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:46983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nngzC-00030C-ML
 for qemu-devel@nongnu.org; Sun, 08 May 2022 09:30:13 -0400
Received: by mail-qt1-x829.google.com with SMTP id o11so9267015qtp.13
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=8gLG2pWSNttgBwMQWqBo8AZHq9TWAN36W9nQGy+bhhU=;
 b=gamFuI+omJro5WHONjP8Hfvimr9GiS3FVxSKEhBtGGA2n7qLjQCnoRmqr72BPgE5ef
 MjV9wZbc6dXcua6IdorCQRsTlj1tf4YftFayCVvoNFcqCHdKrhzrE/vuYU8Yq5+OBBt9
 DtFAem8O6FfeX/5/NMinGB6Pqvj/RlOHOjxz0mBAxcZqqDDiuYKvk5ZoaGlu5DDeSnZi
 PSXyyAp7LAt4Y7T4V2S0tOEy5vfeSsGpnjvIIn/XKJ1uwRVTS9v3MFozrxzPCcFDHIY+
 kbiDS7RUIHChS0OsUm+sANYDWwOKz4tjAMsip0QcV04f0tM0phjpZ3OEq25wvaVMKpBM
 tZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8gLG2pWSNttgBwMQWqBo8AZHq9TWAN36W9nQGy+bhhU=;
 b=auW5lu3xxQFiAx+teJDJHNW928OiYvFU+pOadkAPjwm3RiTy+yZrk8hoqercz01V9X
 u6ksjAU0aeY6zrEhEWZIMxbtslRhLrpg+hqV6UrcT9su/zAanhhSdkU4pcnsTdBQGdtd
 RTYAstQdNNlGdw9HfYgu7VqkRVpMXPI7Z1SqeRFImxiGM2k/0y3922EGa4niWl1/zg4l
 uQqUoLXLcOXORd8CWheAiNg1AZur9BE5p5HQHqHGwa41PH4Bm5UZjcqFgCxi3m5I3CLK
 QssEQPp/mU6KmbzrsbtEaele+wUVntJhrx8LdIYnmkWervyHm65p6/D77Em+THpgWm20
 mrRw==
X-Gm-Message-State: AOAM533lvUx74KrF18l4ZWwx9ELy3VNnLA8MHjmz81wNIWPREYwAOHUX
 9fWby/G12hEhLgjNfV4hidJ7uw==
X-Google-Smtp-Source: ABdhPJwsXEkDgBiKK066qOIhboUI9MHbigxaezRD3K8r4EKO0QWmYDbVjxW8lPC4VDhuiRfl253E9g==
X-Received: by 2002:a05:622a:50b:b0:2f3:a8f3:2ffd with SMTP id
 l11-20020a05622a050b00b002f3a8f32ffdmr10751320qtx.70.1652016609452; 
 Sun, 08 May 2022 06:30:09 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac81244000000b002f3b561957asm6075712qtj.13.2022.05.08.06.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 06:30:08 -0700 (PDT)
Message-ID: <2de64d1e-b2a3-4b7d-cac8-2bc0399c972e@linaro.org>
Date: Sun, 8 May 2022 08:30:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 00/50] hppa: general improvements and tidy-ups
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <d00386f5-238b-323d-0442-a1ea35ba5da1@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <d00386f5-238b-323d-0442-a1ea35ba5da1@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

On 5/8/22 04:21, Mark Cave-Ayland wrote:
> Richard, thanks for taking the time to look over this (rather large) patchset. I've 
> replied to your comments, and from what I can see the v2 patchset should be fine to merge. 
> Are you happy for me to go ahead and send a PR with that and the artist fixes?

Yes, please do.


r~

