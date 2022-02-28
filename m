Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14424C72DB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 18:29:23 +0100 (CET)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjpq-0006ah-KB
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 12:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOjoo-0005aX-1n; Mon, 28 Feb 2022 12:28:18 -0500
Received: from [2607:f8b0:4864:20::634] (port=40522
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOjom-00039h-HY; Mon, 28 Feb 2022 12:28:17 -0500
Received: by mail-pl1-x634.google.com with SMTP id z11so2940473pla.7;
 Mon, 28 Feb 2022 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5kn3699G+V9W9USVWa4FVtQc5cxH/buPsSCUjtTz5NA=;
 b=nrWXdHZC/BTh9jl4R7HYn51V+gkM+Ux4/EQzBrYdVDXNZkRqszHxRAg8X6jK6XYKhL
 +xCfPftgdMQ7S6/C2Cr4QJecMVTfk3deQU9NN9ebMvvBV1q3+UZr1/sPdbYzNk7IP7A6
 N7AAXIWe6nJZxfBv5BZ2KX23Bbf36vUUGkI4/IWWvFXiYagGj42ONjMqu5dE428LY7zP
 PYlFJVRlppFw9aHwG8bzjAaMPVrq10OdaJ0pxjrY4DDEL2A5fnQW2U+MjdTSBB4R5R7S
 FDTeENFdZ8tyjr41iE7RXQ8SA1TQArAikKq6L852ygETM31iVkRmkBJ8jQyX7GhfSkQC
 4YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5kn3699G+V9W9USVWa4FVtQc5cxH/buPsSCUjtTz5NA=;
 b=yg93+C5wwpPskBlWDA6D/gRwyKsfbq2HW4bfjLq1Ih86qYAQAywyoDAKDGEO9Sb/CZ
 hdmO4lEkYO94PAZ8xoJIpDa8iXeBwSrsyCbr9hNzYM8huKIlIzVsi962FKIwv/H9TO6X
 K7TLHaj5wuyAsZQEcB1Hv/27SGZiK/UrRA02htKbD4xRXadwI0p0iAZSYTtMad0QUKAH
 QFa8/pT8lgN9iFM8XBztPnAP6NBrpJUXRSQAWxo9ds12te5N+CtLgGo32Vcyew7ohvrd
 95kftwp9LBKtGlnmVXxC4hjVGbmSq1/vm1OKdtXWSCS7sA0vtnKlBVQ7jNCkSWF4M5zg
 NLig==
X-Gm-Message-State: AOAM533tNDOqFC3Oy2A/rpHMhMFj6uGLveWLyw5YjsdAWMOwS+f3rZrE
 ezZwvyad9MywKthXbuHRsOQ=
X-Google-Smtp-Source: ABdhPJwo5gZqSA+Gy6WVVf7y7BXFEKMkE2Qx8NtRF5+cANjGYhiI87HY36VMXKzIyHvagrytMlUNXg==
X-Received: by 2002:a17:903:1cc:b0:151:3e13:e2a1 with SMTP id
 e12-20020a17090301cc00b001513e13e2a1mr15044274plh.52.1646069294462; 
 Mon, 28 Feb 2022 09:28:14 -0800 (PST)
Received: from [192.168.74.175] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 on18-20020a17090b1d1200b001b9cfbfbf00sm10922598pjb.40.2022.02.28.09.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 09:28:13 -0800 (PST)
Message-ID: <45d6fe24-4a72-36b6-079b-6279e4e079ad@gmail.com>
Date: Mon, 28 Feb 2022 18:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] allow disabling tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Simeon Schaub <schaub@mit.edu>
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
 <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
 <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
 <CAFEAcA_ps901W=Cwu0ev39B2+6YyWZtERfuGjCsDTz=G=iA9fQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA_ps901W=Cwu0ev39B2+6YyWZtERfuGjCsDTz=G=iA9fQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 17:25, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 16:22, Simeon Schaub <schaub@mit.edu> wrote:
>>
>> Ah, yes, sorry, I didn't check whether the tests were actually run. I
>> can rename this to something more like `build-tests` if you think that's
>> more informative.
> 
> What problem are you trying to solve here ? It shouldn't
> matter whether we build the test binaries or not...

Maybe speeding up the build by restricting to compiling what is required
(and saving energy), similar to 
https://lore.kernel.org/qemu-devel/20220204152924.6253-3-f4bug@amsat.org/ ?

