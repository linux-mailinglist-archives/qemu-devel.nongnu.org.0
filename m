Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502DC61DC49
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:07:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMdG-0000ky-Dy; Sat, 05 Nov 2022 13:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMdF-0000kq-4R
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:06:57 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orMdD-00065p-B5
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:06:56 -0400
Received: by mail-wr1-x42d.google.com with SMTP id cl5so10853035wrb.9
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J3NiaZ0BwxU10XNGW4z0lfqGeQEUIY94y3x137DSPFA=;
 b=P/MxcNo1MG1843E+Wxw0hoLtggnv0qU1s/FTSMiwsXxfDYARUeGCm9unaszI3i0dmW
 ffMPaK63r+diBh6Xwh609CT7G7+NfeIVHfYt7nPTrmaTqdT6cISw73+LJgpkKk8eWNWZ
 SXI3w0dQcDCFK/q1OgBM0EpJ5NTaJU0ZF637/VBpIFkt93yB/DrQ1rwM36g8CtBxi3ZT
 LSDKKSrzs/3qwckzgsHiQr8Wz1FwXLR7xVaFsTGXxzHBQZ3qW5Xq7rD56o51Q/a3+IJz
 +QDRkcffu7Fv+/Z7ftTuvpAi7lXcHBgK8lOZCgWtIIaGLcHDia5u0FEaMGW2DQWyI36F
 IAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J3NiaZ0BwxU10XNGW4z0lfqGeQEUIY94y3x137DSPFA=;
 b=BQ4PmNqucXbn//g5/rxz56hmbrnj7928/Qw2Ha1acAyRk/hWlGDNQdWStBME494YmY
 Tuzf0Wb7xCRNHLRJfGQ6s1EL72iWh+kh95yfVtMCZF4zcbAPNyJfWliyGBBbSa3+n/Kk
 p9RBMKVUZo5ZBSuJhATkWI/3jp238ix1VJ3ukqCjEkaLxravrblXE5zvX9GBPQEBvYl7
 Ovq+77nWu9+/YSg9uDRfaJG+b8A0PlDEMPxAjeH1/WyuOIYOu7Rg4s6w/rUg/h7QYg41
 1OyJcKm8GPxMj/xnDu1wm/PxMbLmLrypCBKfEAXIuyJ3s24JczegzWfzS7uCkXIXJWS6
 feOw==
X-Gm-Message-State: ACrzQf2q/baUzpErpcywo4KsV8BOhh+qmANrxqbPhvkpO1FoAVkPsNRA
 g14YQKbU1fNCfjoiRrYAlRnI8IGLR0dLBg==
X-Google-Smtp-Source: AMsMyM509F7ANM8/YY7QOlVDSf/jyHT+6dV0zRL06XGxfAXtnSeJYLRiSxFgclQFEGzY0fpRrF0b3Q==
X-Received: by 2002:adf:e7c7:0:b0:236:6994:a0b4 with SMTP id
 e7-20020adfe7c7000000b002366994a0b4mr27477006wrn.610.1667668013977; 
 Sat, 05 Nov 2022 10:06:53 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a1ca401000000b003cf66a2d433sm6184427wme.33.2022.11.05.10.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Nov 2022 10:06:52 -0700 (PDT)
Message-ID: <bd26b45d-d07f-9114-ec8b-8d6a963e8eb3@linaro.org>
Date: Sat, 5 Nov 2022 18:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 20/30] qapi qdev qom: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20221104160712.3005652-1-armbru@redhat.com>
 <20221104160712.3005652-21-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104160712.3005652-21-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:07, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/qdev.json and
> qapi/qom.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/acpi/memory_hotplug.c    | 2 +-
>   hw/core/qdev.c              | 2 +-
>   hw/ppc/spapr.c              | 2 +-
>   hw/ppc/spapr_drc.c          | 3 +--
>   qom/qom-qmp-cmds.c          | 7 +------
>   stubs/qdev.c                | 6 ++----
>   tests/qtest/fuzz/qos_fuzz.c | 3 +--
>   scripts/qapi/schema.py      | 2 --
>   8 files changed, 8 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


