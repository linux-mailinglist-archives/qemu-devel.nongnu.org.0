Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C06098F2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:42:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omg9M-0006MX-B9
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 14:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omd7j-0006tu-Qt
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:42:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omd7h-00008g-4l
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 11:42:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id f140so7093459pfa.1
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 08:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vv//padBuisfHjg+DIinAFC17BphP196B2vdOmMj6JM=;
 b=txyExrojrZ0QCg/5yyZvrraB0MkunhRVQsxN+MYUuyIFTPf+wjUIlJ368xaoND8gSP
 kUAcVT+DfOOUEDzSepI7jODO0goII5qcX6lqBa1F3E3CMa9Wpa3UEldgUn8EjbMfya6e
 2vW+UJhbnYQjuKIBz8OyYvZ+EG2l3sWjv3L3bay9h7RjMcWDRUwhIAZLwYFly6TEKmW9
 NyjMI6xaDgJ413RYOh7sUplyQ2srY8QjM83kyqKZ6tKvOciXXUuLbtB7BJ6ji13M2N6Y
 5zQGgzqjDfRCGlzNPBz5eOxmXhvSWxRVjxFssS/0a3iIl2Z1kByhYtfmQgMicHpfAvl7
 tSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vv//padBuisfHjg+DIinAFC17BphP196B2vdOmMj6JM=;
 b=Cr0F6d/pGtUUk1ZrKKIB3E/rkLIDEZPi2CYp/F+GglBYNeoML9gNnNGk5fvF3u368f
 olag4GKFscDvLJUMRRN/+eEwVa47e/T1/BjxNgN5OukT6Kt8RmO4VKp6IVHBL6Iu4xar
 IlY58AEyL8x2PiX6GElTeBeoXfEyBeqP9h3LdwreaXFaGXavrMRgNR4HyZhhh6eAzOpe
 V5T7M31p1dxR+A2ccT2/MBmrelnBxhkhdFYEUptBXNLggq4fcAV8jb+Dxl9z/pGS5pSM
 ENnHUs7YguUQ1L5a5M9Zteex+1K0NFG8g7VSZagZJmzQbrEslE0/1az9P0FJlZJmN6Qi
 pjMw==
X-Gm-Message-State: ACrzQf3YzJ406Hvh2FvVTBeP93w74xS49KU9S1QZJTyZ7MtdQYaQ/2tp
 /AHihwqpbxcY5fJ2equdapsCnA==
X-Google-Smtp-Source: AMsMyM4nEOGFPUa+rPiELa15TL7SRkoCJGSMA8vHn3pFnVTsYCX2r9CmeJfnRKoryG2FWI4Qyl2NDA==
X-Received: by 2002:a05:6a00:430c:b0:562:6897:7668 with SMTP id
 cb12-20020a056a00430c00b0056268977668mr29550406pfb.23.1666539766864; 
 Sun, 23 Oct 2022 08:42:46 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a1709027b9200b001780a528540sm5977559pll.93.2022.10.23.08.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 08:42:46 -0700 (PDT)
Message-ID: <f82581ac-618a-4f4b-486f-8a9b009f6960@linaro.org>
Date: Mon, 24 Oct 2022 01:42:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] tcg/riscv: Fix base regsiter for qemu_ld/st
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221023124148.6283-1-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221023124148.6283-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/23/22 22:41, LIU Zhiwei wrote:
>       if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
> -        tcg_out_ext32u(s, base, addr_regl);
> -        addr_regl = base;
> +        tcg_out_ext32u(s, addr_regl, addr_regl);
>       }

Incorrect.  You may not modify input registers.


r~

