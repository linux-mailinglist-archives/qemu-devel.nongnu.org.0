Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAB43F6C7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:47:10 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKjN-0001Mj-2m
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKcH-00070S-Ip
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:39:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKcD-0001LD-Vv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:39:49 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso11578963wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yq0GEOozCFCL/cAZ2OJBnmfzGdQeSJzjVDnkCL1lCSA=;
 b=oUoGzv9Xjo9SAwUDm/UTAMIgvyu7WmXin3WLivMcfTcn79QDBWnfkljOombRADFR/m
 r0esq9WoWpTMrQUYjsWBIUHa0mpqN1GGg7G2WczcvjvssO6SW9+PpH+Ag33sWr3XOsGw
 fUuKbzj4KPnd10LgiVRmZB6M1ns5nxR9TpfPUuGgcFRzrn4fbruYjZGAH7d28pZEs2rr
 2O118rk+FL0l6+Ski2uA5wlfj/PbF9oH0uDMnofR6Nfz8+f1onEJWABNUlcwoy9xa9ng
 H0PKID07rf8MDuiAvdxzNPsxX8WH9/ym3YGxm8V+oqQ12BYYSQVxakttmX11d1U322h5
 NyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yq0GEOozCFCL/cAZ2OJBnmfzGdQeSJzjVDnkCL1lCSA=;
 b=b+txH7uMLdaQ/Mdj0F2TWuP2930FFdEYiyOC4hvsvgvTNK47zkyT9lKjSukEg/qolc
 amDcInNhGYNCV6OIKUoyV1eoeWpQ00zoNadjBt3oI8DeijB+Rw3kAzZEBHr4CkBRAjUn
 AWhOCSGU7vEZNQeM4adRjTx6ByfYA96ZlIKYGZLImLXfQlr0LVHW0XMc4/ZFzkpXkXZk
 jfumI7cVQzq7SA4gaPyYPVVRzNu7ik2ssLwzipEGppzZ6l+jYVLdPz7KEgPgriFMhXlz
 3xt8s9DG2mn+fkK5QW3OVQU2s/vdObIAX3XIc4RPqAlYAD+S15nrZgqr4QgCUQTiual4
 WJWA==
X-Gm-Message-State: AOAM532kliNCIf8gr49SRUZ/us37wajBt1aSMWB52Xu4iNXgTEJLw/yo
 sGUELGElip0irFHW9eHqLivB+zWERcg=
X-Google-Smtp-Source: ABdhPJxMflHqoKABYxHAkbkCbgiCL9quk7kPQk3YFwmt5TIOmxuMOXLmBK2tpqWSdU5wVAXKx1UVfg==
X-Received: by 2002:a05:600c:a43:: with SMTP id
 c3mr16733329wmq.193.1635485983759; 
 Thu, 28 Oct 2021 22:39:43 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f1sm4816271wrc.74.2021.10.28.22.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:39:43 -0700 (PDT)
Message-ID: <dadf454f-29ef-38cf-13fa-46241292e5d5@amsat.org>
Date: Fri, 29 Oct 2021 07:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 13/23] hw/intc/sh_intc: Remove excessive parenthesis
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <5eb52994b1255b5147093fb668e679674f94cbe9.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5eb52994b1255b5147093fb668e679674f94cbe9.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
> Drop unneded parenthesis and split up one complex expression to write
> it with less brackets so it's easier to follow.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/intc/sh_intc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

