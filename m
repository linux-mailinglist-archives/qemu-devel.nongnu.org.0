Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722633A0D7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:01:33 +0100 (CET)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAS4-0003O8-Gc
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAIO-0001Qz-2X
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:51:35 -0500
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:47006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAIL-00084O-Hu
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:51:31 -0500
Received: by mail-qv1-xf2c.google.com with SMTP id j17so5948872qvo.13
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zn4ARaXjhoPAjAj9N+cxkIuo97nly92TkBhVIOMWiMU=;
 b=wRirjT+570bZH/2jq7Xr4oHtlvgIJNbZkrShSdTi21iveK92VoOKp/ExvHjBNGki+5
 LEbmjSt001PpaCO6+Cv7j2UVan4CGgZqCGfRNX6+L1a4TpcGtvTNGLupWNMj/WNb4Dcu
 eRDBjOTDXOEoUowtDXQ/yE0UbosOU1jRVcAD77IfWl7CNTHzUZTPUOT8hW8UOOVXAj9b
 s1oW/HizQlugaXewMR/lRkqSBradFrTcOi0uBJPmHPAHEnWSv9QL1fol8pjVq4510LGN
 DPqrB465MDbOv4VgASfT6/mZAx6xD3rehqcjpBoL0v2wzyZQ2xaO8jLIgLHpN0+PMJlN
 bU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zn4ARaXjhoPAjAj9N+cxkIuo97nly92TkBhVIOMWiMU=;
 b=Kg20qhUsJWtc+alLLMwJOH9xxPVTirN4mI294SQqbuVpFYcjV46RdbjfWq1kp+j9rV
 9RkSj1ZBjoQiXY6NaNfKfytpPbCIYCyIUtRRBa+G102cnwuDIOr/AThA9Ut7mTOrVV4M
 yFhWvy4FRKcNSL5L7HUoYUYMZjQx+X8ulVUCeYMuCBP5x9QncFAqmwPajL7ejWZHm6+A
 qHZPUnDOTnkTDdU4PRFBQSZTwLkFhrg7QnupmC4Hc/IzC7oZ0Vh7zLRrxIXl2Y4JIQ6A
 OIvbcL/nH2Osj7tVgovCKlVzcWok3lexc7PIPZ68lKyyHpSHR+pN3eelVFlS85xc4+E6
 Fy0Q==
X-Gm-Message-State: AOAM530aEFdrsaSfeQOZkIL9KrbDZUHcgObeNqhjYMmNsgir1gJaRmBl
 oNZ0KRF2WqgLto7FfDOUOITLwQ==
X-Google-Smtp-Source: ABdhPJy0LUBeawiFIOd7+cgYdEPz8V4bMQ544g+Hd13QK5iCZQqk8ayk0lS3yqwcfpFmQdM1/3QIyw==
X-Received: by 2002:ad4:5a14:: with SMTP id ei20mr17556790qvb.1.1615665088622; 
 Sat, 13 Mar 2021 11:51:28 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p1sm7382236qkj.73.2021.03.13.11.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:51:28 -0800 (PST)
Subject: Re: [PATCH 02/11] hw/avr/arduino: List board schematic links
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1faed129-91cb-2a4c-4ebe-d1ca4115647c@linaro.org>
Date: Sat, 13 Mar 2021 13:51:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/avr/arduino.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


