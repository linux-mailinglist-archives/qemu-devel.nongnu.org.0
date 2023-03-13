Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F2E6B74F6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:59:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbfsO-0000yb-Tw; Mon, 13 Mar 2023 06:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbfsN-0000xK-9l
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:57:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbfsL-0003An-Ps
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:57:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id r18so10884991wrx.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678705075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wmWEEz7qynDe0evLXMfifJJC5g0zDU777gggwA6WsSU=;
 b=aRRvoNvqeuCutDYuAdYgzGp+dzmlMoa9FPz/IaqqWL+82YqErQb/H9OI30pkm1Vc3h
 RqaIv7chCXR59TVysBw0Ngln+P0yGWIguDt9ENFRbnkTYZMfg5W/K/3MlomSsd+6c1As
 WZJpIQNTwRDnfA71gDld3dRk2zP3WMr4CiJoH31QuiEuU0iPIaCQ0JvTY1YB6ZvENhDF
 cDgrmvK6iweCw+7He1zMi0TpMwwgmosFh8m2aGZpVbnYJKn7vx57OJVLW8gr0p7rw+KF
 X/HSdVe5TlHVal3R3yXKbu67fzk6oe4vC+01D8Xp7eYmbpxsMV2aNnBJ0TK4WsX2LlbN
 D7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678705075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmWEEz7qynDe0evLXMfifJJC5g0zDU777gggwA6WsSU=;
 b=L9/aD+hpP4zwtVti7OMrteHl83A3y/C70c9TSdfpFdi3xAXvnKLG06Y8BSwZO9oqAk
 SkkshywBxno0MfeFJRdgVnmWlrMgSTInkKD/Y/uhEovY/RZJhnGJMDkE+IPpP69CoQXR
 U22SUmJbDSnpuDaZq4h2d/DrZGBaag8rV6cG04vyn1x1z4pyGQf75Bv10pKC3klSurTb
 FPoPHlVYVzdKMXzAkW8GUMCyWQ6lcXP1Ije5y8JzRIVjJuanA8iJnBekpiUtfILyjKSk
 VvVnlCjnlnLKpTczV1v2aWFs5yNu8Zzp/f5UXKETE41ieedYLntKRptrtRTqdTzRjwSJ
 aQlA==
X-Gm-Message-State: AO0yUKXJZipE1yL+9gFty9RRpE1GECiGWQF80YwsD6pphfPkMZ4j0EYy
 xTJaaD1P5bVJjtPZ5ZDpqyJi3A==
X-Google-Smtp-Source: AK7set9mQzE1ghJAMmj3gMfqy2bcxGg9SO5KghlAZi/QUPZjesh0t8jdFF07Js1S4F8KEfoe1ggYdw==
X-Received: by 2002:adf:ea91:0:b0:2cf:e3d5:34d9 with SMTP id
 s17-20020adfea91000000b002cfe3d534d9mr965587wrm.55.1678705075103; 
 Mon, 13 Mar 2023 03:57:55 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b13-20020a056000054d00b002c573778432sm7674247wrf.102.2023.03.13.03.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 03:57:54 -0700 (PDT)
Message-ID: <ff54f396-a75c-325b-6b37-e1959db09c95@linaro.org>
Date: Mon, 13 Mar 2023 11:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 30/73] tests: acpi: update expected blobs
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <cover.1678237635.git.mst@redhat.com>
 <6bf2d446d470dfbd8ba45da27d10ade4616586b1.1678237635.git.mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6bf2d446d470dfbd8ba45da27d10ade4616586b1.1678237635.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 8/3/23 02:12, Michael S. Tsirkin wrote:
> From: Igor Mammedov <imammedo@redhat.com>
> 
> expected changes:
> Basically adds devices present on root bus in form:
>    Device (SXX)
>    {
>       Name (_ADR, 0xYYYYYYYY)  // _ADR: Address
>    }
> 
> On top of that For q35.noacpihp, all ACPI PCI hotplug
> AML is removed and _OSC get native hotplug enabled:
> 
>                         CreateDWordField (Arg3, 0x04, CDW2)
>                         CreateDWordField (Arg3, 0x08, CDW3)
>                         Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>    -                    Local0 &= 0x1E
>    +                    Local0 &= 0x1F
>                         If ((Arg1 != One))
>                         {
>                             CDW1 |= 0x08
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Message-Id: <20230302161543.286002-5-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Better safe than sorry! :P

> ---
>   tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>   tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3081 -> 3115 bytes
>   tests/data/acpi/q35/DSDT.noacpihp           | Bin 8252 -> 7932 bytes
>   3 files changed, 2 deletions(-)


