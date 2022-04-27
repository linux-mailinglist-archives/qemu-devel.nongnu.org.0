Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4663512549
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 00:31:53 +0200 (CEST)
Received: from localhost ([::1]:50400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njqCO-0005BR-SL
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 18:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njqBF-0004MG-RF
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 18:30:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njqBE-0003Ne-9Z
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 18:30:41 -0400
Received: by mail-pl1-x630.google.com with SMTP id n18so2762783plg.5
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 15:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BZ7Nfodjlo122spo1KiVOZJYubrbkroaAgSi1pzR5ls=;
 b=gca8MWVZ/DQYkYkObOmarG4ckOI/yVBksGIxnZo8LObopUxF2yVj6aYXuxnGjhEfpL
 F0D9qvnrlnlgilcBrRCoOdNrhaQ8t4FVTvS94HiAdZiR+3GEuvJLB+TLjROpdbzq8ZKJ
 mmmGjP2Ghpc9aSaqo7Nj9T1ltePmRbiiOWrNjly7IKPghUxpjobxZ7Ncksx1FeX7riju
 gJHRiu4qYI1mxd0ESQRQKDTaS9a9/2zK3x3tqhF4iWebxz+7tnXYryjLYKboe5QVL/2i
 hDkL5OiQhFmuYafBOSWX1Wu01/sfBSn7/JJ9qkTaMiGTYFeXyWe6+y4PCWEWF3pU+o79
 s4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BZ7Nfodjlo122spo1KiVOZJYubrbkroaAgSi1pzR5ls=;
 b=x4Y3oA9YAVQRpBNCuvkNaItQ9MMAvXRiMajiHmASeyNKcvbcfNXbDY0x9PCoSbPnrS
 OwIgizpKULz1VONXZUihqCe+icqlOVf1L+5+0eljPFzC91B4o/kz5wWD6xpwHEy3BTEI
 kS/Py9T+/yv9+y3wyNOkjOJUA7mi1gaRUc6KsXjydiX6//fWPEEieeFfdn9RwHsy2F09
 KS0gIvUOIedDzj1nUjdBBc9IMYlMuhMpmvj8Zg+LwcMjx5RvD9HlhJzX3Iork5ToCM1F
 SjkZK5KkgOWp1ex5nq93kNMo3spCYk18NeY5gAJHcmvhPHkPUDar74Zyl4mUyZYs4dOc
 KG7Q==
X-Gm-Message-State: AOAM533Viv+AhrmRVbGFPTbv39fYKMLiGTTHpC0Nj77i0R0w/NsHHy9b
 uUfWD0AgsxB/Xbfu9m83LCWqgw==
X-Google-Smtp-Source: ABdhPJz1CrUsBTvPy5liFbsXOi6yYd9hf/B+Dqy9C61LFafvLuF7/ysIeYGeLbi80e8fAfICGiTmOw==
X-Received: by 2002:a17:90a:730c:b0:1da:4630:518e with SMTP id
 m12-20020a17090a730c00b001da4630518emr4560271pjk.239.1651098638783; 
 Wed, 27 Apr 2022 15:30:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p66-20020a62d045000000b0050d237e38fcsm16608534pfg.220.2022.04.27.15.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 15:30:38 -0700 (PDT)
Message-ID: <d330b650-1886-cacf-61b6-f829876f9614@linaro.org>
Date: Wed, 27 Apr 2022 15:30:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 5/7] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
 <20220426125028.18844-6-lucas.araujo@eldorado.org.br>
 <e5abeb2f-892f-af8d-0457-c9f8e66ddeb6@linaro.org>
 <b7441766-6fa9-7438-fe61-c041d4237fe0@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b7441766-6fa9-7438-fe61-c041d4237fe0@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 14:11, Lucas Mateus Martins Araujo e Castro wrote:
>> Please do convert this from a macro.  Given that float16 and bfloat16 are addressed the
>> same, I think the only callback you need is the conversion from float16_to_float64.  Drop
>> the bf16 accessor to ppc_vsr_t.
>>
> Will do, although I'm considering instead of the callback being the conversion, maybe have 
> it be a 4 float multiplication
>      typedef float32 mul_4float(float16, float16, float16, float16);
> Since float16 and bfloat16 are addressed the same, any thoughts?

The multiplication would be identical for the two types -- only the conversion is different.


r~

