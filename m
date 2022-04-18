Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326CB506021
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 01:17:37 +0200 (CEST)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngach-000633-QX
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 19:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngaZt-0004rm-La
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:14:41 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngaZs-0005UF-0l
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 19:14:41 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso639991pju.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WkwG6YVk4LXtMNzlZ71lQ7fKSKr33L5EMy9OmJs3e/I=;
 b=m94j0LZfDfTMSZqgEVDUsH12QY6nTn2tuPWk+UmRQZhnGTxWQZdUjdtk9COGCopCBd
 /InwyfD4Uv/joWXFbn7pFbHJ5US4kPIx/aHx4VkDlfIJwsNBeh6OH4iUdOacuVJr+rRe
 DJHaZrqRFxfL2WpNXpq5evmEXD5kTbca+Yj6hOaGyHX26v4i1VzwV129yByhfBPhX830
 6rZFmsVSmpKu86IAWpA+ltw0D3oru4/uOToXO6L6MNAowSG/VMYH3tBxIJlwQGsoY3c6
 38c0N30IBts2JQbz8NQoR9pa/fBYfyhBNnipZ+TAw/WT5BsJA8lIHyueyjCAkFCGLgqS
 dujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WkwG6YVk4LXtMNzlZ71lQ7fKSKr33L5EMy9OmJs3e/I=;
 b=zGPFkB4lQdW9lptGYBUEdXuWbVyraxQHYKoBS2suFlIZlmqEc91jpQlp4u3OGOhKk7
 iALsGkgJ6INA0ADqwWPtILLXFLW1w8a/A3uyFGJOhe2rbDZEhmUvoAxZa3cEJBh7JQrX
 Ik45e1F1ag8BEglKHY4zLCwo+2Hr6qqXJlxQVUu4CWkCI3uoyFHUyl74tz6AUEWKzxwn
 GFapf1Bs0kKkIHG72OlPvwqPAcPf6Pv/XqLMBu7eqe9y6kmnXlPdTId0UkFj0CXMJZJV
 TqhQMW2LrXh/RUFCt1w70bSXU97pfenmZPEagntPbUaD1N5DY11solQkYc9UpOYu9usB
 9KQw==
X-Gm-Message-State: AOAM532UfrtO3DwAVTSBn4AXkkRDJC3Ha/VUFoqZroZGqukz9zoT0eBC
 47QrN6lpsCfQZB/lb4jErJoJYA==
X-Google-Smtp-Source: ABdhPJyv+fa7k81UK6eF6+RXpwGYTJcrWATk9C6gRLBPF/lwaJA3ey3QWmNWaQz7YEdV+zGwIbb3bw==
X-Received: by 2002:a17:90b:4d11:b0:1d2:a600:3014 with SMTP id
 mw17-20020a17090b4d1100b001d2a6003014mr6460751pjb.108.1650323678001; 
 Mon, 18 Apr 2022 16:14:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa79d84000000b00505f920ffb8sm14080382pfq.179.2022.04.18.16.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 16:14:37 -0700 (PDT)
Message-ID: <07fd9de6-422f-23b3-d461-fe6e95090391@linaro.org>
Date: Mon, 18 Apr 2022 16:14:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] TCG support for AVX
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220418173904.3746036-3-paul@nowt.org>
 <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
 <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 12:45, Paul Brook wrote:
> Unfortunately the table driven decoding means that going from two to
> three operands tends to be a bit all or nothing just to get the thing
> to compile.

Yes, gen_sse is awful.  Which is why the previous attempt at AVX2 rewrote the decoder:

https://lore.kernel.org/qemu-devel/20190821172951.15333-1-jan.bobek@gmail.com/

Anyway, do coordinate with Paolo on this.


r~

