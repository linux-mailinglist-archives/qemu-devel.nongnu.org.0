Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EBC56FF85
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:53:25 +0200 (CEST)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAr2a-0007wj-8u
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAqyS-00014X-0Q
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:49:08 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAqyQ-0002qF-4b
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:49:07 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ef5380669cso44417027b3.9
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 03:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bGVY7NUb55AsOohPuJVo+f0ghbv1fPl0/KHU/eopcds=;
 b=UlqV6R0o8tebYmxg1Jsrd1FQ8XABGtRZfbx6RrLCA3LvSMMAfX5W+6ET+yotoWzJHU
 Qn2EWk1a2KZKJg4gubac5jnrq/SOFJrL9P82VRFKgFT91dzJYvP9r0e9farMAd4ZDI4j
 O4lD1RnDObNdyOkUYO11depIeyS0X/7pBPUaiC076hhnFfx2FLWq5RSAYIel+xuUAYBh
 BNVL3Wr7gWCO91kBX0qItFgZXDD+dLni4w8rWLJ4znSxwnHkETREMip15jAoYmNYEBxi
 QKM8Krmh3Uas+9P1RQy4F4V5MUZj6ZhvU5PdPxHmkMmEQPcX1NrBmc3yel3XPCLFR2aS
 HIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bGVY7NUb55AsOohPuJVo+f0ghbv1fPl0/KHU/eopcds=;
 b=in8iqcc05n9APl3igJHgUywpEQexHJdBu521Vyq2w4ax/R0LWJH4JtJpRKXts1pbMn
 yVvd44CP74VDpgwHegKksrzIMYaEhyzhJKszioyvPMvocawPbT8KMPbGhkO7n+67eXaL
 D745ZzDMQZlVvBjYdl72C4kthTF5BkQAQet5p7EfUC4WPydaLncK226283JjjtJ9scSA
 94dbPLQ5n/olZdE5YtZyqHFY2Pxg1LMyHbAVer7cdlKLMDBhv2T6uNYSzRA3pnjBaaJW
 A2naAtzLMDBZygtnPD8nJwZ5sPAZwX8rGiCV9HOZj9FNmajhAJZKyLvNXRBTtTZEJUSY
 skxg==
X-Gm-Message-State: AJIora9g+p8z0N30MpGBjls/9sCuq2OrbYYxOJkrloTePnTbxdbvonR5
 MwVf9qbuQ2uVbqkTpnSfVmqbiXBsLu6SuAYYZ+L6Nw==
X-Google-Smtp-Source: AGRyM1t3UNyWUGL+lUcayOLhVzratUSALl41hG0FEzffKixkIzTQdRhHnpT9yiOhoUbz2FJ9m6lHjxbVueOYWkLQ37w=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr17945013ywb.10.1657536544692; Mon, 11
 Jul 2022 03:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211015144640.198044-1-kwolf@redhat.com>
 <20211015144640.198044-15-kwolf@redhat.com>
 <CAFEAcA9jnySMWRD56FF9D7rXhwARiyvqJx+4Ys+smYa2ghdLBg@mail.gmail.com>
 <87wnctzdl9.fsf@pond.sub.org>
 <CAFEAcA_cYpt_FU5mD+X+BSmQq9e6u1n+nm8EVfdrPeVN0o3Spw@mail.gmail.com>
 <87y1x37ryc.fsf_-_@pond.sub.org>
