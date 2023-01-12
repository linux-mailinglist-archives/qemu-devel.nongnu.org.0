Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A466726B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:41:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwt0-0002mL-Od; Thu, 12 Jan 2023 07:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwsx-0002jX-9q
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:40:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwsv-0003Ng-PQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:40:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso14924209wms.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y/ZvNsOw5dmGb0G+f2WjSE6twQaM5/x5OhlNaFY/PCE=;
 b=bJqYTtMGOChAjSYwfWOKM2d+bDT7eMVHiwFq+p8w3gvvx60JnS7noSewf1BhjsoVju
 zfmg0XjRccGS6MI98GwFmvhJXtr3XtmHTGkVA+p89z4p73ndTmP7Y4Dfhtm06z2Mxdf5
 qMBwTIYiRHto6ZPmXUzFRNeKpI3ZJa4+DP1xm5UGsLMo2ekHczBq7BU7SkAdfWbjsl8f
 jenuohk4s0TwsZ3WLv3CKV6+9GWJXlnAHVv/tBnksZCsbHpfffsu/HFTv0ORUkM/1d1t
 Z1EO9rsH4YL+/xZpeQFxq0hhnDVar4HMvsbEfSV4ucclAG/hL6FYEFS7f/NJMLV54jes
 MVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y/ZvNsOw5dmGb0G+f2WjSE6twQaM5/x5OhlNaFY/PCE=;
 b=GIrK2ie6MgC7sLfyOo90MqGnEBvM9t8XCTTbPi3KATnI8WVPRlnCumfxpWSMVnI/Uq
 aevfo/8BdncYBuZLMeJhvIABsfX4MoOfGYyjHztLgfkI+g2xZqVdFJRos3LOnobQ/QBF
 czgxmORamzBR5BCqL/fUGgravuqDHTC7BJrIAJb1IFfiqdOXy8j/fbZhKFoQ82AFam+a
 cdvZPbNIxm+u0cBRtXg78/Zsx3FuRr/zklj+kSKleq2yfZfZVOvyv/yQxVoi6DLK26Gl
 WZdHPVUboD6Zb/sbzMz9s9YfEy5ZpJe1jVfjHAofGtO3WKJq3kGBYEUkdRKDs5R/lcbI
 KRPQ==
X-Gm-Message-State: AFqh2ko7zZeMYThRoU2QxyJTkXfoCgcKraTbuLJhUmV+W6LARbngmpTk
 rmxbaXhQhX/wmrfIsFeYg4WG4A==
X-Google-Smtp-Source: AMrXdXuSxMyqezQr4+QvYMf1wbd6pTyGXIJc5jWo/O4SOz3mMxNFWRPNuIGKZceePQqKfg4ANTmaZw==
X-Received: by 2002:a05:600c:a51:b0:3d2:3376:6f38 with SMTP id
 c17-20020a05600c0a5100b003d233766f38mr54136219wmq.20.1673527244313; 
 Thu, 12 Jan 2023 04:40:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm19175286wmq.9.2023.01.12.04.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:40:43 -0800 (PST)
Message-ID: <f6648e27-1ce3-ddd7-4672-9975d8115fcb@linaro.org>
Date: Thu, 12 Jan 2023 13:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 10/33] hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 18:23, Bernhard Beschow wrote:
> Having an i8259 proxy allows for ISA PICs to be created and wired up in
> southbridges. This is especially interesting for PIIX3 for two reasons:
> First, the southbridge doesn't need to care about the virtualization
> technology used (KVM, TCG, Xen) due to in-IRQs (where devices get
> attached) and out-IRQs (which will trigger the IRQs of the respective
> virtualization technology) are separated. Second, since the in-IRQs are
> populated with fully initialized qemu_irq's, they can already be wired
> up inside PIIX3.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/intc/i8259.h | 18 ++++++++++++++++++
>   hw/intc/i8259.c         | 27 +++++++++++++++++++++++++++
>   2 files changed, 45 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


