Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E494C45B5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:39:05 +0100 (CET)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmrv-0005tD-V1
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:39:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpma7-0001RK-Ia
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:20:39 -0500
Received: from [2a00:1450:4864:20::32f] (port=36841
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mpma5-00022a-Vr
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 02:20:39 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso4464379wml.1
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 23:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nxMx2zqEUy+QciOr6pSQ7DWuxCQSd90+2wOdIZFGEbg=;
 b=eJBqNGE9urkGmuPRVR3bktXbQoSYB+Hxx8pzGu9VfIIl9IB6FkjIR2gaheDbQDuGor
 9nVlzwe7irwPBkvNKwxQNRBpc6+YpPMKlroXsiBneaDx0cnAk4QFLQovU+4VWdWrp+vl
 B0fmePr95wL+hwjlsVLezuj0SNJrUtxyLfpGCbNVhEUCIDXhnEnXA83CPyals4zdhGHa
 0UatfAcM7UHWpwHHI/2F46HEAwDFJQt/nKN15nX53sxHIZnI0H8+rM+cgOsze1WGGYwH
 SmyYo1uRkU6k3F5qvKOR4PRrgDVb6bWOIFK1m7cvuQXigPCtWWL8beNvOTG2d+CRNOoM
 pGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nxMx2zqEUy+QciOr6pSQ7DWuxCQSd90+2wOdIZFGEbg=;
 b=ZYSpp1yQb280qQMNQh48CUlLWCXbKigZ9Bnhn+/KCOsepNxirBf+FBiDydSrFP29DE
 g16e21Sb8nawIavHcGdMbA91CfAXIIqfYFcMf6YW9R3FJY8Gmde7E6amZylKrO4RtN6l
 bnv9nx7xmF+gLoLhUWzENZdG6wfw9xR3BjQ9LclV1lF5Oq1x8EQd4/GWKXDUObxsO2AJ
 YACGyNy8ssa2AjqVf51RbyYW23/zPMwladtwVpMWmaRW0sVtlmPn7OKSra2pZPrlCNaY
 J6A130BOAmL4ZvQy2AUDHKuMHRhKwnPHBBAw/Ok595hZwoKJUZuqYEqZ3lITR7OuJYW0
 4WhQ==
X-Gm-Message-State: AOAM530UZGadFSMTljkvpJoYHTi8Fndlj9f2oXz72GIo6UJIPZL+zkaq
 Xy7D+9mEfhviWa1exTFJfdg=
X-Google-Smtp-Source: ABdhPJyNLscWYBT60+irThbyrYGpyD5W9dwGnhlDt4zvdW6Ps9gZrp7Z3HLhLaVgbL2lC9+g6xq5xw==
X-Received: by 2002:a05:600c:1083:: with SMTP id
 e3mr11790931wmd.167.1637738433469; 
 Tue, 23 Nov 2021 23:20:33 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m9sm4282786wmq.1.2021.11.23.23.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 23:20:33 -0800 (PST)
Message-ID: <16f93525-a12c-2f2e-0c6a-44e553cbd236@amsat.org>
Date: Wed, 24 Nov 2021 08:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 3/7] tests/avocado: fix tcg_plugin mem access count test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
 <20211123205729.2205806-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211123205729.2205806-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 21:57, Alex Bennée wrote:
> When we cleaned up argument handling the test was missed.
> 
> Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/avocado/tcg_plugins.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


