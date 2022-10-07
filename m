Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B65F7662
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:39:58 +0200 (CEST)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjpk-0007m9-HL
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjeJ-00014c-TP
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:28:08 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjeH-0008IA-RG
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:28:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso4272986pjk.1
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFfMQRVrkkZCR1IRInfVRaFJ4kwCPqGUOajdlJilwDc=;
 b=duEc54iDzMOgqAQbPpZttPa2W0edfy1RTGM2VGnoPYAM2Y+llVCLZRohTwR3Qj4Guw
 Ev8tkUdOQ1yD/BdVfS7MEeib/0OdHHQRL/LbyG/d7RGlefW29AName/tbXr2GTGrd7JL
 LINxQe7B4KZHUAA88PVGcPxzO5uzL7VJWGq6LjM64rwPlxLj7b4of7j46FL44uYs/dQ9
 YzMrWfZcilL0vAe+W5dpBIMGg7qGiuvnmTEidxGQhWF/fN9kJXBSpYL9BXodbNzd3riQ
 yXRQ2HTqn38igeeBIWLbBkjAC2Lm9WbEpeBvU7K/iDRuOlwanUqzXGJNZZ0A3c6nKrED
 czZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFfMQRVrkkZCR1IRInfVRaFJ4kwCPqGUOajdlJilwDc=;
 b=onPVy7ix2QVAcALrpDSxT6BwiGytTTUCK/yggahDeX3114+s6comEt9IPua452UjON
 10Wx2L2GZFzWygYahCibHcGo13F2dIXTdYUmve5OA6trqCS0NGYFB2Z51zt4pmckQaqK
 YvwRSjpoF6Gi0uhlUOE5N3EoR4VBzLhfQcUXdPZLN5NRUrCFW/fmWHg421a/rRIXd+qu
 snxY9hoNQel16wuF3Gt1HDgXl2ZePog08KLUdWsgymNf8sqVROhOiixn0/lHzd2yfntr
 cW28eT+pridG/emEN5sm6XULsi+P+th98a5kwUVvaZELYmAk1xLZ8CsBc7c52bqeZc9o
 /gsQ==
X-Gm-Message-State: ACrzQf3epIdF4jEQ3CWjRG7v8BbqX2Elm7Ce5CTOGQetMJA/sZXBbj/q
 ex8VDRt+kVomwRB81TOmWFH0b3mwEYvsxHys1OJYng==
X-Google-Smtp-Source: AMsMyM4u98GtOTZE1Zp9lrDY5nrmuklW3rBnaPY4vEmgLhF9R5tM4vJOm7/s9Vtsce3GVgugOiGjnpcPQTneviJ7Xhk=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr3871708plb.60.1665134883950; Fri, 07
 Oct 2022 02:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-34-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:27:52 +0100
Message-ID: <CAFEAcA9cz5MjnH5h_BbtesK+JBeOkUxoMVDNG5jmRaXQmQBfTw@mail.gmail.com>
Subject: Re: [PATCH v3 33/42] target/arm: Split out S1TranslateResult type
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Consolidate the results of S1_ptw_translate in one struct.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 70 +++++++++++++++++++++++++-----------------------
>  1 file changed, 36 insertions(+), 34 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 7a77bea2c7..99ad894180 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -220,13 +220,18 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
>      }
>  }
>
> +typedef struct {
> +    bool is_secure;
> +    void *hphys;
> +    hwaddr gphys;
> +} S1TranslateResult;

Ah, I was wondering whether to suggest this for the previous patch
that added the hphys and gphys arguments :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

