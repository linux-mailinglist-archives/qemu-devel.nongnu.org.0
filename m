Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414852EF3E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:31:00 +0200 (CEST)
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4ah-00087y-Bk
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4YM-0005o7-Ks
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:28:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4YK-0005WR-Bu
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:28:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id z3so6519153pgn.4
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+Dw+PCh7vE4HmyaWCoATXE71EdMyH1CLwN4WMVYFoqE=;
 b=BcDIOc8Ls8UOmwuyzdBEHtwX1Lb1bLKCWn6FQcTb2Qst/OWmiae4fpt2sRGuv+JVoc
 uCq7zNfCkP25Ky+a/0pCV6PWjeh5jHQ95cdt1LUUaH9hEhqbJqR7hm2hOnXDNcholKoQ
 ddygVGOQsPsVZGmKhrJ62INzVKyZCYnZBqWQ3vNkP52HVdbmFMAb7itMfo5XeDJ4rrhm
 n+D26v48otJkEtLhG2o37fMvQSK3dy5aOdJse7ApaLCjj1QoKg6TctsH2WAZYanA1C/k
 viSLrwIFH416YiEm3VFesQh0U8AyHj3So0HVv6Kn4Hw7x19o6BwQgCik72NCY8MpiPH1
 iTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Dw+PCh7vE4HmyaWCoATXE71EdMyH1CLwN4WMVYFoqE=;
 b=SC6HvS+L6485XmcRyIHa5OIiIQz1IEeisFOGAbYkV4FF9rShw2hcpHiwkwsHAYX0Eh
 6D5krp8CxBpsL3bG73J/WCxIyCxh07s+i3Tc+7wIFzjWPo8vNb5ueJcbhrGggRXkqh5r
 xAn+Uin2noGIeAH8VDxN664sxUrqMXVUPIlbdK4dGoes7zFppBvqKPQc03KjVJroqrlD
 wzkAhj1MUxsfa1VaZhHTGNXkCgZd846Lynip5ai8CMOmvVFSCt0SD+dt5cdBSV1X3Y5E
 wmSaWc0DJ16r/2E1kdI6mZ/TgszkGybwiGL/lWvCgyhjxro256S1tvYBY1JB4JSfDSTu
 rYUw==
X-Gm-Message-State: AOAM530xD+YWjRK4En+eSq2dt02BUcabJ7xyYFD3THs5B3YPSAUCfTyC
 hjukXL97Kynx9GUwPwiA6JEe/A==
X-Google-Smtp-Source: ABdhPJzfCziL0zJE+U2FO2vmCQ+RwZbXFjLDQFC6bBUf9ysONHO6q6ZSEXDfLCYiE61KjXAgMRa0+g==
X-Received: by 2002:a63:ff54:0:b0:3db:9acf:a087 with SMTP id
 s20-20020a63ff54000000b003db9acfa087mr8708441pgk.185.1653060510887; 
 Fri, 20 May 2022 08:28:30 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a62b81a000000b005180ea859d7sm1986127pfe.123.2022.05.20.08.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:28:30 -0700 (PDT)
Message-ID: <eb0920fd-3c9f-f2a3-d268-ca1a2c6cec7c@linaro.org>
Date: Fri, 20 May 2022 08:28:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/12] target/ppc: implement xscvspdpn with
 helper_todouble
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
 <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 5/19/22 13:18, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Move xscvspdpn to decodetree, drop helper_xscvspdpn and use
> helper_todouble directly.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  5 -----
>   target/ppc/helper.h                 |  1 -
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vsx-impl.c.inc | 26 +++++++++++++++++++++++++-
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   5 files changed, 26 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

