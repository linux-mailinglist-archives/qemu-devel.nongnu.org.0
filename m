Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F253065C
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 23:53:23 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstVq-00062x-RI
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 17:53:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstUs-0005Nn-Fh
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:52:22 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nstUq-0000xA-Ay
 for qemu-devel@nongnu.org; Sun, 22 May 2022 17:52:22 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so15891172pjb.0
 for <qemu-devel@nongnu.org>; Sun, 22 May 2022 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ye/ieyy2cQGInrwD+W99/8R9n3KIre/3qKdqqyrmTlc=;
 b=n13t/SbRhpPLggMzgk3VEN+6b4+XaFegF0sRMeYoT0xOOiQUVMHCEEVPee+yoeWRpg
 9I4MNuhSLII2q1QbWkD5JlWztgW873x+CZmW1x+LhVFlIV/7OqHGGrBp9KcPQkVhRz/5
 4OwMBZXWAHGqc/xCZQFhUfB4inzA5zZu0CNOxeF7Is3RKZLFx3036gdLtOee0LjeNi2p
 LB9T2hSWgKrHG1WmTlNTsrWXiEvHqcbKyUSkJLbqpQh9kJ3aR27QHgdKjVwZrmGHXqPR
 cGFP9ipBl+PmKizBLw4X1ZtccDVcugsBa1ferq1gPxpcukVt8HRypaKAh9nyqQ+v3Azo
 2Tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ye/ieyy2cQGInrwD+W99/8R9n3KIre/3qKdqqyrmTlc=;
 b=crLWhcwFNMXm4iorSGvPVT7UH4QSLKNI1J057CI2PwVR/c3TPODKqcTR3GJcx5EXB1
 M/zc8tZWUbQlYlyGHBkmSUjIlnjZOqP6CZTm8SlWCH6XoD+JxTIJQu0MgiV2i2CvnnaS
 zblvxSb8rXHQaCnK4mpSf42v58Ey9MyzDRrbScujeY8uPrAIq8BlQ+IAtY+PXNG388wc
 cvGp3qbv/dxYyC4M9Wif78xabWxIeNBi9pXbTJlLpiSptgp89UJQPu+qBHj2QMRN/2N7
 spL2R3JD2iQ1dFdBSdJ6BfuedTCnnDh2DkxeCmP3G4ezSH8zcWSBAhzXHzYVMQjRSoj0
 2dMQ==
X-Gm-Message-State: AOAM533gJm/psraWD8S2eimSJZJSIiah7XStctNr7gyW6BTd2b4dVIgK
 0cvR4gNZF7mzwmrycQexfoM=
X-Google-Smtp-Source: ABdhPJy+N97wtZlA7Lkpo+qw7AGOyIM/vZfjPXijKFqzhQ5V/5e6VroD67T/JQLE/A6/L9EzS7JIjg==
X-Received: by 2002:a17:902:f688:b0:162:28c7:73cb with SMTP id
 l8-20020a170902f68800b0016228c773cbmr1398283plg.63.1653256338903; 
 Sun, 22 May 2022 14:52:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a633709000000b003f5d4d4f947sm3401431pga.78.2022.05.22.14.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 14:52:18 -0700 (PDT)
Message-ID: <ec227a28-87bf-04e9-3a03-fbe65c302e1d@amsat.org>
Date: Sun, 22 May 2022 23:52:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v4 11/17] target/m68k: Implement TPF in terms of TRAPcc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-12-richard.henderson@linaro.org>
In-Reply-To: <20220430175342.370628-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 30/4/22 19:53, Richard Henderson wrote:
> TPF stands for "trap false", and is a long-form nop for ColdFire.
> Re-use the immediate consumption code from trapcc; the insn will
> already expand to a nop because of the TCG_COND_NEVER test
> within do_trapcc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

