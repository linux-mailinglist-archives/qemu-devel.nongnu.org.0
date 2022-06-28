Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037555E5D9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 17:59:23 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6DcY-0002at-3F
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 11:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6DY9-0006Rj-06
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:54:49 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o6DY7-00036p-5G
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 11:54:48 -0400
Received: by mail-ed1-x531.google.com with SMTP id n8so4258843eda.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GuM9pGGFtoVsbODieug1+Gue0seA/dTiRTbg/lBvDvc=;
 b=yk6OY9bBNrXp5xXvbiFsuV8TnJxBMyDnVI3j071Zpgefrw3V0i3iU5oexmR/OPJe5b
 a9wI1ibtE0Q2gWsgTEZqXkksLxhLI411ekld43kB/gLia4jILczZ8YjTcSIrFJ8GIn8e
 m0guflvXOhIZzNwUED4KrdqJ/SeUPYoU4n5BkrJeDcB3oEun9YBsbHiLOon4UtSGek0V
 f564sfB3ptnZ/t8H7Z6xIxhWG2QYI7uaumXehedXBFNHTC294DFusJwfN2hSRKz8u+Zp
 fiJvzd8BqJRaenvJ9/x89dmNSUWDz4jXE/yglQCQI2SiIK1tE7HuBBoSuZLa4m3AWZ2C
 mTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GuM9pGGFtoVsbODieug1+Gue0seA/dTiRTbg/lBvDvc=;
 b=b4CMUhSjGqKGzu7Ti5ES0ZxQ2pp7FXFywQxbm+76uTNstNslOvtgMfMarfaE0wrZl9
 ojY3EY4byyMxkPxF0rimW2V1hjVX281VMgYQ8XFop6iZIAPSgsA0wkgpLxe40+UxG5Dx
 38TITIjqpP2eKaPzba7lLHvlyCRNtGPUPPy5ct5cbO8PqEzBGh4xhPvkhQlYstI3zncG
 n0CeKg4ZcQDQ0wK00ieKooVDcMTdHIiWNf1Rz+I4MxULNsnd/jFY+lkGI6rjQeuCcSiz
 UhpL89fj8ii1ILDF17lgPYTA0gO2kRX5SP+lWh50nl+hNbWgIZn0w9YjhGcyKoK6Nw54
 JaUw==
X-Gm-Message-State: AJIora9JdfpDVOXGXwacIcBwGAdNkcqoyph1YnBNIG5hW/x2sesgzVzs
 uLj14tChFxE6YriQjqWGccS7tSai1HNQfA/s4vFvPg==
X-Google-Smtp-Source: AGRyM1uGOGrBI/tQ1zLRLWs5FP3nsLq96h+KXFJGNDFNjxZU3/IaXdOe4XRc2JXuibH6qXd2ckMsR11v/q7OaeLGQuw=
X-Received: by 2002:a05:6402:2987:b0:434:ef34:6617 with SMTP id
 eq7-20020a056402298700b00434ef346617mr24253951edb.176.1656431685377; Tue, 28
 Jun 2022 08:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
In-Reply-To: <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 21:24:34 +0530
Message-ID: <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: Thomas Huth <thuth@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
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

On Tue, Jun 28, 2022 at 6:09 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/06/2022 13.14, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 12:50:06PM +0200, Thomas Huth wrote:
> [...]
> >>> Come on, this is just a test. We *really* don't care if an ISO
> >>> we use to test ACPI is using an exploitable version of grub.
> >>
> >> Wait, I thought we were only talking about tappy here? The ISO binarie=
s
> >> should certainly *not* be bundled in the QEMU tarballs (they are too b=
ig
> >> already anyway, we should rather think of moving the firmware binaries=
 out
> >> of the tarball instead).
> >>
> >>   Thomas
> >
> > IIUC there are three things we are discussing
> > - biosbits source
> > - biosbits image
> > - tappy
>
> Oh well, I missed that part of the discussion so far since the correspond=
ing
> patches did not make it to the mailing list =C2=AF\_(=E3=83=84)_/=C2=AF
>
> Anyway, that's just another indication that it might not be the right fit
> for inclusion into the QEMU source tree. So either download it similar to
> (or included in) the avocado tests, or maybe another solution would be to
> have a separate "qemu-ci" or "qemu-testing" repository for stuff like thi=
s ... ?

Yes, I think we should have a separate repo for all testing related
stuff like blobs, guest images etc. Curently, some of them are in
personal github accounts which is not idea IMHo.

Bits stuff can reside in the same place.

