Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961564614C2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:09:45 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrfTc-00013Q-8B
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mrfRf-0007om-W5; Mon, 29 Nov 2021 07:07:47 -0500
Received: from [2607:f8b0:4864:20::d33] (port=45892
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mrfRS-00019a-JC; Mon, 29 Nov 2021 07:07:38 -0500
Received: by mail-io1-xd33.google.com with SMTP id v23so21077293iom.12;
 Mon, 29 Nov 2021 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EAUl3DWQfAzDG/HNvrOgxJKxeenx2rv5J5ybj2Yz3eY=;
 b=DTSI3m+8rjuv8gergmV3GkvXlGe4Zd3IxEJu3Y0LWwKBp8qP+y9eZxG8FiqDRQJ5IJ
 7hkLJfwRSOb9usOhMdTYq5IySJMtV19YkciXnU7mno8jeMWg212Oc4mcbWg8dOpDfUgz
 4FFG9rgsQZSheEmsSF1QSBptq3DYQ0nHYrzZrvNUAYyCDOgdydLuiwquK5Db3WGd7dS/
 mTO1XlRdck5gBik5nTe6SiB+rdYn+IuCRrfuf+90qpK1p9cwu6aO6MS+SnR4H0G68psy
 KognJhbCxhujgSDrgFpLqB4Ivfqfdp1rArfjEXmst0k7Kkildf2ZieB/bnenGGLqnfep
 Q6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EAUl3DWQfAzDG/HNvrOgxJKxeenx2rv5J5ybj2Yz3eY=;
 b=4pcBhw0fPTGV8Hp3/JivJKCzOOJWzXlNTXeQhFGfTXzux82mVoeNhVFbnGwu38x+BA
 ndiMG0A1Hcf5bLtweD+psBpjSGHJ+edfJCJiPXcYAn2d4B5Zbcr3c4dC1CVtKVYd6h8c
 P9nlSccmUY27PMIrbwiKh9QBIe7wl+VkrWeWlFD6Xv/lPJ745aL818hcplwpzFod34qH
 DZD7yJUWBUPOnpH0qBO3cUt7NDqoEHkvA17kPTbA9T0m5kxkoya+Ad4hbpKNNl2hPoHn
 5SpK3SdGU1ScQYBm1rB5XAXxlj/y+MnpwW/9GK+nk5nBleUn/8EXXFnO7oonHsQFhSc7
 sKZw==
X-Gm-Message-State: AOAM533EfhtWWN3oocfIQJbluSGaZAUW42CHEZSMv4NKoIKSpzZmXMp7
 NjBVZ6/+GUmhR3iNTxEQ6LecGmhIYPjAyn6/JHg=
X-Google-Smtp-Source: ABdhPJwnaR25OHKpFwosDoSjahM8JJL/qU9kOt2NfJEoXV51V1Y24TI6+HPDQWS3rpLd2PXxBWG+qGMZqZS9f0s8quQ=
X-Received: by 2002:a05:6638:d84:: with SMTP id
 l4mr67754870jaj.18.1638187648611; 
 Mon, 29 Nov 2021 04:07:28 -0800 (PST)
MIME-Version: 1.0
References: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
In-Reply-To: <20211128120723.4053-1-olivier.heriveaux@ledger.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Nov 2021 22:07:02 +1000
Message-ID: <CAKmqyKP47GoL+m6PHW6ijCTK1rowgRf=du5=JXOYEtwHCTK=Fw@mail.gmail.com>
Subject: Re: [PATCH] Fix STM32F2XX USART data register readout
To: =?UTF-8?Q?Olivier_H=C3=A9riveaux?= <olivier.heriveaux@ledger.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 12:46 AM Olivier H=C3=A9riveaux
<olivier.heriveaux@ledger.fr> wrote:
>
> Fix issue where the data register may be overwritten by next character
> reception before being read and returned.
>
> Signed-off-by: Olivier H=C3=A9riveaux <olivier.heriveaux@ledger.fr>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/stm32f2xx_usart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 8df0832424..fde67f4f03 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -103,10 +103,11 @@ static uint64_t stm32f2xx_usart_read(void *opaque, =
hwaddr addr,
>          return retvalue;
>      case USART_DR:
>          DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->us=
art_dr);
> +        retvalue =3D s->usart_dr & 0x3FF;
>          s->usart_sr &=3D ~USART_SR_RXNE;
>          qemu_chr_fe_accept_input(&s->chr);
>          qemu_set_irq(s->irq, 0);
> -        return s->usart_dr & 0x3FF;
> +        return retvalue;
>      case USART_BRR:
>          return s->usart_brr;
>      case USART_CR1:
> --
> 2.17.1
>
>
> --
>
> Les informations contenues dans ce message =C3=A9lectronique ainsi que ce=
lles
> contenues dans les documents attach=C3=A9s sont strictement confidentiell=
es et
> sont destin=C3=A9es =C3=A0 l'usage exclusif du (des) destinataire(s) nomm=
=C3=A9(s).
> Toute
> divulgation, distribution ou reproduction, m=C3=AAme partielle, en est
> strictement interdite sauf autorisation =C3=A9crite et expresse de l=E2=
=80=99=C3=A9metteur.
> Si vous recevez ce message par erreur, veuillez le notifier imm=C3=A9diat=
ement =C3=A0
> son =C3=A9metteur par retour, et le d=C3=A9truire ainsi que tous les docu=
ments qui y
> sont attach=C3=A9s.
>
>
> The information contained in this email and in any
> document enclosed is strictly confidential and is intended solely for the
> use of the individual or entity to which it is addressed.
> Partial or total
> disclosure, distribution or reproduction of its contents is strictly
> prohibited unless expressly approved in writing by the sender.
> If you have
> received this communication in error, please notify us immediately by
> responding to this email, and then delete the message and its attached
> files from your system.
>
>

