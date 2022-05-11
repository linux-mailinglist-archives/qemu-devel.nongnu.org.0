Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF55B52309B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:23:05 +0200 (CEST)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojUm-00054R-Lg
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nojRL-0003Lk-4r
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nojRI-00086O-Jx
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652264367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nh9lYW7EGdP9yq6KP9COI0CZWCGOpSsiymfY/LYRn0Q=;
 b=eJTfJ0VRez00cTfG7r/YMuHOmIezgP9hTLijoSCuGi/LzrFvGimdpq6x9r78ymOpqgn9KD
 AllQBlx97V51VTUucFnO5fsHdZVqsRjklO/3SstZA9bZ2HXrp2lzlLu2q+6wiYuWi/l7Um
 6b468s0Ld30rLVT5mAgA8WrPJT+bUYI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-emGbj1csPciPMdEbupQdDQ-1; Wed, 11 May 2022 06:19:26 -0400
X-MC-Unique: emGbj1csPciPMdEbupQdDQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 x12-20020a2e9dcc000000b0024f2bb07cb8so564367ljj.13
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 03:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nh9lYW7EGdP9yq6KP9COI0CZWCGOpSsiymfY/LYRn0Q=;
 b=uoE5A+Ktj08MGjOQY+6Qd7Q0/lQUQGyTpjh2J9AUlNdi5wHk8KN4V1xB04yRUpXjAv
 +4PaCowUtgR4W7OzoXu8YDUB2jSkWbhcsD0pouPQn73OiyYi4wNq7w6OmdX9VykD2Oo+
 UR/YUfU9eMHIl14jpEeVJdKpeVFFW53e6CTJ/IpPKdjUAwK8Dv3bkVLwy+YxRLOAxz0m
 C7F0Y45wnPVS9LRY+Mm020bALda6z74TFIGLXW7A5JoIjPwU9tWitbJsDlDJl84BnWbx
 oG+HHiNDWi0pCcZCu+dnFvwX9Eebrj1nUvb/H5KiHb/NNx7JT5IRmUsEm5DBHLChxlL4
 DQDw==
X-Gm-Message-State: AOAM532kGyNMm/pm9SzqpL1/T527uWTPiJo1f8GXonrcfeUDHxVfUuZH
 3XogqgaEDPoAzsneLDWJWb1FNYIFnXAMsckbrr1qXS4J28S1cY2Zqt6fqJm2n2qOqRNo3qsCJM4
 zO3QG/LyMdYmblebkCH0CZIJfZ68RzHs=
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr19853775lfu.471.1652264364788; 
 Wed, 11 May 2022 03:19:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTwfVNYPvaTf5tHqTY2TfRGOhW1u4ripppBav6N5UDBAaF7y93ok21YY5o/JySOGSWrjoPqGfKHyYGhOGdfKE=
X-Received: by 2002:a05:6512:a91:b0:473:bb9e:fc80 with SMTP id
 m17-20020a0565120a9100b00473bb9efc80mr19853763lfu.471.1652264364544; Wed, 11
 May 2022 03:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <YiotlroslM5hcR04@p100>
 <CAAdtpL44p=kPaRYSi8Y1HLrsQnc3e5Z_BRd1yjH=h7DDBwWWSw@mail.gmail.com>
In-Reply-To: <CAAdtpL44p=kPaRYSi8Y1HLrsQnc3e5Z_BRd1yjH=h7DDBwWWSw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 11 May 2022 18:19:13 +0800
Message-ID: <CACGkMEs0A9-DDsakGQtTpzy72oa0QP66KGOp=etTP4xZBypQVg@mail.gmail.com>
Subject: Re: [PATCH] tulip: Assign default MAC address if not specified
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Helge Deller <deller@gmx.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sven Schnelle <svens@stackframe.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 11, 2022 at 5:41 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Jason,
>
> Do you mind taking this single patch via your networking tree?
> Otherwise I Cc'ed qemu-trivial :)

I've queued this.

Thanks

>
> Thanks!
>
> On Thu, Mar 10, 2022 at 5:56 PM Helge Deller <deller@gmx.de> wrote:
> >
> > The MAC of the tulip card is stored in the EEPROM and at startup
> > tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
> > address given on the command line, e.g.:
> >     -device tulip,mac=3D00:11:22:33:44:55
> >
> > In case the mac address was not given on the command line,
> > tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:0=
0
> > which breaks e.g. a HP-UX guest.
> >
> > Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
> > up, so that a default mac address is assigned before tulip_fill_eeprom(=
)
> > initializes the EEPROM.
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> >
> > diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> > index d5b6cc5ee6..097e905bec 100644
> > --- a/hw/net/tulip.c
> > +++ b/hw/net/tulip.c
> > @@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, E=
rror **errp)
> >      pci_conf =3D s->dev.config;
> >      pci_conf[PCI_INTERRUPT_PIN] =3D 1; /* interrupt pin A */
> >
> > +    qemu_macaddr_default_if_unset(&s->c.macaddr);
> > +
> >      s->eeprom =3D eeprom93xx_new(&pci_dev->qdev, 64);
> >      tulip_fill_eeprom(s);
> >
> > @@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, E=
rror **errp)
> >
> >      s->irq =3D pci_allocate_irq(&s->dev);
> >
> > -    qemu_macaddr_default_if_unset(&s->c.macaddr);
> > -
> >      s->nic =3D qemu_new_nic(&net_tulip_info, &s->c,
> >                            object_get_typename(OBJECT(pci_dev)),
> >                            pci_dev->qdev.id, s);
> >
>


