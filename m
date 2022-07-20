Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91C57BFEF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 00:14:37 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEHxk-0008KU-2j
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 18:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oEHwO-0006yh-RV
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 18:13:12 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oEHwN-0006yJ-4m
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 18:13:12 -0400
Received: by mail-qk1-x72a.google.com with SMTP id n2so54230qkk.8
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=e49og+GJoOoJXSXh5BvQvTkB/t4MGxHUdccN5Rbo3PI=;
 b=wo++Pl50bcTafDHaLDfTp2XdaWN6kkw1BPFoDQiozg6wszgur1Q/LBl4GdlqXh3U+E
 1TrCsn4MdpdJfMKY5JdBIJFeDuDOsaOQRft0Jabo+OX3+8FhpwkiTrEVJrgZmC2kx3o+
 xyWuREcaX4QGLJoafNCJ4EBC4sjWqj1p7KXCRYSxrDToeApZEL5BYfXBaJqsS00+ERUD
 U1dmKWiQ77kDOQMUv7iUmnFZNf9CoFSt4vhueTKn584ZOO+LxShxSiwzHb1L8DDjMSy9
 0yLjdsSySZ0rTRiotF/RLjkYRTirQB+PGHgnAidM5C1cI0f04NvufxQiXDZACYDWaTg6
 g+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=e49og+GJoOoJXSXh5BvQvTkB/t4MGxHUdccN5Rbo3PI=;
 b=FoAz1yRNBceEkwdJmVwT7fTOr3pkx9XEztoIcXUqPy+SfC1DSovvc7IQezdqaN1xvP
 B/9Cqm08IM//JfCdk8Xg7ngvoGpQztLSvoZMnHW/rYn6vd7gTQQJid7JlAgAv6wo6X1H
 SCdE/81a7JykQcxKEnyR4rNZg5ocz2l+OZvLg00Eqlc4hbRf1TJ2Z1TOLe0w6ZbvefFg
 g+KCbX+lhiq5Ro75RzCn/zg2TOF+7k5MwbgZrBIs4jTpn3WaaUagA7Esn23SuCwSM5zn
 GY+dcepfaqbh1/BW6O4xZtvZYLj/YFFd7GnM7Jd0pfDysBIK3M7E+VoOy35Gq0rih4si
 lsqQ==
X-Gm-Message-State: AJIora+T/iL50C7gAT4LNoPYcyF06x8PoI7TyKH9xk4bDT4xtFROb+xp
 lemKoWudczuF0pJJShSN4vPBTQ==
X-Google-Smtp-Source: AGRyM1tcTHBKIgLxzWRAj2voepTWMkBBSvm8uSafHS2JQU+zRhdbDodGgF9LD9DpscPHs+GWKsfxsw==
X-Received: by 2002:a05:620a:4905:b0:6b5:c742:6161 with SMTP id
 ed5-20020a05620a490500b006b5c7426161mr21494664qkb.107.1658355189968; 
 Wed, 20 Jul 2022 15:13:09 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 k7-20020a05620a414700b006b5e5ebfff8sm310183qko.62.2022.07.20.15.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 15:13:09 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 20 Jul 2022 15:13:06 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
In-Reply-To: <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207201450430.17070@anisinha-lenovo>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
 <CAFEAcA8-ufAM2sg8-WkCPV3ksBZ=RU_1M2aq-wUBij82ot7iUw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::72a;
 envelope-from=ani@anisinha.ca; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Wed, 20 Jul 2022, Peter Maydell wrote:

> On Wed, 20 Jul 2022 at 19:37, Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> >
> > On Tue, 19 Jul 2022, Peter Maydell wrote:
> >
> > > On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > How is this intended to work? The obvious fix from my point
> > > of view would just be to say "piix4.c requires pcihp.c"
> > > and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
> > > but that seems like it would be rather undoing the point
> > > of this change.
> >
> > Yes. From the commit log and the vague recollection I have about this
> > change :
> >
> > > For example, mips only needs support for PIIX4 and does not
> > > need acpi pci hotplug support or cpu hotplug support or memory hotplug
> > support
> > > etc
> >
> > So does malta really need acpi hotplug? If not, then the stubbing out of
> > the vmstate struct is correct.
>
> It's not, because the vmstate struct is actually used when you
> savevm/loadvm a malta machine. If the malta shouldn't have
> acpi hotplug then we need to arrange for the hotplug code
> to be avoided at an earlier point, not just stub in the
> vmstate struct field.

yes I think that would be more appropriate fix, I agree. Since mst added
that vmstate, maybe he can comment on this.

