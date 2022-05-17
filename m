Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208A52A021
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:14:32 +0200 (CEST)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqv9q-0007Ap-Vx
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nqv78-0005Lg-9p; Tue, 17 May 2022 07:11:42 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nqv76-0006Zg-JB; Tue, 17 May 2022 07:11:41 -0400
Received: by mail-ej1-x632.google.com with SMTP id i19so33946584eja.11;
 Tue, 17 May 2022 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=U2ekewmZuR009TTZCxacJubRHTKtnotb/GkgBBPv5TM=;
 b=gfEPhSL3CKBV+Cz1+VZ5M+IFwlSuxrfpKNzm/h40EMjOBysowX/iYaVcxQ1ZaL8BFq
 7KeN2sKN1zLyh39Yld5MvDwkpODznU+jSKrFLojW7cb0DzUIQpMrSEacK9xcMSUaHuWA
 xJpUlHq7xLemXfBmSL79a03ScZLnGrJebzp/QiMCBYrveoeoNg+wvhX9KHC7Fo1vJ0hq
 O7K89fYGK56LwNtXFMrA8L/9Pg8nx7oqP5OwEoRtjDBtkz9mVvm6I8jnmj6uznbjHvWM
 EPKodJEH8k5pWFIQOEWnkfUwE8uFkvPf3iCNgEbySoDxjscHK8f1aD83c0rkrTMeLqw7
 gpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=U2ekewmZuR009TTZCxacJubRHTKtnotb/GkgBBPv5TM=;
 b=Jw0xLUvusYWX1NzmnCjayIDZ8UT46gl3LkyX6aEBH6C3WHkWZPOTO+fDtSETYrAD2R
 AsvudqSPziaCtUNdmIGHfqXN9egq8FDLaAW+4IjGGY0AUOw0n50YoQH5UHtfDenQvS0N
 2JKdfqYuFFHxYiU+BwpWF+GJuAjBH01euMtku1048Oaj1RkRNdgKStAg/E5a0QqskWtZ
 0PidhwKmwIOEFhsuimF44n0hXh68xjkKw3qWfXhJ46iHGhQQwDH/MB26/fYT15nKbtuY
 e2bOvGfWIuzJ1zKkrjnNzuJHT4bsFAu2f2AiS6rw42/5SihlLAPC23MqKEVukuZtihcN
 ZEpg==
X-Gm-Message-State: AOAM530HTV8S/5Jigq762ai8mao0yyXSqicOmiwP1CwDtdHdnvevnuyO
 4/HDrnONoWAszFilJcJeSeo=
X-Google-Smtp-Source: ABdhPJx+DNmKFJ1y9wGdmSXY3nvIWoIRv/cLJ5zpi/1FCyhy34hZaojY8tgP3+xFhJw8DYitoLWaPg==
X-Received: by 2002:a17:907:3e2a:b0:6f4:d700:2e65 with SMTP id
 hp42-20020a1709073e2a00b006f4d7002e65mr19726037ejc.624.1652785896770; 
 Tue, 17 May 2022 04:11:36 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-163-155.77.183.pool.telefonica.de.
 [77.183.163.155]) by smtp.gmail.com with ESMTPSA id
 dt2-20020a170906b78200b006f4c24495e7sm916739ejb.33.2022.05.17.04.11.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 May 2022 04:11:36 -0700 (PDT)
Date: Tue, 17 May 2022 11:11:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
CC: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH RESEND 0/2] Resolve some redundant property accessors
In-Reply-To: <CAKmqyKP52UZkjez9YyToZqWbOKyJ_xgAZK0NTpE--Z=DRMea=A@mail.gmail.com>
References: <20220301225220.239065-1-shentey@gmail.com>
 <CAKmqyKP52UZkjez9YyToZqWbOKyJ_xgAZK0NTpE--Z=DRMea=A@mail.gmail.com>
Message-ID: <ED86B551-E7CF-4241-B67C-CFD2DE35EBDE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 17=2E Mai 2022 03:41:51 UTC schrieb Alistair Francis <alistair23@gmail=
=2Ecom>:
>On Wed, Mar 2, 2022 at 8:54 AM Bernhard Beschow <shentey@gmail=2Ecom> wro=
te:
>>
>> No changes=2E Just also CC'ed to qemu-trivial=2E
>>
>> The QOM API already provides appropriate accessors, so reuse them=2E
>>
>> Testing done:
>>
>>   :$ make check
>>   Ok:                 570
>>   Expected Fail:      0
>>   Fail:               0
>>   Unexpected Pass:    0
>>   Skipped:            178
>>   Timeout:            0
>>
>>
>> Bernhard Beschow (2):
>>   hw/vfio/pci-quirks: Resolve redundant property getters
>>   hw/riscv/sifive_u: Resolve redundant property accessors
>
>Thanks!
>
>Applied to riscv-to-apply=2Enext

Finally :)

Thanks,
Bernhard

>
>Alistair
>
>>
>>  hw/riscv/sifive_u=2Ec  | 24 ++++--------------------
>>  hw/vfio/pci-quirks=2Ec | 34 +++++++++-------------------------
>>  2 files changed, 13 insertions(+), 45 deletions(-)
>>
>> --
>> 2=2E35=2E1
>>
>>


