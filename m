Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB653C2752
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:09:09 +0200 (CEST)
Received: from localhost ([::1]:48436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t3s-00079s-Qu
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1swA-0007fm-Qr
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:01:10 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1sw6-0005Jj-RH
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:01:10 -0400
Received: by mail-ed1-x535.google.com with SMTP id t3so14467219edt.12
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EfT2SJUWjhkS8bxd3FqIF9SBpf7PDgkYON/s9oEhEHo=;
 b=sWre3QUx4JnKEIfxhlzGXx6lt/1ZRxPfTtEg78FHIK2/6oBw57Mo2vt1ZXTFEM4puS
 5wigvOaVraQp3/aBcuhd/OidRNdnHRN3qwiGq/EgGXDDbvfZOHigI5n6yv8xwEysABfD
 EYWA7crFTGODUZRuLytjBluNzl3NcDN92GDyf98/oghicHK0fF8v1JsYrWOvWohPIWWX
 gImgbonZ+U/mDS5EY9QwR4XRWjnbzvpze4ZtaphSaH4mxbqPoEBX7fKSX7abWXjnMyYY
 34Px9vSetfa59eirQuAht2cMWzswpvzVUSzINoHtJY2idgWQfBPxbdnmew3kwVv1ebrp
 g0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EfT2SJUWjhkS8bxd3FqIF9SBpf7PDgkYON/s9oEhEHo=;
 b=JRJi+FHowKPVE86uPZ/WOkDBC9RJ6Td5Egx0c20Cld7mXZ+2H8bCwajWqNl11LFESB
 GrwCnENyJhe82XQEpTmp6aNK0XS65JRGkLlicv+4jqOp06SnICYRIbVPL2Y8joiulwwZ
 cnmudFBH4ht9TVv/aSUf1IefwQI9Lq4ot25t2qtjszDW1g1IIaqCavs8xEGuIi9rfusw
 g7s/GRjRoifu1CXK3kl7IJo3GbEZ5P2ILTmmcvl3U+Nf9+Nf9ylcNIODzJBAcbcbPeSl
 ytN8AWJVVlGGRcNSHA1+t8VWZmw7WaYgJdmyKXzWtd+v/ye0hae64We4lnC2ODAN6+JQ
 BZYQ==
X-Gm-Message-State: AOAM53397QKay+KIWSyEENHghdg/2w05AxCk9HbRWs3j6p1FIztLgTHQ
 Cy3QU1MAaOZjwo8GtEV7etuVu+UCLbkmE9XDAByCqw==
X-Google-Smtp-Source: ABdhPJzftAIZP4vsbKN7dMFtoPxXnH8ezlmLZU//mC+nLxsRUwpzKWaJ0Ip8BjiyXiSG3ttr6pOJrRxwrZHy6aPLV8o=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr34679771edf.52.1625846464589; 
 Fri, 09 Jul 2021 09:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
In-Reply-To: <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Jul 2021 17:00:25 +0100
Message-ID: <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> >
> > Since v1:
> > - renamed tests (Peter)
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >   tests: Remove uses of deprecated raspi2/raspi3 machine names
> >   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
>
>
>
> Applied to target-arm.next, thanks.

I found that this seems to break 'make check':

 (09/52) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_r=
aspi2_initrd:
ERROR: Could not perform graceful shutdown (40.38 s)

Dropped from target-arm.next.

thanks
-- PMM

