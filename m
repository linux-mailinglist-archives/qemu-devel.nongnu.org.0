Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F53143F721
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 08:27:56 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgLMp-00015e-6a
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 02:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKdG-0007Gi-Bv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:40:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKcy-0001SU-Qo
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:40:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso2332204wmc.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/5Ie/rHgR8xo/4CA9AGQS5LlDzKtckhdcz0uAp8eCBU=;
 b=U/10HTA4nVDZiT5DMXlwDIl68CNVl29bC2ndTRLNfPCfhlGNMwJp2+gple0WGK2/ew
 xzFTx0F8j1eIFEK0A2qDfH2hyUzA95TnR7NOFXIeTveZb4Pd+0wiwWRmiiEcYTT0p4YQ
 ntVK6sXdHFWDA+poj7gXiivgTvrVO4pvc1M2WWbVX2cOyLRlFC2m+2VR5+yuw/ze1Fn3
 XXd0m/KO96ITVaoAlvYDgEpfUUh4LzZUKuDtOtwably29hVAw+SpVcmSe8GTYOnqP9cw
 ODRKqs16GTncNcCb6l8ie9oPLX98dr4O2MV9CzCFLO0EbpcyiGrZ701vghzKmsV3ZCSB
 G/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/5Ie/rHgR8xo/4CA9AGQS5LlDzKtckhdcz0uAp8eCBU=;
 b=rVZLhcndj+g3WluRmasRpT4KGFFD4UbwdDdsnpMP343unlREO9MLLP/wU5B+VScnG5
 ibSxckl600PK80DBPh+Yim323Q28u5njlP7Q1bO7SsfOXG8gg/ZM7M0dRRFb4lRdzQTs
 Md5VWnMLgHHu+ryomlBsoQGhTZjR4KzsN8z/asvxxzLdTudu3aapKzLnFV20Vho/1eZq
 0RbOnTya0/zY4ErH6t13oB76VEHX/FhAUWxTXVIugoG1sdTtiehyzWZrrq8W30U9WDLQ
 guzgOYslAhbgeGrwAM7X68WYpYm7sr40hzScalRn+jILc3FmHVLuDdzb85rRt+cifACb
 Me8A==
X-Gm-Message-State: AOAM533VNqE9afnmK0tlGkI7RbanBrtEfXsFfnV7lO5uL55XnotsPg+k
 YvQ0x+d+Akbp02x5ZJtRkTo=
X-Google-Smtp-Source: ABdhPJxcBenAGSEY1Ke8rIlq8h+xjnkghRi7zkDdOHxvqUNv88k5PziNZeIrWYvmwFY4pMvsDwI+cQ==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr16988538wmb.105.1635486030243; 
 Thu, 28 Oct 2021 22:40:30 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h14sm8505074wmq.34.2021.10.28.22.40.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:40:29 -0700 (PDT)
Message-ID: <c68103d0-0bbf-9083-e719-59d51c2eca1d@amsat.org>
Date: Fri, 29 Oct 2021 07:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 12/23] hw/intc/sh_intc: Move sh_intc_register() closer
 to its only user
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <65cbe7d7f1b2a8dcc2581e9620a1f94e0364c0f6.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <65cbe7d7f1b2a8dcc2581e9620a1f94e0364c0f6.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847, SPF_HELO_NONE=0.001,
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
> The sh_intc_register() function is only used at one place. Move them
> together so it's easier to see what's going on.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/intc/sh_intc.c | 60 +++++++++++++++++++++++------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

