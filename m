Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4414C6D61
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:03:48 +0100 (CET)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOfgo-0003j7-RN
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:03:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfXX-0004qF-Rn; Mon, 28 Feb 2022 07:54:11 -0500
Received: from [2a00:1450:4864:20::331] (port=37774
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOfXW-0004L6-CV; Mon, 28 Feb 2022 07:54:11 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so5685921wmg.2; 
 Mon, 28 Feb 2022 04:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vZanaNkB05745Bf6hWptNo4HdgucymHeapdfzz7s1Kk=;
 b=eOkLLfb6Yg86PWqPTk1HYjmRiF7zhJaivbKHWJcboUasGI+fYWCq8zNaqESgE/oT5S
 GyjDFAqAkQtTkF9HMOdxA+KcK2IQ19NcSqsarOO5mKTru7stVxJ+XyGQz2rTZDMABLsm
 l39zijvr9eP6ZNBUtxLjdgKAymnaPsxydGLb9nVKpsHACe2fic93TrOxLEf5NMkib3xp
 P9cThU/+ZXDPFa6v+UcN5UUIDqZzVZ/slADqvejxmahZRFFo+R5+xRxzwK9jyZg9arXc
 CcN3yzJc0q10O3gWjLj3/JTwXAuZJ6tLd8LIPqF+bJ/bXf5cs8W4xZhUQUjvn+dzEnYG
 tf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vZanaNkB05745Bf6hWptNo4HdgucymHeapdfzz7s1Kk=;
 b=eQEBdpjbC6oJUbnWefCQoukQ1M0/Mj/ai8dvSpIFJMIs+waOioKNUax2odgJKYIBOj
 cJIJH7erIBefiGL6Rx2sDitwDXsG84hNK3NTtmtorYoZeQfBAakwNEhajSYmGf319uSC
 AzobrvclJinCfTUna2XS2gbBoRwpJx349PbKFXlWJpG6c3GdvLmIaeFBw0AeMOSDfohH
 c8NeNHz01MX/+6i0DfB6cjsIa0sEjl5PV9zFaQzDFVL2NLCQO1YuT3OfUqmRKw5BvYkF
 lk2RA+hhH55keTxlGinLUQFbWkXMAlTPsVOn7nnlqXFv5/VT7pAq7VMG55Jb3f35rbMS
 l6bg==
X-Gm-Message-State: AOAM5312PqQiHiuw6dAESc+ZHL/xDF+6nlbBDDcG6d+jGvADyF1IwlH9
 lhgQFvn1krA1O6gvmxn0FZo=
X-Google-Smtp-Source: ABdhPJwszTSwlex/CL85pyvYR1+GFbgyUSiTHp9KRTzab33NXTMdd5c3kyhPkaQsekhaRS8OqMxa/Q==
X-Received: by 2002:a1c:4d12:0:b0:381:68eb:dd6 with SMTP id
 o18-20020a1c4d12000000b0038168eb0dd6mr3422940wmh.70.1646052847971; 
 Mon, 28 Feb 2022 04:54:07 -0800 (PST)
Received: from [192.168.64.175] (22.red-95-127-166.staticip.rima-tde.net.
 [95.127.166.22]) by smtp.gmail.com with ESMTPSA id
 n8-20020a5d6608000000b001e73a0f21ffsm10425336wru.6.2022.02.28.04.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:54:07 -0800 (PST)
Message-ID: <539f0447-c161-5752-e35f-cbee7e45a98a@gmail.com>
Date: Mon, 28 Feb 2022 13:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] softmmu/vl: Remove redundant local variable
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
References: <20220228032710.184181-1-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228032710.184181-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 04:27, Zhenzhong Duan wrote:
> While there is already a local variable opts in main function scope,
> no need to define another one with same name in smaller scope.
> 
> No functional changes.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>   softmmu/vl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 1fe028800fdf..34b24512f8c5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3273,12 +3273,10 @@ void qemu_init(int argc, char **argv, char **envp)
>                        exit(1);
>                   }
>                   break;
> -            case QEMU_OPTION_watchdog_action: {
> -                QemuOpts *opts;
> +            case QEMU_OPTION_watchdog_action:
>                   opts = qemu_opts_create(qemu_find_opts("action"), NULL, 0, &error_abort);
>                   qemu_opt_set(opts, "watchdog", optarg, &error_abort);
>                   break;
> -            }
>               case QEMU_OPTION_parallel:
>                   add_device_config(DEV_PARALLEL, optarg);
>                   default_parallel = 0;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

