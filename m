Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CB33094D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 09:22:01 +0100 (CET)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJB9L-0001z8-Uk
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 03:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lJB8N-0001MA-Eg; Mon, 08 Mar 2021 03:20:59 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:41269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lJB8L-0006Cp-Sw; Mon, 08 Mar 2021 03:20:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id b7so13289578edz.8;
 Mon, 08 Mar 2021 00:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OhdlXApDsGaeJ3nJJ4SXvFIHQePH+AiYeTyvlGoKrCY=;
 b=jYOeHPQ4UAw2jRVsxTo/UPDU0whgY8PXDQ6Hu3wZm8ndZwV2xIbHXJbBMBxhS0HWNE
 /N4Kd7glq4qNvGG+OX3fCPpT4yaWfkWLrfnUyYD5uSSZyvMeifQgbnK8d2Jp2s2RbALS
 9esB4WrcK0OCdfnrnoAE4fhMveR6lu6fsCUBCkCwCgfZOOaJ06GEZabtMhesc3p8iqiJ
 +GH29HGCI4/N9BmQC+4j4qFCf+To9ztqy3xAarc2VdcyrdOT/MlCbaWLz5DnQ/+eR0+g
 BVkBSCKJPnmpf+2UzjTx16X/MhHGxJ6TwAe7lpz4dA0rsL9K/8c1IiRgdy+JrgnP1qSE
 TAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OhdlXApDsGaeJ3nJJ4SXvFIHQePH+AiYeTyvlGoKrCY=;
 b=KywrTgElVyDx35NroU2GcjpANfkxx3F6xSoixCVobz/EjB0+bxsg9jMM8J08X9l8Yg
 RvEwsNVh/12EFHe258BFN2DtPW62uiXmY8nZNSPy2IiHfynZOlsivRvxVipcMNWOH3li
 3QmsNkEJu86asvM11ung5OS7p+g+DekiRs7rBNnN5rnTxbFWfmOIoDOLVffMuOnrSL+x
 atE/8yF0LAyhbjwaIUV1ki+iH7yqgphpkAvsuAf0uXCBwshBR94SYOe/rjcmNF2RBwGV
 fWGVcGLH2SijrdxzrvwOpQt3P7erI3CkFFlpKa/g3lYlsf6WugefCcyzAqxWw3eYCQrs
 IbVA==
X-Gm-Message-State: AOAM533yLDhisdGivjyQQQP/oUSVbMY6vEAN3kfLPS89oQxqZKlmdL6u
 QSvDlnA+YLTDuc6XxfZ9Ay8+A+9u0v92+jJDJ9Y=
X-Google-Smtp-Source: ABdhPJwriNrfLSnIxViPmUaI5c5s0w0XEq+lI2PaPAPIX4cmuO9zZGrBnKb/PNYXqoDpQ5XAEXGe/92k+S08qjWLfmU=
X-Received: by 2002:a50:fe06:: with SMTP id f6mr20975482edt.349.1615191655191; 
 Mon, 08 Mar 2021 00:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20210307222625.347268-1-f4bug@amsat.org>
 <20210307222625.347268-4-f4bug@amsat.org>
In-Reply-To: <20210307222625.347268-4-f4bug@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 8 Mar 2021 00:20:43 -0800
Message-ID: <CAMo8Bf+wg0yET+oo++dVSYxZwF+GoGQr5JXza5iQ4CiyWfF6Kw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/xtensa/xtfpga: Get pflash MemoryRegion with
 sysbus_mmio_get_region()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 7, 2021 at 2:26 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
> MemoryRegion with sysbus_init_mmio(), so we can use the generic
> sysbus_mmio_get_region() to get the region, no need for a specific
> pflash_cfi01_get_memory() helper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/xtensa/xtfpga.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max

