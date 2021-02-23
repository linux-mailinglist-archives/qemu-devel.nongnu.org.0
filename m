Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CA3230F1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:49:13 +0100 (CET)
Received: from localhost ([::1]:58994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEckC-0000BY-FY
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcib-0007cE-Cz
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:47:33 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEciZ-0008Ok-Py
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:47:33 -0500
Received: by mail-pj1-x102b.google.com with SMTP id cx11so2425963pjb.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AQs5T7PP2knsx+kEmh/2kME9aYWWgZPkV/uaNKlvhb0=;
 b=vnHSwbJMqUAtctj38g9YkOZzWg1vuQnP6EbGoJSdvF0l7K4fTtiWaotTZYnxHMAo2E
 D2/pzecbHJaWMPJ1fFoemEsvIi6EncmBfV1Qyy/gRY/uze0EIwcn8Uf1fWETniXxHjjL
 gLir4x/gN4SBPWSVbgmp7ZWFlpulr9WBWIjWdxOD9M5YFx7dg7YrZZWnUb9ZY3gPB0FA
 QA9Ro7ZKcNF4lNePEeFz0SBWnguOa3klDkgYYbszqMKZveMw7ppmTLy/T7XJyQ+kUEeG
 MSaVhS0ghrvzkU63KCUiRT9oa9heD1LVN77DtVsiNQmMAU9B97nAze1hBjsUdeN3Qo1V
 1h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AQs5T7PP2knsx+kEmh/2kME9aYWWgZPkV/uaNKlvhb0=;
 b=Mm5zE5CeBzyhqaVQJFYl9GM2c0P5cyQo5n7n9FDGZkdOv//S6Do7TlN/WJ2lTdL16+
 WljX7P0do6tjP2pZWUA7uvXXlwZLj9jKE+gvvUc/t/ZXD50v6FIA+I7eJsPGG0at7LPW
 UJGNzuGu4Fj+kic+oxoXf9/QCZyrOWxfvKmZd84iI3QPBjionEQxLrm4EyUr230J2hJ6
 PncFRI9vNLq8oamIEIXRsUlTLXBYLqD2+4LjAyXE4FoWvefDfO+m1JCWQIotnaxeT7q7
 KQOQxRv0HNcPe4cgMNnQI9MayMyH/DTBDH63Teoyao0oOCmaWfHRf69H/IKUC52WoB43
 8fwQ==
X-Gm-Message-State: AOAM530QGhHsZs8ClUvAvRD5xIjEw46jYY1XKCjn0j0mz6WtGK5bZwtC
 ZWcO0F9XjB+NvNuqSpgFjHsAv/Q8LkVXoA==
X-Google-Smtp-Source: ABdhPJwQ6N4y2Wsc7Tx6+W6JLRtibLdErVTijKQ8jok91N9TXPUbcm/OfMO7knwaeqgbsOKhWQaWkw==
X-Received: by 2002:a17:90a:7344:: with SMTP id
 j4mr162189pjs.216.1614106050446; 
 Tue, 23 Feb 2021 10:47:30 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 14sm24354268pfo.141.2021.02.23.10.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:47:29 -0800 (PST)
Subject: Re: [PATCH] target/hexagon/opcodes: Add missing varargs cleanup
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210223111253.2831285-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <565bfcd6-edc0-a9b7-5cd9-9eb73a5d5118@linaro.org>
Date: Tue, 23 Feb 2021 10:47:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223111253.2831285-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 3:12 AM, Philippe Mathieu-Daudé wrote:
> Fix a trivial incorrect usage of variable argument macros detected
> by Coverity (missing_va_end: va_end was not called for ap).
> 
> Fixes: Coverity CID 1446720 (VARARGS)
> Fixes: e3c00c2ed75 ("Hexagon (target/hexagon) opcode data structures")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/hexagon/opcodes.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

