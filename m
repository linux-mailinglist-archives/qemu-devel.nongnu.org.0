Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DED847848
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 04:56:20 +0200 (CEST)
Received: from localhost ([::1]:43870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hchoh-0004ke-OT
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 22:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36995)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hchnK-0004AA-Oq
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 22:54:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hchnJ-0000l9-Rk
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 22:54:54 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:32785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hchnJ-0000kX-Jc
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 22:54:53 -0400
Received: by mail-pf1-x441.google.com with SMTP id x15so4832269pfq.0
 for <qemu-devel@nongnu.org>; Sun, 16 Jun 2019 19:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xjp3Qt2UzuSxunO9M82c1xt2Wbh27sjkL4Bw4PgLRgM=;
 b=IK7UV7YlMbYWqjt+0S9UTtvSdKLRMcQvKAR9fTM4JS+N3q2hh30w7nQIgMMixxIX4c
 R40UeZyXoZOPODqBtC1zNGF1rYnyIawh2feii2paoH3kZHjQWKaxxBqEuAAvusxe4Nei
 0bVes7gZUQDU7shMc/6gY0II94Obl9RmH0cymDRC/ZrCGCBeyUgQTYkAZ2CwC/Invyr9
 ZlxMDfJu9tf0futLSqmu//dAGZaUpKXJj9p0XgKbxGwX4eUEEosXIUf8VP8Fy2cvV0so
 HnhwevV18mYyWDojHrQJLepxFGulL93buXyXUYWIkREV6h0NiALOSFI4GCcdIvrCYqD2
 0d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xjp3Qt2UzuSxunO9M82c1xt2Wbh27sjkL4Bw4PgLRgM=;
 b=alhRq2dxoLvUK2Q/ZUkjuVjm3BPKbf4djQnduTCw0kQIQ0IGCaloI3KrQl0n8sssi+
 T8ikIYdnp1JLKLyFeAy3IKK0kczb1jcfoSg2mNTtrdXzRc1GYmjkUUOsC8Sr/bAFvs8X
 n+7R20YJcAaQPqjZdAtQT8b2dK/N/DbgulnZzlFp+bpMQgmyW7pr7cca9hqCM2fk953j
 QboCg9VU5hYuwuyEWITX7GEe9L/QFC24LYvXZBSs8eDUXfZxVRfhCOrfVTKK0PVfKerP
 83sdPQdokcirTHcgblQeNvEvZmLebvCeVd2wYsNUkLXGgYggxTOS1brb5tRiPwi5F0lN
 PtCg==
X-Gm-Message-State: APjAAAVBdol3JFKB4GrjoUgsTVjgaK+tk38cA/cZY3baxbjY9XPvZ/Dd
 PYbE+4tv6Qlk+33zGh6BLvOTig==
X-Google-Smtp-Source: APXvYqwqT0a4UcVy72GySGWpK3V4OdScUz0Sbsa7l1BCmlyhxaphJ+ATgO85PLCgTqI2sPLWhfyfXw==
X-Received: by 2002:a63:c94f:: with SMTP id y15mr47458134pgg.159.1560740092509; 
 Sun, 16 Jun 2019 19:54:52 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id
 z20sm12165728pfk.72.2019.06.16.19.54.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2019 19:54:51 -0700 (PDT)
To: vandersonmr <vandersonmr2@gmail.com>, qemu-devel@nongnu.org
References: <20190614135332.12777-1-vandersonmr2@gmail.com>
 <20190614135332.12777-4-vandersonmr2@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <7c0ae04f-2b5d-1cf2-93d8-c8ecf7a5222d@linaro.org>
Date: Sun, 16 Jun 2019 19:54:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614135332.12777-4-vandersonmr2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [Qemu-Devel][PATCH 3/3] Adding command line option
 to linux-user.
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 6:53 AM, vandersonmr wrote:
> Added -execfreq to enable execution frequency counting and dump
> all the TB's addresses and their execution frequency at the end
> of the execution.
> 
> Signed-off-by: vandersonmr <vandersonmr2@gmail.com>
> ---
>  linux-user/exit.c | 5 +++++
>  linux-user/main.c | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index bdda720553..0c6a2f2d5b 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -26,8 +26,13 @@
>  extern void __gcov_dump(void);
>  #endif
>  
> +extern bool enable_freq_count;

A third declaration.


r~

