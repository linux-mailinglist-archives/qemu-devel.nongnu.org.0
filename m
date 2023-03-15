Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563A86BAF27
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:23:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcPDf-0002WL-24; Wed, 15 Mar 2023 07:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPDc-0002Ve-Uk
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:22:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPDb-0007i9-Eo
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:22:56 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r18so16975568wrx.1
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678879373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2IBJve6AVokPgpEOEtDRyTXRYenVXGxE3k6sego2rNs=;
 b=RWUtHdWbAOr7qOVCk+KXFLLqIQ087CDPjbeRKzXaB489cD7c2ts7iTr6LXPAdA2FK/
 +OT/jCFMl5ewResJ9jW19ElJgRa3MU+NZbN099ggmdutc5BnlSCvqBWnkCHTTCPB3379
 RXCXeM5+NGApm4Bja+LwoYd3au8/jaNs4KZ9ETE6wv9OKiC98VOKfxkbYlPKjEtQE9wa
 jKVgUEc14F6cdSH86cmAT46aKJsqkBrzQ4YaE8UCTSxmIREGrsAzyEt+n8L0XkaQNWpd
 FQQ3qLS8i3pUm6C7aozJR4TiU01dfJAQdsCgdkbH9xGaVoBZpreKTI+AvTJHKS+b3Hsk
 tBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678879373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2IBJve6AVokPgpEOEtDRyTXRYenVXGxE3k6sego2rNs=;
 b=WkpmbFKTyt6gkHhOVwv5pUe+JcJyvNUVHoUCFwdaWCgW5mPb/3aTOcGiSNYUs4k2Qn
 S7poEvmwp7S19YCx579tzJFy3SGA0llNhpAA41sEBR0ra/OVefpy7Yapl30di12ZY4Jg
 uagW0v1FBiwlPVZt2ZRtU0AxF1kpXfvf92GqXJZiPTJ5n3OGQgsCeSZMhvqE03F1NjAI
 P7AmzKHap8MB+MKSfhxA/uFigOwCVqSjFwSaoszkvxzDQqNJ5twYhqFb62KXSD81S8sB
 JD42QlNRAXx9px8KngxSMcX4hJKo4FZ/FUzEeyK5NSDiYm8D/x90awwGIdAxV6HIxb/F
 U/ew==
X-Gm-Message-State: AO0yUKX04ryvL1uWPmpxIc2c5XZAdjmSx1/qB0wwoKHCQLJgGLYuE8Ss
 m4uqHNXNuU24FMegRjNCkyNtoKvo4lbavfxmfTZmJA==
X-Google-Smtp-Source: AK7set/4xUAzrORFbMBMxMr+CpehtnRhF90ds8wQi9ZHN06dWqymyVG3MwmDIKwVhUSYbjbPoh4w2A==
X-Received: by 2002:a5d:63c3:0:b0:2cf:e868:f789 with SMTP id
 c3-20020a5d63c3000000b002cfe868f789mr1553957wrw.48.1678879373627; 
 Wed, 15 Mar 2023 04:22:53 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l10-20020a5d560a000000b002cfeffb442bsm2498406wrv.57.2023.03.15.04.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 04:22:53 -0700 (PDT)
Message-ID: <5ff09b4a-936f-8c69-2f13-f8c320e35f34@linaro.org>
Date: Wed, 15 Mar 2023 12:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/3] qapi: Simplify enum generation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230315111304.21692-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230315111304.21692-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 15/3/23 12:13, Philippe Mathieu-Daudé wrote:
> QAPI generating enum count as part of the enum forces handling
> impossible switch cases. Modify qapi/types.py to generate the
> enum count as a definition.
> Do not try to cover the unreachable 'default' case.
> Clean files covering unreachable foo__MAX case.
> 
> Since v1:
> - Update documentation (Markus)
> - Do not generate empty enums (Markus)
> - Collect R-b tags
> 
> Philippe Mathieu-Daudé (3):
>    scripts/git.orderfile: Display QAPI script changes before schema ones
>    qapi: Do not generate empty enum

Wrong branch... v3 coming.

