Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B379F351078
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:00:53 +0200 (CEST)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsG4-0001WI-Nw
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsEx-0000bB-Kn
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:59:43 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRsEw-00072m-6F
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:59:43 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so2360802wml.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 00:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lm5+22f/nF8ARNSemNm0W8vZjYM0LlX4w6CQ+7at/qE=;
 b=sZhNxK82+w7PGGAqVgJtWQa4A5TPNNhzWhag43IJu83F5bG0bkGu5ZX7fq5JRI6ETf
 7YpTotMWxZN2QYYtrp6dOPsK/1wLPhehAaRd9R+5zYJPjYjRTyVqZGuKBk7rMmFx5Z0E
 CI2txJS++q1VCOK1gsu5v6vidP84pzqviBOh+VU/G8J1UkR+1eGN60gOoPhjJksW9FDB
 NnjQGSCJq/aHGdO/Xh0GJc7mTEE7YsONOrQpQHxgSdE/RpGuklNfKlKP8EjTu+rGYMFc
 cHL+W0Pga14Aai9nad+XPwlUtZSpPqBtbZx0cpeYsyERqQOEzwcLAzVQXRrP1vR/9ron
 xHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lm5+22f/nF8ARNSemNm0W8vZjYM0LlX4w6CQ+7at/qE=;
 b=I2gC/QEVkaZirDeJFpkF17c2Vbdhr2RkW7W4SwGN2r+hJktop+2pZeDjmV1M1VcEwu
 wvz36Ok//161CFKtX0IOQGuhN2WXqEM2u8WbXuFz/niCpEUUZ6r9XSYgdlOOiqMUROf4
 +UX1Kzh2Ycqg1NZEzzqKk5uKvYAY/3o8x/C33ZKukhHc1m4j2z7h8dVo9QN9t1v+yDAO
 GX+nHgmnoba+SZhHXja0hSFbDY3uYQsbKy0p2hnCZNepa1EXlOEfK2XaAAQRL7SXsyhL
 qgQNeYfq0t4+qIkJaFj+pRKz1pZeVN5iJoC7eCAjsKpuY1HxF0gxpQkwlaURKq3bhwlq
 aV7Q==
X-Gm-Message-State: AOAM530RhrmuYn5/oEebnVRUO20YdmVwTBrk1TyWCuPNvmQQNx2KJrHY
 0cEyA+JHlVixR4oPzymnHDo=
X-Google-Smtp-Source: ABdhPJw42BJcIenWXYtGFHF7UcaU8zrov/OKaVQXWnA0uzSfKUSC4Rw4qmQjDov7goeP9gfe3j4MKA==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr6780120wmf.144.1617263980697; 
 Thu, 01 Apr 2021 00:59:40 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o2sm7142456wmr.10.2021.04.01.00.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 00:59:40 -0700 (PDT)
Subject: Re: [PATCH] docs: Fix typo in the default name of the
 qemu-system-x86_64 binary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20210401051829.3169438-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2b38010b-ac1a-63d8-f0b5-d2724f756296@amsat.org>
Date: Thu, 1 Apr 2021 09:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401051829.3169438-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 7:18 AM, Thomas Huth wrote:
> It's a '-' between 'qemu' and 'system', not a '_'.
> 
> Fixes: 324b2298fe ("docs/system: convert Texinfo documentation to rST")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/defs.rst.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



