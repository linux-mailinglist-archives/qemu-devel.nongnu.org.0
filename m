Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE86E8DBC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:14:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQMh-00048K-2A; Thu, 20 Apr 2023 05:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQMc-00043F-Mn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:14:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQMa-00055K-CK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:14:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so2756297wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681982039; x=1684574039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zNvESpLRpHogoQwQn8P/jwZ/Kg9yVq4mUIyGrKpioXs=;
 b=ppNzTiY/poczogv/KfMiUFrn6sBcfGIV3oSRfu4LrLl1TFRUvU5wrWUhFAYygBh+pn
 UuuqjXE3EMvNOTftdnj7bD1CJTeS9KMt9+5qeZuHUXnqRmWLst+MpfX7Dla54VxqXyE4
 sm6ahuLH9P6FIdjBBz+F4GMBLv8dxJTWDQdOdGw3nc5pYOQibV5Qm7XYCt0ZypQMA/Ja
 4XVOkGEn+fEf+wo9SlTVVNIbSeHzwKSYRPQqLHfQD37QcUgJcMDRTzXW58oh4epk/RNF
 RxQNnF1wjLRWb/EDgMqS1o14jZca1cUQie8lQEEVC3aAyZBRbz+YriBbd5cVukCXow4n
 oDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681982039; x=1684574039;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zNvESpLRpHogoQwQn8P/jwZ/Kg9yVq4mUIyGrKpioXs=;
 b=Z1bOhxgERX7uv85GIaaIqdX1ZcMeVPtIgsVMz4/6FFM3YRFkMbVQaIU81vN/pY8BTQ
 G0d1O1w+K41kZV11djAi0SAUlfQmmoY05P5p7NkAedBmIHw4YV+Stjh30wEEom5jn9ba
 0f3M5jV1aaG30x68tD43T5nvd8W2NhGC26p4NzpoKYRN0LF1TF4kDPdqiX/vLzOT2iHM
 0mnExnXNa2zsAL+cRrtC8X7GB0gJGDknl+ofCJISMnuVRGKhmUb5VWo6P4sVGEnHoHJL
 w8tbbnBgN+7Lo4V0Dd4evQPsWof7JXOU5X+YN3kCHVZyDIdZfbwIYpfCU+ELglAuPvY6
 yHFw==
X-Gm-Message-State: AAQBX9e1e7UQs4pq6KatTe0sbg1DipFPuo20SYZ9eMU4AlAQqgoaRHkz
 SG6ZohMyQQUch/mK7d+hRF/yoA==
X-Google-Smtp-Source: AKy350bzQlXWbOCJ/rvv3mv3reMXnWDFlUnY0Q0o71oEXmGQb2q1mctkEC0vN0tBFjd7jNdWX4Jiaw==
X-Received: by 2002:a1c:7906:0:b0:3f1:6ecf:537 with SMTP id
 l6-20020a1c7906000000b003f16ecf0537mr691584wme.33.1681982038786; 
 Thu, 20 Apr 2023 02:13:58 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x9-20020a5d60c9000000b002fbdb797483sm1408373wrt.49.2023.04.20.02.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:13:58 -0700 (PDT)
Message-ID: <6764a0bd-7d05-8206-e526-828527fac34d@linaro.org>
Date: Thu, 20 Apr 2023 11:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 05/10] bsd-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/4/23 18:40, Peter Maydell wrote:
> The '-singlestep' option is confusing, because it doesn't actually
> have anything to do with single-stepping the CPU. What it does do
> is force TCG emulation to put one guest instruction in each TB,
> which can be useful in some situations.
> 
> Create a new command line argument -one-insn-per-tb, so we can
> document that -singlestep is just a deprecated synonym for it,
> and eventually perhaps drop it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   docs/user/main.rst | 7 ++++++-
>   bsd-user/main.c    | 5 +++--
>   2 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


