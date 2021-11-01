Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A58442133
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:59:04 +0100 (CET)
Received: from localhost ([::1]:37124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdSS-0008JL-18
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbSp-0005PI-2O
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:19 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbSj-0008Ns-Kt
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:51:18 -0400
Received: by mail-qt1-x835.google.com with SMTP id j1so9367911qtq.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AiMSEXLghKBuKHRQTfL0FFpLW3hg8718oN7k12ZZ9uo=;
 b=VyN6aGKM1faNzIsK3ZGRD3LNkk9K6glZ171HtqIY5vTq0jsBvFFEpWwOF8uFDBImv2
 RmyTanl2V8Af7kTi506gh0QGaWsT/Ls4KdR8bMDBI38xJrizCYep2VmkNIvGbJ8t8GEI
 ArK/g6+QJt75Bo5S2YSW9EglojVC5SpM73nMGjeq20n5uNSMotStTKFG/kIEubljGpha
 2ND6YdgIEz4N7SKIHtrBczn6zOMAAMCJiFfKxvlPEJ2rnZCshd+uLDCDq4CWnNqwtUvm
 2nrTWLPHRGTR+Qb1FDbFIOFi8pUaaCeFZ1apQYC7YttiRnzmSKRbYiNRs44F+IZwc7Bw
 YB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AiMSEXLghKBuKHRQTfL0FFpLW3hg8718oN7k12ZZ9uo=;
 b=wRqTS94uGGQ2CXArwCuzlnAJlK/aDaP7ZY7V6pnvsQyaZbn/RPGvFbFSIxwBYrca/J
 YYEnbEfkSLKBPIw09IenQ4shoNacFVd0ch677xNAiTeABGqGak1k99q+jH8Ps4SAgknq
 LBN3OrnzX/RA2724RHwlK2oenDwJQ9bh+4cEs62obXOUcqa1+1ZLwx5rygJYr9nYsf1o
 Rz0ny6MNEwF8daTy1iTp4bkfGJo1Rqp7wtofPCZf/EQJunLt6aCBiuqLzYDZrgkrK6+c
 6+3j7MVTIQT6a3+JYnjZUdM0FsXeT1gQspGq4VMUKDrF2A1olfdorpcTr9zpAanjwKCN
 5JTw==
X-Gm-Message-State: AOAM530QipjFyU23RQA3ZBHf9+bLXSgbvd1T1xP289zLFg9d+j0LU2Cl
 XZILf/HsfGwv0Eud1IMZMsOSSA==
X-Google-Smtp-Source: ABdhPJwaBEeUGANnBtM53AwcnkUGYQweuuzziwfmilquFTaD3QVEq/kQw3jhiPFVOY9eolRqOxxdGQ==
X-Received: by 2002:ac8:5ac6:: with SMTP id d6mr3516418qtd.162.1635789072556; 
 Mon, 01 Nov 2021 10:51:12 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bs34sm10638621qkb.97.2021.11.01.10.51.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:51:12 -0700 (PDT)
Subject: Re: [PATCH] Revert "elf: Relax MIPS' elf_check_arch() to accept
 EM_NANOMIPS too"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211101114800.2692157-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db886c1f-471b-c347-e87f-cf83177c738f@linaro.org>
Date: Mon, 1 Nov 2021 13:51:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101114800.2692157-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 7:48 AM, Philippe Mathieu-Daudé wrote:
> Per the "P32 Porting Guide" (rev 1.2) [1], chapter 2:
> 
>    p32 ABI Overview
>    ----------------
> 
>    The Application Binary Interface, or ABI, is the set of rules
>    that all binaries must follow in order to run on a nanoMIPS
>    system. This includes, for example, object file format,
>    instruction set, data layout, subroutine calling convention,
>    and system call numbers. The ABI is one part of the mechanism
>    that maintains binary compatibility across all nanoMIPS platforms.
> 
>    p32 improves on o32 to provide an ABI that is efficient in both
>    code density and performance. p32 is required for the nanoMIPS
>    architecture.
> 
> So far QEMU only support the MIPS o32 / n32 / n64 ABIs. The p32 ABI
> is not implemented, therefore we can not run any nanoMIPS binary.
> 
> Revert commit f72541f3a59 ("elf: Relax MIPS' elf_check_arch() to
> accept EM_NANOMIPS too").
> 
> See also the "ELF ABI Supplement" [2].
> 
> [1]http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_p32_ABI_Porting_Guide_01_02_DN00184.pdf
> [2]http://codescape.mips.com/components/toolchain/nanomips/2019.03-01/docs/MIPS_nanoMIPS_ABI_supplement_01_03_DN00179.pdf
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/elfload.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