In-Reply-To: <87y1x37ryc.fsf_-_@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 11:48:25 +0100
Message-ID: <CAFEAcA9TpD3+d9ghohkLXVn_0Ya0MtHZvgSxugKMMS=juk_pPQ@mail.gmail.com>
Subject: Re: The case for array properties (was: [PULL 14/15] qdev: Base
 object creation on QDict rather than QemuOpts)
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <ehabkost@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 8 Jul 2022 at 12:40, Markus Armbruster <armbru@redhat.com> wrote:
>
> Cc'ing QOM maintainers.
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 4 Jul 2022 at 05:50, Markus Armbruster <armbru@redhat.com> wrot=
e:
> >> My initial (knee-jerk) reaction to breaking array properties: Faster,
> >> Pussycat! Kill! Kill!
> >
> > In an ideal world, what would you replace them with?
>
> Let's first recapitulate their intended purpose.
>
> commit 339659041f87a76f8b71ad3d12cadfc5f89b4bb3q
> Author: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> Date:   Tue Aug 19 23:55:52 2014 -0700
>
>     qom: Add automatic arrayification to object_property_add()
>
>     If "[*]" is given as the last part of a QOM property name, treat that
>     as an array property. The added property is given the first available
>     name, replacing the * with a decimal number counting from 0.
>
>     First add with name "foo[*]" will be "foo[0]". Second "foo[1]" and so
>     on.
>
>     Callers may inspect the ObjectProperty * return value to see what
>     number the added property was given.
>
>     Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>     Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
>
> This describes how they work, but sadly not why we want them.  For such
> arcane lore, we need to consult a guru.  Possibly via the mailing list
> archive.

This is not the initial array property feature addition. It's
adding a convenience extra subfeature (ability to use "[*]"
to mean "next one in the array"). The inital array property
feature commit is:

commit 0be6bfac6262900425c10847de513ee2490078d3
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Mar 15 16:41:57 2013 +0000

    qdev: Implement (variable length) array properties

    Add support for declaring array properties for qdev devices.
    These work by defining an initial static property 'len-arrayname'
    which the user of the device should set to the desired size
    of the array. When this property is set, memory is allocated
    for the array elements, and dynamic properties "arrayname[0]",
    "arrayname[1]"... are created so the user of the device can
    then set the values of the individual array elements.

Admittedly this doesn't give the justification either :-(
The reason is for the benefit of the following commit (and
similar use cases):

commit 8bd4824a6122292060a318741595927e0d05ff5e
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Mar 15 16:41:57 2013 +0000

    hw/arm_sysctl: Implement SYS_CFG_VOLT

    Implement the SYS_CFG_VOLT registers which return the voltage
    of various supplies on motherboard and daughterboard. Since
    QEMU implements a perfectly stable power supply these registers
    always return a constant value. The number and value of the
    daughterboard voltages is dependent on the specific daughterboard,
    so we use a property array to allow the board to configure them
    appropriately.

> We occasionally have a need for an array of properties where the length
> of the array is not fixed at compile time.  Say in code common to
> several related devices, where some have two frobs, some four, and a
> future one may have some other number.
>
> We could define properties frob0, frob1, ... frobN for some fixed N.
> Users have to set them like frob0=3D...,frob1=3D... and so forth.  We nee=
d
> code to reject frobI=3D... for I exeeding the actual limit.
>
> Array properties spare developers picking a fixed N, and users adding an
> index to the property name.  Whether the latter is a good idea is
> unclear.  We need code to reject usage exceeding the actual limit.

Note that the initial intention of array properties was largely
for within-QEMU-code QOM properties. The usage of array properties
for user-creatable devices is a later development.

The basic rationale for array properties is:
Sometimes the thing we want to be able to configure on a device
is naturally expressed as "we have an indexed set of things".
When writing a device implementation, it's nice to be able to
straightforwardly say "this is an indexed set of things" and have
the property system set the device struct fields accordingly
(ie setting the num_foo struct field to the number of things
and the foo field to an allocated array of foos), and for the
way that device users to set the values of that indexed set
of things not to look too awful either.

The specific implementation we have today is just a cute hack
that avoided having to mess about too much with the core QOM
property implementation. (And it's only the implementation that
imposes the "set the length first" constraint, that's not
inherent to the idea of array properties.)

I don't have a strong feeling about the "[*]" automatic-indexing
subfeature -- none of the use of array properties that I've
added uses that.

thanks
-- PMM

