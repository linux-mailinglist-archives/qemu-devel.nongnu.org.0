Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014AC2DE3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:13:24 +0100 (CET)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGVW-0002Ax-W4
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGT2-0000V0-Ey; Fri, 18 Dec 2020 09:10:48 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqGT0-0008Kn-PZ; Fri, 18 Dec 2020 09:10:47 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o19so5809425lfo.1;
 Fri, 18 Dec 2020 06:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Icab2t581Ck4QeC270P5fiAfqxwfrPopZCszLQQScwY=;
 b=JRT7WLwVDF7J+BV0mV2sQq+vWJa4zYMf1pyQPoemuNg/Ho2TMr889GxT7DfycHMRSt
 l0yByQ4jQrjBa5EDOy7yeQeSj5d9icK9Pesweu8D7CWjdT3E9Mgn9Td+7BLtazbvDz9X
 +W2rIvCE1zxFvRZpRkhP0vdd0WkkVq3opGqaGeoETM/V0fRXNnJeDsO3IdXYWEO4Egs7
 xAtZ6XygqI8VdDLbT57V3eINNvoGCP1Ft/H/6DxYm4GOIBnUHrNFGDhcoFi7TwQpj+55
 ujpEBN2NxyUuL5wiNuXpahFHGSe9SYrp1wzrftMSZ6XFZCnrkJxd3ItCZFP5ZduMM4KG
 15WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Icab2t581Ck4QeC270P5fiAfqxwfrPopZCszLQQScwY=;
 b=kFUgHHPmLQwjOygcsl3hG4urJj1XTXGvi9cv3LjIlBs7qlvgGARI9vFuRzTs0rUIUK
 QfUywAANpSViN3XQxC7aewk27XII4tiUoaR8W29e5salZWkAFxjGVbzW1o22UV47fwLv
 GP6cJe0A5vGbOG2T63Sp5AJ1/ro0nrAmboI0RfGIP7JQ84y40yX2IHrb87WItev9h6HK
 BkUuaIEgaC/0uI8oKjV8ciRIY5bwnIXU9Pwc9VfdLIinpZhTntJL3eSqqU+h58TT/HQE
 j13sMgwZEpWwHW6qLyqVxgXTYbM1ymWWbV+0R4e0HH2H3t4ANV0Vp4T3nHkmcnbzfMY+
 l33w==
X-Gm-Message-State: AOAM531strcOnZGq8qCn3Aakrp8EO8EALGNDFLuhmgZpgxZyQHcWfi2+
 khD1scqXXP8eldb2ZjZp/p3pn1L5rfBdVA==
X-Google-Smtp-Source: ABdhPJzusSQcpmaHegR7i1GvQ6Cd6Wvw0+O4nnTnefthvlgcT1V/bRaAwci4oD0qyz3x7tbMm87KjQ==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr1902535ljo.490.1608300644273; 
 Fri, 18 Dec 2020 06:10:44 -0800 (PST)
Received: from [10.101.1.184] ([185.224.57.162])
 by smtp.gmail.com with ESMTPSA id x138sm938286lfa.66.2020.12.18.06.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 06:10:43 -0800 (PST)
Subject: Re: [PATCH v2 6/9] gdbstub: drop CPUEnv from gdb_exit()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abbd5586-655f-c3c8-409a-c2edad3e798b@amsat.org>
Date: Fri, 18 Dec 2020 15:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:27 PM, Alex Bennée wrote:
> gdb_exit() has never needed anything from env and I doubt we are going
> to start now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h    | 2 +-
>  bsd-user/syscall.c        | 6 +++---
>  gdbstub.c                 | 2 +-
>  linux-user/exit.c         | 2 +-
>  target/arm/arm-semi.c     | 2 +-
>  target/m68k/m68k-semi.c   | 2 +-
>  target/nios2/nios2-semi.c | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

