Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716E3F7C8A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 21:04:58 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIyCm-0000cI-Om
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 15:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mIyBd-0007tV-Ae
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:03:45 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:43858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mindentropy@gmail.com>)
 id 1mIyBb-0007S2-Rn
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 15:03:45 -0400
Received: by mail-vk1-xa32.google.com with SMTP id l21so116454vkd.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 12:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rEOIP7NvasKyMZ58XqbiVjgmhjzstvrTlRHAQlJIb1w=;
 b=n5W3g/sAalMo2UGls/OvLs6VvIe8a6uNFdWIJpmYuGvzu3Sf9XsTu0FQ9nhZwnuSOR
 6gpg7zfFeyCm8blJ8XCNPdcm7ZDTp9vjbgB/RKqSTiej6Q02xBEv4tYjX9gBgwTkRrf6
 0Usp0tT9empYoBHAmJIybc+LaUmdEtrjsYj1sVJWc6lB+Et9t4L27UE9a9RHmxSSPqWB
 UbM0T2ON9cm4ySL7fmVwXL9f0IvZYlvbJ2bgnr9PLtrfpjaOGxo0+EcVha9AJUBKqPn7
 wzah1PWF+khi/Ngn2xHrJaCLNWwI5eOvbiPa2l/FexkJeYypFTA/p9RpTUQYCB5L5e5B
 7X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rEOIP7NvasKyMZ58XqbiVjgmhjzstvrTlRHAQlJIb1w=;
 b=UVKNPsli4m9R58pijHeb+cKxb9O/3hXv4rHaSvPtcVPPyUBJjvqFTzK8/PyI/jvTWa
 iuGBBb/ZhyadSrsMXapAiCyaIITnyMqDufV5v8HZaf6hyDJ/uicAUq4dbb8O6TmIeVki
 iewBTEyYfK9J/FJWdWOD9i17gyNhE7eoqQpfdakyRD9Zk1ewHZHxa+KxQmGByDIQyXel
 MLnXxRXEapyT1D+dnDrlYvqmcUU5BsYURJWfQRnjyM2YvIto8MwwHxQqbHz5G0MOC0su
 9ArspcYxiqsPMShvCBRlhPWrzLgHIsk0Fkcg3+kdx9XMRIEaZgBGzLzj9GHblrrASxEn
 UdjQ==
X-Gm-Message-State: AOAM5313yw+9kxP2lr5f+RINOrVdP/t9Ucg6tyO68Aa5NKjLw2MbIL6A
 J/XLXB6RrvylO06wkuLFQddpDNy+9oVO3jKFK6w=
X-Google-Smtp-Source: ABdhPJxV4civQTOWcSDRrsrbFXaD1gxR/ZRM4W/cOJUVR0RNDe4FlU2SuQ/hS4BH2cvR1/95jGfQaWGBleA6nkTBwTI=
X-Received: by 2002:a1f:add0:: with SMTP id w199mr31771784vke.0.1629918221742; 
 Wed, 25 Aug 2021 12:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
 <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
 <CAM2a4uxO=DaspSeT0LPHTvKuH6crzzQC4_syAf=J+FOE_C_sbw@mail.gmail.com>
 <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
In-Reply-To: <9984de93-0b83-ef88-8301-a8b74f3f6247@amsat.org>
From: Gautam Bhat <mindentropy@gmail.com>
Date: Thu, 26 Aug 2021 00:33:30 +0530
Message-ID: <CAM2a4uxp29QKMaLFOseS5dHRNuooVY6sghzD22NEtGE=3g5wVA@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=mindentropy@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 1:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>

>
> Aren't Nascent uC based on 8051? Because AFAIK QEMU doesn't emulate
> this architecture.

I am trying to emulate the TI MSP430 microcontroller.

-Gautam.

