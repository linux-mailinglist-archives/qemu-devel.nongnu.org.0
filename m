Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E327832DD64
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:53:02 +0100 (CET)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHwq5-0001hu-Vo
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwkj-00052X-OW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:47:29 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwki-00046A-BW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:47:29 -0500
Received: by mail-wm1-x32d.google.com with SMTP id n22so29848wmc.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 14:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+rbFGeGnJOS4ij/3yVMBtzAvOdlTMdgt0UsBysLLGdI=;
 b=FWpgcEYQHFQQVHGW/pLsZXvKT07QQ2I1AhELUpg7xJC3z+l7gKLH3QhT8nAN3DgCOP
 pBFe2TW3gnfp4CRmtpk9w/lbYz2nV9hcq1Pa56ugFKDl/9/mjzSf1ALdOrMv7pjI/3kX
 lx1YyfRu05pz7opZLqFJ4kT5+eHgvxYzDpTsdNlNhDXT5HeJmbOaprBKD5QXnV1K8HnW
 eNipaKMZNdOHffwDPb6ij3A4kKlTI6LTttaUj1RGREvAUf7dIx8iJ42DnyoPq+RgAIsX
 PZ4mEOFWqs8KZq3s8GytRiVEfOlmpNdsc8wnFIiffysRMdo3r9MgT0mVoaxMDbCK152I
 B0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+rbFGeGnJOS4ij/3yVMBtzAvOdlTMdgt0UsBysLLGdI=;
 b=K8Uaa9JEVZMZrcOg/a6u1qIrOgHRVJZGiTOixBnJSg/fMj2HT+8/xPk1QLeU/VGzqN
 YCneRbqPzFhbC5xFrX5IOVPJ/Z2hPuO/eVNUpooUSORGbcJ5/dGLWsGjazyRTz5kv9Hd
 IJusUHBB3fi+Oxzd/uBOLvJUP5NWd7hyd60ouFYeOYmlQmzduPFipRhmdBuzrHIxDHcx
 vYCtE653uBOrBovGO9+n0YcVBAelO4/j0WYwN9WjwMZ14M5PQKt1uFWzpS/SePUZ2B1n
 gaKSLXEnr8kopTCLtzfBC2yBYlgyBAvQ+LV1aCvEKUVd+IDXEoy3ZNyatxfLLpDbgWbd
 Zncg==
X-Gm-Message-State: AOAM533bwfLrvPHmFaohglnTkagAKWiTgCTPuYt6hd/uxv9rt1uMBTWy
 GVCGuDMUxGhjTNVoOKC+7rA=
X-Google-Smtp-Source: ABdhPJy3r0pNP6eXibuVZQ3h7/OJugOcoLGDjXfctqfgrMHmOUei5zZ8Q4q4AP9730g47bbl4QqIOA==
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr5956058wmo.8.1614898046896; 
 Thu, 04 Mar 2021 14:47:26 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm1138995wru.95.2021.03.04.14.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 14:47:26 -0800 (PST)
Subject: Re: [PATCH v3 3/5] m68k: add an interrupt controller
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210304220104.2574112-1-laurent@vivier.eu>
 <20210304220104.2574112-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb256430-3ddc-0965-0aad-212f69b62ea5@amsat.org>
Date: Thu, 4 Mar 2021 23:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304220104.2574112-4-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 11:01 PM, Laurent Vivier wrote:
> A (generic) copy of the GLUE device we already have for q800 to use with
> the m68k-virt machine.
> The q800 one would disappear in the future as q800 uses actually the djMEMC
> controller.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/hw/intc/m68k_irqc.h |  41 +++++++++++++
>  hw/intc/m68k_irqc.c         | 119 ++++++++++++++++++++++++++++++++++++
>  hw/intc/Kconfig             |   3 +
>  hw/intc/meson.build         |   1 +
>  4 files changed, 164 insertions(+)
>  create mode 100644 include/hw/intc/m68k_irqc.h
>  create mode 100644 hw/intc/m68k_irqc.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

