Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0817F3F75B7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:17:52 +0200 (CEST)
Received: from localhost ([::1]:35740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsmt-0001bM-0W
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIska-0007Ix-Ua; Wed, 25 Aug 2021 09:15:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIskW-0006ts-DB; Wed, 25 Aug 2021 09:15:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id x12so36372893wrr.11;
 Wed, 25 Aug 2021 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ymu8Rgdncv7qdTaeRlI1UM0LxMHQFbi/WRPFkZ1gsbo=;
 b=uQ1Q+h3DWvvRVORnPjHaX0mNDsa30cxl+tZ6KaVPKoJx7cGnBr1V647STkBtj3FNl/
 hht5y0R0IdOwkVeOQD/mddGrbtCfvbhYK1XN15YcCfBSXtNsV/pMTs3QpeCHU0T8TsXb
 ADSTXCygbvJgl+mvoCPI1ICuqMUiwdH7GXWRDIP54UvX9wVlkrawn4CT4EQnqp7K7e+S
 T/YkWbtLzFHyR8audgjhv4xkcJnD2ydgmUNbRbggsiiioS+TxwnS2BWpBhRAuSM84q5h
 16kBgSM9W7U+j8RLO/6y/sjYm0LFUuJiCEY2NCW/JSXAEDQENEY0aHEVm/8nWGSc5VcT
 eQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ymu8Rgdncv7qdTaeRlI1UM0LxMHQFbi/WRPFkZ1gsbo=;
 b=cQlwWn88ocX7h9higns+x8j9CeziOVMAWg40YarOA9Gfp4l5GrTanp+sP9W2mnZ/uL
 ubzLzZmN5kIiZFHV3b01K9jsJEehCx9MHUAzD6ChM/7ctrC64EgQ/ZJ8WgaMWMrHXqq9
 fHvjyYWM1SN+RApUffLY7Vn7L3n8mf9rHZGl+oah0OJUTMdwK/rNLc5K0yXy93FodOij
 Hvb0Z2xkhE7qm0ivna0mkQxkh0IYhrQLr3w0QfwsPjncFEBW/WvM5Wb2+WwnSHTG6rUS
 de2r1XpxArAhUSIZO2ikEWBxJb1t//I0FzRB0nxlh82JkF0pcXfTUmVwJIz9H1Y3Dx8f
 1BFw==
X-Gm-Message-State: AOAM530eHkhlXrRGP1LbK/9FkT2u8oYqb+Qg8+A9GwuiA/1fSufedLzb
 SlMXJ1DaXgLO5I1iUF4Jsh4=
X-Google-Smtp-Source: ABdhPJy6aM9/leHo/PifwIsIKLfeL9lhTpSeC0Ra+sOV0U0Q6AzrIAZJ8EO+DlN1HsoW0llFdAeM8Q==
X-Received: by 2002:a05:6000:128f:: with SMTP id
 f15mr23993039wrx.262.1629897322483; 
 Wed, 25 Aug 2021 06:15:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b12sm25449894wrx.72.2021.08.25.06.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:15:22 -0700 (PDT)
Subject: Re: [PATCH 13/19] target/ppc: Move dtstdc[q]/dtstdg[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-14-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8493eb1-c87f-c060-1fb0-a7dfeaf85c7e@amsat.org>
Date: Wed, 25 Aug 2021 15:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-14-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.24,
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
Cc: richard.henderson@linaro.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:27 PM, Luis Pires wrote:
> Move the following instructions to decodetree:
> dtstdc:  DFP Test Data Class
> dtstdcq: DFP Test Data Class Quad
> dtstdg:  DFP Test Data Group
> dtstdgq: DFP Test Data Group Quad
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             |  8 +++----
>  target/ppc/helper.h                 |  8 +++----
>  target/ppc/insn32.decode            | 14 +++++++++++
>  target/ppc/translate/dfp-impl.c.inc | 36 ++++++++++++-----------------
>  target/ppc/translate/dfp-ops.c.inc  | 10 --------
>  5 files changed, 37 insertions(+), 39 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

