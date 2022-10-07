Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE285F770A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:46:27 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogks6-0004S5-Ou
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkmi-0000Fz-NI
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:40:53 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkmh-0002C6-7v
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:40:52 -0400
Received: by mail-pf1-x435.google.com with SMTP id 67so4517415pfz.12
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mdPFoRUFIZGBJA8nE1KAvD9rYhpPWusUfJU9/D7GUFQ=;
 b=ouiApFbTO5OCoWVX/6/crabCxhmd2F9rYTl65hSON/8X8pCe/Q8Z4J8gF6MUNfSJgg
 wEVZdr+ehiv9qAEBGEpa5f4Y9242GyQQkyCJ0OVmJCiKyn3K5yrydh+3N5Kv9DhRWm6J
 FqbLSMYZm7iKkzgJLaTf3LGauX0fJDZNzwLcxGx6HTWhShngiz19rEt4MFiOs1zca8Vo
 eKw2/NElTCR3hkg18dC6wsdxXohBxP+BzUcGj1v2UGTThSIYDjkpP4rjNvs35Bvc9uIk
 ZEajwFApZnUFPeNfY+D9G8qpWt/P4IakNeQbcw+ExIeXnYcIPkIkIu8wdL0IalKg/0Ce
 mXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mdPFoRUFIZGBJA8nE1KAvD9rYhpPWusUfJU9/D7GUFQ=;
 b=Wp52S9UwPwo8dNakRSto7/NX/Szc22LmRV848XMLUS57BACs2wWA7Hb6f7opNQWV/2
 DXCmsTcEb2YvU8FCzqk0iHLdT47CDB+7hR+QWuT+GFfF7hzMYM6C5UYarL91KW15x69Y
 rWWiOW8tVRPbONFLEbmOX3u0alz4z1pkIzvrPZSYCioRuZez2IsKvWgOTTc99h5vZ/0f
 d6qrhAexgc0EdzcObSOBK9y7EB8Le92bTVI45OsLUaWAivIXAYHohyUG3HvkpPeziGbM
 Ro8VbzcQQPTmJwiRmQRhCTzbxP8hNUkn559Vpbx0liJALsKaEFbz+e1a4Va8pXs8CsYb
 PtQA==
X-Gm-Message-State: ACrzQf09CRKd3nECZ+T3CJqSxYfOeNVwcPT5Z1088bVgLlukbMBrEPGe
 8kICjnGx/WEJRnGKujYp0zwY0syp6AEqPflFSYmNioyi3WU=
X-Google-Smtp-Source: AMsMyM7P35wHQO87UoTwpQ5GXKHiTmkANOYSqgSQPIJg3Hgqv5EG1vLKfGKB6QxtivRD8GWRiedw7S0s3543xwsmI24=
X-Received: by 2002:a63:89c3:0:b0:452:f2ad:52b9 with SMTP id
 v186-20020a6389c3000000b00452f2ad52b9mr3917467pgd.105.1665139248544; Fri, 07
 Oct 2022 03:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-41-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:40:35 +0100
Message-ID: <CAFEAcA-FKNFufMA2z+QCzcv+uQFe1qTHucS+MmNU+8+auFVpZw@mail.gmail.com>
Subject: Re: [PATCH v3 40/42] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 18:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Both GP and DBM are in the upper attribute block.
> Extend the computation of attrs to include them,
> then simplify the setting of guarded.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

