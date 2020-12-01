Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9302CA291
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:22:09 +0100 (CET)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4fY-0008Fi-1m
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk4eN-0007ja-Cu
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:20:55 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk4eL-0007Gn-Mn
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:20:55 -0500
Received: by mail-ot1-x344.google.com with SMTP id f16so1403137otl.11
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lDVJdLxVnKO+AbMMT2ufZlF2lh5qmyf9JwdaHQg4BXQ=;
 b=L1CSxSCY+fOYl9BnQPH0156xBQhDnf7g+oDga3QEH6/UyZt/4nmMGfH5Tmjg2sBqmR
 23mbI90YmrqPO4r2UbRS3oZOTNblPCPBMq5soE/fjuJKjDZsclGV387upB4utirNSFOi
 ZCJQi7KnkD0ZEbw9V2ldw4gMyBujwn+9rNfl8BbZNVQvjReX6rJULkKw1BOkok4Hdzy5
 opddjjFM3Q5K4nYYcA3m+Ly/hW5vboMAjBdWbsadCTDaySVZtySiNAtHnLblmtFrgjmX
 bj8AtlxxyaMRPK9raZEnXlQ3/u+wbtgpYO3OwhFkZ2t1CoY3DTrzk86zsVbq8CecdkJ4
 JxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lDVJdLxVnKO+AbMMT2ufZlF2lh5qmyf9JwdaHQg4BXQ=;
 b=iMZ4XKGp5WCgIWyR0699acCbVKEo/w4Echto7lc8chVy9w7/AEb3X/BDHpVg8RZV3Z
 z/oKo4eUwhdc+DWkzCc2iHf+Ydou7JCpRgysqESg8cfcKMj27JVsqroJqUZbWSfe/DuQ
 Gs+UFIwbU9L0QCZrNWCKaGrsxZwKE56knA2xt6XJ5zepIIxN8e9cyz9/PZOKNlCao8x1
 Fzmicht0c0RQPG8DVIDvAb85g6pfAj+21zu0P2dHr+BctgcA8+4awccwe8HBM71pHTk4
 TdSmGmZnYmq5LTtBmCIl0JDH5n1NWcQzPUlrMYQ5oZ820CiDPn2XRbMXEgGvjG6ZUmeO
 YNsQ==
X-Gm-Message-State: AOAM530F6CvTS9KWWPJyvzgudAThnojDcntFk/RvEE/ldFKxPr6SBei0
 loFwLhL6SZMaZMWpFp17JqyT2w==
X-Google-Smtp-Source: ABdhPJzJ/WXtyzNc2WcyuCoxuhFQzo/fcisYyEo2rZn56JuL97otci8AEMAvNHGYc79XFvofdSnHnw==
X-Received: by 2002:a05:6830:204f:: with SMTP id
 f15mr1570493otp.80.1606825252472; 
 Tue, 01 Dec 2020 04:20:52 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id u20sm353656oie.56.2020.12.01.04.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:20:51 -0800 (PST)
Subject: Re: [PATCH 0/2] linux-user: Add support for MIPS Loongson 2F/3E
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20201201083951.2745111-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94fdbd95-ce7f-7e5e-bf73-440bfeea9859@linaro.org>
Date: Tue, 1 Dec 2020 06:20:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201083951.2745111-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 2:39 AM, Philippe Mathieu-Daudé wrote:
> Update the ELF HWCAP bits and set the Loongson instructions
> so we can run 2F/3E userland binaries.
> 
> Philippe Mathieu-Daudé (2):
>   linux-user: Update HWCAP bits from linux 5.7
>   linux-user: Add support for MIPS Loongson 2F/3E
> 
>  linux-user/elfload.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

