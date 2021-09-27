Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD42418E81
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:56:07 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUigQ-0008Hs-Py
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUibC-0002e4-RA; Mon, 27 Sep 2021 00:50:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUibB-0002KT-AW; Mon, 27 Sep 2021 00:50:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r23so23153254wra.6;
 Sun, 26 Sep 2021 21:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ITenSA96Ec9Zj+HHGYR/19gPh/mr/Ae0idyuW0VCYws=;
 b=MxL36Mbbb5DnpHQGj9Mz85uViULTChjKE8XxF+mvHtl7VCBteZVNLBt0Fluyav4HiD
 ZGcdld2sbxIuaDiQ6svi6925KwFZgv26vypU/y9mymuF7UJAcmSfX7FRMCVWiQQCFlDt
 Q+KKgCEbg+9KEJc0i7mOjoSk/Xe0McIoxubRnn8J5O38UpHqqRUVLcPY5FatBc2Eo52G
 aF+5XZNrz9wyfOTHB4y3ic/TgYYVRsnK7DjxpyuDVOtPEURRTueE6dLh9CDqv8+481Cv
 wv1lxHRDnAR6/nmoABS6mYUEKZxeMxd8jpk0Q8qCYyn3ZXYOcMC3F8pRhYxesfMgN7KD
 hgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ITenSA96Ec9Zj+HHGYR/19gPh/mr/Ae0idyuW0VCYws=;
 b=xs/rx3/Hk2LAYoMkSlmV7N6fyZvjYCQmzWNUuGqJO5Ta1pJnNz04t9dYA5KYyETH/t
 wJZo+RW/oBjuS+u6fQTXCRf/riUpwOSv6+m8gYs9HrTS+p+fm4IcEf1xAIIJithOywxU
 4X8T2TNRE4liurJZPJRsBdsehk2gZqTXMA7dDfDvlDqZPVbB9E0LPB10w6ObsAmTfxqH
 yex7ZqGGrQxv2AogCrXxvaPn3hMAJ6iuHtgGFJdFAdTZ2S/tgPPyBaw1ZMV7szNJu5Ks
 E0PWtrqZXTsSOwOvpjgYWqcXYkRiVTb765UUxuyZtpBFTpKVHh6Li7JH0pohrkBn38NB
 LhZA==
X-Gm-Message-State: AOAM531AsrqNwnR/o2h+PtSRs2/MR549P1L5q2tBg0+5l+iKJJaDN0yI
 aATsiBIfo00JxWtZDhHz8FE=
X-Google-Smtp-Source: ABdhPJz7NfCTIioI/aF6lr+aHM8G14NnGhv7tSThv+salmlBYjNJBY3jRBAXTyRoS5/y0IwxU+Vocw==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr7261637wmj.44.1632718239372;
 Sun, 26 Sep 2021 21:50:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id k18sm15239558wrh.68.2021.09.26.21.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 21:50:38 -0700 (PDT)
Message-ID: <fbb720e5-4695-2194-cea8-6c9c2f385a10@amsat.org>
Date: Mon, 27 Sep 2021 06:50:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/7] qemu: Split machine_ppc.py acceptance tests
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210927044808.73391-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 06:48, David Gibson wrote:
> machine_ppc.py contains tests for 3 different ppc based machine types.  It
> is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
> really accurate though, since it's really more about testing those machines
> than the CPUs.
> 
> Therefore, split it up into separate files for the separate machine types,
> and list those along with their machine types in MAINTAINERS.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  MAINTAINERS                          |  4 +-
>  tests/acceptance/machine_ppc.py      | 69 ----------------------------
>  tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>  tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>  tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>  5 files changed, 104 insertions(+), 70 deletions(-)
>  delete mode 100644 tests/acceptance/machine_ppc.py
>  create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>  create mode 100644 tests/acceptance/ppc_pseries.py
>  create mode 100644 tests/acceptance/ppc_virtex_ml507.py

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

