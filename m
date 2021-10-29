Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2943F6C8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:47:48 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKjz-0001kz-9w
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKde-0007O9-H0
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:41:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKdb-0001f2-1N
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:41:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d13so14312666wrf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y82UYZImFq4VVWByxRnp16AMwNqQ67GxcjzwPIYQ1LU=;
 b=mA4czI3KKb/n4uU2rc5YTbsaxdCZSWtMmT+SRntRMNiT/Qk9ABA/RkuoiLrsUoipcy
 9rkpxGDcGDQRIKaAXa2qEZhpH9/N/5J1p4JWFdxenVk0yfT1qUWKpznr46fsDZA/ybHm
 syCNmfHlV3ALFzkq4qdDYfrUWyYY+mmkLH6E/TURoxAdRN6x/GeYyk734S5fNkXuDUB4
 01+gjGiChomOiE8Iiikt03po5o7O26w4sTtjA2HcXhJrsFJtgqyyOvmWQ2qlKotm/KN/
 mWuIp9WPRw9rJdjG7YDcJ8gpDJdi/l7Jg40dDAtCdwMmFpVmeoZFJgr7UtgMaK9Hi6XJ
 5/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y82UYZImFq4VVWByxRnp16AMwNqQ67GxcjzwPIYQ1LU=;
 b=6mUp8z3nCP8ZKOK9w05aaJwyrLvC3Q9tzWs7BGCJieA1UH95lBs3SKlIHqAdT57X4z
 /iVsSNP/d+VbFl0triQpgElx6xazVKyG17VazjcFc2rT/G+PkQ83WOMffy2BGvZOO8E3
 Nhg2SXoToqClWqfGQQHw39k5a9yiRcpQmnFbfNjY4cK90DT/6vGZRAXo06shu5Xh/M14
 q9+M5EJzC9d0WQxARU2Qbfb/kF6hebXIdkXXAPWcW/f7PayqlRl8naJujlVTVNw76a3s
 C4DSz3tEYMNPq8lkA9TKEKz/sOJAs3dVsoAun3IITmFv2wI0+TODQKUT+P8Dw5JsrL/B
 ottw==
X-Gm-Message-State: AOAM5309/HC1PTl0I43wkwp05DzuFIr+r5Xtoh7d7rFqbpUpff+m8KvC
 PNG6zjBt86fbWP310rFHbU0=
X-Google-Smtp-Source: ABdhPJxv9b+djZauhqSgvaq6D6NlGByIAnL3EiVBXUE694hlN4ft0NUA0mR7CyI2r6vhmMmCSAU1Ug==
X-Received: by 2002:adf:e709:: with SMTP id c9mr11869899wrm.78.1635486068639; 
 Thu, 28 Oct 2021 22:41:08 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d24sm4106470wmb.35.2021.10.28.22.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:41:07 -0700 (PDT)
Message-ID: <72370de1-7a3f-1cc4-cd4b-a85e7b0854be@amsat.org>
Date: Fri, 29 Oct 2021 07:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 16/23] hw/intc/sh_intc: Replace abort() with
 g_assert_not_reached()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <6c5014e86298b5d511a0e4e80f405683ad4191c2.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <6c5014e86298b5d511a0e4e80f405683ad4191c2.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> All the places that call abort should not happen which is better
> marked by g_assert_not_reached.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/intc/sh_intc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

