Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1324AB228
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:55:02 +0100 (CET)
Received: from localhost ([::1]:37882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGoYm-0004pd-LU
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGoXD-00045F-MX
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:53:23 -0500
Received: from [2607:f8b0:4864:20::52a] (port=46020
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGoXC-0007hX-0R
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:53:23 -0500
Received: by mail-pg1-x52a.google.com with SMTP id z131so9841835pgz.12
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fWli0wLLPG9841PNO0S97YnGZQuMGD8W4jT/t66hoXM=;
 b=FcwRKaViwJZOaFvSuhS63V8d9Z/lxw4rzAtM6XqwTBjDR7+cvYTr1TsuD/lJGdkepW
 s41MlRzgws7pmWcaoMsvLBTKgXubetPKVIsoxjhz61mZUIE4ni/KuZPYIXMKbN8HD4bB
 ba1Dccpk9+9v8yUiIHw9RUJeRUzbeSGOyjgpR4XP35ksTNyXwmkcYYiRMZvFEEUvVShX
 r5DvLBrwLM2JL51uURppg2MpK47hf/hbiih1iDiuBa4sv3ZTOHqftIFhztCl27ky5qqM
 TfHelbP4QERBBwclVGzWRpxtckpIUKIxrLorD3ddvwCnLiAAxux/gOBHJuELtuyPJiVq
 o9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fWli0wLLPG9841PNO0S97YnGZQuMGD8W4jT/t66hoXM=;
 b=nqAd299AOO/dnCOT9fuXVLQFRIlSeSHbrutK1vZMs9A4voZgvMR9axygsy9DValCbM
 q9FF4wkXZKGTVYm3jmfVb8oxpXEVbDXN0MG1MOcYjxW3z6tVRyLn0mHHv8mcm/EGhh/l
 iY1wukST8DlPXtdBMCSFogRqq/5SIBIREcHqCPK9poSbxnXfxjX0Ca6vB89eogaQZgL6
 tU/N+bBmW1+3SLs1lVU4sBg7TXdjLEBzZ81DA2J+fZTtXgqqbaQdUkC+wd81kv9lsgNv
 BTe210YP7rbmXczH1USVaupWEbMbI4aYm4tCrX+AubBtCakCvR3rjEvGsI4hh067QPSO
 xOqA==
X-Gm-Message-State: AOAM533zG/nXzgGzcZjIceGbmQrZGUhtJG5ef8/Sn8XMS+Jop+NqYNB6
 mdXTpbKkg77oJ7r05Tb9Ejya4A==
X-Google-Smtp-Source: ABdhPJxUjMmzRqyU3R972Yo3hiq9+8ajOwcRkmVOiF6FEmcGD9GyQSj4uG9XfqKNl/+tLtqRnZv/lg==
X-Received: by 2002:a63:2c16:: with SMTP id s22mr6967207pgs.297.1644180799701; 
 Sun, 06 Feb 2022 12:53:19 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id a186sm6433144pgc.70.2022.02.06.12.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 12:53:19 -0800 (PST)
Message-ID: <060244be-ec88-4bf2-80e2-79110801e9b0@linaro.org>
Date: Mon, 7 Feb 2022 07:34:36 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tcg/loongarch64: Fix fallout from recent MO_Q renaming
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
References: <20220206162106.1092364-1-i.qemu@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220206162106.1092364-1-i.qemu@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/22 03:21, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> Apparently we were left behind; just renaming MO_Q to MO_UQ is enough.
> 
> Fixes: fc313c64345453c7 ("exec/memop: Adding signedness to quad definitions")
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 9cd46c9be3..d31a0e5991 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -871,7 +871,7 @@ static void tcg_out_qemu_ld_indexed(TCGContext *s, TCGReg rd, TCGReg rj,
>       case MO_SL:
>           tcg_out_opc_ldx_w(s, rd, rj, rk);
>           break;
> -    case MO_Q:
> +    case MO_UQ:
>           tcg_out_opc_ldx_d(s, rd, rj, rk);
>           break;
>       default:

Thanks, queued to tcg-next.


r~

