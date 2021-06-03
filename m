Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E939A609
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:44:18 +0200 (CEST)
Received: from localhost ([::1]:51096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqS9-0001Wj-10
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqIk-0008H0-Vg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:34:34 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqIj-0003dY-By
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:34:34 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r1so5561573pgk.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bKDSG/vl6Zm3HS8Ctg5GZll8yhBsX/63RfDYUvFsIuQ=;
 b=yW8k0wbY/ErFpRIAPoR3dNni782JNfEs1iSTqKrcJFSj0Ns4JJcpq5HQqk6PgaZP6J
 Ev1toebWfuaiqovvi6WyRfqx4wYgP+MtM3ZwPHZK3v6ppI5uXCde2aetBoUhEb6AlvpP
 moX027YRqVTWUGo5Z9qYSxIVlnx67u1Bdd8oiyMg0Bi1Fz9YAZzZ1TGwsFygebw9nNhX
 76Zr3jUP4I24v6SEC4Lm2FJG+gVTsCuNd8WWCwJ9Kv0WKUE2VNHDSkbS0rlnXsh4bJzt
 mWjO1HFbL7I+vnRC9bt7x73WYyuqZuS0lXpdJK1b1bO+xahaJmiBDWV7EA9JOfzIDSlx
 Wb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bKDSG/vl6Zm3HS8Ctg5GZll8yhBsX/63RfDYUvFsIuQ=;
 b=F8Em8pUmBzx0hr7tHD1CaW1umRDgvPLpOVXq43KEdU8LpYZ8CbC0RlJkVFOu4GbItE
 XereJGQM0DjvGxGOfIt/a9hZ/JXF2VH0KPf0hmduOxMM70MsT80RgK7K28j7JtclmBMq
 etYtwTLZI8mh5Mo6ECBOTLq6TRZtaxVvZRPCDHnlWinU+8lWig8dJHS728FiLJe+k2/z
 o4GoXAJxwgPJ0QbcFqdCcVaaqRm+wkEMkGoS0U5mmzbq6bKySQ8EyWAGqhKh1vuPX6ko
 P3w6vhWIjfV9QCUqjvawlZ7TONTu+q30J3dhjj5ySZCU/nnfrrxWTdvTgLL5XM30uKLF
 gRMw==
X-Gm-Message-State: AOAM533CqAL0r6uFdNFsYsZE8aSX5OHmIKrutn704Xnm718c0bx7XFVw
 orxnXpHPDlrERIQtQlAskwIpjQ==
X-Google-Smtp-Source: ABdhPJxH0QMHjxyMO1skZCf50cll7rEvQWN74W9MJwFZ/XDVJhfZ5gcv7XcNFIc/HnUWBYJLjYHSBw==
X-Received: by 2002:a65:6487:: with SMTP id e7mr330625pgv.27.1622738070685;
 Thu, 03 Jun 2021 09:34:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t24sm2655666pji.56.2021.06.03.09.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 09:34:30 -0700 (PDT)
Subject: Re: [PATCH 1/6] target/microblaze: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72e0b8d0-5350-75b4-e87d-28c0b0a67ac4@linaro.org>
Date: Thu, 3 Jun 2021 09:34:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603090310.2749892-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:03 AM, Philippe Mathieu-Daudé wrote:
>   static unsigned int tlb_decode_size(unsigned int f)
>   {
>       static const unsigned int sizes[] = {
> -        1 * 1024, 4 * 1024, 16 * 1024, 64 * 1024, 256 * 1024,
> -        1 * 1024 * 1024, 4 * 1024 * 1024, 16 * 1024 * 1024
> +        1 * KiB, 4 * KiB, 16 * KiB, 64 * KiB, 256 * KiB,
> +        1 * MiB, 4 * MiB, 16 * MiB
>       };
>       assert(f < ARRAY_SIZE(sizes));
>       return sizes[f];

I guess this is clearer, but I'll also note that this is 4**f KiB, so could 
just as well be computed by

     assert(f < 8);
     return KiB << (f * 2);

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

