Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CE4E32A8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:34:23 +0100 (CET)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQbX-00069B-3H
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:34:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQYT-0002g4-BH
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:31:13 -0400
Received: from [2a00:1450:4864:20::433] (port=42774
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWQYR-00020m-QJ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 18:31:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id r13so7561470wrr.9
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 15:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CNsIKY9nW4vT80sMvIzqxlyv5ZkFjZZQQ6teh0mn41U=;
 b=o+tcSoDJbzRqALA25PKFI/MW2oYg8gpAS4YtKA2BPhtMeLWcoy9JpcgIpN7iBQFdBs
 boWMzEuQW4KcWdVO+ccAc2n2TlolxgFp2UofTlrEhWv0eym9fv1lpXzuciJozCN8evYa
 TqeBOmL4KilDmYN8xVZUSq6FiEfHI+6Etu1Hb7U2xRPOyRGbj0I7LlLfFB4Twz3DPjxN
 MytUq5BNiSm8ekKiAkStAlfBRarPB98qS9sS+9NgwsyCtl4Zrm/8AL7HAD7xs2bPOh/w
 qKFr4YVWZI0DtM7WDr7DYO14UdipNj6KF7mOInNAYSQ2JuyEo0gnPiJVjtF8J77wDyDD
 +1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CNsIKY9nW4vT80sMvIzqxlyv5ZkFjZZQQ6teh0mn41U=;
 b=amB7cbRQVe8zcy9I1RMM4NhPizhsUOQDkWNRupYv7Yp1STm+fkCOR7lL2vwf11VDQL
 wHMYtoC3nJH9xQ/5EUXxyx37uepPAG2u+Ty64h6vzYFlU0XcU1HSUXpeK9Ox//KRW//R
 ydBfO1NgKgj2fwZoI6U+iAe7qWWc5vd2n685So81lvIx0iTfHhXpvENXTwQ19OaZngec
 U5LSM+ahquSvNGpTvswivk3QHLsN71fcj110hHeXmeqZ7F4AN0fB2AcOGYeSZz06GhX3
 tJNxRu2uUQMMa++236gApMGBNyaNkfm7kst/tjGocusF5WBMQIYViDI668FDzpC7wH1R
 Py5A==
X-Gm-Message-State: AOAM5338ERo2EyDtr1KIeyNShPJqpXLPP5W70rW6GCilLsrCKMpR0uNF
 dVpSIx/V/5aRGapvL81VzyOkGT9q+V8=
X-Google-Smtp-Source: ABdhPJyjZq3T8NhHtdtNSPVHvm5DaDljmbNOQxeha90cXZFvCBYqo4r7LGTaBKMu/Anlj4QFYa9Mjg==
X-Received: by 2002:a5d:658d:0:b0:203:f544:101f with SMTP id
 q13-20020a5d658d000000b00203f544101fmr14570849wru.91.1647901870405; 
 Mon, 21 Mar 2022 15:31:10 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm16286823wry.112.2022.03.21.15.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 15:31:09 -0700 (PDT)
Message-ID: <c36797c6-d980-9de5-ead1-5983040cd22f@gmail.com>
Date: Mon, 21 Mar 2022 23:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 08/13] libvhost-user: expose vu_request_to_string
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
 <20220321153037.3622127-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220321153037.3622127-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org, stefanha@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/3/22 16:30, Alex Bennée wrote:
> This is useful for more human readable debug messages in vhost-user
> programs.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   subprojects/libvhost-user/libvhost-user.h | 9 +++++++++
>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

