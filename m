Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024875BA83C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:28:57 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6iW-0002TP-4A
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6bJ-0006lP-KR
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:21:35 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6bH-0005Nt-7y
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:21:29 -0400
Received: by mail-ej1-x636.google.com with SMTP id bj12so47636043ejb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xTH64oplCrFiHF/AaqsjLULgb1ocRnxOlg331DmQjsw=;
 b=LhmWiCecF62oVe6BhfdBfMiZuW/dY5iMIPnr51dg3+5vSr3nkx0BIWTalktnFItS7R
 HxlyLTa/83rNJHqLryPsU1yRr3LyJDYCznHh8jlSykt7IgSdN12XQah6pMJw8Ny5ZLCO
 sGFIT2NB13NbHGSoLnMbwjKJNEFwzK8qIREtNFZr7RB1R7FDOs9tjmwOYSYgwcMMGIN2
 w9JknUOFiSx8sfl4hmqwnwRMs1BLrmq3hlgpXtHfHb1Bo1GbtC5QwVCHDvZ0zdRayJMV
 KzcBBmBqzy6k25Th5r8AV4PYSvuHkzfOo4/9Bw/fWf9wugfkYqaCAWLUGyI5N3SaYusH
 msCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xTH64oplCrFiHF/AaqsjLULgb1ocRnxOlg331DmQjsw=;
 b=Ro1qovo5dWY9c73p1iK+4qbT4fHzDRp4Nl2fbMIsQZ4wHXKCU0/0dBWyScyAPO3LnC
 w3/VK9m7Oo8eVF0Xih4VnTnST6J3YoHUGWm/ImXILkoZVBhFhhHkEqM7zOQgEJmkuy9h
 bL6sW4eBkq2rrTalelJfJI18J7Sdyd8Yx6oC86bVBhWg4+2+xY6ecBJuEuUZZNhLbYNb
 b0GSuPKDMBRHQG7qnSaVuGowJiStY7wd2ZkC1iWdJovO3WcE5iyByQKPartFFhMY6Xf4
 Wnx3HT0NF3nS15cB0k/4BX6007Vgsmv+VpBTBoq8JYSqkSo6BEQ7TqsVd4xmk50R7GsS
 gpQg==
X-Gm-Message-State: ACrzQf1GFa7s086s9hdVpibBo0L0ntpqrnNX5+MD67mNOvrJ1B+X/2xC
 3MzMCONNjui06rSYIrVormkDa1W2v7tMVH3mEE7UCg==
X-Google-Smtp-Source: AMsMyM6x3X0yBGbcu/axl6c/darWpQzpMHb3AdjzNxjaw+JZuWq7RsEsB6ipiyIw9hh/HL9fH78P2NMFMhVO9A0YX9M=
X-Received: by 2002:a17:906:5d0e:b0:77c:ecf8:904c with SMTP id
 g14-20020a1709065d0e00b0077cecf8904cmr2728167ejt.716.1663316485393; Fri, 16
 Sep 2022 01:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
 <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
 <87illnenpv.fsf@pond.sub.org>
In-Reply-To: <87illnenpv.fsf@pond.sub.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 16 Sep 2022 13:51:14 +0530
Message-ID: <CAARzgwx8x0kW4tknikPzscm59cCDBRw_+z__tm_Rb=1EmYF=kQ@mail.gmail.com>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, jsnow@redhat.com, 
 eblake@redhat.com, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Sep 16, 2022 at 1:48 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> >> They are also a nuisance to work with.  Recent commit "qapi: Start to
> >> elide redundant has_FOO in generated C"
> >
> > Commit is referenced using <commit hash 13 chars min> ("commit header")
>
> Apply my patches in your tree, and your hashes will differ from mine.
> Hashes can serve as stable reference only when we git-fetch patches, not
> when we git-send-email then.

Has the referenced patch not been pushed upstream already? I thought
it was and hence was asking for the reference.

>
> >> provided the means to elide
> >> them step by step.  This is the step for qapi/acpi.py.
> >>
> >> Said commit explains the transformation in more detail.  The invariant
> >> violations mentioned there do not occur here.
> >>
> >> Cc: Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Cc: Ani Sinha <ani@anisinha.ca>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

