Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBF05F6539
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 13:29:43 +0200 (CEST)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogP4Q-0006fy-RH
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 07:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOoX-0008HY-SE
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:13:17 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogOoW-0005Vj-3R
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 07:13:17 -0400
Received: by mail-pf1-x433.google.com with SMTP id d10so1739743pfh.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=uiV1FvVVqtv3qEC5FgBwvWdH+Bp3y7YVpCeWS18KaYc=;
 b=onTqCjKgy0G3J83zUGMUBGCA1dSa+anhdbRlHpzDJJFk3aC5Wnf1UZHmtqZKxnprpI
 AP2C36on6IZJJGR+s9zCXhwTscirtvn6BzpwdSRcClkEBMoxiQ+AZkZ9v0e5bzeJgdLt
 Uu43G2BTDf7I80imXBx6NAQLTY6e11KreaN06oxGjYlGz9ljJUmSCaG2c/WKQZpoLp2P
 sykIw4R/mkw3esD6IM4mE+ANbqPBr26uEUERzMY7bgCaGLA/i1DYIwaw01X00q3s3GBC
 nXpTKYlDXijbUdrt40D03BLcHX7NSBL7+HBK3K3osME1llpqrsTsXyRXOfWtde9liKB8
 W34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uiV1FvVVqtv3qEC5FgBwvWdH+Bp3y7YVpCeWS18KaYc=;
 b=6Vc57hg4+fd3HQjRJM5VQMDOSFyPT2sker7Bvn7AMKYGvRHpNd2RP/H2zwAipGGLV4
 32nT/mHf6msnQavd7RUF5exYxyEFFju6LJnqz8gsQE2mhWftHucpZhIabOvyfGitF/jJ
 lSwRhisjylD64pLgAayhfHDxgCW+jOVljcS3eFXcrjmn/S7Mk9nBkptqUJZgJS3YRzDP
 TJCB0PSYOzYBXdmISICKKJQMkCdf4/DCwcbO+S+eh+TnO8SIVn5Li3p3Mu12aYDV7QkX
 33SF9jn/h3sKiUGmIBUP1pMdwPqD6DiSUzk+/7yqrI9T98DG22QtDUbVbeNmYf2H+TIo
 ugpQ==
X-Gm-Message-State: ACrzQf1tQwPH0APwtGFdPjQIo/Hq1Xl78lWXTiqKrnGkH1K9n91yL6HB
 +YoDai6HUb7G0Y2E6YrQ0/M=
X-Google-Smtp-Source: AMsMyM5cS+b01Q0UxyOmqxLmu9wkIrM8YUXiXhY34POMBNaclATuZFBng974uw+97A4T+hPOYTBYPw==
X-Received: by 2002:aa7:9083:0:b0:55f:9827:42e7 with SMTP id
 i3-20020aa79083000000b0055f982742e7mr4176943pfa.15.1665054794723; 
 Thu, 06 Oct 2022 04:13:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a170902e54700b00174f61a7d09sm12205664plf.247.2022.10.06.04.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 04:13:14 -0700 (PDT)
Message-ID: <c8e01827-60d4-e3a0-07dd-70ced5beb106@amsat.org>
Date: Thu, 6 Oct 2022 13:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] linux-user: Fix more MIPS n32 syscall ABI issues
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Joshua Kinard <kumba@gentoo.org>
References: <20221006085500.290341-1-xen0n@gentoo.org>
In-Reply-To: <20221006085500.290341-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.435,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/10/22 10:55, WANG Xuerui wrote:
> In commit 80f0fe3a85 ("linux-user: Fix syscall parameter handling for
> MIPS n32") the ABI problem regarding offset64 on MIPS n32 was fixed,
> but still some cases remain where the n32 is incorrectly treated as any
> other 32-bit ABI that passes 64-bit arguments in pairs of GPRs. Fix by
> excluding TARGET_ABI_MIPSN32 from various TARGET_ABI_BITS == 32 checks.
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/1238
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
> Cc: Joshua Kinard <kumba@gentoo.org>
> ---
> 
> Note: I can't reproduce the crash with neither MIPS n32 sysroot at my hand
> (a self-built one for Loongson-2F, and stage3-mips64_n32-openrc-20221001T170527Z),
> so I can only verify by looking at the (host and qemu) strace outputs, and
> would have to ask you to review/test this harder. Thanks.
> 
>   linux-user/syscall.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


