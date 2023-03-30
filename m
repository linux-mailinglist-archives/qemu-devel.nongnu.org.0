Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF86D0836
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:26:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtE9-0002ik-An; Thu, 30 Mar 2023 10:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtE7-0002iC-9j
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:26:07 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtE4-0003D2-Ff
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:26:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v1so19294690wrv.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VRtt4OG9SQlNxdJdFJl1jzjMIM7XyvmgOKJ+03xqTg=;
 b=ufJpQcekx43ba7tTPuw7ViCELmWFXx9IBA2325cfY7RA6RJdvBr9+AvIPvT8FF8+UP
 9eTsQxcIHuaJDg2BZBrGyhAsIKOA85mtmaNpD21Dtclmq6XcuRjEHfiOnmMfJ20ANC8X
 7CAThcjOlGRl9Y1ZIqfG8qOJp4N3iSl3RY4AG0pGpXnliJavvwQx+7UAZE/FPEXoJKIl
 3qu+Ty9+k5BDXIYuzbJPOvGblaLgmjrOp72L9TG0iRYldZnq1f/oEcSpGKFHPG4n2+2j
 rcdlThP0dRCBkNpU9D6C0LyasI0K49qbDs5RXLMjy9/Ku/qpoysJxbVy62jNK/usHSIA
 2fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186362;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VRtt4OG9SQlNxdJdFJl1jzjMIM7XyvmgOKJ+03xqTg=;
 b=oBOXrMAy5Gl+t+oT60a20lb6Gy18PKcsOMhlFPhYhir91RMbzquOnm5MNPR5AdFqvG
 Kj19KNHNnoqFnaDr2lPE2eg5XxOZpzk8/Z3/Llxe+drbCImvpH/LG1+NnHGSHPfKkaYd
 auW6ulSnAhQIEAaFvWcBxSxeoJUNfVHhlrdeTIdi7B+EE7pcqhRMKTNoXu/lwsEIRvHq
 XTxfQvbFf94ToQLCE9RK3PvzlnxCMRZyhKUcbF24bZMAwm7ZmH/eZ+O2gO0aAePCCti0
 Lr5CabMAtWYA0NadNyBit2KpIBT7TpjILy2ANnf9mhY+h/PNY4Sru/8MuT1hiq0zbcX0
 IYNQ==
X-Gm-Message-State: AAQBX9fLsb9Oer0V4B7sji4g3+tnBIsiLMDRYsMSlAkp3FVeWmXrhEfa
 tZMZpKPD10RQ/Uv5frVSHzf46SGWsEMs3MLm6OM=
X-Google-Smtp-Source: AKy350bpsbjBnwgtTUdzh0PA2bxjmYefQSmG1PJ6FDImvZLcvSeWt26lE6O/deZrLKZD8mkRwM2QNQ==
X-Received: by 2002:adf:cc8f:0:b0:2d8:cacd:797e with SMTP id
 p15-20020adfcc8f000000b002d8cacd797emr18710730wrj.10.1680186362682; 
 Thu, 30 Mar 2023 07:26:02 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d594e000000b002e116cbe24esm9562522wri.32.2023.03.30.07.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:26:02 -0700 (PDT)
Message-ID: <573c666a-0fde-4722-0876-417d12445ea9@linaro.org>
Date: Thu, 30 Mar 2023 16:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] block/dmg: Ignore C99 prototype declaration
 mismatch from <lzfse.h>
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Peter Wu <peter@lekensteyn.nl>, Julio Faracco <jcfaracco@gmail.com>
References: <20230327151349.97572-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230327151349.97572-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/3/23 17:13, Philippe Mathieu-Daudé wrote:
> When liblzfe (Apple LZFSE compression library) is present
> (for example installed via 'brew') on Darwin, QEMU build
> fails as:


>    [221/903] Compiling C object libblock.fa.p/block_dmg-lzfse.c.o
>    FAILED: libblock.fa.p/block_dmg-lzfse.c.o
>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    LZFSE_API size_t lzfse_encode_scratch_size();
>                                              ^
>                                               void
>    /opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:94:43: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    LZFSE_API size_t lzfse_decode_scratch_size();
>                                              ^
>                                               void
>    2 errors generated.
>    ninja: build stopped: subcommand failed.
> 
> This issue has been reported in the lzfse project in 2016:
> https://github.com/lzfse/lzfse/issues/3#issuecomment-226574719
> 
> Since the project seems unmaintained, simply ignore the
> strict-prototypes warning check for the <lzfse.h> header,
> similarly to how we deal with the GtkItemFactoryCallback
> prototype from <gtk/gtkitemfactory.h>, indirectly included
> by <gtk/gtk.h>.
> 
> Cc: Julio Faracco <jcfaracco@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   block/dmg-lzfse.c | 5 +++++
>   1 file changed, 5 insertions(+)

Patch queued for 8.0-rc3.

