Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC26B2AD5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:34:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJCr-0007lq-Ud; Thu, 09 Mar 2023 11:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJCY-0007cA-6s
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:33:11 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJCP-0003J6-5q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:33:09 -0500
Received: by mail-wr1-x42a.google.com with SMTP id f11so2467843wrv.8
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+pfYMIZJpW/vfMCayU+mL7IZ6euqh4SsXFp7vJnluw=;
 b=aB0EAXeaRAbsux0h8Ols3iT5YvqQ+SD3sIg22vgTj/7SL8JtvfBk1MrchjEAL02v75
 /fhRblIGr756BK0+nEDPHsoQKrlSBCJSJXFK5EtN6Um/PyYnKTheT0n7edzA2rtizbxH
 zO6SJkMRIl6+4brNFujmsFHQZnZHb4d8DCM+gztXqTwY3/9VVxUmgMhihCiFMK3D/4hz
 31FhJpk2L1ygUEQgZ4fEMQtQjPlal2Pm+7EO3gnHK1fJs6Qd4T+PrOym9x4zvlwTQ0K+
 /U3b5gUyN/kJhiCb1YSkhsZzpx8tQxZvk0A7jI54CoW41hCME2/Ro+RO0rSfhJvN5Sjt
 0xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+pfYMIZJpW/vfMCayU+mL7IZ6euqh4SsXFp7vJnluw=;
 b=dI2+fBFZAEH282hYr72KLNBxU5hMi1m1sNmM+JBrtIMmf5zPebjwFJlWKQCjxK8SDy
 43O7kiDEbjaP7uAoVCxj3PBIq948Tu8rQdMGuYsifrtzYc9AgMRfNYw+HnuOqs5mjVll
 OCpDeKq+rc3MakFQl2YPd/dhg1UEeimUVcWRH+p0U/dWhanRM4/TAYC+Enh+kTSzBOz3
 d8iEVaxpGYF8W82myuHcnZqBRk4Tx8w51uvk5fdZW+ZYsV/m13EP3Iwhe+hAXNproLAW
 p/JhIFcsqvW9L4/qrL7cHhWjB1WT1+F9RWHnFhJkrlckv1h+/3dBAitYCJ5EAMrDVCv9
 8e6A==
X-Gm-Message-State: AO0yUKUEW1v5TzEZYiYqBub3G4yK8kOIgQG3zyjcxx6MPgXgE9G2J25j
 rh0DohpT72F3t3yr1i+WWl5ntg==
X-Google-Smtp-Source: AK7set/kF1fJ3SOHJtDsKGXO7at55R1QnrdMRJA6wbH90Ik94yiMQeTCOTMTX/9oKgV4mIfT+Djpow==
X-Received: by 2002:adf:fd07:0:b0:2c9:8a3c:9fc5 with SMTP id
 e7-20020adffd07000000b002c98a3c9fc5mr15214379wrr.41.1678379557612; 
 Thu, 09 Mar 2023 08:32:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f9-20020adfdb49000000b002c59c6abc10sm18612583wrj.115.2023.03.09.08.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:32:36 -0800 (PST)
Message-ID: <aedd816d-42cf-b42c-ab8c-8dcfa5a973c8@linaro.org>
Date: Thu, 9 Mar 2023 17:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/18] ui/dbus: set mouse is-absolute during console
 creation
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-5-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307115637.2464377-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/dbus-console.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


