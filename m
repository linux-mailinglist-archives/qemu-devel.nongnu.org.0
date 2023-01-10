Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E2664F9B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 00:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNih-0006Wa-Be; Tue, 10 Jan 2023 18:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFNif-0006WM-Bh; Tue, 10 Jan 2023 18:07:49 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pFNid-0006Es-Ac; Tue, 10 Jan 2023 18:07:48 -0500
Received: by mail-ej1-x62a.google.com with SMTP id u19so32542549ejm.8;
 Tue, 10 Jan 2023 15:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yhzDadNnqRN37FW7Pnkv9sJDfct5eDyIDGgrVAzlkcs=;
 b=eKh0t9Xr5GpLSemHlDYsAjADXKNQRW6LZldPj/GjebzFEJ25CN/e27kU8I51PSWiM1
 OEkP3SC2JyFik6VMQlY2gB6tOEvobtTnRCjYPMczbaaf7q+8m7vJ1LsARiP3NmiNx0JN
 aMuB/lMx8gDWWGYYGpge2UNhNNIMLs6WHvU7WaRmhK1eFQl+AJgoIseh+Tzg6vhQzN7e
 fPl6hpNrefqssajlW3j1pvFgBGTQQW1chNtd1p0UJzlV8uUQvD/IgqkNP5DBtzuaHlA5
 nEStOlxze6yQIjY6+md0hJGv7t6ItDXd0fX2K2KSEplgU3pFc/Xgs44PmBn7zqQ2rbfU
 8efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhzDadNnqRN37FW7Pnkv9sJDfct5eDyIDGgrVAzlkcs=;
 b=fMS0YnH7HIrptztwVcOhVHSvpWPBdeyqrm9bFnIfqxxARSSnC15MwpQP9ikJhAuJcq
 fu5FfeIw6Xavzg1jgVn+K4LCF9jGrpgNAgBFA5SVGnHPu8a1pjR7O7Hc5QUNFhNDwF/z
 CgdEvOnPgku6zdD+JeeQEhHcShxmMXWijh7lioLCOm1jr/o5UFAJhE5Hhc9got/QFeLL
 Tcw6lJqKZadc8OvtOKb+RG1EZExq6aPlpacdodMTfriclaYCiBmtQjYwNEmmihuayw4+
 mGBvxqfCD9DPbrfWFbEhqYC1hdyD60Y1q9/a7adY0omHhZsaMckiZayCY7Vj9bz5jGRt
 +6sg==
X-Gm-Message-State: AFqh2kr35uvF/3jCIpUC9+w/1t/2a6G2IbolpdjEiOZvxXBbao2Xi7Ak
 wFDXSsvmsj6WrjvYJoesjug=
X-Google-Smtp-Source: AMrXdXuugN1Tq6/cZnUMgXdOZiGUdyKJxiFlq2c4uRxibwgtkGbBofbttqeQJLVC1zQQcUvDgZa6+A==
X-Received: by 2002:a17:907:8b09:b0:7c1:6e82:35fc with SMTP id
 sz9-20020a1709078b0900b007c16e8235fcmr79654724ejc.40.1673392063713; 
 Tue, 10 Jan 2023 15:07:43 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-208-176.92.224.pool.telefonica.de.
 [92.224.208.176]) by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b0084c90164a56sm5488904ejd.29.2023.01.10.15.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 15:07:43 -0800 (PST)
Date: Tue, 10 Jan 2023 23:07:40 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: John Snow <jsnow@redhat.com>
CC: qemu-devel@nongnu.org, Liav Albani <liavalb@gmail.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
In-Reply-To: <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
References: <20220219080818.327683-1-liavalb@gmail.com>
 <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
 <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
Message-ID: <59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 9=2E Januar 2023 19:24:16 UTC schrieb John Snow <jsnow@redhat=2Ecom>:
>On Tue, Sep 6, 2022 at 10:27 AM Bernhard Beschow <shentey@gmail=2Ecom> wr=
ote:
>>
>> Am 19=2E Februar 2022 08:08:17 UTC schrieb Liav Albani <liavalb@gmail=
=2Ecom>:
>> >This is a preparation before I send v3 of ich6-ide controller emulatio=
n patch=2E
>> >I figured that it's more trivial to split the changes this way, by ext=
racting
>> >the bmdma functions from via=2Ec and piix=2Ec and sharing them togethe=
r=2E Then,
>> >I could easily put these into use when I send v3 of the ich6-ide patch=
 by just
>> >using the already separated functions=2E This was suggested by BALATON=
 Zoltan when
>> >he submitted a code review on my ich6-ide controller emulation patch=
=2E
>>
>> Ping=2E Any news?
>
>*cough*=2E
>
>Has this been folded into subsequent series, or does this still need atte=
ntion?

Both piix and via still have their own bmdma implementations=2E This patch=
 might be worth having=2E

Best regards,
Bernhard

>
>>
>> >Liav Albani (1):
>> >  hw/ide: share bmdma read and write functions between piix=2Ec and vi=
a=2Ec
>> >
>> > hw/ide/pci=2Ec         | 47 ++++++++++++++++++++++++++++++++++++++++
>> > hw/ide/piix=2Ec        | 50 ++---------------------------------------=
--
>> > hw/ide/via=2Ec         | 51 ++---------------------------------------=
---
>> > include/hw/ide/pci=2Eh |  4 ++++
>> > 4 files changed, 55 insertions(+), 97 deletions(-)
>> >
>>
>

