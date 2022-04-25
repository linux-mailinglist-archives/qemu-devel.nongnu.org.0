Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F0A50EACA
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 22:44:42 +0200 (CEST)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj5Za-0003ht-0P
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 16:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5XJ-00017G-Cy
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:42:21 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj5XH-00079J-S8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 16:42:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id j17so15936227pfi.9
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fo7xpoCzvDa4WE4pKx6024TFqDY8qEg+AIKyLvd2UGo=;
 b=bcpScmAXfeyDyCuhzig2L7kx/H72WasGWEmrhAOeQdGjG23hE67Zdz30wnPkOchVSi
 Db7GVLMBtJ7rNGpo1w8HUZYsiVZO3E9PaqiB4qfzKAkVw8djNrIEcj+M+D16T7+3u/yR
 KtnzFoPHFCwt2t3lUEXyDA/VjGmzXDdL8ZuwE5Qswuq2pN3o68rY3adaObWg1Owe6U3Q
 2GCRI51mMVyxrCQw2O0LCCWeMzVd7S7n9Vw+isvxW+RrfMiWocccEkPYlIyIHIn9do2d
 W6CznK+mr/qTn7a0UH1HwOKq8yDDC6JLR41aH6h18LZ1G/2TPhcqu0tH/vB6Yex/b7gq
 zp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fo7xpoCzvDa4WE4pKx6024TFqDY8qEg+AIKyLvd2UGo=;
 b=dGqIoYqPuJdaK0mwXYGhGdXfwSa4cmB+tfrGPjt/r80tx4Nackr7B2CtFNF9EmCmtt
 L8rt32OBKhRuRbAQkSxz9zYunLFbFgTefjMwxcX7wF021WbfKTfsAq/tWb65ybtSQAK2
 jgUcnnWNyUCQyT7kmxQgV2ag0URFbj6dl2G4ON4txopr7FHGdsZueezpmncDHszi/PwF
 Pm7wwmxenoHd6+9Umli3adS2z/pRR+C3rFmnA0XmnXrgEIcl7OO4XgRUSGXt1k72hIGb
 7KXhgxMxfK9amN4QiSu+Zajb2vFD51y5L/oZ9s/m8TGvNE9DYLW7QoqyVBqmIXVTVjqL
 mePw==
X-Gm-Message-State: AOAM533++d7V66oZxQ/N/L3Ct4LybPCmkV5Fw2CrfUmfOrcxsvBrG8xd
 rvgfZ3ux/tFakDHhGFqBG8Xu5w==
X-Google-Smtp-Source: ABdhPJwrA5zkuPZvzM059N0Fh7T6d8rsbZ/SyHr197avft+Cbfhd9X8Y8nzsOuMMfnRU0mn3TA7AMg==
X-Received: by 2002:a63:6bca:0:b0:3aa:8430:cd22 with SMTP id
 g193-20020a636bca000000b003aa8430cd22mr16173212pgc.156.1650919338572; 
 Mon, 25 Apr 2022 13:42:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 8-20020a056a00070800b004e14ae3e8d7sm11927453pfl.164.2022.04.25.13.42.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:42:18 -0700 (PDT)
Message-ID: <cca640d3-9d76-2cef-1baf-5b6ef95d1af2@linaro.org>
Date: Mon, 25 Apr 2022 13:42:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 07/42] Enforce VEX encoding restrictions
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-8-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-8-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> +/*
> + * VEX encodings require AVX
> + * Allow legacy SSE encodings even if AVX not enabled
> + */
> +#define CHECK_AVX(s) do { \
> +    if ((s->prefix & PREFIX_VEX) \
> +        && !(env->hflags & HF_AVX_EN_MASK)) \
> +        goto illegal_op; \
> +    } while (0)

Likewise, fix coding style.


r~

