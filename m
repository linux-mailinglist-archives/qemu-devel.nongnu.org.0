Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9233F644
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:08:14 +0100 (CET)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZeX-0004Qr-6Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMZHZ-0002rX-Mm; Wed, 17 Mar 2021 12:44:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMZHX-0000ov-AD; Wed, 17 Mar 2021 12:44:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k8so2516209wrc.3;
 Wed, 17 Mar 2021 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAkkjgFfGytFx/lWr3Lt8yIxc2bkArlU6S4EA+hRPso=;
 b=rfnAw3jIWpo87hMNkutcqJVSGfS4w0x9WXFx8EHVu9Upi2sSfq9zc5FKWM/eCJvl7x
 DyIqlrppRCs28AReNwytrZlWn+x+qpW8QUPqvlVpLU6VDzQD7Aevun+dCxqCXMrhzSa5
 HIy2sJBNilvLjkjIxNZZEg2odX1UMwktQFdiUO9WzViNGOPIi/5DZP403GKMumYcSc+i
 B0O8dbEYIjznzGe5UHNIHVAIjeq8SN1mTsnN2kw3Sqf+D4W9xfF7/K6mB7qh983JL3p2
 uQHNUVQv6FD47xNIHC/PczF/5dt0HLdgl3wNwvltqvxSjYQ/PX3xGHXdpHYaW727xXCj
 /ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAkkjgFfGytFx/lWr3Lt8yIxc2bkArlU6S4EA+hRPso=;
 b=jbB1N50sV21ptHNXLGpDov8rZrlEqLvP1mng+whojMv3EVJX0IUdK8wUbzJ0hMD0t7
 luQQIxh5HGdr7clkea0xUC/hsC7DtMuw4axIOpihJZ9IviKeYBzZ+lwRy5XA/z2G+/N0
 FFs9hctrgrX7LUo/CWrRiGKjjRLBguWKYUeFhH1IIZ0pvLHOLuYoZY8TCoTR1G3sntnH
 4rmXM9fJ8F5Cnn0IP8cC1GGdH89+au+XzJdBp46xyDX+iwtTuOMhHaRVj4E9jVt6i1WJ
 CiXly5P6cb+9ixcT9m2IEdT0+r4vLlkuXW0vpc77hWst2ESbH8w8cyyeutoT4B3VjjAo
 Hwaw==
X-Gm-Message-State: AOAM530O9iXDbQQMfqa2sv/kafj5mvgfZQnLuAWIhNWj9LbXcBARKfzf
 2bS2Ulb/nTODF4WKkOgeyBRwr6vix3k5OA==
X-Google-Smtp-Source: ABdhPJyfk69aXHwflFjrYKuJEWzUGwzoIrZitQXRVisad3HvYVJybip52VfIhGc6nuwL7f28tbqzmw==
X-Received: by 2002:adf:c752:: with SMTP id b18mr5273516wrh.233.1615999464921; 
 Wed, 17 Mar 2021 09:44:24 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c8sm2930096wmb.34.2021.03.17.09.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 09:44:24 -0700 (PDT)
Subject: Re: [RFC PATCH] support.md: add a link to matrix bridge to IRC
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210317160259.14098-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bfd35b1f-0d1b-ad18-a4ff-86632f61412a@amsat.org>
Date: Wed, 17 Mar 2021 17:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317160259.14098-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 5:02 PM, Alex Bennée wrote:
> We want users to be able to use newer tooling and not be stuck with
> IRC like the rest of the fossils. As the #QEMU channel is bridged by
> the matrix.org server lets point there as well. At least it's not
> Slack.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  support.md | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

