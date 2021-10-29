Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DE4401BF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 20:15:17 +0200 (CEST)
Received: from localhost ([::1]:58146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgWPM-0008Km-0H
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 14:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgWCM-0006qU-HX
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:01:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgWCK-0000Yn-TB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:01:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id p14so17531749wrd.10
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QjQb83ct36Uj7LCEhZbWpy6kiJ5AY+0vXDiYUJpjEwc=;
 b=cF6x32iUoMsTreS11cBoaEWFsDrPA5w9js+63KGNz56KVOjK/rsQzACnqIEsUKyykL
 Dv4LO/bM+hNmUG7EB4efFboXVWyClX2mCnHL6blbKoA2sPYDtbVpgJN2bfxj1GlXhfIj
 4RZAvvy4W+axsOiJdIChOyPv4pS7MFFKIDpwx7TzUptReld1E6qpZalTJBh11KnFeZfu
 lGcY0+dAhXG5HzmkI+oCHtWRcPwRaEoW07ezJjiEfxy7tc70bLk7mqzWqwj4s5Jo3bgN
 /sawPTi0K9dQsJouEAug0E5xOCZOF0ky4YUTi9o159SDU6r+5o/5yTDYPAy+yv78jOyo
 EerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QjQb83ct36Uj7LCEhZbWpy6kiJ5AY+0vXDiYUJpjEwc=;
 b=NobLjjwgYYSW1bZjUUo0lvOr4e459M7VIrGvapqpI9la6YbAF2egzjtCncOXuhfmDt
 diYO6Uz6v0XB1toruvsZCyM0v6sTUJ0/Ev2Q4Yanc8vCjYPNHP9FzZK2NUGPV18Rn4Se
 +WuBxaxG1NfLYuEPD0SRzkOaTVa51YmSIaLKeSBrx3R3a6orOg4LRj/9KQdmqnQh4Sru
 LZYpaq/uzKHYnPunyNhplrE2C/ZNAYHOtuZl/Pvsi7SPK10t+RHIW5LTcI503k7E9aU4
 bXaPZS4dvc+SP9pAcHx9SpERXYprZqhkHGpzpIOmSDzazBYw6H1go4yUDE7XjcrQtK3A
 BS6w==
X-Gm-Message-State: AOAM533i6yjKEdcIkCNSCfMj8Q29/fT04m7ONt6G4I2isJfSQoFRoXoz
 oDbXmuBqacSJI6VzpfvToaJJP2JAOHc=
X-Google-Smtp-Source: ABdhPJwFaHzXYzN1I7HCZo0+aJZjj9LtyytBnGZgLKiQrftIREwIoWbIfpCEjhICZ+Tx+lzdeY+AhQ==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr1502199wmj.133.1635530507247; 
 Fri, 29 Oct 2021 11:01:47 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m8sm6380950wri.33.2021.10.29.11.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:01:46 -0700 (PDT)
Message-ID: <d352d64e-bcdb-8129-7309-e11d57bb0de8@amsat.org>
Date: Fri, 29 Oct 2021 20:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/mips: Remove obsolete FCR0_HAS2008 comment on
 P5600 CPU
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211028212103.2126176-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211028212103.2126176-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 23:21, Philippe Mathieu-Daudé wrote:
> FCR0_HAS2008 flag has been enabled in commit ba5c79f2622
> ("target-mips: indicate presence of IEEE 754-2008 FPU in
> R6/R5+MSA CPUs"), so remove the obsolete FIXME comment.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu-defs.c.inc | 1 -
>  1 file changed, 1 deletion(-)

Thanks, applied to mips-next.

