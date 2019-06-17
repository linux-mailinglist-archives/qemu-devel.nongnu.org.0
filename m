Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB34896E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 18:57:16 +0200 (CEST)
Received: from localhost ([::1]:49738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcuwV-000386-Ju
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 12:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcu9n-0007pJ-C1
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcu9f-0001jt-Mi
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:06:50 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:46265)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcu9X-0001dS-Cp
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:06:41 -0400
Received: by mail-pg1-x543.google.com with SMTP id v9so6052806pgr.13
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HZc0ugJ4In0YcPCol7qHxJ1iBTe+z3wZFv5qxvYmNAk=;
 b=poOxT+SGMQQQT/oZL0Wok0tdkcGyW+LrhAJbrcjHc68Dn0KCNHjLggLHFqVnZboA8A
 RNLaEbRbNaFkc74sfU152VI58B2O/Lfi3Prz3CjsmeseMZNv7gWwTuKcAEzq/E6nrbUu
 bI12pIMtAoRRXOQ8MVyrhsFuHHr2SVVJfsXgzSscvQP8f+K5pM8B/RHY03cJSYyEiJO/
 7JGLgpWPBeKCE9MPMRZ+SVTjm6/87+4Exu3vdbv4bSnT6OWLGRZLxfGsHC3BUJcsZuCh
 NPdgGqX3nT+mD5khppQc3Lbo90bHNsFvpEK//qitI8isECcwLGVkGAr+WI2zaN5rpPlx
 AKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HZc0ugJ4In0YcPCol7qHxJ1iBTe+z3wZFv5qxvYmNAk=;
 b=i5mLZdRJs0bbE6FOJ1FH06CF0hCdHWFuyP9DHMlabcEIJqS6M15yYwcV36i52n+FvX
 JABNCSAWpswiwerjONXZk3D5bwLUa51HDDzEUihPCgEX6O6Tw5qxpp89LtPxW53VMZEX
 /tWC5dNlkkhu3Mv5PgTUXJgXfHGKGpRlr3Iwx/+s7c1WkUgqZO6MiAQDXzLzKU/5rfGZ
 nptOspsdujZvpl9Qz1IWKWdBKPF5Z39/iq1Gwe0yWBHyzwkcLgjpsQVgTXIaX4lpYiQr
 MUpBfh01Xjc10sY8E0YK6DREC9axOXXjvBo8/CwBKj2jtGHeCgBPXu+sy1kIzymrFi/N
 RYPw==
X-Gm-Message-State: APjAAAVyh1DxhAqDAjykZK+EDjcz1ollhC5sbicw3o8rp9v6cF5H+dds
 +1ttWL4Tbxw/phvjBoBJ75jrNg75Tm4=
X-Google-Smtp-Source: APXvYqzR5bv5StuhnO/4YX/MYcXUfecV6BtJiBwV5gSQ8yM7ar1aBsmq39HV+i9grbqxBTXWoWtvZw==
X-Received: by 2002:a62:7552:: with SMTP id q79mr95246515pfc.71.1560787596649; 
 Mon, 17 Jun 2019 09:06:36 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id e26sm12410136pfn.94.2019.06.17.09.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 09:06:35 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
References: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
 <20190617143533.15013-2-kbastian@mail.uni-paderborn.de>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c073a437-ebe3-41ac-096d-4b20b7f9dc36@linaro.org>
Date: Mon, 17 Jun 2019 09:06:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617143533.15013-2-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-devel] [PATCH 1/3] target/tricore: Use DisasContextBase
 API
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
Cc: david.brenken@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/19 7:35 AM, Bastian Koppelmann wrote:
> this gets rid of the copied fields of TriCore's DisasContext and now
> uses the shared DisasContextBase, which is necessary for the conversion
> to translate_loop.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/tricore/translate.c | 98 +++++++++++++++++---------------------
>  1 file changed, 44 insertions(+), 54 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

