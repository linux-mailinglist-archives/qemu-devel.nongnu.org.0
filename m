Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED14DB143
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:21:35 +0100 (CET)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTan-0007X6-S3
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:21:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTYw-0004cl-GH
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:19:38 -0400
Received: from [2a00:1450:4864:20::436] (port=41869
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTYv-0003Am-2u
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:19:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id h23so2337698wrb.8
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dKFlv/p13cbMGhUpDPhMcBcExODto9UI6wt7l4imvo0=;
 b=AG6QKmK/u5G693CK0GkaRquWqBJw+srCDyng8EPfoYDRHdtY3bHqIGolcn96JZwTz5
 L8LcMQSJJs8rU6p7DDe/Qm5gAu7hv+jUmJTret5HMFzZZegaGLW3QIhkgZoueLjWctfU
 5fKItn2cGDw2/1xIgP3KufimdhC3cgTRhTtbp89j2XyF27gAqpybgRthFMvlaUd+uQlX
 Ka2AVeQARs9QJqR8QQnY+CIZ4OecXg1muplIIcyT5uyjmYzotJOs12KbBI6ZCiWewX81
 rz/erwgb3gk/AI5rKCtGuH/Vw7AtfTsF3kSKqlMABMHeZ+cmLkj5s4Z//2nZuZJ73g8J
 +8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dKFlv/p13cbMGhUpDPhMcBcExODto9UI6wt7l4imvo0=;
 b=sLFMbZefZkc5ksqOtJ2+473gwLt+yV4FbZBMsGycIOyEad2Nydv9kYqJdZH0vGB8lo
 ejUhhAh5TvrcqJgDpZNjigiwPkMrGEkCWbZEPaeCz2GXplYPgeGn59zzFOmh0dct/zNf
 oBaMJ17/vEQqQLCad6GssLan0Q2+eJv9OTskrtrg0bwb8SwEi9qtH1BhvQJdDnx9Nzy4
 JGfe6Qckpi32yEUGIW9ILAqyi7m72zsMeeBlXeXimpCnveGHHUIMqBPijzBfbXimcV14
 a1sN6uBcig0jE9x0ciMUZciP8nZhqJQhm1bFMXOXQwnlM+50j0G/1vN2M0V8pqi+kLHh
 4UTQ==
X-Gm-Message-State: AOAM530eVRkKYtYE290zcTjOtLME5oz96AV/b68cZOP0kRvQNi+SGIaO
 ADOjCUFl6yKw1riao9adtOZRGPbIjLQ=
X-Google-Smtp-Source: ABdhPJwZ6iC4SZ+CRRe8LsThulVC2N3hAVfkV03w6JyQPiQkG9qX2sF7z2kBzu/x7fioWFa88x++wg==
X-Received: by 2002:a5d:6da9:0:b0:202:293e:85ff with SMTP id
 u9-20020a5d6da9000000b00202293e85ffmr24815598wrs.159.1647436775699; 
 Wed, 16 Mar 2022 06:19:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm5043289wmr.8.2022.03.16.06.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:19:35 -0700 (PDT)
Message-ID: <b4896642-b471-7c81-5da1-6a09b0815e2d@gmail.com>
Date: Wed, 16 Mar 2022 14:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 09/27] compiler.h: replace QEMU_SENTINEL with
 G_GNUC_NULL_TERMINATED
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095301.2613635-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095301.2613635-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> One less qemu-specific macro. It also helps to make some headers/units
> only depend on glib, and thus moved in standalone projects eventually.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/compiler.h    | 2 --
>   include/qom/object.h       | 6 +++---
>   scripts/cocci-macro-file.h | 2 +-
>   scripts/checkpatch.pl      | 2 +-
>   4 files changed, 5 insertions(+), 7 deletions(-)

Preferably poisoning QEMU_SENTINEL:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

