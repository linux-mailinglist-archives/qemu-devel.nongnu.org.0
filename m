Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680F4C0435
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:00:10 +0100 (CET)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdCb-00008D-0N
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:00:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdBh-0007uo-S6
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:59:13 -0500
Received: from [2607:f8b0:4864:20::1030] (port=52152
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdBf-0003vW-GE
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 16:59:13 -0500
Received: by mail-pj1-x1030.google.com with SMTP id gi6so920715pjb.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GRAZuX3caeEXCWNal8OPTsMZovAGAy6TusDr6tZFHIA=;
 b=Ipk6EAE8kXnyKB2FtvLNAfQSTHwamEVYqZMrQInFK8Hj54XfcTdj2bpNGinUwzTaAE
 Ta6AFN0XD/qX+V2b0Z07v3BCvM+d3/b9OtrLykN3K4P0YPspXyivjTRG2jOL5NI+agzx
 d8wkrVzIJNfNsJExyyhLNWWGpj80ZTMg0UribdQcDWhAwSaodVjSGqD/i9nZrmQORY+3
 MfE8CkMpPuygaGdBr9NoHZ10xuXm1eULvT8ofLSPPIotIwMeAlQ0j0wrxDw+zEayIwGH
 Tu/OX2LP4U6//OgC6VG1mIttxW0Mc4E6AL9zzsTsHzyg7YDrdtwvSQ1GYp22wb6IpL4A
 tX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GRAZuX3caeEXCWNal8OPTsMZovAGAy6TusDr6tZFHIA=;
 b=2Ofa7FtRHdhPZbdUGAm4RtPRrQz/sPxPAXtHdAcJ83kYpVxeG0zINnClPyTiUwRHdN
 AHYBG2M5i3xNTTFZPncZAQanygDgb89GbHp3siLm40oJu+2QVr5EidxKPevyrrd6QXHy
 oVJ/BFtPcwCZl+9S7uW6dptp8zgImOo9FszeYW/klezgNtxPRsrxMHjGUguUMxPR2xDA
 Q9WhRLRJTyCbTJ/ffPbuL8SvryHUkbw88W7P6XAG11u+TTSDNA148/ojY48JnHnbSCCe
 XucDyvF22JBgy8Pp9OA88W7/wFT/+yE+8yjuX8zpmLIAqC42l708/iBFNmaMHrSd7Njb
 2t+w==
X-Gm-Message-State: AOAM530FgXIhBKcsop+j7oRJtaZuiENBetiUT3zaeY5KZSxXXiwMVIhR
 UcUF1pUyu0lPZKUWh7K+IZ0bOA==
X-Google-Smtp-Source: ABdhPJx8d0CfH/6HWFoGfM4rASfutWQ0W0ocC11oT75amMPW6HWaVdkBkBNuytwjdyW3TkEpcCzIHg==
X-Received: by 2002:a17:90a:c296:b0:1bc:7a6e:623b with SMTP id
 f22-20020a17090ac29600b001bc7a6e623bmr4118998pjt.68.1645567134476; 
 Tue, 22 Feb 2022 13:58:54 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id l22sm19948573pfc.191.2022.02.22.13.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 13:58:53 -0800 (PST)
Message-ID: <d9f71867-f4ad-464a-60c7-4ef88d6f55c4@linaro.org>
Date: Tue, 22 Feb 2022 11:58:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/47] target/ppc: implement vgnb
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-19-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-19-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   - Optimized implementation (rth)
> ---
>   target/ppc/insn32.decode            |   5 ++
>   target/ppc/translate/vmx-impl.c.inc | 135 ++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

