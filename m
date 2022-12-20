Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74224651E83
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YzO-0003tV-Sy; Tue, 20 Dec 2022 04:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YzM-0003sq-EN
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:32:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7YzK-0002Wl-1J
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:32:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h11so11097542wrw.13
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 01:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rxv5T3YNaIXJXWUYsZ8FH2rXMjErvcLXb76cSywTPFk=;
 b=E2dncYPk1AOqSGUH+ifOxk/J/LK0BnEdMWYUT11rQtGTXh+txdXxjYpuQbYZaJaNNO
 Llt8d/VqT4KMr7ZbyGm2X6qyncjc53qWqdzc/QilCn3wc+nPu3QoIvwEaQGbum4yQ58o
 QTCzh1iwg+YmaU59harzPkFYiyMuuwN0SRRLq2cigT3DUJF8wF8t5yOd4S5w5vd8bIZ9
 iQZ2QGPNOv0YRPQnZRFzrVNC4UOnCt7fscJvEZa4vcoEWE4R9B01fiHAqVdhQyi3PYZ3
 h95jW8z9t8qCes7Eu980FVOHu9cccWL+0llDcF7a2o0+569LWouQM8Lb/NAlvv2D1sXI
 Q7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rxv5T3YNaIXJXWUYsZ8FH2rXMjErvcLXb76cSywTPFk=;
 b=JYdzdHZLthZE3ZguS+mkyY9Wlz4wbaRD8cHaXviqeuqStnOWWhtR5LjYy32cckh23r
 vqkJ7o4BzAsO39u8xnUQwr27iA0v+0Fz3EE1g0NzC1Y69iAOnywuEnw0qjiE4XLomzke
 tB/RXE1k8BQ6CcYbJaWIQR+AUEeuHq3TiBR9LO13uRXqzWOTu9/CnMOJqG71ZD78tvpf
 GiKdyDYSSJqxfK3CVDDtq0THT5pnNThgBrjL4pdBHj6VR82lXWHu02qzffdWwBSmtAfP
 aHyxrVBPqSEM58WbdMC25ps1ddJEZSrnaCWSyuyY/ggPRA2lJWYMg+vyR7lSP3OKQp24
 ZR+A==
X-Gm-Message-State: ANoB5pm3/ICkjnhLGMS+ihEawdvfr53r3q7maCLiRpb96d3gDQeYMvWW
 /DcpApqPNuPYFBEdEc8bT5bPpw==
X-Google-Smtp-Source: AA0mqf6fFe9pwUVyMuKdi+06xFP6nWt1cynXuk5W/w0M5bPKhLJYMEZNNZCQPdmuQ4KvNjRnwkRqiQ==
X-Received: by 2002:a5d:4e4b:0:b0:242:67f2:9d68 with SMTP id
 r11-20020a5d4e4b000000b0024267f29d68mr28197863wrt.34.1671528758164; 
 Tue, 20 Dec 2022 01:32:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 cl4-20020a5d5f04000000b00242209dd1ffsm12367136wrb.41.2022.12.20.01.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 01:32:37 -0800 (PST)
Message-ID: <a6606bd9-08b6-0884-ab32-f5f30cc3ce4d@linaro.org>
Date: Tue, 20 Dec 2022 10:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Huacai Chen
 <chenhuacai@kernel.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz <groug@kaod.org>,
 Song Gao <gaosong@loongson.cn>
References: <20221219211034.70491-1-philmd@linaro.org>
 <20221219211034.70491-3-philmd@linaro.org>
 <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e1f13a16-e6a5-a484-8e6d-722b60dbaefb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/12/22 00:58, Richard Henderson wrote:
> On 12/19/22 13:10, Philippe Mathieu-Daudé wrote:
>> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
>> user-mode builds") we don't generate the "qapi-commands-machine.h"
>> header in a user-emulation-only build.
>>
>> Extract the QMP functions from cpu.c (which is always compiled) to
>> the new 'cpu-monitor.c' unit (which is only compiled when system
>> emulation is selected).
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   target/loongarch/cpu-monitor.c | 37 ++++++++++++++++++++++++++++++++++
>>   target/loongarch/cpu.c         | 27 -------------------------
>>   target/loongarch/meson.build   |  1 +
>>   3 files changed, 38 insertions(+), 27 deletions(-)
>>   create mode 100644 target/loongarch/cpu-monitor.c
> 
> Why cpu-monitor.c and not monitor.c like for target/arm/?

I figured later 'monitor.c' was simpler and renamed the other targets
but forgot to rename this one :/

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!


