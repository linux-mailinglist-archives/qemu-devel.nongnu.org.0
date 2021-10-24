Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C548B438890
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 13:19:33 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mebXI-0006sf-EH
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 07:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mebWT-0006BO-2V
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 07:18:41 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mebWR-0004Fe-Kr
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 07:18:40 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso1863711wmc.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hC2ROvRhq8ySPx31tUgyPwfZCKQtqHjtM9lDYcHukpk=;
 b=GAnYireEosSJOqaa5WMXAmGDe2ahEl5DbITC/lgJGH42sFDMmSFCrBVBWytoYS7JEK
 JrXp49tECUGdSSaXyp3zFwSf3xQkXuaHS4lh07kGJVzb+U77FZbMSUH6DkrzunAe4YS9
 uIHwk2RDwGa7Ghi23eFEogZzwepCGr8VCgaQQ7XVYLYWdmpUx8d0wS/NwDcDALuOWlT7
 fgoHtiuiDTIqkp96zJTR/dPnlGpK9YVmzW7ZzhnyMX2hN5frzdr9nvIPjLXiNhdsmSzd
 PcAXUfVdHZc7VQxN76yR40tAvWqqzkQJD3F7UJ75Sq1cv2lfSO6bGFEV1hvHm5i/BdpR
 zvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hC2ROvRhq8ySPx31tUgyPwfZCKQtqHjtM9lDYcHukpk=;
 b=M1R8uvAojUFTrHnYmtRdF8Vk6KQM/xEIlHhfsEn3AtmKbJSJWlJIWa5MlRb4a4agzD
 kUUPw7TJ/wqQHDgIW2WANRMSBwLL7qyUwyLl+QQA44qLkSLq33pQmZ5cOU07img92plS
 KUTZqD/8cGb5ozma37ukuFu/SNuxHM9I6TXQmaC2iXFWNH/EufBlZZfC8dONYdOR/nPv
 R/xRIZpw+qWOZIoB3h9ktvyimXAe8fu0t/pI9povykJj9btNyCnXtx3ac1BhyZYguvMj
 DMqhIwSeekbYIIffFwyfh0WxkUA4Z6n+nCmTZx1PTdNQWYar9+3R5JuvtYBufRhnEBJ8
 1qgw==
X-Gm-Message-State: AOAM530Lx5mrGfUZyPK6aobqHgwZfUHg8gu9LBU6B99RrL8LBGzjhGJL
 GWPaFbyPHaoYj6NEYMp3CNs=
X-Google-Smtp-Source: ABdhPJyOpJt1DEQgtVcFH911eidjizwIx1+8a8A5j2xAcoEzLBKv+jXwx+meB5CIvOlLH8sZo3WIxw==
X-Received: by 2002:a1c:1bd7:: with SMTP id b206mr2585701wmb.57.1635074317761; 
 Sun, 24 Oct 2021 04:18:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k17sm13096708wrq.7.2021.10.24.04.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 04:18:36 -0700 (PDT)
Message-ID: <5f225ccc-e84b-eae9-ffb9-35853704c9e8@amsat.org>
Date: Sun, 24 Oct 2021 13:18:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 15/33] target/mips: Convert MSA load/store instruction
 format to decodetree
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-16-f4bug@amsat.org>
 <afe60d73-0cc5-3af1-2da7-52f5d5a4adfa@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <afe60d73-0cc5-3af1-2da7-52f5d5a4adfa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 06:53, Richard Henderson wrote:
> On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
>> +#define TRANS_DF_E(NAME, trans_func, gen_func) \
>> +        TRANS_CHECK(NAME, check_msa_access(ctx), trans_func, \
>> +                    gen_func##_b, gen_func##_h, gen_func##_w,
>> gen_func##_d)
> 
> I think this would be better as a table.
> 
> #define TRANS_DF_E(NAME, trans_func, gen_func) \
>     static void (* const NAME##_tab[4])(TCGv_ptr, TCGv_i32, TCGV) = { \
>         gen_func##_b, gen_func##_h, gen_func##_w, gen_func##_d)       \
>     };                                                                \
>     TRANS_MSA(trans_func, NAME##_tag[a->df])

Nice tip! Thanks :>

