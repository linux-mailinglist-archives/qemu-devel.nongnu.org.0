Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9E8641FED
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 22:45:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1wmw-0007fw-PC; Sun, 04 Dec 2022 16:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wms-0007fS-Vj
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:44:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p1wmr-0000M6-Ai
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 16:44:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id f18so16004367wrj.5
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 13:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W4kMkGrGe0rwwzOGikB2OHLU7PJz5d4N6lDSsHUQOSI=;
 b=zxduwTfuHe+L4FwR1Qe7YW+JNlJYB4oXAKyOOfhyc2695YE3mx/zqBh10q6eco79Mh
 UaVCV8Obfyfmu/3zlkxNqeKmoxxldi8OecKuyYIU8wfyjsftU6wa/2/Hp+h7mv/RjMmY
 OXbj3uZyGmSMsx2+q+7axRbMy/ZRRWvlKvdGisExfWIPHOv0aa7rapsw7A5aABVDJKfF
 IqOVG3ker2FEuH3c8U6IU3gHjX6V1mcrm/AU0aFxThuVUKIaWJRq2mIEzeQVouXNNgv6
 6dPvO5LWEaCH5bcpAmPzGZNsKiPr3osxSLuiZuOFOJ8vqWImNNWIOEKlVNqMy64lfNpr
 YlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W4kMkGrGe0rwwzOGikB2OHLU7PJz5d4N6lDSsHUQOSI=;
 b=MyFWKPjvwcSAgg6ueqRnvP6diUbVcDIZ3P54FQ7Ja84d52sBKZk3AQN6ulwbbJK82k
 GfrsxboJGxlyo1f0uvSGjkfZolle9t2c0uis14z4EA+FV79Ucpr+XH05uoIUBTxZDRd+
 Sw5ibEfac2CRjRrFEsksGJKzHVJ5OKqs/vO7IJB6Mp9QtZbDoMD3ncS9ByabC6ZGLeoo
 ri/VhIY+03mw+NdI1YAZ+liMDK3qEK1m8mYulmYx9hrCdm6lk9HCfyx5wAsZgal5t0vC
 snRzcRfT9KwnlgAxiI749QYr1nG7TPL/tGhduKNtRGqaGYCvYw8YErwbg/NimPAO2NLj
 q6iw==
X-Gm-Message-State: ANoB5pkd122SR6MVzFti11tG1uvXz+tuFNgZctmVdCnwl+ChXCdKX5on
 JYk2rTySbbxmyoezOnfWPjXZXA==
X-Google-Smtp-Source: AA0mqf6622yLF34cHHrxfMgCNemAO6ihVAtwx9odWYZwAEnIeyDLr3uNVF+KafzMwbMjW4y10Q58ww==
X-Received: by 2002:adf:ded1:0:b0:242:673a:d9e0 with SMTP id
 i17-20020adfded1000000b00242673ad9e0mr493996wrn.134.1670190275751; 
 Sun, 04 Dec 2022 13:44:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bq8-20020a5d5a08000000b002302dc43d77sm2308752wrb.115.2022.12.04.13.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 13:44:35 -0800 (PST)
Message-ID: <4cd1cdf5-5f8c-5d6f-7f73-09457d609ef3@linaro.org>
Date: Sun, 4 Dec 2022 22:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 04/32] hw/mips/Kconfig: Track Malta's PIIX dependencies
 via Kconfig
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221204190553.3274-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221204190553.3274-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 4/12/22 20:05, Bernhard Beschow wrote:
> Tracking dependencies via Kconfig seems much cleaner.
> 
> Note that PIIX4 already depends on ACPI_PIIX4.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   configs/devices/mips-softmmu/common.mak | 2 --
>   hw/mips/Kconfig                         | 1 +
>   2 files changed, 1 insertion(+), 2 deletions(-)

Yeah, it is it that state due to the Super I/O stuff pulled by x86 :/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


