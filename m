Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EF32BA62
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 21:36:12 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHYE7-0001Fy-1C
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 15:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHYBO-0007Dx-Pc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:33:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lHYBM-00061n-Hj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 15:33:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id u14so25178900wri.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 12:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MVSwh+Xusvo5kNnlZiAYV0nY5+h/9ef41h95QX9GlTQ=;
 b=kp6OjeicOHNxqwMpIevlGtQZg8J/fDDUhw1Ji/Fkj3c6WRkPANMz1m+n0DshXh2ddd
 /gw3GMUyE/NOuNivRyN6P5yTapZWJ7UgyA+ZEicNoIy2fP0CGDEskUj7ONjhnQM4IK1R
 nKyY9AC6bS0JFo687u1SAO9C/YWM/bHp15tFpeBz3Qtdw6Of0fSOf8ZeKhfz4Y0KHEZy
 nDSaWT9F3k6L+fM8lWv4K905zH5T+LnrbvlghVM9dbrOSM0LOeIU7y0Z2wGdtjs4RKfr
 ltpxRHrd8e7whw0o50gxnPti1Dt8V4CUZb/rVyirlqvrVo3Ll2cgdeLV7olMYL80unAv
 3LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MVSwh+Xusvo5kNnlZiAYV0nY5+h/9ef41h95QX9GlTQ=;
 b=XK0r8x/y7NWFdehRIc5zLPU8U1zBzP79k7s9P2KjL7q9zpIYwNVZc2u/sQFTJuZTHf
 jYUG3IWD8TRKhIvc9/gRt+soKThgsoPncFD0k1xuP/+RKscJOxvM5qJUh5R27ksBFZ4a
 b2xXfjY5BVcw2/3gusThFT+nRniMP1j0C7mgT4AC433RzQkey5Gse39QDgZzRj2xhRFY
 L1MlQr0Bt+TATMh2Fk/t2zZWxZTiNF1lrrswDiiTBtIEl2WxeoOob9tyX8QERovId2m6
 l5Y0A75oTBUxqh7usPgplVP9w7HRo/mov3+qxngCRlXhX3s5xciEmdysjRRNQ1g3u5f3
 rO+w==
X-Gm-Message-State: AOAM533MxzbO4Lq99s8Zr8/qNIYyM5OqMQMvGGu+YGpefVSGPAKCAERT
 cCWWOvv9CJoPK/3T8boo/gidFah1mKliYg==
X-Google-Smtp-Source: ABdhPJyjJe84c0y3vxqQPEsFHPyQXFI13ad9+H7e47v4o2/rvOO8vt0RUnQsZdAlarUjFJHFxgRb/g==
X-Received: by 2002:a5d:6610:: with SMTP id n16mr390473wru.399.1614803598513; 
 Wed, 03 Mar 2021 12:33:18 -0800 (PST)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl. [89.67.26.161])
 by smtp.gmail.com with ESMTPSA id
 p18sm27358033wro.18.2021.03.03.12.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 12:33:17 -0800 (PST)
Subject: Re: [PATCH] arm: bump amount of PMU counters to pass SBSA ACS
To: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>
References: <20210303151634.3421880-1-marcin.juszkiewicz@linaro.org>
 <20210303174849.GF1664@vanye>
 <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
Message-ID: <95e5a34b-1325-8eb3-25ca-b3e63b4e67a1@linaro.org>
Date: Wed, 3 Mar 2021 21:33:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-KFF_An50h8JKy68_Y3J4j=kQCOFyGoySKyh53E7KGYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

W dniu 03.03.2021 o 19:06, Peter Maydell pisze:
> On Wed, 3 Mar 2021 at 17:48, Leif Lindholm <leif@nuviainc.com> wrote:
>> It would be good if we could get 6.0 closer to SBSA compliance.
> 
> How far away are we at the moment ?

Hard to tell me how many of those things are missing in QEMU and how 
many in EDK2 we use as firmware.

SBSA-ACS failures:

GIC ITS is missing (Shashi Mallela works on it):

  102 : If PCIe, then GIC implements ITS  : Result:  --FAIL-- 1
  104 : GIC Maintenance Interrupt         : Result:  --FAIL-- 1


System timers are not present in GTDT so few more tests are not run:

  206 : SYS Timer if PE Timer not ON      : Result:  --FAIL-- 1
        PE Timers are not always-on.
  207 : CNTCTLBase & CNTBaseN access      : Result:  -SKIPPED- 1
        No System timers are defined
  505 : Wake from System Timer Interrupt  : Result:  -SKIPPED- 1
        No system timers implemented


There is no SMMU present so SMMU and IO virtualization tests are not 
run. This one is probably related:

  605 : Memory Access to Un-Populated addr: Result:  --FAIL-- 1
        Memory access check fails at address = 0x104C0000


