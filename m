Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4C48C520
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 14:53:24 +0100 (CET)
Received: from localhost ([::1]:57160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7e43-0006E1-1P
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 08:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n7cfn-0001E4-GV
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:24:15 -0500
Received: from [2a00:1450:4864:20::52a] (port=40789
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n7cfl-0003s0-OW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:24:15 -0500
Received: by mail-ed1-x52a.google.com with SMTP id a18so9244796edj.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=09CUBBuzUJFSOWkHG1pWqHEf57pLN1+upuvzSL5sJ0E=;
 b=yTKJbN4le3O3UhwGNQH0CB7Ypywj4b/6iHmYhhVom4Rpx6zhb7fvXiixQJJT584e4y
 gsFiHTM9o/LwkutokZ0Jlb+PDhTTLJB2Yzy6ktNCmQHR5ytoMlikRTQKYe4T5bKOnuNL
 AYZ0WUgGYIH1+WsTJrbOS4mEcTPm3b8X604St/e+bmyBbus3jD6Wk+c/R+Z/u/4QKz3h
 csrNANtRRWfvI8xYKDNqDuGCl4rXVkKEyANXFN9LnTjZBhTdDEIyEz3UeGUktnb12HWn
 rRPz2Wvb8xIph5UAxC3S/VeRGH54ZL5gZ5VCALg49u+BXU0cRIeT/BqZCX0cchXTWMXz
 sHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=09CUBBuzUJFSOWkHG1pWqHEf57pLN1+upuvzSL5sJ0E=;
 b=d9M1fLW7SWBuuBhpgka2kbKICEQMjfLJHOrHHqAf+cUPGxeICo3GcAsn1TVSTcqn3O
 RGQgdJKRe+PPe7YFscPbiC5cmceCqzg7S85dJ8/jWKJ/UaHUWOJmHzFlYadJu+OgX8z7
 lZN2ApQd6QrT3wTGxSV69ItkdVRnn5B57cJmncbw8eptuoFRuYxigjQQ0wPQrvpgKUwq
 ks3BnhfcJVPz1md0jWH2XK6/NCfTNoFTX2N1APojdYnx5kzaa5WgYqkRSzGzpa9q0iXC
 PGImGkKEn6KeC8u1GHvDeuzX1Qa3SiUQH7wpF+crNjlZmt1UVzV3FbjezInJR8QdppFF
 BcVw==
X-Gm-Message-State: AOAM532iCN3OGTRYmX+5QDJvTVemZKngPGqB4UOqhjk2uxawhvK6fb82
 Azvm9k4vKUSXCNdjjWhYtlInLg==
X-Google-Smtp-Source: ABdhPJwjFkBI2eIwAm9sJNTlRcYUGIcah/cUQ3BwmvitT0CKHie2sLDeVE04o9ILou7DB2yCdhr4Hg==
X-Received: by 2002:a17:907:6d1d:: with SMTP id
 sa29mr7394163ejc.278.1641990250559; 
 Wed, 12 Jan 2022 04:24:10 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id c12sm6288450edx.80.2022.01.12.04.24.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 04:24:10 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: /usr/shared/qemu binaries
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
Date: Wed, 12 Jan 2022 14:24:09 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52a;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 11 Jan 2022, at 00:55, Alistair Francis <alistair23@gmail.com> =
wrote:
>=20
> I would expect them to just be referred to by QEMU internally.

I checked and there are indeed several files referred internally.

> My guess would be keep *arm*/*aarch64*, keymaps, npcm7xx_bootrom.bin,
> efi-* and linuxboot*/multiboot*.


To start an Ubuntu 18.04 only some efi-*.rom files were needed.

The linuxboot*/multiboot* seem to be specific to x86.

>> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-aarch64-code.fd
>> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-code.fd
>> -rw-r--r--   1 ilg  staff  67108864 Jan  7 14:52 edk2-arm-vars.fd

These are the top 3 largest files. They are referred as =
"@DATADIR@/edk2-aarch64-code.fd" from the JSONs in the firmware folder.

Any idea when are these files used?=20


Liviu


