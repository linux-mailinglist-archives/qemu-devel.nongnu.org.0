Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25F2440190
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:56:22 +0200 (CEST)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgW73-0007ad-GN
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgVbO-0004sb-8e
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:23:38 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgVbM-0004is-IF
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 13:23:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m22so17455308wrb.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 10:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8y0YLNmL/p/7JHZ50ReUZeox0ARb3V6mLBvTjV9VTNc=;
 b=ehEcJuwudq8hTMdytmPg8SuN4vgUS4kKEW+igx/1kU2GBWyDho4UPG/XQKAy3Dr7Qd
 GcyjZqV3Az0CDMEKtyGkc7KzUV38vEVFk/HiSd9u9uwXRE8HtGcScmTyfuKk9iCBpN/C
 0g1SW5POWo4VCwizZ0nzQrnztbmAAq1AlZDV9+S7+fCoFoJjPujXtAw1Vxbbtiztevp+
 9t75CFXiPgsf8b9UFPQmTfzsajGkavLWuXNUktSzppPMt7WE8SxUOr3Rh9XHpDlwyLhJ
 YnYSVKkkZYnFh3sZHXJ2Xz+kt5NgrPD0+Us5IZ5h7cbtRwdKsIu5S32YHRSLxV8twpQk
 Haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8y0YLNmL/p/7JHZ50ReUZeox0ARb3V6mLBvTjV9VTNc=;
 b=qzwpCgurULkTiLMydxJUn5lEUYB8WQTkoYCjX+GLlZyvqBN8IuT5QHhS4AEXTSCCWP
 rU45Q2roCgX63bSGDXPCNiATen28j69zb3A2ucqS5JFXXPfXJRHPk1I3OsXPdb0n5K+y
 55nzi03k3PmBiY8SKtGQpNeKprJSWIFwggHOxEAGUrB7aoAhpgIidcADYCfFM+F5ppY3
 Z5Pc9Gy13AsNt1fcZpG7LMtqLOOiHHknmevadpjL0jsWoeGsFgX6eYzr1HSi6DpqHOVu
 Rq02r22B5SwowCya05aIe3vXYjdR1Ea7pF9atyOsYzE/2bgepT9N6zzsjDhOtS42InQs
 lkHw==
X-Gm-Message-State: AOAM530AmdfJa7NFKP/tYkeaIj5VdC514VPc0UntK5869ArGazJBLe9R
 2H3HhIw7w9OzQO4iiyufLas=
X-Google-Smtp-Source: ABdhPJxTj/cEFJJbvWcZWkpSaGwS14Fud1Z9ZXPXF0NTg+pxxx2orfM5odElbS+ThhYfh1r0IZGZhg==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr13284822wmq.95.1635528213847; 
 Fri, 29 Oct 2021 10:23:33 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d6sm1493738wrx.60.2021.10.29.10.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:23:32 -0700 (PDT)
Message-ID: <df826b1b-f563-2fb9-7e92-f823dea61936@amsat.org>
Date: Fri, 29 Oct 2021 19:23:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 20/32] target/mips: Convert MSA 3R instruction format
 to decodetree (part 1/4)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-21-f4bug@amsat.org>
 <7b392e80-b4a5-b01a-e9ec-0d2fa6a39e76@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <7b392e80-b4a5-b01a-e9ec-0d2fa6a39e76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 18:35, Richard Henderson wrote:
> On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
>> +@3r                 ...... ...  df:2 wt:5ws:5  wd:5 ......  &msa_r
> 
> Nit: should this be called @3rf, since it includes df and...

"3R" is how the manual names this instruction class:

  Figure 3-40 3R Instruction Format

3R has 2-bit DF field, 3RF has 1-bit DF field. The other
arguments are the same (for the helpers).

>> +TRANS(SLD,              trans_msa_3rf,  gen_helper_msa_sld_df);
> 
> ... you use trans_msa_3rf as the implementation?

Maybe I should name it trans_msa_3r_or_3rf()?

Hmm @3r is actually @3r_df_b (DF=0, DF_BYTE). So trans_msa_3rf()
is a good name for it.

I could rename @3r -> @3r_df_b but then it doesn't match the
manual '3R'. All @3r* use &msa_r structure.

