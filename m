Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA90D21D3E0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 12:38:54 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juvrJ-0006RE-QU
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 06:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juvpl-0005YF-EF
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:37:17 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1juvpj-0000vR-UG
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:37:17 -0400
Received: by mail-ej1-x643.google.com with SMTP id dr13so16331904ejc.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Jc3qxXzcE/CVru2qaLaqjXnxaXf1qiUI7yYK8zKvlI=;
 b=UdGzuAgogrKOZp5wiOiYO9Yq1S8jewbIQwy5C1NvQt4kuD4yvsu80+YSlZ+0t7AjQc
 oPED/eQoDq2q4q82qvl7/XjMiKERjmdoZz20cbqNvz12v05mPd2F9W7CGKKzt9aW3UXu
 AvpB6uaGUSVHEwo0pIhWGYXW/mboHMMQNkA+2Ihl+nVlDyvpD6h/uDRCOdSzMAAYfTlp
 rCTggDQ9h6h39TOLG4E9bAap0lQP3ONkG2sVPbMU65Mogdy0GJIxtLdEkV56pY/d+Y0l
 a56/SLL9X5HlvPPlXD5/hPjowkji0PFWwjBh2vrLIEPmE4zb8/51vfn/KbknTYrz7P54
 8aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Jc3qxXzcE/CVru2qaLaqjXnxaXf1qiUI7yYK8zKvlI=;
 b=mhHAMB5+8e3X1OjA93hxyA1Mpm3torO2c2pFnmwyrZ92vcWHw8MzRlyuxL5bKX4lSd
 TSlgEtNuqt2IGhyE8SIEzWu37beuDIHkWVEVy+HVPLktcpVsBKwEfTi9nV4Ib5IF62De
 uPAICfolW1vQPeZIoOAmLfxoVIbAOkqK+NLBK0VHXiPR55QTKfXhICCGelKQmwitzaB0
 EREe9acY+4gqZ2LSnTmhihjIX5IuRZmO7Y1HiA6tFjqPi9FsgOMpY6NFbo5J8jzBq2Cm
 xKLwaFkmcMSpW17OcL0XpjBUvlty9BsjNmNcYTgkCqMLzdWkRYPijWMnPX5wNGjC/MTM
 q2+Q==
X-Gm-Message-State: AOAM533SnTYVUfAWyuJYybQaykrLI+6S/abkLog4gJjlFHTu2JXbl2wh
 KjeWImh51FHGdBDkwGiGfeU=
X-Google-Smtp-Source: ABdhPJw7Rz8SjcpUfloFLCn73rBrcQwjRO8NnjYgGTOxKAG8mDVXkfUH33fEXBIz89rxzON2p+dtUg==
X-Received: by 2002:a17:907:4240:: with SMTP id
 oi24mr71136124ejb.23.1594636634575; 
 Mon, 13 Jul 2020 03:37:14 -0700 (PDT)
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id z1sm9345185ejb.41.2020.07.13.03.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 03:37:13 -0700 (PDT)
Subject: Re: [PATCH 03/12] tcg/riscv: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <1594631044-36284-1-git-send-email-wang.yi59@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e874ea93-f1ab-1779-0f44-c3c1de95de6c@amsat.org>
Date: Mon, 13 Jul 2020 12:37:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1594631044-36284-1-git-send-email-wang.yi59@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: xue.zhihong@zte.com.cn, wang.liang82@zte.com.cn,
 Liao Pingfang <liao.pingfang@zte.com.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/20 11:04 AM, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org> 

I hadn't reviewed this patch, but now I did.

> ---
>  tcg/riscv/tcg-target.inc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tcg/riscv/tcg-target.inc.c b/tcg/riscv/tcg-target.inc.c
> index 2bc0ba7..3c11ab8 100644
> --- a/tcg/riscv/tcg-target.inc.c
> +++ b/tcg/riscv/tcg-target.inc.c
> @@ -502,10 +502,8 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
>          break;
>      case R_RISCV_JAL:
>          return reloc_jimm20(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      case R_RISCV_CALL:
>          return reloc_call(code_ptr, (tcg_insn_unit *)value);
> -        break;
>      default:
>          tcg_abort();
>      }
> 


