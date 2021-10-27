Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E343CCCF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:54:20 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkJn-0003l8-HG
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjad-0003J7-TH
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:07:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjaa-0005qz-HK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 10:07:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2487504wmz.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4s+xmPXBvZv58VIqIqj5Zn0KqPj1LTfpGmlAVpcFv9Y=;
 b=bOxaFwfsoN8RHulZm1bGnLyH6Etj811Y5QsleHoJDnFwbo7KwbW2atx65bL2iDouoL
 V9XytPJgW553yq8fWZboDSSypVL3jqS7UeR9f2t99kC5ONbH4RCc0Du2BN9i9XV7nonr
 Z8SOvMWHMw4BqVkmv6deY9ePzQZEGdPRiXciD/VQLg4Ax88PJpQ6ItVwfUVjoCTy0CHC
 BQjedIC7HLCD60CjsZ3KN3DsRd5LNwhg8bPsXanp9U1KJTPFFT7N3lwMmGzH6njxN4an
 i0mJcx/tcmTQQ6D9kWUGMeARgsSxcHMhH1ZJOt5mwA4gAsOcbw9j9gwJjfvJ50+5bPY0
 rYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4s+xmPXBvZv58VIqIqj5Zn0KqPj1LTfpGmlAVpcFv9Y=;
 b=0EpU/OfSw/D3bmp2eaI9jeQROjtUiYIETD6Z7N5L1PN63NwVi1YiaUa3ELGfj0ZwEy
 s2tXU6ywA4yvSyZPHlBr8gka0T45C1YKHEnCfSnyjZmp/sazowtd0txmJUFWZk5ljrZi
 60mtTAXb5bK/UjFJK6ZVgdlYLMUZ1OFdtv1tKQFbiotjP0plzyB8kClfCZec1fh1oJ7b
 XQeny7i3ScKv+r8hSbNDSj4W897E9DI8OlzXf8zAqncEmlSi8vpBu5i1Dn2Q72Rie7ik
 Yqf0/M0eHbgP6TrUajJJEIXEV1P3VzGE9JJzT/n1Lc7h5TQ7md8mkIWQ++hbkhLG5p2e
 VvFg==
X-Gm-Message-State: AOAM533jrziC4bHFsaWe/JEb+lebYia0GX7WdS7B0cbrALM1GEex/tog
 0BHQYHn0mtrySA9VwM5KUds=
X-Google-Smtp-Source: ABdhPJwjR9WSzluWsTAQyUsUxyGk1GT73csiZDUzpablANjo8I5ExoI0dxi/Rigy3JRiCQiJkEJOug==
X-Received: by 2002:a05:600c:796:: with SMTP id
 z22mr3593759wmo.188.1635343654847; 
 Wed, 27 Oct 2021 07:07:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f7sm4524181wmg.14.2021.10.27.07.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 07:07:34 -0700 (PDT)
Message-ID: <cf314faf-16f6-850d-ee3f-f67872c93d94@amsat.org>
Date: Wed, 27 Oct 2021 16:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 43/51] tcg/optimize: Use fold_xx_to_i for orc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-44-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026230943.1225890-44-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 01:09, Richard Henderson wrote:
> Recognize the constant function for or-compliment.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

