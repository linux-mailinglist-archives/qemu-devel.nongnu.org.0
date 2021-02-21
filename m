Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6CC320AE0
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:05:11 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpME-0006cO-Hw
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:05:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpLI-0006Bf-JU
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:04:12 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpLH-0005i6-Ab
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:04:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id v1so16272531wrd.6
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uO8fn3gwc3ZwKivnxWWcu74mwcE6xzTnBPuvrXS/TYk=;
 b=Dzk38lmfwHUH7LKA4qSmWCc4Hi/bEMB5ybuypScq83dQjAs8cu6/ohc4EeYP0Kczcv
 7V0DPbazGYH+AHqJXvohxXO2jT6cwbJLJ0VQJbzbn9Ho9mODGleCBn00DxWlUWAYrzI/
 XCydsOVbLi4IfovHtSV50oQgfg38p0pygh0lc0lX1FFdXV6upUrnZJDK6TopBdDslQki
 wODjpdbBpcDy5FzOZvvRTwpe6s5DbAogBIOMGxcT2BoyU3BgJ46yai2rwt4SCA1NbmiU
 EhXDdgCnxYepmTbzmMq9lqnJRl3rJCyAv5k+sb+32H1Vrbto1X7THiSiRGmGiu32TmWZ
 P/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uO8fn3gwc3ZwKivnxWWcu74mwcE6xzTnBPuvrXS/TYk=;
 b=emH2G15svzRkvuzwmZBOb/8rZgCUlwI5h6TTY+l3dBp+UX3UfsbOTG3YP578O8zFjc
 e0mWBXWqqMD6AhHC9QkC6FkJaIilJ6UQVfkEZO89qdJXAAj+VUKP4PotSHEImm6LnhVv
 mLdPlcqvXbxX65FZZrIaAc1N13RVKlr/oHR3OmMZku5h4fPZNNa4I/j6Z1Jp6ULYUIMx
 faHU9PdquZk+IkfjPfHOM/4jY+zIiCwHcj/dVzXLPkao7MQ3LTMSaQcvo+tZOpLmU5Em
 ds/jGHMknHHMXTFduuaNz8GptrcM3vHmUeoKV8GJqKz02nehlf+SxXCwal7j/pLYuh7p
 CTfQ==
X-Gm-Message-State: AOAM532PuKkWsIR6t29vD+pI5YpKlcsf31V/amSuRuMUH13tki3xXio7
 Wq9mrTGd9/kM14ffMASV3uw=
X-Google-Smtp-Source: ABdhPJwqzM8m+Dt4DS7M+nHOKO0ZU0gzb1EZy+LrXNQn1SPd0sEYFn01vmSgL7cvx5Dr2DNXbDUpvg==
X-Received: by 2002:a5d:6706:: with SMTP id o6mr9633473wru.235.1613916248388; 
 Sun, 21 Feb 2021 06:04:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x4sm24779891wrn.64.2021.02.21.06.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 06:04:07 -0800 (PST)
Subject: Re: [RFC PATCH 00/42] target/mips: Reintroduce the R5900 CPU (with
 more testing)
To: qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4cd22769-1ec7-ccf9-389a-82d438960698@amsat.org>
Date: Sun, 21 Feb 2021 15:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 6:58 PM, Philippe Mathieu-Daudé wrote:
> The R5900 CPU was removed some time ago (frankly I don't remember
> why). This series add it back, but to prove it works, we also add
> testing at the end.
> 
> The main motivation is to have MIPS R5900 coverage, but to be able
> to run real world r5900 binaries, I had to implement more opcodes.

> Philippe Mathieu-Daud=C3=A9 (40):
>   linux-user/mips64: Restore setup_frame() for o32 ABI
>   linux-user/mips64: Support o32 ABI syscalls
>   target/mips/translate: Make cpu_HI/LO registers public
>   target/mips: Promote 128-bit multimedia registers as global ones
>   target/mips: Rename 128-bit upper halve GPR registers
>   target/mips: Introduce gen_load_gpr_hi() / gen_store_gpr_hi() helpers
>   target/mips/translate: Use GPR move functions in gen_HILO1_tx79()

Generic patches 3-7 applied to mips-next.

