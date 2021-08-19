Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D193F1BCB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:42:33 +0200 (CEST)
Received: from localhost ([::1]:52776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjFY-0000ab-Vr
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCD-0005CZ-DM
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:39:05 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjCB-0004uk-FW
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:39:05 -0400
Received: by mail-ej1-x629.google.com with SMTP id bq25so13355453ejb.11
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vVVDXr9oIYYY2xqnY+5rphyvS0aAAxMcD4SzkQgbEXw=;
 b=dniTonSeDFX1dneOf5zf7LvbP9IuI3aS+CX1CJ+iLuSMqqnZSPXNGalmNoVUpC4yt8
 QmmhGNSFZUHauycI0wzU+temQDnNnXUu6iJd+aPyHDvrShFmKSJq4kEQbcgQORVAGD/O
 jvtIoXT4vjK/D2OPc7+PsOAEd4ozytmERbMcFRlODGcmoUPhdN+K1vsYOd2pOVhGAx3x
 9hmymFTWSW4mwy+kPbIEvB3b4uiASRVi+2nUjjA0gA9Eg90cJ3BUxCNfxW63ztOVUbPz
 xZb7It77v/K3ZLmyt0JdoYI/U2KdY7HJREQAGa6mscE/FQw3gv0XK/Avu7z5nzHxe7j2
 ypoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vVVDXr9oIYYY2xqnY+5rphyvS0aAAxMcD4SzkQgbEXw=;
 b=cjYL9nO6gUNF9kLJlYtp5Ao2J6QwFxm51tNG+5WuL1kku8DI3lisB78UHDhq4ox8dA
 hKFwkz2zytYI4BvwWZdEdCyYvMkLMn/VTL5zZrfTSuyKDmmFtZ0f6NXVuhhykrvdMjz1
 aw6nkFR82S0HBbHlxll1LynN9MudA/g5n+lOKSU9y4niZyq1zd0G1LL7/6N6Kbqqj8v9
 KmbSI9M/oqOlGkwsJEoGCaEkCdm3OlNfMP96iYivGPLoDG9eppMONOXIvyimDjnMIm8w
 BtIZR8tDSTHW1gre/ty1yQAkKloBkqbfhSt7DD2T5PCoqQz1wRGTd15jnXTJDOXmvxL8
 /O4w==
X-Gm-Message-State: AOAM531pJ3D1+g/1WYYq0nqLAEfri/1jdsJbBb2/peZKbM4GhQgPo23s
 e25sPzkBn5ls1m9E0PfyfddQjNCLkKOMiQLCe/10Dg==
X-Google-Smtp-Source: ABdhPJxUw60Rp5Ps1V0CbH1OtqoiEttqfAQIhSICjM+J4lQGlYLSgdQSLzFoMebBcm899Q3Nk8mAryaY7JKJ4I5bJAs=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr15691623ejb.382.1629383941633; 
 Thu, 19 Aug 2021 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-5-philmd@redhat.com>
 <CAFEAcA_MrsapWF9K4_HW7FNGcT8PHUJRer7FH_fMU4yf1wz4tw@mail.gmail.com>
 <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
In-Reply-To: <8fda9bc6-54ce-3a04-6c4c-b200ec699fa9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 15:38:15 +0100
Message-ID: <CAFEAcA_kB0-fHYBk1hJ87=Qoj0U-EbjhzVruhVhJKnexViG8_g@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/dma: Replace alloc() + address_space_init() by
 address_space_create()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 15:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/19/21 4:22 PM, Peter Maydell wrote:
> > On Thu, 19 Aug 2021 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
> >>
> >> Replace g_malloc0() + address_space_init() by address_space_create().
> >> Release the resource in DeviceUnrealize().
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/dma/xlnx-zdma.c    | 15 +++++++++------
> >>  hw/dma/xlnx_csu_dma.c |  9 ++-------
> >>  2 files changed, 11 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> >> index fa38a556341..9f6b3fa47c6 100644
> >> --- a/hw/dma/xlnx-zdma.c
> >> +++ b/hw/dma/xlnx-zdma.c
> >> @@ -777,15 +777,17 @@ static void zdma_realize(DeviceState *dev, Error=
 **errp)
> >>          };
> >>      }
> >>
> >> -    if (s->dma_mr) {
> >> -        s->dma_as =3D g_malloc0(sizeof(AddressSpace));
> >> -        address_space_init(s->dma_as, s->dma_mr, NULL);
> >> -    } else {
> >> -        s->dma_as =3D &address_space_memory;
> >> -    }
> >> +    s->dma_as =3D address_space_create(s->dma_mr ?: get_system_memory=
(), NULL);
> >>      s->attr =3D MEMTXATTRS_UNSPECIFIED;
> >>  }
> >
> > Why are these devices doing a heap allocation rather than
> > having an AddressSpace whatever field in their device struct ?
>
> To easily use &address_space_memory if 'memory' link is NULL?

They could do that with
    AddressSpace our_as;
    AddressSpace *dma_as;

and set dma_as to &s->our_as or &address_space_memory.

Or we could fix the two boards which create these devices to always
pass in an MR to use for DMA and drop the conditionality.

-- PMM

