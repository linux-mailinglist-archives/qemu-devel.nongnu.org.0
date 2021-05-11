Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353A37B067
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 22:58:12 +0200 (CEST)
Received: from localhost ([::1]:42580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZSF-0000LQ-L6
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 16:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZRC-0007dr-8C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgZR9-0006EI-Oo
 for qemu-devel@nongnu.org; Tue, 11 May 2021 16:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620766622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeDck3+QKdNlEjRIMvAwsnri8NTquF1K1SAUd/fCy9c=;
 b=QVV5dtAHo8ozr1n/vfIKo1fkAP5oc8qe/y5UerfEsDC5uB3uIfmVK4Xkt5D8LwXmJdX4uf
 HAVXHPInjsJFomIU66RRWZPH67jRs1JGbqJ7vWPiZCx2M59gAgb4/JjNzuJsyu4pfNSjWh
 kO5baTqhz1ovXdG65Vtkx0hbuvr2P1o=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-ezztMPJJNLqrMllkPQcLQw-1; Tue, 11 May 2021 16:56:59 -0400
X-MC-Unique: ezztMPJJNLqrMllkPQcLQw-1
Received: by mail-vs1-f70.google.com with SMTP id
 v27-20020a67c89b0000b02902227f70aa8fso10190814vsk.6
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 13:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TeDck3+QKdNlEjRIMvAwsnri8NTquF1K1SAUd/fCy9c=;
 b=Ylu2amU6BceeCEsPhkwhl2verAlDTOxALUjCWeMdhePkoPv4OfOXLQ7csmk6r4R+/w
 +5qY2tuHghPaRTYRiKOAijCAiO5y20yAx6uCLzsSdzS+KFgJTZtyzVhjenkhSoWGtL/H
 VtfUgXSGFv24HBv+tJluRc2CT0fCV6R6asvaaNW7bC2/fmAA8UTXlBS9S2dnmmdgwDD1
 MDXAvWzMRHkJyEHhE4xAybdNWsUn0E1BHpTTtdFZuXqaY0872ybYoPbmYTY4jAmcQn/j
 mnj1AmK0IzTgvw+On/NoYdI2UiZUWJniaCAIX7jGtgx4bxR3nIBovTyXqoTGwIt9ba32
 iIvw==
X-Gm-Message-State: AOAM533vnIq4LYMFfj3IrgBvm1qq6+M3dO0dZut2WDQ93M4xgOERuB0w
 6zo56L5arqdfzPIe3YtTJJKOKsWqbXQVNC30tloP3IUp+dQj5p5x2zClG0+v0cBDrNaKRTB5DqT
 eBtmBDhpgIAGr1KkMjeIv+MXFLU1SuSQ=
X-Received: by 2002:a67:2642:: with SMTP id m63mr27149994vsm.39.1620766618574; 
 Tue, 11 May 2021 13:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5AAAkAsZEzp3tiqvOemk18Ohy4/YxxRDa25qb4/P5nKlvP3LwD4XC/Sc/5tDlOg6twumzARLIW3vuGrmg3IE=
X-Received: by 2002:a67:2642:: with SMTP id m63mr27149980vsm.39.1620766618422; 
 Tue, 11 May 2021 13:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-4-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-4-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 11 May 2021 17:56:32 -0300
Message-ID: <CAKJDGDZ_Knmp0J-YETwEXC7gY7osz1SybjQ0bGS_GjVG7+jmOw@mail.gmail.com>
Subject: Re: [PATCH 03/12] crypto: bump min nettle to 3.3,
 dropping RHEL-7 support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 10:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required nettle version and
> drop a lot of backwards compatibility code for 2.x series of nettle.
>
> Per repology, current shipping versions are:
>
>              RHEL-8: 3.4.1
>      Debian Stretch: 3.3
>       Debian Buster: 3.4.1
>  openSUSE Leap 15.2: 3.4.1
>    Ubuntu LTS 18.04: 3.4
>    Ubuntu LTS 20.04: 3.5.1
>             FreeBSD: 3.7.2
>           Fedora 33: 3.5.1
>           Fedora 34: 3.7.2
>             OpenBSD: 3.7.2
>      macOS HomeBrew: 3.7.2
>
> Debian Stretch has the oldest version and so 3.3 is the new minimum.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.yml             | 10 ----------
>  configure                  |  4 +---
>  crypto/cipher-nettle.c.inc | 31 -------------------------------
>  crypto/hash-nettle.c       |  4 ----
>  crypto/hmac-nettle.c       |  4 ----
>  5 files changed, 1 insertion(+), 52 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


