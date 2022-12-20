Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCF3652654
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7g1d-0008QF-UT; Tue, 20 Dec 2022 12:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7g1a-0008Pm-CG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:03:30 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7g1O-0001JG-TM
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 12:03:26 -0500
Received: by mail-ej1-x62e.google.com with SMTP id u19so30688808ejm.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nh9tDA0NkQlko8fr1f4T0aUymgHoY0VFk0CzYUC1Nfc=;
 b=IhwFvz9MT7nYfkuxNSTEOU3JvtETlMygdtUipt4S9Gnuu02PZA5G3NNmc+sjD80Wrb
 6OckT3z/8xPsJ7QO4OWH4YW4fSMEiot9MPol5kP95fKpEfcp4tywC+wPPIzoEceOS+D4
 5h0VbUGthm3glJQoGHLD7RKsNny+eGfKdOiInx6/9PmHe4QisON2jAuBobxScmFMUoll
 tZnYfe3+8DfdK4thL4DfIq2ObiwdE21pVYLFZ2m+SP6NK5FtrLsXo/RCCIvBFpjKCRIu
 bUfIyjM+UBMuQECEl/tmZb1H/4N/q09P3DoZlJtMGCl9bUz9DAZiV4YejmIWs7ogL6iA
 g0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nh9tDA0NkQlko8fr1f4T0aUymgHoY0VFk0CzYUC1Nfc=;
 b=gFt+7w1mno/QGaD23B7dOkCOfHDssPPHJnv5cKOzxoQKX58U4Qy3Q1/TYwQ2lL7g18
 L4TaD3x1FTH7he/DFDjQDvuwuXKPv3VwGpROakTVCsOO4nPApMADjPPod8tedndNPY5i
 u0pf9i7UiCwdsx90i6asBxgBE4ql+8iNQcZ/cBp+5DdIESu0pWAzI8tVIiqUaIBxyVJz
 Xi6j6hXvWaHtSai6p3GkiQRFriytPExIocT138HBuKIPJK3ntrvDr26ekDhFY483MTET
 QQfEu7s55d30juE5D2S13vuuYu9Cd+lTflReSFmnwUOgh/I3xxrSg5xcPYmXD6r8xc4J
 WjLw==
X-Gm-Message-State: ANoB5pkIv+yRsf1ifF4DDHQ8ppVG7XYYAHnTiYrnFHunZcOR+o+uLnqj
 s9qtvwpl35SNKt3/dFUuaqXp4SJzNZBWRAuJQXc=
X-Google-Smtp-Source: AA0mqf4RjPAk45hM+G8cvLGCv8K1SVpkcS9hULUaEMSF7f5TfwzEYmlVcm2qpLZQlCTnpVCt+oLitA==
X-Received: by 2002:a5d:4cd2:0:b0:242:368:7665 with SMTP id
 c18-20020a5d4cd2000000b0024203687665mr28620900wrt.60.1671554123681; 
 Tue, 20 Dec 2022 08:35:23 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e34-20020a5d5962000000b00267e918d1ecsm1452355wri.24.2022.12.20.08.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 08:35:23 -0800 (PST)
Message-ID: <6773c48e-9dc1-d74d-8ed6-7d16efb5ae41@linaro.org>
Date: Tue, 20 Dec 2022 17:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 12/18] ui: Move more HMP commands from monitor to ui/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-13-armbru@redhat.com>
 <cd8d91b0-b639-b7e5-ba62-f9b11fe5567b@linaro.org>
 <87v8m68fcr.fsf@pond.sub.org>
 <0d5454ae-290e-b767-d633-f6dc7ff6d438@linaro.org>
 <871qou6qk4.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qou6qk4.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 16:30, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 20/12/22 12:49, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> On 20/12/22 10:06, Markus Armbruster wrote:
>>>>> This moves these commands from MAINTAINERS section "Human
>>>>> Monitor (HMP)" to "Graphics".
>>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>>> ---
>>>>>     include/monitor/hmp.h |  2 ++
>>>>>     monitor/misc.c        | 66 -------------------------------------------
>>>>>     ui/ui-hmp-cmds.c      | 66 +++++++++++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 68 insertions(+), 66 deletions(-)
>>>>
>>>> You forgot to move hmp_sendkey() along.
>>>
>>> Moved in the previous patch.
>>
>> Oops :)
>>
>>> If I get your R-by, I'll squash the two patches together.
>>
>> Hmm not needed, the previous patch is already big enough.
> 
> Yes, but it's just code motion, and the split between the two parts
> feels arbitrary.  It came to be by accident: I missed a bunch of HMP
> commands hiding in yet another file :)

I see, OK then.

