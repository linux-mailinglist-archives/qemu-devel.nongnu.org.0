Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583B38F807
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 04:20:19 +0200 (CEST)
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llMg6-0006bP-5B
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 22:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMZJ-0002Yr-Qu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:13:18 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llMZF-0007Hn-ML
 for qemu-devel@nongnu.org; Mon, 24 May 2021 22:13:17 -0400
Received: by mail-pj1-x1030.google.com with SMTP id k5so15942912pjj.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 19:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mcPFxCNWWbtruHWx7CqEOukYZjqr0hgWmFeSePAaLZs=;
 b=z3OE6G3TutdqedccssLW65L73Q1tieLoSuqWlxy935Bj6uwF/3QsYKFIikvF2lRcuk
 quvHrvUSSXfJRGq5YaRKN9BHkFxGt00eXwh5vo3a/n7Tgh5016tmuxYB8VF/R2lbsDJF
 +IDUi3cdsJbsEkq7Pk3U7mZw1ih2NwpX04Lz2t67xB2059SCNRsKMdmb1Uwr15ZhUZIP
 hD5Na2zNvlFmr8WIT5jHG2lgzZ+lpfDXUjDknYEAuir+ueHp0hxNkL4RKqwsOnnCFAna
 THld2E5EaCB4d2u2WRud+n9JPXHehcncON0ntY7KBC9uVcuhcSfcmQBpjqikLrdzvM53
 hbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mcPFxCNWWbtruHWx7CqEOukYZjqr0hgWmFeSePAaLZs=;
 b=oZUBhcpSZF0qb5WX0H8AQsttn3Ptdj6Ib1LTzPxk6LF6EEc7CxHjQxNOQGm7D/RiQN
 OHr03u6t9szx3FUYHb6iFyWOBiET+ejyXaVyAbfUZqfl9j3eepYNGC9YagRY0lfcycpr
 YULa6dbqjQctCT/BwOxrDR27zHjckD1DtVkUx0QpCSb3QxpAvOfVeDpMeUWZdpUk3iSM
 kXh/QQlMm2oQqo9fCeDW56jlQXjSo80vbyOg2ARMzeG9/6GNggqSIE0geyD0o8/6FuTr
 TA/6GeYQZt1wvSNqaLIgLRwl+ZZD5vX2s1IbboLZ7+i1Ozd2Dc6zDtJ2ujTvwc3VnR64
 OdvA==
X-Gm-Message-State: AOAM533QuHfbPZSLgHfmjBhPfGc4EDMlBndqy74J6HWaXE+f+9JW1ujo
 a77JkWGXaeHeUTqQ9RnI8KAlyQ==
X-Google-Smtp-Source: ABdhPJwW4qq4j4wLDLjz5sjzuPiyfot2oYjmI4QX0R6BaeFTaj9QHhmWDvx6h3I54ZQaJxV+pAQZZw==
X-Received: by 2002:a17:902:e848:b029:f2:deed:ace5 with SMTP id
 t8-20020a170902e848b02900f2deedace5mr28445020plg.63.1621908792154; 
 Mon, 24 May 2021 19:13:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d10sm11759977pfo.65.2021.05.24.19.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 19:13:11 -0700 (PDT)
Subject: Re: [PATCH v3 9/9] target/ppc: updated meson.build to support
 disable-tcg
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210521201759.85475-1-bruno.larsen@eldorado.org.br>
 <20210521201759.85475-10-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <177c516f-70a2-8ae0-0748-c6abd6964e24@linaro.org>
Date: Mon, 24 May 2021 19:13:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521201759.85475-10-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

On 5/21/21 1:17 PM, Bruno Larsen (billionai) wrote:
> updated build file to not compile some sources that are unnecessary if
> TCG is disabled on the system.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/meson.build | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

