Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDC3F75C8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:20:21 +0200 (CEST)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIspI-00016p-3W
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsny-0006Gd-Ga; Wed, 25 Aug 2021 09:18:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsnu-00083e-40; Wed, 25 Aug 2021 09:18:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so114884wmi.0; 
 Wed, 25 Aug 2021 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BwWgqWbNzvPcesRtGEjeSEgpB0m4rdGzaJZVfpLb1+M=;
 b=VkCg8JVUUI4QIf4Yli9/L1uWyP5X8BIqXAEpPBx7m+YsUX5d6MtaId8ufUVvflDlwB
 QVhFnOwQ4z/zcWskc4dqNeXEL7GwRDEj0RUFRpq11CO8bkkND/WKWtBLzKRcuBX/7F+n
 0XJcElM0XA340CGpAyd8fWJthEauNux7AP9dew9AW+VyNPPJTUFVEX+ofuiFgulLGI6K
 Zt8FKRmSFXxWzCyWce4Gl0oS2uF24GfoX8lbIvIUHcbxrt5kmTbDuwhxSF6UtvdRlLjn
 /hpb1Ih7H0DLj6f80nHc5J9r8Jyv7Gu3aOFClSLNx0qWbd00TXm4y1zvuOoFv9dk57Dg
 lorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwWgqWbNzvPcesRtGEjeSEgpB0m4rdGzaJZVfpLb1+M=;
 b=Nm9OT/aCL7DnoULvNjFv9/0M90XYCnII8y1jYX5ofkbdwdRL7MjAp8v8lpRBMrjbOq
 D/rexHcgiml62EePwG5rICsGqaKHWYEN4cd6uQZ1skDPNSj69X8/Hu1XadkCRqAEBArL
 Y1yPGOiVT17t3m4ra/ygdKsnLEdwfybm36f/L4p/7NDQqunhIL+xkZK35g11cCjCqeDB
 5j/XCKmcPxlIhM63rlPp3T4q0qq+AIHeVVyx3DuIyF8zEmbxwaGiRWm/tf9BGoA5hpUV
 4u7mcfOL6v8m+h1RjTPq1FLHaa1XAI/9NsPMAiNPtKr0+aLFL7olIeJsnYmiZVElTBkI
 EjIQ==
X-Gm-Message-State: AOAM531v/Kkx84+mYI/AYF+iKW5IGdCWXnY5Xc2ggcPnPDHt5vNaO4k4
 jRrGuYzbbe0c+1zi2BeugVo=
X-Google-Smtp-Source: ABdhPJycTpk3U34xIsrU2C4mC1XDMyVl1LN9rY+jSGueL1WvxTdiMn4JiYyoHLWp/EUXwYzBBxh+NA==
X-Received: by 2002:a05:600c:4fc6:: with SMTP id
 o6mr9597127wmq.122.1629897532547; 
 Wed, 25 Aug 2021 06:18:52 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f3sm873062wmj.28.2021.08.25.06.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 06:18:52 -0700 (PDT)
Subject: Re: [PATCH 17/19] target/ppc: Move dqua[q], drrnd[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210824142730.102421-1-luis.pires@eldorado.org.br>
 <20210824142730.102421-18-luis.pires@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fb172aee-7694-d216-710c-ca449f46015a@amsat.org>
Date: Wed, 25 Aug 2021 15:18:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824142730.102421-18-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
> dqua:   DFP Quantize
> dquaq:  DFP Quantize Quad
> drrnd:  DFP Reround
> drrndq: DFP Reround Quad
> 
> Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
> ---
>  target/ppc/dfp_helper.c             |  8 ++---
>  target/ppc/helper.h                 |  8 ++---
>  target/ppc/insn32.decode            | 18 ++++++++--
>  target/ppc/translate/dfp-impl.c.inc | 51 +++++++++++++----------------
>  target/ppc/translate/dfp-ops.c.inc  | 25 --------------
>  5 files changed, 47 insertions(+), 63 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

