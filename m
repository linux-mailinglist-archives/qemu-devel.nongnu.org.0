Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216792B97A7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:23:03 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmi6-0006Hd-5y
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmgK-00046t-SO
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:21:12 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kfmgG-0007iP-S1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:21:12 -0500
Received: by mail-wm1-x341.google.com with SMTP id 1so7278346wme.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vq3hK9v4h8GGSyggGKpUFyNjRo6DKtOs80VRJeyUwzw=;
 b=OASNQd6eGK6cCHtfeG3PHsU4biP/NCQ+FmuCJYXBPzDX4QuLBGsQjkUP/HRMV7wVBP
 0u6i61zvrhIYJxORle28mr4sO/Od1vDvWtBIs6YeZtYCHxJiO2ZXpEv7bY5xXUSjI7jh
 bWlstKiLMR0AhJcTw3YX2rT+e1zLvaWvKVtLrHCIMfb96Vmls0Kc4h8XaHp8ly408K/o
 WimaZGKP8bctgg0EAKcd9Fum1P4yk+OA7SN0haPAQMVdg1C7F8LXv5QdfakPer1iKp+A
 FkUh9j7wao/VwWnvqz8H5RWfvF7jrHfTrFdwxA+CCrpXTnXwcAQ0ZY6WlxFDfjvBRPkV
 CLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vq3hK9v4h8GGSyggGKpUFyNjRo6DKtOs80VRJeyUwzw=;
 b=J0RCp2eui5i/9zaCLxZ02esJaNs2zf33jrq3Xb/g+Z4r1mooqjo5uxclaCrgswQKPe
 OFVMQikVQe3Uef5XOc2Eb40f8CNuAynF98NoOjvQXC8MFS0YOy9koZPsNiOicaLrPi/R
 sapDoprN2o6IdMTPEG02vlsSmyTvaEmJxK5E4J0UZ3FjXjnITWHcSpYQLXY8rkphmkKc
 3QgwOUs5zEF9CfFHi0t1z84/WhaViFMOgyxqK3Z+OEXEske8/Wa4OspkZX90fwtNCKE8
 EdPHmQYGYionzyr5cF2w0/ws/ONNNiIJvH58Ll/rOr0Wudk/SYmLpcoR/F+KAhpb72Zk
 ZZGw==
X-Gm-Message-State: AOAM532E0TqCu5f81l+CwSpCsawO5ES1xNnLSFuq6ykzKstiwy9UmUGE
 yTxafCf7ooaFYq4u1W4mLwgmr+lOSWU=
X-Google-Smtp-Source: ABdhPJznzk5XrwbqTRdTpyL/XnN0QP3dHdzUKD3/Ny6IR0koTEwJpc6UGyQYCfxeGzfWUVtLlv1a0Q==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr5715110wmg.121.1605802867598; 
 Thu, 19 Nov 2020 08:21:07 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o63sm569054wmo.2.2020.11.19.08.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 08:21:06 -0800 (PST)
Subject: Re: [PATCH-for-5.2] docs/user: Display linux-user binaries nicely
To: qemu-devel@nongnu.org
References: <20201119160838.1981709-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e3801a87-8eb7-fae2-5118-8669b696e610@amsat.org>
Date: Thu, 19 Nov 2020 17:21:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119160838.1981709-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 5:08 PM, Philippe Mathieu-Daudé wrote:
> linux-user binaries are displayed altogether. Use the '*'
> character to force displaying them as bullet list (one list
> per architecture).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/user/main.rst | 99 ++++++++++++++++++++++++++--------------------
>  1 file changed, 56 insertions(+), 43 deletions(-)

Patch easier to review using 'git-diff --word-diff=porcelain'.

> 
> diff --git a/docs/user/main.rst b/docs/user/main.rst
> index bd99b0fdbe9..8dfe232a3af 100644
> --- a/docs/user/main.rst
> +++ b/docs/user/main.rst
> @@ -170,68 +170,81 @@ QEMU_STRACE
>  Other binaries
>  ~~~~~~~~~~~~~~
>  
> -user mode (Alpha)
> -``qemu-alpha`` TODO.
> +-  user mode (Alpha)
>  
> -user mode (Arm)
> -``qemu-armeb`` TODO.
> +   * ``qemu-alpha`` TODO.
>  
> -user mode (Arm)
> -``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
> -binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> -configurations), and arm-uclinux bFLT format binaries.
> +-  user mode (Arm)
>  
> -user mode (ColdFire)
> -user mode (M68K)
> -``qemu-m68k`` is capable of running semihosted binaries using the BDM
> -(m5xxx-ram-hosted.ld) or m68k-sim (sim.ld) syscall interfaces, and
> -coldfire uClinux bFLT format binaries.
> +   * ``qemu-armeb`` TODO.
>  
> -The binary format is detected automatically.
> +   * ``qemu-arm`` is also capable of running Arm \"Angel\" semihosted ELF
> +     binaries (as implemented by the arm-elf and arm-eabi Newlib/GDB
> +     configurations), and arm-uclinux bFLT format binaries.
>  
> -user mode (Cris)
> -``qemu-cris`` TODO.
> +-  user mode (ColdFire)
...

