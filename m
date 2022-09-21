Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32315C05FC
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:52:54 +0200 (CEST)
Received: from localhost ([::1]:36846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3u1-0000Nl-R4
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3hV-0006Go-KH
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:39:57 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ob3hT-00073D-TD
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:39:57 -0400
Received: by mail-pf1-x436.google.com with SMTP id a80so6651485pfa.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 10:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=MHI/4WIi4gTsvn7JQ2A6ZGlerl0aTnZyBHnWGZmjGO8=;
 b=Yta+gNwg+5HslvwgyVYFt1M2qWYCQDFnhRqelJjGcELhtElFwg5grOcgA64djAQtoX
 f1IV21s2sE7fNTLGEYNkakXEpXqwJsW80UHPBsKmeOKsQSgoDkd9CU7WvKWQOiG3IPmE
 vta5yET+Lf6Ly6OCXCVVEG+7uXPBtHzE6Mtgiz9h+Z7lXOQRldNs2HKLv8TERqG+JtI4
 uza8Ws/gpKrdOxa18PZ3oWX2pCzoHY6EucqXUFc5+LmGF6sE2S/2uGrcH88x3Z5GP3rS
 mXoYyb0MgBeafUaUmFv5C71WlYfSqAO7yKOwhk0VR1BoxeMCs6ICUaKMPMOId9deY7kE
 rHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=MHI/4WIi4gTsvn7JQ2A6ZGlerl0aTnZyBHnWGZmjGO8=;
 b=r34GJNogjBvQIb5U9mHn1Z2Zrcxt3+hdYOaOjvQTwGpZlKjT1LnQzSJGKFVJIMi6Sj
 rU9SpDSy8NJXqdQVXpEx2IILqKE0uNNmeJjgyJZOxuxEePoFw+TxBJLSaFHpu4L/QKeg
 tMPoapnQcmpjPhB6htabr9feD1s4lXqRVh+zUhyhiyC0mgRMx+XCh3pUmEYgc80Dr7LU
 GCeIpowjpcoLznA4hlu0gY0wlwyrsmdRujAUcqOR8AqOME7P3DxTIyzk9+5TThui17mp
 hjKanHsuHXMm7TSlx+fdtMaeRXuGY7cyRQ01rxmXrFs4yMNsIsxBKUKdvlOv2bTHy8bi
 4hVA==
X-Gm-Message-State: ACrzQf2mguCKTRuhHZxRLVbZokxdshY03hjLs8HNt3K1Ojy8m9zizDQr
 5nsGFqHqU1o9Ta5C2kea+lA=
X-Google-Smtp-Source: AMsMyM5VZjXNNr8FJ4Lc0MYMPBxHDdxw54j0du2w3RbDzanravNlie31LoP54T5/pxceCvo61wckNw==
X-Received: by 2002:a63:9d06:0:b0:43a:5cf5:1204 with SMTP id
 i6-20020a639d06000000b0043a5cf51204mr11303250pgd.557.1663781993192; 
 Wed, 21 Sep 2022 10:39:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r2-20020a170902c60200b0016dc2366722sm2294451plr.77.2022.09.21.10.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 10:39:52 -0700 (PDT)
Message-ID: <bfa49f2f-3646-a16f-c623-b5194610e13d@amsat.org>
Date: Wed, 21 Sep 2022 19:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 07/10] docs/devel: clean-up qemu invocations in
 tcg-plugins
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Alexandre Iooss <erdnaxe@crans.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-8-alex.bennee@linaro.org>
In-Reply-To: <20220921160801.1490125-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/9/22 18:07, Alex Bennée wrote:
> We currently have the final binaries in the root of the build dir so
> the build prefix is superfluous. Additionally add a shell prompt to be
> more in line with the rest of the code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/tcg-plugins.rst | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

