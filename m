Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5616AFAC4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:53:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh6s-0006Rw-Cq; Tue, 07 Mar 2023 18:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh6q-0006RU-DC
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:52:44 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh6o-0003Tr-Ib
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:52:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id j3so8841786wms.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678233161;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OeqDnrkpR8eKYeFXwI12oKUiIRH+naxX7cmxeFhmdqE=;
 b=aJcZDoZd5iqplicuDjsivEFGVHjTQU4N+J/hqaZh/k+t4wUHSiuIWjy3lmHooGm61y
 TmDwFMnTuzxlvebVavMSFe9tl34QMwnn2GRMGl1uQ75nFb4Fmp+LzHT2Amha6vtBaav0
 C0SSRrsw0uBVEmiD57EBb/l5M7i15gVaKo62tysGt0/0Rm8go+7SoLQGjbLw6OCTP4XQ
 dWEY6+ZOBNZT4aYtOqJo5Z/4ZMztWRNvwDV20h4fYCCSZBLcpo71E71rDEApm8ZojdGl
 5oslgS2gNLL8DQehYlWibanpJZczV03p147RQ3gWt7vM5NF49JOdKNbqGs1pGyuureTW
 UCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678233161;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OeqDnrkpR8eKYeFXwI12oKUiIRH+naxX7cmxeFhmdqE=;
 b=xM6wxzYCMQTB5YpB2K6z/xPV5LUYgvAfmZN5b+NmSU2xOroIsIlvS4+jzDT44b+rLS
 vO4zJunDdL4EYh7Pq8S3XieKNkMbfcHr22ovBqm72HHEy4PgBNDulw9/HPoCoJaqhrT0
 am1PvD2jq6BhBrfl8TxfX12I5/JnkmRMgUYy3bmKXIw29TM1dCCcTx1pzYjSmf152nFP
 SDWXhIUDceXsI5UKnBIKpdliYKAUed6y80IKdo2nqJFoz8g9zM33sCThANNscdetta9q
 xy4m5LzLFTsrEp+xG8tClr+vnys8qDIVoTLXaTKTKDYApJXEFTYU0FDQgpZld6ilI6Ki
 1vgw==
X-Gm-Message-State: AO0yUKWVa9/8uGPcXP8nu33bPnthCU9/Iy/d6SIR21OrXExc7+iTnFg6
 W/N62K/5r7MiagRgF5u6y/fi9A==
X-Google-Smtp-Source: AK7set/bczpxxfR5zId8m7GcqfiRD82kZqnZUCS0SGd81Ev2X2yAe42LUvn57JmQS31K48RANyVlHg==
X-Received: by 2002:a05:600c:548e:b0:3eb:248f:a13e with SMTP id
 iv14-20020a05600c548e00b003eb248fa13emr15323719wmb.22.1678233161014; 
 Tue, 07 Mar 2023 15:52:41 -0800 (PST)
Received: from [192.168.10.175] (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003e1fee8baacsm19004244wmo.25.2023.03.07.15.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 15:52:40 -0800 (PST)
Message-ID: <27d01c39-190a-28a6-b161-b79d3492229c@linaro.org>
Date: Wed, 8 Mar 2023 00:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: sh4-linux-user compile failure
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, richard.henderson@linaro.org, anjo@rev.ng
References: <83144281-4b2d-4bd6-b8f3-345e4b795f5a@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <83144281-4b2d-4bd6-b8f3-345e4b795f5a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 8/3/23 00:46, Mark Cave-Ayland wrote:
> Hi Richard/Anton,
> 
> It looks as if a compile failure has crept into sh4-linux-user, most 
> likely related to the recent TARGET_TB_PCREL/CF_PCREL changes:


> In file included from ../accel/tcg/tb-hash.h:26,
>                   from ../accel/tcg/tb-maint.c:28:
> ../accel/tcg/tb-jmp-cache.h:24:5: error: "TARGET_TB_PCREL" is not 
> defined, evaluates to 0 [-Werror=undef]
>     24 | #if TARGET_TB_PCREL
>        |     ^~~~~~~~~~~~~~~

Your tree seems desync / out of date:

$ git grep TARGET_TB_PCREL a2b5f8b8ab
$


