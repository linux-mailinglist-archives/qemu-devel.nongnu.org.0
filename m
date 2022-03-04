Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D34CE156
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:05:45 +0100 (CET)
Received: from localhost ([::1]:38314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHvc-0001UD-4U
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHpg-0006M0-OE; Fri, 04 Mar 2022 18:59:36 -0500
Received: from [2607:f8b0:4864:20::42e] (port=34698
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHpf-0003SK-CX; Fri, 04 Mar 2022 18:59:36 -0500
Received: by mail-pf1-x42e.google.com with SMTP id g1so8925369pfv.1;
 Fri, 04 Mar 2022 15:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jg8HUgsHmnspjlisO/PLGzqG19Q4VuT4nfNJsfczpUo=;
 b=jyIBwsGjRsIXg1VobTjkMISx6fQUTKP6D4nOeFeTtaHOWAriVHqVYr2ItQHcUG6MCF
 iR/Bn8PqpQ27Mg/b4fsLZbxd7eqNlmVYi4w5b+RLPO6PNXKacJyvmXvA1VVR/qgHEMLV
 0cevT2Jovyk7IOFMOerAeUN5wh6lo90B2vXhQqEdVAa6VjyguSmxhNWSVGavMd4/oBTg
 Q6ZYG9LsG8Ane7wg6Aehk5aaePQoUg0WqqBdCGwUK8sFZL6jViVcW9q8MdfPUw8r4QKO
 sMfT9usNSjUPltOFY067Jt6ex1XpCwQXHI4BDGdame9BaK23eLI1CUswhaV0B2KmhfyJ
 n4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jg8HUgsHmnspjlisO/PLGzqG19Q4VuT4nfNJsfczpUo=;
 b=6aPKgureyaoJkJpJ7vaTOA23JioukTDORHE6nRZDN5BonTgvY9+P6p3+5ca1KTwVgx
 Blyb3d/Sa/ZSGqExpqRQ6SCDSUUJq6yxUZnwizf6Sgx3FDHqp7bjInc7WzqEQnTH+Q43
 BjEt22yPpF4RyZEe6kM3NEzqNMFCXrr318wU9VenkgcN/lWm1zK/FwvyVRagrMXLNYGT
 qCaPSbP6PcB56DQ1dH3/ExY5B9KgqrgvzUBuZgyNrBvJN9UdWgT5oNUB84TIcohOB8xy
 TmA48Af/L9iqKM/JGnwih3NJFXruf3cQVooy9i6iq8QILrjegbLnMfDuzlqyZNqVrwBq
 QU9w==
X-Gm-Message-State: AOAM530YOgY4SQqnbX0PMGpInCjHSWxyTlRbz8QIn5tqRsg+QEDBx5nP
 +hpXSpplQUA61pMMxk4UGe0=
X-Google-Smtp-Source: ABdhPJzdzGMp/UROibugSQ/RzSQfGZpCb4OtPW81YGcfN/OSRiMxULzpGKNtbqXs/jMjtab/rt/DJw==
X-Received: by 2002:a63:7d04:0:b0:378:fb34:5162 with SMTP id
 y4-20020a637d04000000b00378fb345162mr669751pgc.487.1646438373700; 
 Fri, 04 Mar 2022 15:59:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a056a000b4d00b004e1bb6ea975sm6814106pfo.214.2022.03.04.15.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 15:59:33 -0800 (PST)
Message-ID: <fc68d57c-e373-14f7-a24b-47f1af0e43c4@gmail.com>
Date: Sat, 5 Mar 2022 00:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 4/9] hw/i2c: pmbus: refactor uint handling
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> This change cleans up the inputs to pmbus_receive uint, the length of
> received data is contained in PMBusDevice state and doesn't need to be
> passed around.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

