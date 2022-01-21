Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBEE49684D
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 00:48:31 +0100 (CET)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB3du-0003JE-Jf
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 18:48:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3d2-0002dX-G7
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 18:47:36 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53791
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3d1-0007ZZ-1Z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 18:47:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id h12so10477112pjq.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 15:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WnxKA1moSKIyeKasap2YEvD2c5Ddiwl7opXvZG3tci0=;
 b=SJ9MkvMDPwRR9ZMCg9jO8UtE7KZ5qg93jU2vE/R7ccTdvUC8qP/1PEiIeij7iz9Te8
 l67yMT7yo5T7VdRJbAOp43uGn4yuZT/ZpyIJgQS3oDj7mxGKPeJgpGWPJ4JFO2v+k9xJ
 CoS1k5fIZG42OjrkZfv4/YFYjmzyMYgjaetFq8yyJaAb5z4rSEHE+azxtnwMrbe+gPGL
 1YreB0cMbucgKHpZt2JPsjXpgTU7m8vV9GZg0L1M3qNgVx6YGgl1qdnX0srAmWdKatAO
 IpMopAFnpnU1T23iiOLhzxsVhgHGM98cbtdFxZMHfh5Sqg2tualpbGBtd6CIWL8xwC2M
 NrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WnxKA1moSKIyeKasap2YEvD2c5Ddiwl7opXvZG3tci0=;
 b=3LIexKwf3TGsx0YZqEJ3fCbr6CRqy4rEzXeiRHJGe/5xgOvVXr6Pm9znK8W8ZikgO0
 5TgBe9SlRYVCsdy787zt5TCc0tLoJh7nOVZGCMJ0vQ1IBR+SCttKZwx/MLmRBr0HTwXN
 J6UwIJQ3wWVqg7c6PQRu9Gx9vftwXNn5/9ZEi8Jx2Ukcq7SC/9kHmE/qjX66NxvHdTWf
 +P7Fke8wDvxLgdX4E98+Kgy009xw9xYZP8PitpEkiCqp7GQ9dcMsEVtwABRKUPTahN8u
 SDmXY558a4+wbV07Vu0XGdzHh4yJ5DBeyQ0ftm4N4vsvojs+zIvkQju7Y0woeBonEKSR
 OOPg==
X-Gm-Message-State: AOAM531TVhvQsdZl7TMTAJ3IDVVxpEQknnXxnE7i31xngVRtFDxwc7Qv
 gDYP/x+JH4jSSJF+tJFvnBM=
X-Google-Smtp-Source: ABdhPJyZ0HTT9PN2egLV0aFnkXwTi+iYcfY3Tnz6h0631bl2ptleLlUWNq1VrFX0gHzu9DRkP36zng==
X-Received: by 2002:a17:902:7046:b0:14b:20ad:3411 with SMTP id
 h6-20020a170902704600b0014b20ad3411mr3648973plt.40.1642808853665; 
 Fri, 21 Jan 2022 15:47:33 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p4sm6915069pfw.214.2022.01.21.15.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 15:47:33 -0800 (PST)
Message-ID: <a068a4b4-7ed7-7689-fd0b-a94a8b537d1f@amsat.org>
Date: Sat, 22 Jan 2022 00:47:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 0/2] some simplifications in hw/core/fw-path-provider.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, pbonzini@redhat.com, berrange@redhat.com
References: <20220121202952.24763-1-danielhb413@gmail.com>
In-Reply-To: <20220121202952.24763-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 21/1/22 21:29, Daniel Henrique Barboza wrote:
> Hi,
> 
> These are somes simplifications I found interesting to make while I was
> investigating Gitlab #720.
> 
> It isn't clear in the MAINTAINERS file who is responsible for this file,
> so I'm ccing the QOM maintainers since it's the closest match.
> 
> 
> Daniel Henrique Barboza (2):
>    hw/core/fw-path-provider: turn fw_path_provider_get_dev_path() static
>    hw/core/fw-path-provider.c: open code fw_path_provider_get_dev_path()

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

