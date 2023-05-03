Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4E6F55DF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:19:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Zc-0007qu-JW; Wed, 03 May 2023 06:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9ZW-0007pw-7z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:18:54 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9ZR-0006mu-7T
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:18:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3062678861fso2796523f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109127; x=1685701127;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YGif+5kZ/7Gigjs3fEk5APcFitt0lEemN12bmDkVK48=;
 b=rQIVRbGoOFL0KFtEfqGT/IOhnYyc/qVyp0tg1ZFZplIs/cr2EQRIKV/9RX+C4XKE9Y
 P/+L4irSD94t/whBN4IF7L5Fa4TU7vec9EFf6aqsfTKpZ3uzep1jWMbXBWndXKh2obKL
 FMjqFwsU7UGcZNwvUw4nrbkAil3Yl8m0uu1tubZL2C9VtB1NdP1ddz0QrQobdcZ1DPvT
 5ZBzA78EMXfkL8kxDIEa5A8oRgLLC6xzN+jPb3tTEzCZZngQKxOXA5SAz6EGGy0iZb8X
 4HNUm3vrvGUtW8a1336drRs7bGRvU2idH3zE6QJYZiw72fnryaBNszrOBbOlTkYLOkW6
 MrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109127; x=1685701127;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGif+5kZ/7Gigjs3fEk5APcFitt0lEemN12bmDkVK48=;
 b=D5ReYm7MgxPbQISnpsrUGgiD+Mnd5kpirPwYB1TFbfEBOO+R/OjxD+gTIVY1cSx2v0
 kHYpPeW3+/NwjErHGOqxf7yaxM7d1KlqMmBreJxKch4lJFKEOT4mLdNBM7Lc8loLFOaR
 IsOnftgAAzQrLaSBZ9YVOqu5YHffvtdM2JF/1f0rpPqJAMNESzpH0TL6Pe0JxnfklQGm
 6TpVCe+UN02vj1em8JMajAsUE7UrICEYO/ki/SJJKysO3uocS/pnlMUjeboVsG/UOBM6
 1LzD2r+HlrNk3uHjH+plM/YX38eBwomJ+s7/OogA0fUOyILN21q4kQWGUAHjAfXs2h5p
 Sqrw==
X-Gm-Message-State: AC+VfDwQ6iKW+0b/hKOBLis45Ajvhhbw2a0nrWItzM9fsunb/Haypj6C
 UmxFCUVM5wEmHQe8Wx8tnzY2u6SdO82s6Hd/ixW0ow==
X-Google-Smtp-Source: ACHHUZ4w3txolEc1PN4x3zCKj8V5pGN16htTjjCNb13fBlHhEC0oyx9+7wRK0aC+vm8ZPgoesugUaw==
X-Received: by 2002:a5d:4a50:0:b0:2fe:c8b5:b5d5 with SMTP id
 v16-20020a5d4a50000000b002fec8b5b5d5mr13461417wrs.2.1683109126960; 
 Wed, 03 May 2023 03:18:46 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a5d5490000000b00304b5b2f5ffsm15120665wrv.53.2023.05.03.03.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:18:46 -0700 (PDT)
Message-ID: <216de6bd-63bf-2260-7ebf-7a90a3ffc0c1@linaro.org>
Date: Wed, 3 May 2023 11:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/22] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102
 machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> This machine hardcodes initialization of the USB device, so select the
> corresponding Kconfig. It is not enough to have it as "default y if
> XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
> disables the default selection resulting in:
> 
> $ ./qemu-system-aarch64 -M xlnx-zcu102
> qemu-system-aarch64: missing object type 'usb_dwc3'
> Aborted (core dumped)
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-8-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   hw/usb/Kconfig | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

