Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26814C01E9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:17:08 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMaep-0005U8-Ii
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:17:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMabS-0003l8-SO
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:13:42 -0500
Received: from [2607:f8b0:4864:20::534] (port=38530
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMabN-0003Xh-1Z
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:13:38 -0500
Received: by mail-pg1-x534.google.com with SMTP id 132so17831196pga.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G2m3Id1VjYJHZxzksTO7CBjZt3GpZCNxvt8OMQ7TgGk=;
 b=cJoxKD6lSaX5wSEKUAuYMRZsY2wbC1cFPDJIXy9Jgtp4QkgZM/THxeae0eQ29RQY53
 gMAW621pFcxaP10WA/Ex7ilVYNRl7JfbDfV3GDo+tGwUdWC9+QCHRhgg6ZA9GAWs3HT2
 9l/0pcsi7nj4zEjFGZ7hp63aKQ1MMwiq6Ly5C5pKN/E1rMSUJ3He3xLJpWMlS5sxCe13
 zjorDj5KTKlrgVTg0K1OYIc+sS5Jz1TN5CViw/UQ+p7hGUSQisR3iDdeKIy2x3Ke15iz
 N+wM51VMUzAeJedRs8tC3I7x3fxoN3F9wxHGdFByWH6w5pvkn63v6P1vyIx58lPtn7B3
 w+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G2m3Id1VjYJHZxzksTO7CBjZt3GpZCNxvt8OMQ7TgGk=;
 b=elRqq/m69JxVzKumFI8makcDuL5rqoHVSi7odzdlFfLuLUEeSjnIPgeziY97m/egSa
 EPJ9dGRGEEXqQzAzglNtigo6BMgPWk13KhEdzo5eukI8+Yo8WjKJlmoeX+n7+WTHJLT8
 53iovsWGZCJGIvbwciZAKoLe4VwV5i9lHLRZts/Ur/Imv7QTwH9/KklqlDJU4vpPVw4g
 S5E9gpe8TWDivSSBH2qVhUKrNSgTDh2lZ4oezKMA9x9hHOnPa2oyhpVRFP0vDF8GxmXU
 GF61sXQT1oBkITESU1O335qjkk7br8M5aYf6JReaK+oljfClaDYwVxYrzf2t/a16U/4c
 N2oA==
X-Gm-Message-State: AOAM5323T2XU1HOu72zajeuO+xcM8uwxI3syzX1hbzl4Hh5h45SD5f9K
 Xd6AlYVabUqCIcVOQTOuXsWLTA==
X-Google-Smtp-Source: ABdhPJzvL09mtVK0GjwB0+VUEWY8a6XKT6XDbvtcXvMrzwiAPqg5PjV3MS2p46xOyIRi8Ycqi1V0Ew==
X-Received: by 2002:a63:10c:0:b0:36c:6dd0:44af with SMTP id
 12-20020a63010c000000b0036c6dd044afmr20942552pgb.41.1645557195669; 
 Tue, 22 Feb 2022 11:13:15 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 z11-20020a17090a1fcb00b001bc58804974sm282709pjz.27.2022.02.22.11.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:13:15 -0800 (PST)
Message-ID: <9cb63e9a-a4cf-dc11-6c02-f10191a3d85b@linaro.org>
Date: Tue, 22 Feb 2022 09:13:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 14/47] target/ppc: implement vstri[bh][lr]
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-15-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-15-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v4:
>   - vstri helpers return CR field (rth)
> ---
>   target/ppc/helper.h                 |  4 ++++
>   target/ppc/insn32.decode            | 10 ++++++++++
>   target/ppc/int_helper.c             | 28 +++++++++++++++++++++++++++
>   target/ppc/translate/vmx-impl.c.inc | 30 +++++++++++++++++++++++++++++
>   4 files changed, 72 insertions(+)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 303a29fb5a..269150b197 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -211,6 +211,10 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
>   DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
> +DEF_HELPER_2(VSTRIBL, i32, avr, avr)
> +DEF_HELPER_2(VSTRIBR, i32, avr, avr)
> +DEF_HELPER_2(VSTRIHL, i32, avr, avr)
> +DEF_HELPER_2(VSTRIHR, i32, avr, avr)

Oh, DEF_HELPER_FLAGS_2 with TCG_CALL_NO_RWG.
I should have thought of this wrt the other helpers you're touching in this series -- 
those that only modify vector registers should use this.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

