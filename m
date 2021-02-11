Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B09C3187F9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:20:53 +0100 (CET)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA95g-0007gD-4Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8vj-0000Fr-Bu
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:10:40 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8vd-0004qM-E5
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:10:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id n10so3248990wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZdmcRZQVIA18M75nDGuIE88SmDMOWl+9uPOPD5CtS4U=;
 b=F4t00az4kaz/1BYJbYvfAz2A2sCg5XPaVxbyQEk1wiRjE8QQLZzyAt/5NwfyIc8bA9
 VeegiGxJ+soc8rhoUc07HJYuGorh0dBI2jxldRVRxhhIMMUUojdxH+k0Ake1JgqYo0Ck
 KrYXrfwgOxSbjSc7gx0Hb+Ntlb44+++XEXlERRhGCYzUck2zgbRnbloNIq47OiA8JKW2
 oTP3/kZGk7Oh6sjkGjpXCu16Re8zlz8nYDLo/qJXM7QXX+B2I2ECrjmAUO9lM1WHQ19P
 dJI+UQXGW7+WT7EJ/X830o3nJzANbsbL1i+FlIKlTO352j7DkNZg7IElpNJgTc5qKpjV
 BKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZdmcRZQVIA18M75nDGuIE88SmDMOWl+9uPOPD5CtS4U=;
 b=FOpZuhNntvUOVTJS1QAe5C5ZZMbNOCeclfZnCz8qTHacd0+r3SKeBZOS8Pr2H/R//Z
 iA3bmnf3aFVNPi6Moe/6Ik3pVLShaARHked/w+eC7q4abs6xnqoP00X3bE4PcXv+xDTB
 HxRgIfINIXaV3MgiGbHOdy2P7XlCSvQqQgo79BBDOuL2rs+hEnHh1VhrgXNsyhyxUY/I
 fW2rh1WKH29vE7ubiOCYRhV1lWlMO0xC+am6uFIu67HJFlPuXPwdwXLBmeZeh+pbnlpK
 hovbC02dknoAdROo+rmZZ5xhEP53IITY+9agpBureLJUOxjB6gRWTgEzjaZQ79xaUVWx
 YV1w==
X-Gm-Message-State: AOAM532x9vZvSfQwFSS/J0ot7LGJkojGWpWokyj5EhEOk+wuDFVV+MgL
 q8LuLDvtFxlwSkE8AUEsV7wK3lJNJTM=
X-Google-Smtp-Source: ABdhPJw18we8BgcHiVcZ1fmpoAN7iCkENRgPgYzV4AVf/PzdqNuTz4M03WkMifkXlolmoMllHWc/eg==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr4417774wmk.188.1613038227155; 
 Thu, 11 Feb 2021 02:10:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm10191301wmb.5.2021.02.11.02.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 02:10:26 -0800 (PST)
Subject: Re: [PATCH v2 12/21] target/mips: Create
 mips_io_recompile_replay_branch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210221053.18050-1-alex.bennee@linaro.org>
 <20210210221053.18050-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6e746ab6-979c-599c-d5fd-3cae7c4d5b89@amsat.org>
Date: Thu, 11 Feb 2021 11:10:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210210221053.18050-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 11:10 PM, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Move the code from accel/tcg/translate-all.c to target/mips/cpu.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210208233906.479571-4-richard.henderson@linaro.org>
> Message-Id: <20210209182749.31323-4-alex.bennee@linaro.org>
> ---
>  accel/tcg/translate-all.c | 12 ++----------
>  target/mips/cpu.c         | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

