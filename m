Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E983B47581D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:46:31 +0100 (CET)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSju-0000me-Rh
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:46:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRwb-00013E-KH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:55:39 -0500
Received: from [2a00:1450:4864:20::32d] (port=54901
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRwZ-0006zT-6N
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:55:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i12so16288670wmq.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vZEOGaSI4gwTvEh4J3o+iYz8+lgY6Gvc7FU2F7lB+R0=;
 b=GWn+dBDECuoJVkwmV7w8DSbO3ko5q6flovS2YVCFleVmnuLMLfDTM3csy2v/XpYMsv
 PSHVhodlu0xvJn/hDwocdsRSlSeEcMaB6RUPeDCIpNa/WXz2akZevFTRp/Jljbxnctac
 uHEXXTZQzqYQm4ThYX8OkRRrXCQBqcFWthq23pOPChPDGZ9XZnnHBKHhqCtgVviz5r0v
 pxDRPFtXlC4wKhloRLbEo1j6d6o2PJTcFowXFPxr8ywWjAWWju0zIufGhOErOgIUyaHO
 N3KbhRlDmG2TXrEDp1exZjybTqmTq/hgojJ/pG1N4BmWZGxzaR3hFkRhAgkwjaOUA4wX
 0q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vZEOGaSI4gwTvEh4J3o+iYz8+lgY6Gvc7FU2F7lB+R0=;
 b=sUim8hU2Nnujv6851viP/EfIN6LPgvEvmw1qQ957nWHB5ha6We7AOi9hK67UJvT82X
 91oWb3S/E4cIg86dn/fNz2it8CSQdmg0JyB6gmZycX4s3yLrTgDMuZXtEEokDiwQ+m/B
 YUiGKMfKCtoASQBEWZE7TXfeVrfPfVm6csYd4U8CbovdSilMu52x7bHzMYlqIG0zen4M
 FhDrrhIHrcHtL8GDPmzUaasaU7RXl9zJRw6KkZmY3ysPbzTHGh/ObeOcmsUSJyRKuF0k
 xAv3AO522ul79U98jHDCNsKdbzf3EzJgDuRikud7id7SVtJUaJauobk1+BhxVMK+a150
 Ucjw==
X-Gm-Message-State: AOAM531nGiRgflpzBHvd7+8lE0QPc2lMF9NgrcLadbTKlnW7AoCoC7xG
 qclXZ0sm8AJNSewdCbqcRN7AtLK8vWM=
X-Google-Smtp-Source: ABdhPJzubcteSIUkKSDEmjdhqN0hTY3BFsZV5G7rvMZNNFpecR1x0Us1YBHsxK9zZyNOEppEAfMsBQ==
X-Received: by 2002:a1c:4303:: with SMTP id q3mr4055851wma.78.1639565729405;
 Wed, 15 Dec 2021 02:55:29 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b10sm1750456wrg.19.2021.12.15.02.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:55:28 -0800 (PST)
Message-ID: <802e3402-29b6-f312-534c-aaea97c3e9f1@amsat.org>
Date: Wed, 15 Dec 2021 11:55:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] linux-user: Mark cpu_loop() with noreturn attribute
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211106113916.544587-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211106113916.544587-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping? (patch reviewed)

On 11/6/21 12:39, Philippe Mathieu-Daudé wrote:
> cpu_loop() never exits, so mark it with QEMU_NORETURN.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-By: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2:
> - rebased
> - restricted to linux-user
> 
> Supersedes: <20210905000429.1097336-1-f4bug@amsat.org>
> ---
>  linux-user/user-internals.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 661612a088b..c7ad00268af 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -65,7 +65,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>                      abi_long arg5, abi_long arg6, abi_long arg7,
>                      abi_long arg8);
>  extern __thread CPUState *thread_cpu;
> -void cpu_loop(CPUArchState *env);
> +void QEMU_NORETURN cpu_loop(CPUArchState *env);
>  const char *target_strerror(int err);
>  int get_osversion(void);
>  void init_qemu_uname_release(void);
> 

