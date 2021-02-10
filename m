Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C8316788
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:10:09 +0100 (CET)
Received: from localhost ([::1]:58478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pFu-0007QI-Nt
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:10:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l9pBR-0006hq-GP
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:05:31 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:34106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1l9pBM-00014y-Ui
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:05:27 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id l11so760754qvt.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 05:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sDrmGo8pem9ScIst8hmFlNMKbmeSREYh6gTkuYiCNcs=;
 b=J23lqriGK/uhxmOe2qJLlv9BKtyjRvdZtdoOukkx3tCLfii/xvY6CwNH5uHS386Qs1
 meN76qhLbnwcN6JS30EurYdet5r5aIDdVzvPc/P+Z112neIZEYVAIqu4NV2HOOGpZR/R
 7kavtO0lAA4vWAANsSxlZos1wQKUpj1APDX3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sDrmGo8pem9ScIst8hmFlNMKbmeSREYh6gTkuYiCNcs=;
 b=gFgRNPWeW8Pc0JmR9ulT22DISmiQU/br/I+cuxy36c8wvkW3pWJ3eswp2QK6z5SyMZ
 UdGB+kSjpW309LOTidIEVTJ6c1FCyFiunvA6xgblUZIrNeVW5rZAzlPSRrELhd1QeEz5
 aRq2Eep73okQduxw0MPRAW6dTHkGwOXk2EhNFKL9S1AxYsU2jcTzYZgvdeDu4+cEMr6k
 1AslGfhYWrminjkZZCTbGSpWhljaV3thkH5NbiO0JR1TINhS/2RYbyKFZQN7H3B86zFK
 V0l8oB60I9Ag9e++z8HnpGApi2Lra2EIpENDCLtZV4POT8SspNlx74AHbE5RTm7xj72i
 chWA==
X-Gm-Message-State: AOAM532TR1vppPa7Du8xfAF9CmYS+lLGpnw55WwuZizZuK3hM20rFx7i
 /I9NA+tJ+NMoQX7omNGN8GutZUwEpYi547H7sjIxAfBw
X-Google-Smtp-Source: ABdhPJy61YYvtRVvz4l3SFq12KVTCfB9afcpERNSR8m+NcNmufW/mOCPKdS8KbXhOI2WURe0elwqag1s/uUgrrvjfoI=
X-Received: by 2002:ad4:4693:: with SMTP id bq19mr2593351qvb.43.1612962322395; 
 Wed, 10 Feb 2021 05:05:22 -0800 (PST)
MIME-Version: 1.0
References: <BY5PR02MB6772761F83EDC56737969C18CA210@BY5PR02MB6772.namprd02.prod.outlook.com>
 <CACPK8XexXLYrwMenkyou0Xkc8Tx+p1SNi7jbFBj6aObAKHcBwQ@mail.gmail.com>
 <6a30107a-abf1-635b-c96f-af3d63f93bc8@kaod.org>
 <6c1e1335-887e-0459-f1c7-f37daa008c4d@kaod.org>
 <d0ef7bbd-2b2b-422f-9420-29ca620db130@xilinx.com>
 <BY5PR02MB677227AB2EE184B02E1E90B8CAB69@BY5PR02MB6772.namprd02.prod.outlook.com>
 <e401d119-402e-0edd-c2bf-28950ba48ccb@kaod.org>
 <13ff3712-e187-9555-057f-3612654d25c9@kaod.org>
 <BY5PR02MB67726489BD76132422D6297ECA8E9@BY5PR02MB6772.namprd02.prod.outlook.com>
 <10976153-915c-8399-b6b3-6091ae41ec3c@kaod.org>
In-Reply-To: <10976153-915c-8399-b6b3-6091ae41ec3c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 13:05:09 +0000
Message-ID: <CACPK8Xec5o-+9La6AGaVZpfXXFOJ59x6iW9eEO=c016ga+az9A@mail.gmail.com>
Subject: Re: eMMC support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Sai Pavan Boddu <saipava@xilinx.com>, Andrew Jeffery <andrew@aj.id.au>,
 Edgar Iglesias <edgari@xilinx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 09:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello Sai Pavan,
>
> [ ... ]
>
> >>> The patchset is in the aspeed-6.0 branch :
> >>>
> >>>     df91d012672c C=C3=A9dric Le Goater - hw/arm/aspeed: Load eMMC fir=
st boot
> >>>                                     area as a boot rom
> >>>     27b75a7ad322 C=C3=A9dric Le Goater - hw/arm/aspeed: Add eMMC prop=
erty
> >>>     2836cf5a15a1 Joel Stanley - hw/arm/aspeed: Set boot device to emm=
c
> >
> > [Sai Pavan Boddu] I see you guys have implemented the boot area access =
here,
>
> The boot partition modeling fits our needs to boot the Aspeed machine
> but this is very custom.
>
> > I was assuming, your use-case just need to access data from boot partit=
ions.
> > We are not implementing eMMC boot operations or Alternative bootmode ri=
ght ?
>
> Joel could say more about it ?

The solution I came up with has room for improvement. There's no way
to tell the qemu sd device what boot partitions it should expect to
find, and likewise there's no way for the emulated machine to check
that the image is formatted in the way it expects.

If there was a way to add metadata to the image (through qcow2?) then
we could use this to define the boot partition sizes in the image, and
have the model use these numbers to populate CSD_EXT. It's only an
idea, and I don't know if qcow2 supports this kind of metadata.

Cheers,

Joel

