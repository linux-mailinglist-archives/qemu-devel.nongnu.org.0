Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F853348B6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 21:15:03 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK5EU-0001TT-UJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 15:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK5DC-000102-BX
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:13:42 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK5DA-0008I4-UW
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 15:13:42 -0500
Received: by mail-ed1-x52d.google.com with SMTP id b7so30052222edz.8
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n1ZqNl5trSA23T5shPw2NFox33jKVK/t0xvId1RmYdM=;
 b=COZn8IGZmAHSn7qiyA++htEloHOtF3TOk8XRW2kmk6XvGmAAHdoEvlsyU2gQ4Jl2lI
 PqbGlUnWKpYKeNH20RN9Sv73yIi8l732qutfHbSlDYzbiAdpob2TFQwfZWEPgLfyIcP8
 77I1iC5nCK+L+0VZCo6ENh8d+W63P7QjrfmzDXdTUi0oWlKNBoBwRMpOIGrns51WvYGL
 SoHcSYO+aWxEVBnj22Sd4jxZijvpmDWbS9aJkpHmju1Mz8s6sxOBBmNQqy/EvFm76q0O
 ggaFcMELO11V9AkHoYnBqWPZJ1uN4IoZLt/z694IxWpnZBRMgZy28aXQHoH1at1az4YM
 mW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n1ZqNl5trSA23T5shPw2NFox33jKVK/t0xvId1RmYdM=;
 b=Uh8arN12JNqMOxuYa23hC90H6Xsw5LtNuUBvIVCKtCVwzPrqA1ho2Uk+JgRjFTUeWt
 wZrfJK0AMLNbwrYXB9cN7ld46MEh9BFMaexnWwALlAxjNN+E54nlhKGQoY1gKxSJ4ORh
 SoXifqe0rTqvL0514HbEZoKtlrSNibhELAY+9T0I1ZaDGDgoo1utLm+55RGWhkjy50OR
 KKQAkWlT6VvF1NK5j97GtvQsplnU2tcRGqyJ4AJI2PHN1qks+JbA3cTRo+VOYfuVmzVA
 mIaJ0l8VJvYckFQimeocQmJ0itmHy39tgg5uvyuBTKihpzSSHtLWNQPxz6Kvi2zTfm4n
 JZsw==
X-Gm-Message-State: AOAM533kqrbsk3hqxpgfNIr1wRSNN9qJ8nFH9b3LG/HlD75LldvXaKMj
 0t6/9UNVmNKwpI/1pVKmUoRJE3uXdU0=
X-Google-Smtp-Source: ABdhPJzfJBnslWhOL+Sksv6FDJMdf37oFEK8KAQVx4NZmT38b8ihnlB16Cexlzo68IKt4mY/RK9LCg==
X-Received: by 2002:a05:6402:ce:: with SMTP id
 i14mr5206289edu.42.1615407219502; 
 Wed, 10 Mar 2021 12:13:39 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p9sm148397eds.66.2021.03.10.12.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 12:13:38 -0800 (PST)
Subject: Re: [PATCH v1 4/7] tests/docker: add "fetch" sub-command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210310192331.29284-1-alex.bennee@linaro.org>
 <20210310192331.29284-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f15b2182-99c9-cc23-3f27-7606ad01d01c@amsat.org>
Date: Wed, 10 Mar 2021 21:13:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310192331.29284-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 8:23 PM, Alex Bennée wrote:
> This simply wraps up fetching a build from the registry and tagging it
> as the local build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/docker.py | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

