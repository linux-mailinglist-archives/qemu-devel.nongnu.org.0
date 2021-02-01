Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C430AB97
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:38:55 +0100 (CET)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bHy-0007sm-TX
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:38:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bFq-00061R-9T
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:42 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:38199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6bFo-0001wB-LJ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:36:42 -0500
Received: by mail-qk1-x730.google.com with SMTP id d85so16591279qkg.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0KJValy1cbvnEfUavVgK0/avBrvTW2LxzI+7mR8AjEw=;
 b=bI2KoWxGNgYhJD7CDFjKPgga8nIZ0i+d6dSvyauZCyahNy5c39ilCgRhDaxLWnMFAe
 DctDAUazSXJNA32G9AmWqMJN4JLtI0HeLmtFgxbU1h+D1mfSytCReZX2juS4K7jPMVAt
 3WFswOmmnlBZWGNmesjGt0Z+yhBJJfR/rB8LMnz86pD3xAhBb0RryGITf5vHPQhmehyY
 Cc4T2V4YGwspNudcjlfPIFI2yWBovpxfd9SMPOAT3rcKgvasKXwHI7+QV/hrFnGEc2js
 pvV7D9Cnx5oyTyyZLd2CzgeZ0GpBgalVpkoLXYIiQHtcxAG1GNj9IknSyF6nmdS1iN8c
 Jjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=0KJValy1cbvnEfUavVgK0/avBrvTW2LxzI+7mR8AjEw=;
 b=SxVvwKxv0o3hHmn21OtxwWfIU7ClcXDzsyMbwEJIp3shaDHAK6inaTc5BNm719rgFX
 u40VMAtPxKgZgg8Ao+J1eDRPOZdkO6zkUq2eklbcydrG6eOaM8FksKQ02Eg6QjMYb2Ax
 Ojxmya0eMVGYdmRuCAZQ57cFP2lz3MJVSaZVhmf2aSuWwFE0/v2TSIA5zmcoYyVDDNSy
 ZZVAv8yrHR/xoDqOIgj+dBFA4J5C6zprhymdL+v4O0S8nAfrnNqDqfofCHxUSwimICEh
 F12Ha2kVZFmk6MWgeruGURVEUmnwnjHlqqucMSEP7Ghjv/irROs9O+b+clGVp3yPtPTW
 f0Rg==
X-Gm-Message-State: AOAM530HsvYdHXGQrOU9u14+U224DYZrU9pbkKVBDcTpmU/Z49et+4wy
 An06eXXMfZN8go6BqMXBiHY=
X-Google-Smtp-Source: ABdhPJyYGj9mxcC5RPLePqipRr+yyXE7KqMrIL33LjAm51Mg1fHm2yRp4mglN7ZWNb3VzPCDI8cAjg==
X-Received: by 2002:a05:620a:24c:: with SMTP id
 q12mr2433735qkn.203.1612193799781; 
 Mon, 01 Feb 2021 07:36:39 -0800 (PST)
Received: from [192.168.0.16] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id v145sm14820648qka.27.2021.02.01.07.36.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 07:36:39 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Makefile has local changes that will be overwritten
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
Date: Mon, 1 Feb 2021 10:36:38 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <03FB77FD-2C50-40E5-8BE3-2F005D5056AA@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
To: Stefan Weil <stefan.weil@weilnetz.de>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ddstreet@canonical.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 1, 2021, at 9:58 AM, Stefan Weil <stefan.weil@weilnetz.de> =
wrote:
>=20
> Am 01.02.21 um 15:23 schrieb Programmingkid:
>=20
>> When trying to build QEMU I see this error:
>>=20
>> error: Your local changes to the following files would be overwritten =
by checkout:
>> 	Makefile
>> Please commit your changes or stash them before you switch branches.
>> Aborting
>>=20
>> What I do to see this error:
>> ./configure --target-list=3Di386-softmmu
>=20
>=20
> I suggest to start with a clean installation (or clean your existing =
installation manually, especially remove the generated Makefile) and run =
configure from a subdirectory:
>=20
> mkdir -p build && cd build && ../configure --target-list=3Di386-softmmu
>=20
> Running ./configure is no longer supported.
>=20
> Regards,
>=20
> Stefan

Thank you for the suggestion. I tried it but didn't seem to help. I =
should report this is what I see when I try to build QEMU:

Disabling PIE due to missing toolchain support
error: Your local changes to the following files would be overwritten by =
checkout:
	Makefile
Please commit your changes or stash them before you switch branches.
Aborting
Unable to checkout '85e5d839847af54efab170f2b1331b2a6421e647' in =
submodule path 'dtc'
=
/Users/john/Documents/Development/Projects/Qemu/qemu-git/scripts/git-submo=
dule.sh: failed to update modules

Unable to automatically checkout GIT submodules ' ui/keycodemapdb =
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc =
capstone slirp'.
If you require use of an alternative GIT binary (for example to
enable use of a transparent proxy), then please specify it by
running configure by with the '--with-git' argument. e.g.

 $ ./configure --with-git=3D'tsocks git'

Alternatively you may disable automatic GIT submodule checkout
with:

 $ ./configure --with-git-submodules=3Dvalidate

and then manually update submodules prior to running make, with:

 $ scripts/git-submodule.sh update  ui/keycodemapdb =
tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc =
capstone slirp


