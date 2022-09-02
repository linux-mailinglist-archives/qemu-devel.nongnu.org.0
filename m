Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664C5AAA1A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:33:28 +0200 (CEST)
Received: from localhost ([::1]:53962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU27D-0004cR-77
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU22E-0001NT-Qy
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:28:18 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oU22D-0005Fb-3X
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:28:18 -0400
Received: by mail-qt1-x82b.google.com with SMTP id h22so952355qtu.2
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 01:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=bU6AQEL9pbcWQwDcMCcGpGJaqerBDA0M40EmJYF/pSo=;
 b=ao38R/VhvlC6yKGw8rTQhAlGnsHaXDg4zLwyVsEcQzRxMY0wau0HLuMvlJq+ERMtA4
 EiUO+gwRXZvBhu10X8gnjm1qSppI6hL1UE9xkhAtRN2Zh4sSkQvqBUScZt2+wQ3WeZJ9
 jZJYwSbcYansgNmXnJUDfGPEpUNfVe/A1fGyeaxBrVMTxQHqt09pBe4nlrGpU52AOGbm
 gEZYS7Mg2PsSAnSLDAEVVcmLp2KMyqCP4BbQx8xxagCb23Mm/5zhBbrPB5DhatRALY15
 Q1sPSrbKbevyYtDrJKv59vduexe8QsAtBEJ/nDE6IQQihs4HsSmoEM2rgSWsiKbeq2ry
 CtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bU6AQEL9pbcWQwDcMCcGpGJaqerBDA0M40EmJYF/pSo=;
 b=wv0C/Zy+6bVEISQpeNtAndHW/uWayxxOSIEtBoJk+bGiP6Blmj0N26AsmnuBVNPV3O
 wI52m2NTDQBGT+QuXS1GA9oOVlFKG/ibezlVqC6vVX5SVZYBZTNVu7PJNtQSQAOIkcLk
 Y1f+a676NQOWbwQdSARezZwDyHx8Nk12XHkeL9KmSAkxEnos9aDb4AWS0+trI3UVkSom
 QOKwE7guJhfzDDtlI4QBGB9qlptYiqNiqNz5i9Q2PiYgnCQKD2HfZ7/3VRd6QlO5D+ui
 eY149lAUtO6TSpB3OeRi06Nukwsm9oJHjyc8iZXpfFoH2xbT9I/SlnhhB6z0df3CMpUe
 4tDQ==
X-Gm-Message-State: ACgBeo1fZ+an9hiAOdU+zKpSU8ubT0cioHMviRpMnz5yens5V7HzCaDY
 KePWm5GaR0RuGnaasq6oGRANv4K8apKmOkakHCI=
X-Google-Smtp-Source: AA6agR6pV/mMIRlgGqMFO7+wJM9mXSU4xkul1RuYeOqFEE4W1MjDt1Z2FmVKlXX+oHrojd+VskCjeHxtDUMjiizpWOM=
X-Received: by 2002:a05:622a:181c:b0:344:6399:d8c0 with SMTP id
 t28-20020a05622a181c00b003446399d8c0mr27194440qtc.334.1662107295931; Fri, 02
 Sep 2022 01:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-24-bmeng.cn@gmail.com>
 <CAJ+F1CJGp_rS1zQLmH7RDP+imTKZ12yCm-cRg03M-T1XEMpGKQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CJGp_rS1zQLmH7RDP+imTKZ12yCm-cRg03M-T1XEMpGKQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 2 Sep 2022 16:28:05 +0800
Message-ID: <CAEUhbmVFY-RWDdBTHP+uW4-rbu1H-MoGyxosGmiCDfbVFA8KJw@mail.gmail.com>
Subject: Re: [PATCH 23/51] accel/qtest: Support qtest accelerator for Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, 
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82b.google.com
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

On Wed, Aug 31, 2022 at 9:50 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 24, 2022 at 2:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>>
>> Currently signal SIGIPI [=3DSIGUSR1] is used to kick the dummy CPU
>> when qtest accelerator is used. However SIGUSR1 is unsupported on
>> Windows. To support Windows, we add a QemuSemaphore CPUState::sem
>> to kick the dummy CPU instead for Windows.
>>
>> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> What if we replace signals by the semaphore on posix as well?

Yeah, with that we can make this a complete portable implementation.
Will do in v2.

>
> but lgtm,
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>>
>> ---
>>
>>  include/hw/core/cpu.h   |  1 +
>>  accel/dummy-cpus.c      | 14 ++++++++++++--
>>  softmmu/cpus.c          |  9 +++++----
>>  accel/meson.build       |  1 +
>>  accel/qtest/meson.build |  1 +
>>  5 files changed, 20 insertions(+), 6 deletions(-)
>>

Regards,
Bin

