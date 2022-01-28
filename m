Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19649F1BA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:17:52 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHln-00067g-G5
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHh3-0000QT-Gv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:12:57 -0500
Received: from [2607:f8b0:4864:20::1034] (port=40648
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHh1-0006oL-Sv
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:12:57 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 z10-20020a17090acb0a00b001b520826011so9717191pjt.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0gx2La73i55guNFbmZkkQPmzp3blHiSd9YakpQX/jTc=;
 b=esU6/7bOBkQlt4vhO5juIt1ViSG9PRHVD4fgcl5fRimhzpu1DqxoEhjsWWZDx7oXlW
 V/dVBe4kvqygEoPoNfhAL9/Ckfkvv0h3/UfnlIgaFgFfS8p/0QnizuuS3BhF1rm5ogGb
 r+IU4BKYqYH/1sKNI3mPGHkrytNFTYlsJYENDCqolIVTNo7wL59O09ckPLsIlPNiS8VU
 cXGpYRDjXWsmouMJHytsfDz8gVK9LyMJgHzJCEtekRXtJAHJ3NbvqLlOImbdOy0DQq7y
 YDvUpBiHICaAHUUK0SBLmISkcIIMzJwSCCx/mHICkLcZYpdExoUY1cH9woQP3Yo2mt0t
 r65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0gx2La73i55guNFbmZkkQPmzp3blHiSd9YakpQX/jTc=;
 b=7IG2Q2WJ1a2kVBhtnF3dg44bkFRF4efstdebeGo05SpevAOlg9HgPzqvQTKs6ixTeZ
 4iItGF59bw07K66YGmX8IhCHUzqvjx+R7A7j61jPed+z+2GOv7WRi55mHBPU+oyXbXES
 l5GAH5d7+zKNZj6lCTNmGrtC9f66vauw+3IE6rjez/NYh2PaoIwBF+2Z831D5r7/a3j/
 Bohq4k+OyTKtqXtcpAC/76lRnFwzrhL7DVcbKrLmseKhZAv2mDDi9Nw6BLOiDXlU1e+7
 G+Y6xsLjA7Gpkt78EAP+ugAKSJJZ08ouG3ua1LHY1x8PUJhWnSrDJhKlyC5flV5Hv1OC
 4/VQ==
X-Gm-Message-State: AOAM533PuBGSjFzmyOXQXt+hyi4t1qxZyNvw/LZuFvm0Vb4HwBnj1zai
 w6GqafkqudJnjFBEVwb1bWF9Wg==
X-Google-Smtp-Source: ABdhPJz0rnuRDSFXaNqFT/SkfnOUtffxT79f3n/LEwxWoAyd4XxFKEZ1Pt48piQ8qFSBhlbzdW20Dw==
X-Received: by 2002:a17:902:d2c2:: with SMTP id
 n2mr6448441plc.57.1643339574658; 
 Thu, 27 Jan 2022 19:12:54 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id mn2sm632223pjb.38.2022.01.27.19.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:12:54 -0800 (PST)
Message-ID: <70fdabac-f73a-e3b1-cd98-44b67f26aff1@linaro.org>
Date: Fri, 28 Jan 2022 14:12:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/14] hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when
 GITS_CTLR.ENABLED is set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The current ITS code clears GITS_CREADR when GITS_CTLR.ENABLED is set.
> This is not correct -- guest code can validly clear ENABLED and then
> set it again and expect the ITS to continue processing where it left
> off. Remove the erroneous assignment.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

