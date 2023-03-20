Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2276C1A78
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:57:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHrn-0007T6-If; Mon, 20 Mar 2023 11:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHrj-0007R9-5P
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:56:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHrg-0006zJ-SS
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:56:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso9493977wmb.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679327763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rURRgWb5ORslYjZrNVNt6tUhtsC9ll24Yd3qEbGnih0=;
 b=nSGThxM4RAv/EYEk9ZwheHBBSrHhbqnlkdw8xdbvnPcrFJhCKTz98BXKMLskhCuLuD
 JQ++a2iuOlbFU74zxdZFg8ixEopsjLf7Jv8NkdtiRF6iFdun8N+VdHOqCb63bxd2bTzW
 UFRbKT4scdP5MOqaa12YaKgGLrEHrl3kVggy4iJD9YkkI5KllkQ8LfbIR/XWXFylkQOS
 zgIqIuKXBLDEzSvdaVIGgE3C+EdGdpmEgvWlyxoVPjxBuyN4Y5GDr1QKE+Nkg4M9k4Qr
 hpuseq5WT+RxxVOn9YOu+b17+Kf7SS4gKApf5HmIkr1huhuWMLSQkxnHkgSI9gRGTvkw
 T10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679327763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rURRgWb5ORslYjZrNVNt6tUhtsC9ll24Yd3qEbGnih0=;
 b=tOc0OMvszvTrXraaYbpwRxKqjBQiPm8gqi7LUmARhEM/IbnC6CtBK5DbTOeG2S+ZIe
 qFG6k72CgQR9lBaOozoPxxsMWH7qD89mx1jtd1w61qi95p5TbJProoD/utYvfDaSeBii
 hFPM7HIITRQzJMoctUqA4h+gG7u9tlGYDQoAzd6c9Xrl1nFViTG2RrsP/+nNJHsEQ27m
 TCvljVEbI3bzpJENLCJVb2jyqdHsJLo31tAfRo8aT4MKpALfd0iWR7LM8iKb1mJjSJiN
 bsmbo52Mjq6FQg00Ow3laVKmXK0lBvHrhNS1YnHr39gx5rFUfDimWE9xkiCM3gupYBjR
 CPyA==
X-Gm-Message-State: AO0yUKXDmOnisX66GFwUidL1K2nCTsgbxaT2lT+uhMbpjA9niMnYGC4a
 CmgaeM9JauU6p2J9pSd+wT1sef1WCknJmhk5fkO24Q==
X-Google-Smtp-Source: AK7set+u1Ekn+TOveZL0aveFCBqyJ1JHppyv8OCPQVJ30W6ckdrh+gFP5XQvfhL8+NdN4BjaX6tjsw==
X-Received: by 2002:a05:600c:1546:b0:3ed:22f2:554c with SMTP id
 f6-20020a05600c154600b003ed22f2554cmr26068406wmg.29.1679327763054; 
 Mon, 20 Mar 2023 08:56:03 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b9-20020a05600010c900b002c7163660a9sm9200463wrx.105.2023.03.20.08.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:56:02 -0700 (PDT)
Message-ID: <19ac8d20-5626-b014-aa77-607c757aee46@linaro.org>
Date: Mon, 20 Mar 2023 16:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.1] block/dmg: Declare a type definition for DMG
 uncompress function
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230320152610.32052-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230320152610.32052-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/3/23 16:26, Philippe Mathieu-Daudé wrote:
> Introduce the BdrvDmgUncompressFunc type defintion. To emphasis
> dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
> declare them using this new typedef.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   block/dmg.h | 8 ++++----
>   block/dmg.c | 7 ++-----
>   2 files changed, 6 insertions(+), 9 deletions(-)


> diff --git a/block/dmg.c b/block/dmg.c
> index e10b9a2ba5..2769900359 100644
> --- a/block/dmg.c
> +++ b/block/dmg.c
> @@ -31,11 +31,8 @@
>   #include "qemu/memalign.h"
>   #include "dmg.h"
>   
> -int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
> -                          char *next_out, unsigned int avail_out);
> -
> -int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
> -                            char *next_out, unsigned int avail_out);
> +BdrvDmgUncompressFunc *dmg_uncompress_bz2;
> +BdrvDmgUncompressFunc *dmg_uncompress_lzfse;

Unrelated, but since DMG maintainers are Cc'ed, upstream lzfse warning:

In file included from ../../block/dmg-lzfse.c:26:
/opt/homebrew/Cellar/lzfse/1.0/include/lzfse.h:56:43: warning: this 
function declaration is not a prototype [-Wstrict-prototypes]
LZFSE_API size_t lzfse_encode_scratch_size();
                                           ^
                                            void

Unfortunately last upstream activity was 6 years ago...
https://github.com/lzfse/lzfse/pulls

