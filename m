Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F1538877
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 23:02:47 +0200 (CEST)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvmXF-0004EN-S3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 17:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvmUm-0002bW-Ca; Mon, 30 May 2022 17:00:12 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvmUk-0003La-Uf; Mon, 30 May 2022 17:00:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x17so7057582wrg.6;
 Mon, 30 May 2022 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=j+LNb3AW6qPqPsw248a48oDxCuHb1EqC8yS+mWaN6+w=;
 b=UotWSFmxgiGbz8lo4VBHe5SE0ylneR631bz8CsommG2XV485+92ccEgR29CGULoXxd
 f27hVlLRa3fvz/XkRGiB6JeLhT7uMTLQDX12cwzkGg7VPeZWVwkX9g+n70HG/z0vduoa
 wcceX9LSV8JVff4kOrFabY3HpEqjjbZ9+92vOv2aEr6P5CRWSC3KiFPDZ6zr9ud1q88W
 kVWkEpEgIYcwbxfkRf1Ov5yH0c4xqovCpDUvBXhL8RL4Q/lUGkp78XcSVOS8bWTW+AUw
 fTdG15T3cBMM8pkWHvFYFeuZQrjpDcj2uLwoU6VXP84+X/C237eV8FPphZCbI4dAZrSA
 sN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=j+LNb3AW6qPqPsw248a48oDxCuHb1EqC8yS+mWaN6+w=;
 b=R7JMk5yqqMg65TvjAQxVDAAJyVkXyNYXeei0UKV6Y+QM/728QGf7Kb5ifoJtfs75VW
 nINRKV+mOvO8C61ZOJzIQ+FVAdzYpNvIIwK0I1RB3omuKKFpoXywT1Pkldkf8/Qm9kMs
 YAa2l9o80ExQcofDNg/EXBkyv5B5y6LRbciKdt8Djlj0KWD9l9nZXJf20cI0MhEk+iG0
 +9A1me9Dr846iV8Bupn34MJt/SbGiCZXx6o05DQ56j/zk2KZwqEcs61GaTdNpAAMMB8N
 uPVaIYY8PtFqXBChuqTvZ+Fc6iS4F8iI4Q00VDy1Bcd5G6SfI41zdn95GXyc/w4CAOKp
 ThVg==
X-Gm-Message-State: AOAM530l6WvCE4JkC+9K/k5xqJxIjMai77x5qySaf9I7JSk0BUHs6NfW
 xiA2xE/Tbxhd3NPFIrc3gGg=
X-Google-Smtp-Source: ABdhPJz7yaeyg7WY7xalYnbo+nbbuwd1td6x/VA9zf4P9Ui9kYKVycVrwkbUltEw/bm0R1EZatzQjQ==
X-Received: by 2002:a5d:6943:0:b0:210:2f76:93ff with SMTP id
 r3-20020a5d6943000000b002102f7693ffmr7614483wrw.377.1653944408604; 
 Mon, 30 May 2022 14:00:08 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d00ad33f34241f66c9c.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:ad33:f342:41f6:6c9c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b00397402ae674sm391738wmg.11.2022.05.30.14.00.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:08 -0700 (PDT)
Date: Mon, 30 May 2022 21:00:04 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_4/7=5D_hw/isa/piix=7B3=2C4=7D=3A_?=
 =?US-ASCII?Q?QOM=27ify_PCI_device_creation_and_wiring?=
In-Reply-To: <8a1584fe-68a5-9176-f8d5-c4ed2d9f745c@amsat.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-5-shentey@gmail.com>
 <8a1584fe-68a5-9176-f8d5-c4ed2d9f745c@amsat.org>
Message-ID: <FF9408A7-883D-4666-9F07-5597A9139651@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 30=2E Mai 2022 13:17:12 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4bug=
@amsat=2Eorg>:
>Hi Bernhard,

Hi Philippe,

>On 28/5/22 21:20, Bernhard Beschow wrote:
>> PCI interrupt wiring and device creation (piix4 only) were performed
>> in create() functions which are obsolete=2E Move these tasks into QOM
>> functions to modernize the code=2E
>>=20
>> In order to avoid duplicate checking for xen_enabled() the piix3 realiz=
e
>> methods are now split=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix3=2Ec | 67 +++++++++++++++++++++++++++++++++--------------=
---
>>   hw/isa/piix4=2Ec | 30 ++++++++++++++++------
>>   2 files changed, 67 insertions(+), 30 deletions(-)
>
>While this is the same chipset family, these models are maintained by
>different people=2E=2E=2E Do you mind splitting?

Will do=2E I'd split the whole series then=2E

>For PIIX4 part:
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>


