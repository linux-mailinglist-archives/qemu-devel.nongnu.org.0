Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71964724C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IIC-0000WK-Hf; Thu, 08 Dec 2022 09:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3IIA-0000Vq-IL
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:54:30 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3II9-0006JK-1X
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:54:30 -0500
Received: by mail-wr1-x42e.google.com with SMTP id f18so1905699wrj.5
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WZd9OxEs6RhQSdiXIfXEsw5mb3P4Gmp6GKFR7mLXnRo=;
 b=j3/U+hjYc+AKnQx1+7RXtp890gXgaP85jnTxtyUp+DDrEcsvP+GN8UgbqdMuDERbHR
 IO1v6DaUqK47ALjL+qTLqao3rVZl5plEMBjUQ9sv7NoR1isgjHcC7JJbkxY5If0EPAKz
 WOA7CPECBxAfmn/uuIztgjqwCAiBIab5NCTnQNlhSID4grf14nY98bF6jI5EzxisysaU
 RW9NBQuTUIEq+b0C4jjSJAraaW0GS0bAd7AqMP0KpbPSnHDMIEMxJFwM1rQPftZZ5rAd
 pFXDvRrupvpHpY+LLDrGgXNah+s4HbINkXAKHdzViCLDBR8CnW4Wlthx7Ks6DzdmLkkE
 S9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WZd9OxEs6RhQSdiXIfXEsw5mb3P4Gmp6GKFR7mLXnRo=;
 b=rTrITrBNcuhlRibt7FkM3DI8AYzndF2NI/lLskBAzS5Eur7g2A0S/aQSnWmDs0//dA
 4K8r0YYmwI6hE+gYY/z5hFMaXy46U7JSa4sztvClakxiyhBp69aRYsRsq7LaYXF1Ffuv
 HkZHJ9SrYVlbglxhAnvEOcJOsZet+F1tfWSb0Rt+XOQWTYI84MrJD5nwcvooBkoZA6CP
 Qfzxd8PMRqdeNlOi23M+aCtZbeDKjL/5UXdzvyBgDfsxPi4tatxeUShowaJaetUzevf7
 64/lrtZr0gASMYmlQfvGvkkPIR94hIFllz+CqPHJjlp1/sNFV97QMSmdcAyLD59pCEZv
 8Nyw==
X-Gm-Message-State: ANoB5pkGyabEd4rRiENnI8dg6rUmWIr9erDdPKiBWTn5NyPvCoN3N76w
 pY790gloco2ug4VQwrH8Zsobig==
X-Google-Smtp-Source: AA0mqf7Gy/VV+kxIINB51xYWSSYpUK7E3jzgZiPnN9EK2MrYMp7OGMl8w/3ksu6bqEDvg7ZeIY0UBQ==
X-Received: by 2002:a05:6000:83:b0:242:fd7:285f with SMTP id
 m3-20020a056000008300b002420fd7285fmr1592129wrx.45.1670511266861; 
 Thu, 08 Dec 2022 06:54:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bk4-20020a0560001d8400b00241da0e018dsm22039772wrb.29.2022.12.08.06.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 06:54:26 -0800 (PST)
Message-ID: <3c8ed258-665e-8191-0612-276d5ab448fd@linaro.org>
Date: Thu, 8 Dec 2022 15:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] hw/sparc64/niagara: Use blk_name() instead of
 open-coding it
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org
References: <20221208143939.2775453-1-armbru@redhat.com>
 <20221208143939.2775453-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208143939.2775453-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/12/22 15:39, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/sparc64/niagara.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



