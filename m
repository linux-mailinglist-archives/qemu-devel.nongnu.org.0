Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC75179CD
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:09:21 +0200 (CEST)
Received: from localhost ([::1]:52362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleEK-00053W-4v
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle4D-0006qR-Mp
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:53 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle4C-0005TQ-7k
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so527926pjf.0
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RHQ7ls5aY5z/oizxE92wtCKqyR4pjF3fcoSmiAg89mU=;
 b=ImSVhfyj1+uvlG8zXY4xxb+Q4MTl9fVfmzmq1ZjqJFaI6m+li4ID3cRbN2es7NgyTJ
 m6mnfbzSuwCz8Kce5BL+14V8mlut2VvGCt2YIz3MRLVgCi/1aVfNTXHdl8daFmW9BOai
 JHlpPcGNfbWGwg+o1ZFCx1zo/4f3zgjNXDyBeI4bOfTkAMdVqxIGMmX0GaSzL8aRt+rN
 VRCIoxp0hnTMBcqO/fPOV6m1nifaY4fNuXuqxx3MOsv04Mj0/PvfmK/yEjVpt310GoCT
 /kw22781r3Fiufwwy3/xbp4d82U7tSVhFOOCYo4RROA5CNEgAaE8ZJUv49Gw26po6KbT
 EVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RHQ7ls5aY5z/oizxE92wtCKqyR4pjF3fcoSmiAg89mU=;
 b=JPrBEozUlmOQA/uWqUOyWL/jA23gt+DJmdca1o/rcPwJ5p5/gATINSeLn9n60bNY4c
 Rq4CzL85Pv7fNEO+TzVFXwwadzV4lFJGd6I0xO4uXxPrG7/WLZIMJ8KIuTwNtvFtojlk
 zxMhjkS82musAqPtpxiDQO6jRWc0mztwM32fPdGKtvro1JH7Z+bacC4LzfCO4MOEtTKj
 0L6/TZEcQiEu141Nf4nZuzDN0uSTNaVMnPMiDAojJPib3OZSKGnxVA5i/SGgPE4xRb+U
 uXH9K83Zlo/8D5XoBxZVxsiOP3m2VOJ6DbZIr5H/dstxPmAhr0GKY0OOrZwwXi7zkZnS
 tENg==
X-Gm-Message-State: AOAM531x2MZxeomkKJprpsFWkqXKzmToFx/4OTCY5nI/COymmz8IFdJ8
 6kMmRPnlMpapvFPJ3hcT1PfPRw==
X-Google-Smtp-Source: ABdhPJxgelO9QSeQBiwH1+eZzZYmDkauFGAwQd5oqR9bclhkoijplbM7Nu730+9yB+jJdh4YyqgvHw==
X-Received: by 2002:a17:90b:314e:b0:1dc:ae7:8588 with SMTP id
 ip14-20020a17090b314e00b001dc0ae78588mr1278397pjb.125.1651528730776; 
 Mon, 02 May 2022 14:58:50 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d3ca00b0015e8d4eb298sm5108465plb.226.2022.05.02.14.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:50 -0700 (PDT)
Message-ID: <1ed46f97-eb25-2ced-5eea-52961d264106@linaro.org>
Date: Mon, 2 May 2022 14:58:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 12/21] target/ppc: Remove msr_fp macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-13-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-13-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_fp macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

