Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A04C047A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:22:28 +0100 (CET)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdYC-000750-1n
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdWn-0005Rv-Nm
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:21:01 -0500
Received: from [2607:f8b0:4864:20::102f] (port=51725
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdWl-0007VT-TX
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:21:01 -0500
Received: by mail-pj1-x102f.google.com with SMTP id gi6so966123pjb.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TXEPu+Om/C51QBWkdrH8SmhaH2ljo4vvx6ErKO6FYt8=;
 b=DtxSSFW+ndTKxMnFG0fKpP+OEX7i/VOwWkxWjgMy0ngcYvYhtiz38fCSwybqdH1nx8
 ToYDqfU9T11ne3vV+RZU31SZK9PRKLf1NeDx1VMBi2t7B4TZk+1oeBHDIfT8pU2Aii33
 Pc/WfyCnaGMHdnW8Rr1txvfva2B7W0UnZUz+NTS99ePUanQn0g4k++7f2xldVAVXk9Sy
 Wg3msGIRutgZrygTxvicTvDyKwJz7+RiP0Sp0+NmqCUf0SdSDV7nCiGWBr5LS334iFMo
 PUrIdHNYwxmPZ2A/dqwOlf9aw45V6FmkSVhqLoeoqrW6FXRPbrc0nwqITSrbIpOgY96h
 vz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TXEPu+Om/C51QBWkdrH8SmhaH2ljo4vvx6ErKO6FYt8=;
 b=ZosHEDCSvGu2vvuQOGdoRM9AQiREDDWrs/bzSvxWMHHfrbTTJyYTx3My8NXgVVCAtH
 +pXAm3TvV7UuCqqgyzSHzHuKezClzAjoiiuxixa1BsDanq5QRhbQ3H7s1OydxnG2inCq
 bS+FovzRF62r2ojDr0MBtHgAjOimz6478h4UbAFcNxWkikYbcf0UwGF92988yfV6CN7u
 ihNmKvSDKaTYjP9kC65h2HjTYlmlXmh7pwKoV3PPCW/k/1+Aeowwy1Abj4TvSRRIfmg2
 tQKDesTC+tbyhbAmqt5IPQ6/DhmKAakmgSOpBgeVNYal6tOaGM9Ad8Ejt2B1VDzU6jPO
 jeJw==
X-Gm-Message-State: AOAM533Zkj9jNXIyJiiNniGLs6YNqEUYvHMm7Vh50MiXy2FXqx7mN/3E
 ou2ri0PkzwV1RuFcJFTJbKrkqA==
X-Google-Smtp-Source: ABdhPJysjny6Ddi5DxUhfslqqiRAfuRS1xV2OcC/acjCKhpDalybLMIcI5aMQklQ7XyTX+6aQVmNhg==
X-Received: by 2002:a17:902:bd95:b0:14f:40ab:270e with SMTP id
 q21-20020a170902bd9500b0014f40ab270emr24718770pls.101.1645568453670; 
 Tue, 22 Feb 2022 14:20:53 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id 10sm17206750pfm.56.2022.02.22.14.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:20:53 -0800 (PST)
Message-ID: <2f20c6bf-45fe-f9aa-7d3a-51778fa8451b@linaro.org>
Date: Tue, 22 Feb 2022 12:20:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 23/47] target/ppc: move vrl[bhwd] to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-24-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-24-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            |  5 +++++
>   target/ppc/translate/vmx-impl.c.inc | 13 +++++--------
>   target/ppc/translate/vmx-ops.c.inc  |  6 ++----
>   3 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

