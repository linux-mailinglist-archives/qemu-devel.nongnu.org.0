Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759552AB32
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:48:47 +0200 (CEST)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2FN-0004ik-Ip
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2Cl-0002ZO-Qz
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:46:00 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2Ck-0007Po-7R
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:45:59 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c14so17700058pfn.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/VGYtqDBgUXOC4bYGwyyjqsl1IJ+BTLKq+HnUnFEFFI=;
 b=sTIuDUTbfDIzSEffIJuepclhW3oXpBqn6B//92hfaihbQK4ZraL2lYgwSb9r1fKGvi
 HHQN+jmARYZXwowklJGLvt2EY0Tjltvzl48JvdGBdidx2Bfvt9NcHlMwcpp+h6lMhQh5
 jMBp02OmhimeXWAiX/Aj1vV/woZFYi33h4e3C0GOJ9AwTeMQD9iCEQ5JlWN20PmMwkkb
 f+Pva+SXELR2rMagVNzrKCwciSQ7ge8EqxzdM29itaaxZiqp3f5qKNB1H2J8E+Dv/YZx
 IapAKnO3adftKKDFEV1y+fXDGNbY5tJVfA59a8sv4HefP0ZIs4yoVzTrKsibjXRagUb0
 wojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/VGYtqDBgUXOC4bYGwyyjqsl1IJ+BTLKq+HnUnFEFFI=;
 b=B9pw8zDe7ox4mUVLYxFBjlm+6y+pqezyinGg17Mipz1B8qS2K2n+fegTDj3M1w1BeK
 Y6Anpok52BH97LCKJ6+7sfUVcYaRERBVis+vhiZObePTe2OSRU3kFNIbTMvKuCyHl1i1
 n+rLENtwtvDBoFm9NRBBNhnvt+1y+pqRNOYkN4VgOQfm1heeQMhnt63yist/0FbkYWcy
 /BMuzUvd05yTEaEWDTp/AYd7rXC+rZPbLd4NWA6cZKfsfeFdNm0I8ZtfMHc00DiuPRcx
 J9KKh+cnEUTCWVZaL2G3ui19Sie22FtRKak9D+SyE2V2HkTv6q1o8POJ/m5by+BCVLPD
 weLw==
X-Gm-Message-State: AOAM532sf9MUXsbIlnL8EbhlJT7w63gzU67ChESIE9a/oouR61/tL9HM
 pO670XORqDkRarcLJTKPcVSF2g==
X-Google-Smtp-Source: ABdhPJwpS8VYK6ydVBqYMm/s/qngBuO5hrv3Xmkybv4H7pMjRx8hZEpXw05PxA43SW7jpzs3g2Ipqg==
X-Received: by 2002:a63:f407:0:b0:3c6:9d04:fea with SMTP id
 g7-20020a63f407000000b003c69d040feamr20974657pgi.605.1652813155914; 
 Tue, 17 May 2022 11:45:55 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 be11-20020a056a001f0b00b0050dc762813csm86050pfb.22.2022.05.17.11.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:45:55 -0700 (PDT)
Message-ID: <7ec4b7eb-3f7c-0468-b7be-7ad46ca0efc6@linaro.org>
Date: Tue, 17 May 2022 11:45:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 03/10] target/ppc: Move mffsl to decodetree
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/17/22 09:47, Víctor Colombo wrote:
> -    do_mffsc(a->rt);
> +    do_mffsc(a->rt, 0xFFFFFFFFFFFFFFFFULL);

BTW, prefer -1 or ~0 or UINT64_MAX.  No one needs to count F's.


r~

