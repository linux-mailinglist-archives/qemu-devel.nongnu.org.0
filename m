Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAF60D0E7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 17:42:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onM1L-00077T-LJ; Tue, 25 Oct 2022 11:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onM1J-00075J-8S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:39:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onM1H-0007dv-8S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 11:39:13 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bp11so21215489wrb.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LOGSShQ8z56vlwmZegqJUaejvP51jj5sYDagmqJrins=;
 b=AvYhfeQZlmzXWHxZCldv8FeskfmX5lfCNKbOIO7dAEhxzabJJfWTo+sVytfd0REzjz
 y1cuM9pQTD+L8bDlCyS1qzsqM5J54sqjTUWcg3URjIaP09SY5kAVyehBGrc7QZGajzZT
 8U7xp7u9Wp5l69KnofMmUqKGHYEcz9ogOudZ71SDlU7g7lxUiLrOJSXCmnHyxz4j4sbc
 j6vgwHREJP3Z9Sxfe9P493cbXcosbZtmL7tC4Yn7YOTOWyq7WL9GcGfUiZM8Vt+KYP1y
 7ieFpFTty5WNqj6+4nJuxHgjhl7ST6cRGfQuEdBXT8d3SkIOcRYPhiWoKa9KH7v4upCA
 lJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOGSShQ8z56vlwmZegqJUaejvP51jj5sYDagmqJrins=;
 b=DnV1OYQ+5R0KB6QCiWN5YIwqUwUbzxdoqcPioOf2ya6TxGCdCxSGRycqI5HdnSs0OE
 RH5Gtrixxdh4Rle/mh8G2jSCDbJS9aokJ8mQ/kt86labOAseH/wTVOK6C1sHRHBGsAuo
 cV/LNZnc/O+MIOYtg3HcR+JnNdHIVIWWIeJV2wF1LnLoKxlo18pBJhCQh0Jo1wQtQAoO
 e1D7C+Y+VOD2F1iU7k+RrsouKeuKEove1wnMnV6QB/NLTnx0CUXzCt45L3Q5xx+pOu/P
 dP0cyDDHizLYyBwGZ/Y28PLKr94CCyg0MzBcHWE3iVtkcXXBZ4YOaAt0l9vhPklooxiP
 Ut+Q==
X-Gm-Message-State: ACrzQf1I98U/Bp1fhOemYUERPTkEEfkHNIGCfuRy6c4bo0kJoIvEMdjm
 TKLI8YoAMajKR3xuJNZBhus9lQ==
X-Google-Smtp-Source: AMsMyM7WipozLNsgpkT41bbbdM1QcT+tRm9sKchSB9Yg9vGbxcUCt47PDioOJQW644kS446m6mZ+aQ==
X-Received: by 2002:a05:6000:4086:b0:236:55a8:8abd with SMTP id
 da6-20020a056000408600b0023655a88abdmr15528356wrb.157.1666712349375; 
 Tue, 25 Oct 2022 08:39:09 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003c6b874a0dfsm2378852wms.14.2022.10.25.08.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 08:39:08 -0700 (PDT)
Message-ID: <ed0d9440-2b33-e6cf-1e07-e5bf9c5cd13b@linaro.org>
Date: Tue, 25 Oct 2022 17:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 26/29] target/openrisc: Always exit after mtspr npc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-28-richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> We have called cpu_restore_state asserting will_exit.
> Do not go back on that promise.  This affects icount.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/openrisc/sys_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index 09b3c97d7c..a3508e421d 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -51,8 +51,8 @@ void HELPER(mtspr)(CPUOpenRISCState *env, target_ulong spr, target_ulong rb)

Extending the diff context from commit 24c328521b ("Tidy ppc/npc 
implementation"):

             cpu_restore_state(cs, GETPC(), true);
             /* ??? Mirror or1ksim in not trashing delayed branch state
               when "jumping" to the current instruction.  */

>           if (env->pc != rb) {
>               env->pc = rb;
>               env->dflag = 0;
> -            cpu_loop_exit(cs);
>           }
> +        cpu_loop_exit(cs);

Is the comment still relevant?

>           break;
>   
>       case TO_SPR(0, 17): /* SR */


