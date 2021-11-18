Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BE7456253
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 19:27:44 +0100 (CET)
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnm8N-0003E6-Ov
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 13:27:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnm72-0001pV-BY
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:26:20 -0500
Received: from [2a00:1450:4864:20::430] (port=45005
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnm70-0007L9-Se
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 13:26:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id n29so13289133wra.11
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 10:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=woNJ4Xbjl7r95fJy/tkVBaKFg7v1xZ20HmDyf+QvsYU=;
 b=jsfClOpMtBLwLzvIOMcI1XDEOPd41RdVHsskM7VoyB+47ONkGE1FqB772ZJC3DRO9O
 5QQ+ZupZ0KiuVjWZzuJwv26yyF4CmVuCNfoVegTPLo6Ua2BW6GkXOAu/sCnbWtAlpHbu
 EF/zemPR2QiBm3Y+1i1CM0gWgSnIcr2WO1WfY1RuIKMt4mcYqXo9WC5RjiaShCFdKWfq
 2rz5ukMayRZjC8cjZFBbaq6SGpiCNC7s0gwmsyTiPjHwUA63g1gw1ysk4FAHt3r3afjY
 g6V9SoD2/++/m40J8m5ypT72TpL55Fj0ttnFDAKJtfQ2QmdsnNlk/lNTboatGwOmoq2/
 qnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=woNJ4Xbjl7r95fJy/tkVBaKFg7v1xZ20HmDyf+QvsYU=;
 b=yfslEDczHcAU3B0LjFsgH55rwblEIx2+s67oYQqvjlDomOnYyXBZKbfMhS6TyKG3ON
 pDUWTU/qcGL58q6lN6C6gxTnlHR3Y5kPXv3jbxK6j+7JUAl6pgO8ffcrF6mBm9MpThil
 LutRHSAJXNyse8zRkQpw3UilXVL5jt3AQBcdIyHiSlhUAlc5+RXOS7HkEITx9UtmXDJn
 LkCWbiykmXL8BXH8L5eRO29U/RUzQT0WCPKH1+u1WrKuYocnWMvII18buyx2VXkdndcJ
 0O/7Q+F3bqy9zZA08LsCrlxfAtKWscf0QNEkoDnnFg7GwyJe5FFnU2r7iMkTFamQpUva
 oJIA==
X-Gm-Message-State: AOAM5315nWVOx2vr33/jVvfQ+BWK/ZWuQUTmUFbB3RMpSBdjO9ei6b0g
 zITIYoO8QMV1shQwE4NnLBh1qzrLJj8=
X-Google-Smtp-Source: ABdhPJz0Lhb3qANjoiI3R9ukivsAEY0ZOZKpyqcVbWST1wK6TVkoFxE5VZaCHLPEl/Y7DybQmTrzhw==
X-Received: by 2002:a5d:5186:: with SMTP id k6mr34215148wrv.146.1637259977460; 
 Thu, 18 Nov 2021 10:26:17 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n1sm594738wmq.6.2021.11.18.10.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:26:16 -0800 (PST)
Message-ID: <d75dd40f-4b09-a57e-f0c2-7989168f5336@amsat.org>
Date: Thu, 18 Nov 2021 19:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-6.2 2/2] escc: update the R_SPEC register SPEC_ALLSENT
 bit when writing to W_TXCTRL1
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20211118181835.18497-1-mark.cave-ayland@ilande.co.uk>
 <20211118181835.18497-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211118181835.18497-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.084,
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

On 11/18/21 19:18, Mark Cave-Ayland wrote:
> The ESCC datasheet states that SPEC_ALLSENT is always set in sync mode and set
> in async mode once all characters have cleared the transmitter. Since writes to
> SERIAL_DATA use a synchronous chardev API, the guest can never see the state when
> transmission is in progress so it is possible to set SPEC_ALLSENT in the
> R_SPEC register unconditionally.
> 
> This fixes a hang when using the Sun PROM as it attempts to enumerate the
> onboard serial devices, and a similar hang in OpenBSD SPARC32 where in both cases
> the boot process will not proceed until SPEC_ALLSENT has been set after writing
> to W_TXCTRL1.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/char/escc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

