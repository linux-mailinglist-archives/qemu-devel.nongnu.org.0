Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32616A5A07
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:36:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX08k-0007uM-Rs; Tue, 28 Feb 2023 08:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX08g-0007o0-Eu
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:35:30 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX08e-00005C-PF
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:35:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so923678wms.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPaOzWEueAVUSJG4Y1LU86DDKz7fDP1SzuvXk3pCQog=;
 b=wblWL6+CWQIoSr3B+Qh89hgGGF3BbbU3yhxr1eXm8J20rJl3MWQuW784+KNWnainJr
 bSNsG3KFrTLmDB2U64iGB6L+rkACBxL5a8c3Utd3ULMHyt+1tpXT0+xp5eraf+3WtC+2
 DUduBTe3elijvZYH5vomAbB3mK/WV+Xyei9Leq8F71Zp4G7ny1D2S7JKgKMVhwGDA/m+
 FGh7FvLvZUjBOrmH4bot4yoApeOPwc0nfI9b7P3gN9MrwTjm9HwIFfjxPsLnMGumdIZL
 tn7pFTY8/lAfBswo0cy+DERmWK5liovHeo06fHB/L0h3YARwHSfgaNAtCViyzNdw7Uok
 r9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DPaOzWEueAVUSJG4Y1LU86DDKz7fDP1SzuvXk3pCQog=;
 b=QIdXK+uER2LAAR/gbKFymPgh4+oC1IaCa2Dakdp9d+Kt/BQA7FD3TT+s/sGXJdOEWa
 RfT2M2RdF6xbGEM454vg2VElyoSqOvbxv8Za/MpcNOxeceY+LuHjtP0AhTuD/enoxdq0
 S7Mkds8YrYtnN8WfkNx+IwkKQaSAdUBMznmoYCvqwiQOc2zoORf8EBLhzJXBRhntDt7G
 VUD7MHxWQ+ALgai39+kiUmmfekOdnILzBKS1kDH5Kb+hBqooZbjiWEODHu4daR9jPxqp
 QUgVDmisidj02yzMlJDU2rQtMphLcOfJqATKNzFSDS3HU2kbdeoqq6k3if6NhTH8lIgG
 3XYA==
X-Gm-Message-State: AO0yUKU+Dc6QAqs3EmIbmHsyIvsIiWYhfulBUeqPvcYgS0m/BZ5vujnC
 dayqO4pxwzuorcoM/4e9FLQ4a+/Rp/KFQHbB
X-Google-Smtp-Source: AK7set9NnPhpxv+EPrrzrbVAvW1mdsqCNee9WlilEl6ukvylYYdxdQWCV2J08pWosRLFLVG5wHk7Cg==
X-Received: by 2002:a05:600c:3b26:b0:3ea:f05b:50cc with SMTP id
 m38-20020a05600c3b2600b003eaf05b50ccmr2608481wms.8.1677591323708; 
 Tue, 28 Feb 2023 05:35:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c229500b003e1f2e43a1csm12306066wmf.48.2023.02.28.05.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:35:22 -0800 (PST)
Message-ID: <1002191a-dada-5cbf-31c0-f196d5773e37@linaro.org>
Date: Tue, 28 Feb 2023 14:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/4] hw/isa/piix: Housekeeping QOM names / macros
Content-Language: en-US
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230210165754.34342-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230210165754.34342-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 10/2/23 17:57, Philippe Mathieu-Daudé wrote:
> - Use QOM macros
> - Unify QOM type names

> Philippe Mathieu-Daudé (4):
>    hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
>    hw/isa/piix: Batch register QOM types using DEFINE_TYPES() macro
>    hw/isa/piix: Unify QOM type name of PIIX ISA function
>    hw/isa/piix: Unify PIIX-ISA QOM type names using qdev aliases

Ping?

