Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A688647286D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:13:33 +0100 (CET)
Received: from localhost ([::1]:57218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiKq-0000po-OM
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiJ7-0007yy-OB; Mon, 13 Dec 2021 05:11:45 -0500
Received: from [2a00:1450:4864:20::42e] (port=40838
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiJ5-0003EQ-RK; Mon, 13 Dec 2021 05:11:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id t9so26086816wrx.7;
 Mon, 13 Dec 2021 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Q5vmBoydi6XhwdxjCs7Ykk0Go8oJFpb/T+fS/otPvs=;
 b=hTe7yJ4PG3Q/VlPM7S25cMnRJeHqmka7/HIRIDRFzj74By5dDySyM0/ojBRciS6P5g
 do++JEmDfoQuPvkS8uTMiCI2iu5meJ/mjfTEHvv7R9ZcNq/kn7Lp5gHxU2fPy80yVqWW
 iwR2DwBxWOXFT8FKP1vYiQD6YKZkHphMQV4ug1CmuO3mTBzWojJ9uuJJunTPaTsiSAJN
 da8QAZcprx1G08yse8nBLeNj/zz/07u91n12LVjt+jrGI9EfLVz+bPQZSH9adTseFQrV
 r44yCLOiHnQoqTtIJbRUXgMHSxIjPivT+Mv4oYk9h8gp71dUfUExyIq3iOrMJ63tyIId
 sUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3Q5vmBoydi6XhwdxjCs7Ykk0Go8oJFpb/T+fS/otPvs=;
 b=buFsuxawPhUmY3clwMMQdQlAyNL0/MtfgCOJPtIzplglCz5nTOvwHupYbDpgr0WGnt
 hjfqcdrzr5HGxC9/DiLi1FPfNjgCXuU15kcoLRCjkKX0n9OG7hyqjJ02mQs4BeUSuiDp
 pXAyTsCi0/xhUVmmsQFIFIo+Ax1IfS/HQKh0SDqM7AOKL+N7NFO52xDEImYSEk2XQYZM
 z+Y1iiKJhroZP/2ABWcYUFlyvcHgf2NgXtiOKVDss/ZK2QpbOqtwtSjk5etWH79/c6R3
 s7jfHL4R1OfJlSFQj3lQLcQElC4BcchSttpd1Vy7dEDAA34BX8zd3xQ4uNeyOznF4m0S
 N6wg==
X-Gm-Message-State: AOAM5329pher+LI+MgxHNlb3xKCGp75v0pAtOmDdRV0rgedzz29NiYCG
 QsZ2O2NZDM/DWwAuQ+PIZWY=
X-Google-Smtp-Source: ABdhPJwyhQCKDaMwmhnj4wCGgVV5OAzi67CpAGKidAFUkWwvFF7BhIClc2PDFexzduSjW8eHsBAk1Q==
X-Received: by 2002:a5d:4482:: with SMTP id j2mr31795475wrq.355.1639390302265; 
 Mon, 13 Dec 2021 02:11:42 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g13sm7822010wri.102.2021.12.13.02.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:11:41 -0800 (PST)
Message-ID: <0808354a-c9ac-4dc1-574e-ed41c5d32a1e@amsat.org>
Date: Mon, 13 Dec 2021 11:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 01/37] bsd-user/mips*: Remove mips support
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211108035136.43687-1-imp@bsdimp.com>
 <20211108035136.43687-2-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211108035136.43687-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 04:51, Warner Losh wrote:
> FreeBSD is dropping support for mips starting with FreeBSD 14. mips
> support has been removed from the bsd-user fork because updating it for
> new signal requirements will take too much time. Remove it here since it
> is a distraction.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  bsd-user/mips/target_arch_sysarch.h   | 69 ---------------------------
>  bsd-user/mips/target_syscall.h        | 52 --------------------
>  bsd-user/mips64/target_arch_sysarch.h | 69 ---------------------------
>  bsd-user/mips64/target_syscall.h      | 53 --------------------
>  4 files changed, 243 deletions(-)
>  delete mode 100644 bsd-user/mips/target_arch_sysarch.h
>  delete mode 100644 bsd-user/mips/target_syscall.h
>  delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
>  delete mode 100644 bsd-user/mips64/target_syscall.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

