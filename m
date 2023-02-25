Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A76A2B0A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 18:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVy7z-0005S9-QO; Sat, 25 Feb 2023 12:14:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy7x-0005Rd-QE; Sat, 25 Feb 2023 12:14:29 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVy7w-0007cA-88; Sat, 25 Feb 2023 12:14:29 -0500
Received: by mail-ed1-x532.google.com with SMTP id o15so6957241edr.13;
 Sat, 25 Feb 2023 09:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxzpJxkSp+OFEod8eTZGAWaMHgfZsuWv+jFovRZwnQs=;
 b=pDs9OSMOF7IL20qPFM2kDSuKbdUeMnQMvkTnkvdW9V/cznXh5iz7WMD8MNUIEI3QYf
 ARbWjhQgmOUv8ML479ohqcMR+ZDKbZyrPBi1exs6ybHue2HC1CZux0MqhEe3SAIWKgw1
 IP/iEaOUSrlVBxs1+PW43cuJiD5KsBubZ1IjjVqaKinrmzFa2BHNLulNmrEvPyJwRCTg
 5uiZBSL3NcaPalK5Jj3PdmwpTF2w8bR/WctyBejhexYBhpQJYURoqZ05xIzhQs5PAChg
 C/QBq8MlirHIizl4QScbF6n30N9kvnB9/5joKo1s/CPopICnIv0ePb9y7logZ3kICgQx
 H41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZxzpJxkSp+OFEod8eTZGAWaMHgfZsuWv+jFovRZwnQs=;
 b=y+lsjycCmKUzCyUefe1EW0jRLR3uypiMc3Px1zZHQIgBaEjiX1QJVA7AvHHqMPrAA/
 az+PvDnhmtDjY5R65ryjGjfKO+HiJfWJ+Skna7WdErzYzyz+eah7wpAyZfZJgEGPJZOH
 zDqa/BpAQFOMnIKta90VbeWCF5VcJI9BgqxWe15DioIwOWFBa+np+iLkAavAXzRq9rXJ
 7TH+CGvlhGIltpyG1xSUhPjklXZMrSoUb7ze3Xh69pcvStWYE/upEKD5An17i/Ti6AOJ
 wpzJpyCixZ3KqmYDf6eDV/bGSAP9I/b2XtNsdDRyhOiGDj6pgObppNtSD2OSL1bIBOL6
 1SoQ==
X-Gm-Message-State: AO0yUKWUk8cBR4Wohb7M67TkiBftAhn1MG10oQHIkz4BREuqZYpBmBsR
 8Iwu560nwLTLEZnlbnZgBio=
X-Google-Smtp-Source: AK7set/RMO6o8iHcSjUh25v68yZxrHhXexWHSwpfUc5rV5fKRJiGFwH8qY18iiFhhfcBDreMHoYUGA==
X-Received: by 2002:a17:907:2149:b0:8aa:6e27:103b with SMTP id
 rk9-20020a170907214900b008aa6e27103bmr23963348ejb.67.1677345266091; 
 Sat, 25 Feb 2023 09:14:26 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee00fd6c518ad556fc73.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:fd6c:518a:d556:fc73])
 by smtp.gmail.com with ESMTPSA id
 qq10-20020a17090720ca00b008cb7473e488sm1040684ejb.12.2023.02.25.09.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 09:14:25 -0800 (PST)
Date: Sat, 25 Feb 2023 17:14:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/5] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <alpine.LMD.2.03.2302251409090.2738@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-3-shentey@gmail.com>
 <a9efb349-e2b9-1ece-cded-ee500457f1cf@eik.bme.hu>
 <83759E2D-1871-4D26-906A-F9112990BDFF@gmail.com>
 <b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu>
 <D6825370-F3B7-4FF0-9C91-3A7B1755D989@gmail.com>
 <alpine.LMD.2.03.2302251409090.2738@eik.bme.hu>
Message-ID: <7C9B21F7-7805-4C86-A865-99434297E2A4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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



Am 25=2E Februar 2023 13:12:05 UTC schrieb BALATON Zoltan <balaton@eik=2Eb=
me=2Ehu>:
>On Fri, 24 Feb 2023, Bernhard Beschow wrote:
>> I can only take the three VT82xx patches as I proposed since I don't kn=
ow the Pegasos2 board as well as you do and I don't want to iterate on any =
review comments for the other patches=2E I'll send my series soonish=2E
>
>Does soonish means still today? Sorry for being impatient but I'd like to=
 finalise this by Monday so to be able to rebase my changes and make it ava=
ialbe for testing as soon as possible, still in the weekend as people won't=
 have time on weekdays, then we should need the final version of your alter=
native patches about now=2E

Sure, respin is out=2E It's so fresh I can't even give you a link yet ;)

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan

