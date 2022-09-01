Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CC15AA118
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 22:56:52 +0200 (CEST)
Received: from localhost ([::1]:44712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrF5-0001ZQ-So
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 16:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrDN-00082m-Pr
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:55:05 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oTrDI-0000dE-LI
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 16:55:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id f12so18005357plb.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=t/Lj85Qn3bv6YBPxNRaNDXx9z/2pAEG2ZyUv9DS7vpQ=;
 b=DRITVjntauVZ/TqEIH0+aGFnMfitsHp3F3XJOOcLv2RCheN2PimPwEgWNk3Kz/4HrQ
 JoaNloAzPWIPiv9eZKN+UDWwduoJ1WmTVhkJFBFO1Ui6riYO/2wpHgJnijiproP9GOK4
 pucSEGpq5cPCG3rr0TfysjBJN2BEYG1y8/4CLxuJIA0Y04mVzBzROfTX2skyCODixuF4
 kZ38bl2C/zRSAKe+F9ezDsxL7BdEhai6XPhOX3N7nNyrBdab+3qLCAwkUkGCsSlL08WU
 6qcv1okjujs2en7pZvfO+NnDSAU1oEV7ZFlBnnt8/c9riPwGxgu4hVoNoLl0L6aOPVIZ
 KKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=t/Lj85Qn3bv6YBPxNRaNDXx9z/2pAEG2ZyUv9DS7vpQ=;
 b=IntnzelPcH517Dr4nEg8rhqKBhla77/VdXJdtEf7VN82R0eTrglh96aVl2JvfbHmkp
 /XtB7bQybuz6DZH25dvFWI4H3GoFI58lFJGeTlNVi+m1XJrFVaAofm9kalAFEghNz45h
 QG62HpSq2G5PeFiAHpKnFQsMxGj07lwEdvxseN/Zy1RK2uAef7IwDgjRASKQvPi4tmdQ
 RHxhKqe8jlFMdGZYgtUFa09aGAMb76IDnejxKQidZrctU1v1xXjFTr/J4Gu2I7u0XMU4
 uNLeUIGxv+dT9OAWOcFJLaRlGqgg2z4DdOx6qQPuwzW4gaIIZH/OZZ5xgvY7qKr33smM
 Inuw==
X-Gm-Message-State: ACgBeo0Vm1u1ML4sj7yJ0dzTXP6rFRTsVGU2eHfXRTs6w+qvpgprwP+V
 PZwiugHNg++Zk1Ir+kd0tcg=
X-Google-Smtp-Source: AA6agR6PONleSOMlBRHQC3jrbdbnVw/K+BWRWWDj0F81iMjax46u5YdkPGnFoE/T2RKNBSWaxwmHcA==
X-Received: by 2002:a17:902:bc84:b0:174:505b:2d67 with SMTP id
 bb4-20020a170902bc8400b00174505b2d67mr28643067plb.33.1662065699201; 
 Thu, 01 Sep 2022 13:54:59 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a654106000000b0042b80a27ac2sm5701940pgp.75.2022.09.01.13.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 13:54:58 -0700 (PDT)
Message-ID: <5a94f74c-bb18-fa4a-4128-35afedb493f6@amsat.org>
Date: Thu, 1 Sep 2022 22:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 25/42] hw/isa/piix4: Move pci_ide_create_devs() call to
 board code
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-26-shentey@gmail.com>
In-Reply-To: <20220901162613.6939-26-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/9/22 18:25, Bernhard Beschow wrote:
> For the VIA south bridges there was a comment to have the call in board code.
> Move it there for PIIX4 as well for consistency.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c  |  1 -
>   hw/mips/malta.c | 10 ++++++----
>   2 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

