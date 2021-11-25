Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098AC45D82E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:23:29 +0100 (CET)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqBua-0003Nl-3u
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:23:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBpg-0003tQ-RQ
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:18:24 -0500
Received: from [2a00:1450:4864:20::334] (port=45797
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqBpe-0000nO-Un
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:18:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4284369wme.4
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 02:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wQ2PRfrEbcJ2rvNHpVQMfeN9N3iHqQVNKFvQhIu7xZo=;
 b=mxiFPONwC1fJ6axoe+Kf9aaFFWkTSI0pk6Xo6I+pl6GmUWa7ac19UZ2vQkBfjdOk9F
 VPUG5sZrpLIgD8mfLKFzUGl7q190rSE9XuMTswxivNCY4rNINg79nb4b+3k2cWmbDesm
 CmGS3J8ts4UhV321XDAuW1ZO26FEYUh2bL0cQHS21KgjvpGzDqOTZmIinu+pdqu0hnWi
 XySMJwTqe+iglVDlEHC7ONYgLpjyd8gI/qFx8njh2AwAVoKxrbi1ugNMWOZCq/THRkYN
 OoOwFoUlfJRlbTsdxtdfOs+S7rgZTgAVH1UupNKu/TuMi4R/IOAo2Y0d/VDYifmTAmUT
 m3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQ2PRfrEbcJ2rvNHpVQMfeN9N3iHqQVNKFvQhIu7xZo=;
 b=CL+qai8FVUM6xSzJMrY1cFLLzAHLOuXxpCxbkgXu8B1Ce7T/4mwXIaT4lqjjrglFRp
 dKVuWprVNczOSiCdLdUMzoPnSyQGInuB9xov3c1ReH3b8PRRB7YmPpq4OHJpjQJAZxSN
 ThX51fNANvBSI7hvPgthk4HARsd6m/lNVW75A+ma9VXdWKoKrehEW/JKj6GB+xTW7iOR
 /gj1IPAHoSwWiFYwpOGOUyhpDreRO8BYdmC+bA/fm38dyBd3qEpL1r68AXUJ6ipELEMZ
 e9iaD5/1I9C8PgjualIdkLqlAWRAP2Gm4SWT6rDbcclZCW+rde0qISI+s7etAIjGh+ml
 3G7w==
X-Gm-Message-State: AOAM532iIfMuDPCuS7qQyypzab5Rd7xA1hSOwY1RDMbT9+2/GKNwwZkf
 0yS8NfWy5+9+u8SIPqc55Q3M8g==
X-Google-Smtp-Source: ABdhPJw8NVEEeh19htJpXRf+TvUKx38bgqnotHyuqxjxTtq9kodZOSBt4MIHFJb+z3YeRvVel+sX2Q==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr5806900wmb.51.1637835500354; 
 Thu, 25 Nov 2021 02:18:20 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id f7sm2886550wri.74.2021.11.25.02.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 02:18:19 -0800 (PST)
Subject: Re: [PATCH v3 2/3] test/tcg/ppc64le: test mtfsf
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-3-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86e222a8-82a7-90dd-e03d-d402b90314c4@linaro.org>
Date: Thu, 25 Nov 2021 11:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124172523.3598396-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 6:25 PM, Lucas Mateus Castro (alqotel) wrote:
> Added tests for the mtfsf to check if FI bit of FPSCR is being set
> and if exception calls are being made correctly.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   tests/tcg/ppc64/Makefile.target   |  1 +
>   tests/tcg/ppc64le/Makefile.target |  1 +
>   tests/tcg/ppc64le/mtfsf.c         | 61 +++++++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 tests/tcg/ppc64le/mtfsf.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

