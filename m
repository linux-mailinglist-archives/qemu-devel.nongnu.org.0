Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4937D3A4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:44:39 +0200 (CEST)
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtqY-0006lU-Mf
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgthD-00035C-AE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:34:59 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgth7-00035U-Dy
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:34:59 -0400
Received: by mail-qk1-x734.google.com with SMTP id i67so23191434qkc.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HmXSVeFYL3pCl6LWw9jgh+IOfYj2+FGay7KrItaeraM=;
 b=R14CCPYAWfJnF0y9uUD9gB7nMZ3HECbDsyQ05WPRLOMRATL/kwRH3i1Wfd8FTC6/nX
 b04cQe2HYDr9Jv10CymJXPeAWsIrfIfnf+om8J5TUQ6C6UOaA42KJMurXyDRy/zoBGWM
 hCAW59jxj5xgrkf3u0Pb9QtMWenUnzWh8j96Pyb20i1n8JkUZn0SgK9mAKnmm2YLgEQN
 jRkWzViFSVnfgUYRuB2WtLYCdsjHOTMU76fpe1EVD/a6V2IYpVoxl2pBH2fSbWp0EY2c
 81Y+YzcdhQoftsUwncDA30h46lujF2CF3eDDqFEV3d/D0PJbIQIqRLGhvgnT2mtgwxxl
 DCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HmXSVeFYL3pCl6LWw9jgh+IOfYj2+FGay7KrItaeraM=;
 b=ent0s++cUSPULj/7/1QgmrMJsI+iDMlF8ddeUkgqbxECVbUWr/rG/v0eU38K0MLBR7
 QbZJzAADre6k/0U0YbKHmZ327ZOXzrYLfIdBqKssDBDouC74kQHNaL6vRjwa5SqUVM3/
 bGSuMykUs41ZDKzjhxOxsj+5nSC4VyPjK2BoKnUDBGEXCVmeot2ovTPJtu/CwV3ZvM8G
 2Z60QZCXGQLFXGJxLveELtPAee4GMK90kvFy6snPCWcxZ/tw8wIDvplUb0lv7hbroorG
 ID7Ghm5K9CM178AgR20SC1jYJTKlL0KSlIys+/G33dTT2q+0U4bGyBNqQSB4L4H0j3gr
 yLAw==
X-Gm-Message-State: AOAM531LchLga0sqlpU7dX4lv6ge3syCjEp1OJKldMvOVZ0p98YvfxcM
 B3cySd0oykcEchmLI3Rx68gd5Q==
X-Google-Smtp-Source: ABdhPJw9Xl727xwZKOWJuRm5DtEFEGRrgVV/NR/D7e+3HqREAZjcOGh5MbhaGp5l2/kczLVFx9W6ig==
X-Received: by 2002:ae9:e80c:: with SMTP id a12mr21410489qkg.85.1620844492137; 
 Wed, 12 May 2021 11:34:52 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id w4sm632248qki.57.2021.05.12.11.34.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:34:51 -0700 (PDT)
Subject: Re: [PATCH 09/11] include/exec: added functions to the stubs in
 exec-all.h
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4b7cba3-eb5f-ff65-9376-da9dc8edf45f@linaro.org>
Date: Wed, 12 May 2021 13:34:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-10-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Added tlb_set_page and tlb_set_page_with_attrs to the
> stubbed functions in exec-all.h  as it is needed
> in some functions when compiling without TCG
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   include/exec/exec-all.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)

No, the caller is tcg-specific already.


r~

