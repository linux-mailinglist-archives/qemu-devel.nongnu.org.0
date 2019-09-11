Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD50B05BB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 00:44:27 +0200 (CEST)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8BLe-0006TF-Jc
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 18:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BKn-0005zt-P3
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8BKm-0001wE-LJ
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:43:33 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40847)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8BKm-0001vr-FC
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 18:43:32 -0400
Received: by mail-qk1-x741.google.com with SMTP id y144so14489398qkb.7
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 15:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UXX/qWLQ5ycH4sZQZ9cy32zhc9QaUh8qQNvutkmxdtE=;
 b=kwMZGq8pILPcFt+u6kRA8RaW/vTgTea90FImVJXniP2jAJnad0Z4IvU24YR+A6JEVf
 vvmh88+axZ4aJdU6df4KTuxMqjOgaiRWnJU/CQV+/U5n21Gb79pSmJWsZ4mKV9r4VSXd
 HY/Xb86SPdzE6IAMaVGK4wM2HVXCXdCPhBW4ZaJLzViOqDwEXiuyvF1VA9UCxkOFPWtC
 A2alTBktqJ1Qg9Vppy8/Xx6pzZPce1RiDbeQZQxJcCva08FDjDdqoKbtsRm+qqeZA4Rv
 gx7AB5uEB1O7k0ZWKZLEa9oL2eXS3ymiCNelkw6wUFufiNr9n1KjqgiX+6b+VgL26ADj
 XqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXX/qWLQ5ycH4sZQZ9cy32zhc9QaUh8qQNvutkmxdtE=;
 b=jXWdWUrnPlNenKxi6IZxLdlnHcuNadS92gEPDjqLtBDyf0+/YGo4cn+IiV6WAkSEG6
 9HcHNsgABskos3QioZPQjrP3QzqXWTR65PQlPiIhx+9GV8fBNd5aSTYXj0DtohSz8Tei
 IjzEDC6lWiENv0sG7ms5l1pwC8z6Nn6t3FMomgPgcxKR6G2xnulD5c12xniIGgP77d5g
 150IMNLvYAhlB4TL6N2ScHG46oOXZqkYj4XIX8UW2LKk8VnKUKS4SKFzawkS/O/9M6gn
 dMMunsOm7e5PQ5cDtoAVDHgWicdoCbilupBNcKKzfDLmR+BGtc80yPRZ7Y7Luco9rLn7
 eBLA==
X-Gm-Message-State: APjAAAW6Z3yKqj3oz2FGsJURuQQ5XuIl0A/4gS9p4A1xP7g+hSU7CdWI
 mq9MtZT+tidlAaQwD0XkSfGM1w==
X-Google-Smtp-Source: APXvYqyOkYNvImQ/6HX/nWJPau6lz1m98sQYer4e2ccREQVgMu/Z57nSSpIdAT2IIoClKdTJCgLqBg==
X-Received: by 2002:a37:a704:: with SMTP id q4mr20073701qke.385.1568241811811; 
 Wed, 11 Sep 2019 15:43:31 -0700 (PDT)
Received: from [172.20.5.51] ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id p199sm1582680qke.18.2019.09.11.15.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Sep 2019 15:43:30 -0700 (PDT)
To: liuzhiwei <zhiwei_liu@c-sky.com>, Alistair.Francis@wdc.com,
 palmer@sifive.com, sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de,
 riku.voipio@iki.fi, laurent@vivier.eu, wenmeng_zhang@c-sky.com
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ac250aa8-886f-befb-070f-2f5d10861e39@linaro.org>
Date: Wed, 11 Sep 2019 18:43:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568183141-67641-4-git-send-email-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-devel] [PATCH v2 03/17] RISC-V: support vector extension
 csr
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/11/19 2:25 AM, liuzhiwei wrote:
> @@ -873,7 +925,12 @@ static riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>      [CSR_FFLAGS] =              { fs,   read_fflags,      write_fflags      },
>      [CSR_FRM] =                 { fs,   read_frm,         write_frm         },
>      [CSR_FCSR] =                { fs,   read_fcsr,        write_fcsr        },
> -
> +    /* Vector CSRs */
> +    [CSR_VSTART] =              { any,   read_vstart,     write_vstart      },
> +    [CSR_VXSAT] =               { any,   read_vxsat,      write_vxsat       },
> +    [CSR_VXRM] =                { any,   read_vxrm,       write_vxrm        },
> +    [CSR_VL] =                  { any,   read_vl                            },
> +    [CSR_VTYPE] =               { any,   read_vtype                         },

Is there really no MSTATUS bit to disable the vector unit,
as there is for the FPU?  That seems like a defect in the
specification if true...


r~

