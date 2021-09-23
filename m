Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE9C415B89
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:56:59 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLTO-0005QV-93
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLOq-0001nG-Ol
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:52:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mTLOp-0006Ow-BP
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:52:16 -0400
Received: by mail-wr1-x430.google.com with SMTP id u18so15474681wrg.5
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t+bGzuPJ0qKNxjJgzcjHlUnGJY02kw+ZwDq0g9CLjCA=;
 b=m35wfHdhn/BEb+0OF1ATDu0AQjWv4rxgxzagW84cJKuxNiFKrfqci4fJJ1URM2C7Qo
 KuW88KdtfU82Upaq0P/YVQnFbREi6zk9d5pQ3Zo2fEzrr4ewJbPrAX010zRmqTce7SUa
 8xVIpinf0erulP7RJBjVQ+fFD9grPSkF6Nl8HcelVWmrVDxabEcEhKqrBlxdAjK/02/q
 sMtQgMDndXi35t924RAFQdUg6sR6ZWAQ5EUfwocZSQv55vrSinRrGZpFaZyyfYRX3wPz
 OiRk1YkgM8uwVJaMCqq359Pamd0uS/aq/juqjnaUtPK7QvRd/ItyLsHBWjQI6zoWRgHb
 098A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t+bGzuPJ0qKNxjJgzcjHlUnGJY02kw+ZwDq0g9CLjCA=;
 b=Kdu0iFQHsLmaI8nyBNxOA7Y/sdP08I+pmB77DkfduJT/OQd6bHTohC+sW80F9LS74g
 U4kXaxgbEvqqd1NU6+/eh2iaupAUj6lXVYQDzeDIeGy8VBpGlf2U/Tt2HEapeqYCeRg9
 uNmUqL6gKQJFIlnumXzklTJdY5WkwtbTb1bn+SUHEG5JbVx9LOqi1etdRItjmQmzXT5q
 TrDwcosn6Y0TufGJKcGMXbQNRCNCzu25KHfO1F9mUONVJ7n/p76Wv5+Q5HkmZeKp28RP
 bTF4/GUoeXFB56lIk5g/E1tHupddhRqcP4pDDc16vsYg3uGPrllyAnkC6yt/wcZCxHz4
 JMTw==
X-Gm-Message-State: AOAM530Sqwwvc7q6kOfsATT82kR4E2n8JajGHEnuMiRU3yaIBPMZ91nL
 o3LLSAdVIUObWlpT+FhWAaQ=
X-Google-Smtp-Source: ABdhPJw4l9a0e+KJafnFdYuSbj+mwCQcTMTU5nsoh0NPWMftKd80y8lf1ESK46lGSbLJ89PHEHJzIw==
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr14901287wmi.143.1632390733711; 
 Thu, 23 Sep 2021 02:52:13 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id q3sm3366517wmc.25.2021.09.23.02.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:52:13 -0700 (PDT)
Message-ID: <36fee3e3-40a4-9b6a-e0b6-bbaf826e7df3@amsat.org>
Date: Thu, 23 Sep 2021 11:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 17/20] nubus-bridge: make slot_available_mask a qdev
 property
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-18-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210923091308.13832-18-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:13, Mark Cave-Ayland wrote:
> This is to allow Macintosh machines to further specify which slots are available
> since the number of addressable slots may not match the number of physical slots
> present in the machine.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/nubus/nubus-bridge.c | 7 +++++++
>   1 file changed, 7 insertions(+)

> +static Property nubus_bridge_properties[] = {
> +    DEFINE_PROP_UINT32("slot-available-mask", NubusBridge,
> +                       bus.slot_available_mask, 0xffff),

What about using DEFINE_PROP_UINT16() here and uint16_t in
patch 04/20 "nubus: use bitmap to manage available slots"?

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    DEFINE_PROP_END_OF_LIST()
> +};

