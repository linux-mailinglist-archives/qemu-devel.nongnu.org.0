Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C157440DCD
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:17:50 +0100 (CET)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7uP-0005aj-7T
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7s1-00046F-8N; Sun, 31 Oct 2021 06:15:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7rz-0000cJ-6c; Sun, 31 Oct 2021 06:15:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id d5so8504121wrc.1;
 Sun, 31 Oct 2021 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f66C1JkUgSfG9tM6khWtdFQFSQVf0XPyYeOPRD5fU2o=;
 b=SB1PO4YnC9NXO+DavIOvtDQai018HXlR5hQ7mUz/8NY80u3JsUCwMM7DWY3ZNg+On4
 71JBzEuBrUK5ZqsfGh2PBnXtqYhbsiY0TxAIIfLuP7VBxYZxmyaH+T/Ai2Rxvn5JoM6h
 CJnYScRnjV3dQ5xK4s6BvShL4N6B4HapTusSxF93q9INp7s4dfQQJmGjk3/HU95Rb31c
 sSFWb2oIXfqV4ND4hw8qdJ8aMj/n1hfWXjb7hRTCw8vpZ9Y5tcbcAJI6d0JfcWp4XRN5
 Tfd+V396w9RwMYcZazl26czGlDVcR63j5yTu8cuR/zfh7M8ez8ryuJVilA68obhXDYo5
 taHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f66C1JkUgSfG9tM6khWtdFQFSQVf0XPyYeOPRD5fU2o=;
 b=kANg5GYg2/whx0sLajpgmI99UIgs/duj9Z8jPWZ1jZ4SRDOdnBwde+5Hmb9gTlK5AE
 0K3kFhG7qZLv7li7Im4hAM0kzq6vhpIySrTMm8BA4FFeBI8qnRuMc8NJEvFqe4bQ9Jyr
 5/hawpWyGtbd8ooin/Z+RtfjQ4N0B2zdF4HQh4fyiMoejfa2LD0AzzH5kv76YeEep92r
 l9ZcPEikKw2uRdURpd1Qf8U9CdVbXflQH5QVtTRvo8CT4vfVGDEalA39Hh3ac8hivWQ+
 PK3KtzvHDdu+8233RHK29ItcPJmPAki/GAFoDLnEJKMUp/T2uZyuQ2MpF4LBYhCS5oXm
 hKSg==
X-Gm-Message-State: AOAM5309BgGfGCkNXmKlHlz01d9jNeC58GtazPWZSfWbsVB+CCAFhgLh
 fYQMA8JmEwkUN5sElFilRfY=
X-Google-Smtp-Source: ABdhPJxXSmaa27rl1xHtDVKGItnVURKZUMxcZRZpHYqDEd6LPUYbChMg28sI3qAlg7K0qVIFF0mLVg==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr29543598wru.242.1635675317570; 
 Sun, 31 Oct 2021 03:15:17 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i3sm13330723wmq.18.2021.10.31.03.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:15:17 -0700 (PDT)
Message-ID: <b4a9dec3-fd5e-09b4-2175-807094d1b5c7@amsat.org>
Date: Sun, 31 Oct 2021 11:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 51/66] linux-user/ppc: Remove POWERPC_EXCP_ALIGN
 handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc <qemu-ppc@nongnu.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-52-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:16, Richard Henderson wrote:
> We will raise SIGBUS directly from cpu_loop_exit_sigbus.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ppc/cpu_loop.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
> index 840b23736b..483e669300 100644
> --- a/linux-user/ppc/cpu_loop.c
> +++ b/linux-user/ppc/cpu_loop.c
> @@ -162,14 +162,6 @@ void cpu_loop(CPUPPCState *env)
>              cpu_abort(cs, "External interrupt while in user mode. "
>                        "Aborting\n");
>              break;
> -        case POWERPC_EXCP_ALIGN:    /* Alignment exception                   */
> -            /* XXX: check this */
> -            info.si_signo = TARGET_SIGBUS;
> -            info.si_errno = 0;
> -            info.si_code = TARGET_BUS_ADRALN;
> -            info._sifields._sigfault._addr = env->nip;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case POWERPC_EXCP_PROGRAM:  /* Program exception                     */
>          case POWERPC_EXCP_HV_EMU:   /* HV emulation                          */
>              /* XXX: check this */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

