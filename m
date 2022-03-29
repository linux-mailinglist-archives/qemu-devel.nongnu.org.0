Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F84EAB2E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:23:13 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ90K-0005dK-3B
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:23:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8vs-0003Yc-EP; Tue, 29 Mar 2022 06:18:36 -0400
Received: from [2a00:1450:4864:20::430] (port=38673
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8vr-0006hm-0w; Tue, 29 Mar 2022 06:18:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id i4so5241727wrb.5;
 Tue, 29 Mar 2022 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/3rr+fmvfaGMfnXP+x+65sNBWXvBhBdzOmwdpqDFCVc=;
 b=U+K3H5XeHJwxADb6VV9EHmmSW9glVgCuc6gDpZr+TdXV4kLawR/xvWIoRCv5Oii/X0
 2QUORmjPLVrbu+86Tt7xiNNvjnxRiwoNe8TjqTj5M1xzIemJ4qyUveQcv5npcAzIcb4u
 ySRXZMBggaI5suDt9F/OI1cMh/qqN6YmLDISnUOLEOlIcuUsh4g+IC6I+jo9E5mmKdyB
 +m6ijO6bFeDZTHnbLU3pQXnpP1R3oX4Shrws6u+p+Vf1P19VhZjaW+YetDaVzaftstiP
 iwmjBFEcJmcD6MFWlZdmZYm5+RbCfSBV/wbP2l8PmZ0U0khY01NDLNx5vwWNFQPV1mt2
 oLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/3rr+fmvfaGMfnXP+x+65sNBWXvBhBdzOmwdpqDFCVc=;
 b=PTx5aJvYmDJ36ZnwR9wAXcr+d8VvKXTJ4Bm1/Pl0h91GsgZjHeicIOX2CFgHF3uKgs
 QKR7kBFHxytW0rBzK0g2VAyDJhE+BNbpO04epn+s56Gp+vEqbG8pyZZZLHj70CLlYstB
 qJnQbwup2vAkmOkdFnVwDtnLvW4ZX0+YQezxvgPRb/+nqgyr8feJ9wPudZzrvnvPBOG0
 2sMWiya2rgqc/GqQ4/0EBOWBFzjStQx95PQnN/veReXtPyAcWalahtCrKhlLWSvN2mrh
 pJHa0ChTycSv8+b98JoUbIhUdjLxHtkIrYfkrZcEJnSBClQH6pampgKOQgNM2Gw02JRX
 8gag==
X-Gm-Message-State: AOAM531wjN/vC3i3ZulpG7iDOAkWuFzx1zfvQPh/EqkeFPT2Y8IcC0L+
 suxqgALVSHw5DY/OqOI0HWlwC2XowGzr4A==
X-Google-Smtp-Source: ABdhPJyDZk1lRpPf8FAXr4mG5tUEjlfWzBW5bnPtbiGsEYJB7D3/7Iu2zQtTwPEPqZStptuQ12Jl5w==
X-Received: by 2002:a5d:5846:0:b0:204:1a79:f1ab with SMTP id
 i6-20020a5d5846000000b002041a79f1abmr29577756wrf.520.1648549113074; 
 Tue, 29 Mar 2022 03:18:33 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm2094459wmb.3.2022.03.29.03.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:18:32 -0700 (PDT)
Message-ID: <3828acb7-93de-ee2b-8d5c-49fc65a96c67@gmail.com>
Date: Tue, 29 Mar 2022 12:18:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] tests/lcitool: Do not use a hard-coded /usr/bin/python3
 as python interpreter
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220329063958.262669-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329063958.262669-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 08:39, Thomas Huth wrote:
> When running "make lcitool-refresh", this currently uses the hard-coded
> /usr/bin/python3 from the script's shebang line for running Python.
> That's bad, since neither /usr/bin/python3 is guaranteed to exist, nor
> does it honor the python interpreter that the user might have chosen
> while running the "configure" script. Thus let's rather use $(PYTHON)
> in the Makefile, and improve the shebang line in the script in case
> someone runs this directly.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/lcitool/Makefile.include | 2 +-
>   tests/lcitool/refresh          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


