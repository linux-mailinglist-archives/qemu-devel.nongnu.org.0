Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173734D2206
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:53:09 +0100 (CET)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRftM-0001QX-6f
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfr5-0007yi-O9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:50:47 -0500
Received: from [2607:f8b0:4864:20::630] (port=35381
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfr4-0000oa-9u
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:50:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id n15so70550plh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wChGAO3skxH2xUerExIuYqf0MAVgEVx1IFwbCFdUlpU=;
 b=ghHteS5zGuMc3sp/NHH2xW/qJib2+B2Fy1GlM2WRLHK59N3ohR83QwYxCgmpYujDlw
 x2k8Q2VE+oftD7rhgx/2FS1UiLM7xJYjlSsIfoML2MWFusx92qcWeJ936vINha2HC6IR
 Ix6+X29vgF+goOGachYyA3W/ASGHDudQsCi1e5VxQMib61dRdteMSufA+4yiSmAzysDF
 TOdQN9CFj6X+cY1oOHOPpwLyklkkOFeH4pZbPp2rU0jabAGIN8RWG4qe0hI4plMYprk6
 HmiVoWxLE3a0sSrqQ0dDEC43WD/VQoZi+AmlirerARJb8jnlgt3S+1bkyPwKSt22/VoV
 8pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wChGAO3skxH2xUerExIuYqf0MAVgEVx1IFwbCFdUlpU=;
 b=ulJUGEplNYFG9dBjDRhWgT2CNO/qHIjbmDXvOH5WYUsLKrLreSHDS6Q1cEtMQY6h8K
 Gv91JHQlysQAi4hys4cxZDyeFHkKUoAYDV1iFLU2E34l6rIxr+XJy2W4WDfbqTJ3M4wa
 v9tCapIUjPnIGVzDmUt9tjGGjLowOJbLlAcQmdCtfi1aEq20Ig4lBiLv/JWyZ9eCIV97
 nu90rMOYHSU58AyDuXCH0R7lninq1K88OvvUt24JqCcQN7qgedaNqqXlOcrzkthc3FC1
 xpEThE3jWt16kGeNXv2UN3U9V4w0oovfNquYpBicTBtux5F/rm+JJuUTx/rU0+gGWGBa
 eWOw==
X-Gm-Message-State: AOAM531CHvq82ThsLEHMbe7OypxJUTlGqULs1VP9f1vVRA0KOcFiOILY
 +KChLJ0Ym4cFeVVd5bQportvfw==
X-Google-Smtp-Source: ABdhPJxCQ+6ZTSPntR8QKTuOrrQjArboovfHnNRlFgwfiMsub1BcnU4o32n9FLj049cM7Qi9B+K+Kw==
X-Received: by 2002:a17:902:8603:b0:152:7e6:c326 with SMTP id
 f3-20020a170902860300b0015207e6c326mr3195503plo.119.1646769044857; 
 Tue, 08 Mar 2022 11:50:44 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 63-20020a17090a09c500b001bef3fd20b3sm3656506pjo.18.2022.03.08.11.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:50:44 -0800 (PST)
Message-ID: <bb334b99-1bb6-90ea-956a-7308db356942@linaro.org>
Date: Tue, 8 Mar 2022 09:50:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 18/33] target/nios2: Implement cpuid
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-19-richard.henderson@linaro.org>
 <CAFEAcA_BYBgpJOe2_gjdpkPHoy6dk68dNYvo=p5wcJnTqWpknQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BYBgpJOe2_gjdpkPHoy6dk68dNYvo=p5wcJnTqWpknQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 00:52, Peter Maydell wrote:
> I guess. This will have no effect as all our nios2 boards are
> single-CPU.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oh, fair enough.  I didn't even think of that (even though I've just spent quite a bit of 
time on interrupts, and there's no sign of an inter-processor interrupt).


r~

