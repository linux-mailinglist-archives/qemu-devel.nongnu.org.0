Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4113F9C02
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:52:37 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJe9f-00007l-Bn
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJe86-0006uA-Gr
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:50:54 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJe84-0000ZY-Rt
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:50:54 -0400
Received: by mail-io1-xd29.google.com with SMTP id q3so9090672iot.3
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=DiRn87Cj7jwLcvAGfuwDJWSSvI8WjJliow20oQfxmEg=;
 b=f5D1WJriIScsXDwB/zqdMcQ6Eoq1aQXxktqFM+IivNdoWkJtYcDATuv0FCF9I7YwWu
 JdQRoVtbKLt94tl62cjMhzUZF52BPBwu6SpNehYNsyv0am7w2td5JyHmMwaDzGNOrnK6
 am9E/Lm++rUKoc7T0K9C15fbC6Z5KXV9vTDH9T1uZ+zVQmP7i+ZRrmQXg6Pqczc3lMrv
 tqn+n1Z4C4uWqtGATCXty3zGRdiCtZQ+eJkvkF4xeMcmxenhSW3eac33UA99nIe9gdfP
 +muxFpT8jqNp3Efq+nLSBDMeNh0YgybG3Xv+d/qmr8j4fDx6PY1CBjEoFADnPA4aH7o8
 QCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=DiRn87Cj7jwLcvAGfuwDJWSSvI8WjJliow20oQfxmEg=;
 b=l6aZqsjDdu3Z1rjaH2t2GALbKxj8nAHtsAtsM6VhwQzPvd4a2Sec7dVX1bZXWL7rSp
 OU8Cyzk8vZzky53YPc6GDVaa5FeUz0X+FkP/c2Da6oFouOAMUF0QaPhkd2nfh4doWbK6
 +bXdD/0bvscIHJYbhWXn4hh8i+IhvQkm0u9Tc0QnTpxUsUJucuPhXtmVZpkueo2ExWr3
 WWCxHVyk0a2UuUXJEPnBZztuM3uuZD7eRFgvxR6FWaB5VjqFlR0SzPMINU2SG4wLMbGJ
 cLLsT3ivYdo4h63qIUNyAzkHtTAcUezWYIJFAf9KtupYWHb7vbTfZqcAgGJ7g3maMvna
 iJhQ==
X-Gm-Message-State: AOAM533owZQVVg36sDJMNX+oztaY076wZ/0l/9f0evqkDkXU1CcQI42H
 Xk9YDkbLogAzQ/8ZdxEB4tvJ7A==
X-Google-Smtp-Source: ABdhPJzW2CMA/fdoLwAgOo9exryR5uZOB3CmIfMLOhoD7jwMSv0BstP0kMnzbyB2nMSTt4EVVFK0dQ==
X-Received: by 2002:a02:9695:: with SMTP id w21mr8616458jai.64.1630079451509; 
 Fri, 27 Aug 2021 08:50:51 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id t15sm3503602ioi.7.2021.08.27.08.50.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 08:50:50 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <B55EEB85-968E-4F60-A58E-17C4A07B57D5@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_4C29FBA7-B043-4410-A70A-96F3F6542605";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 07/43] bsd-user: move arch specific defines out of
 elfload.c
Date: Fri, 27 Aug 2021 09:50:49 -0600
In-Reply-To: <edb32fd4-023d-2111-d5ed-b02cdfebac82@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-8-imp@bsdimp.com>
 <edb32fd4-023d-2111-d5ed-b02cdfebac82@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=wlosh@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_4C29FBA7-B043-4410-A70A-96F3F6542605
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 26, 2021, at 10:19 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>> From: Warner Losh <imp@bsdimp.com>
>>=20
>> Move the arcitecture specific defines to target_arch_elf.h and delete
>=20
> Typo "architecture"

Thanks

>> them from elfload.c. unifdef as appropriate for i386 vs x86_64
>=20
> "un-ifdef" or untangle?

I=E2=80=99ve reworded to make it clearer what I=E2=80=99ve done: only =
retain the
ifdefs relevant for i386 and x86_64.

Warner

>> versions. Add the copyright/license comments, and guard ifdefs.
>>=20
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> bsd-user/elfload.c                | 81 =
+------------------------------
>> bsd-user/i386/target_arch_elf.h   | 76 +++++++++++++++++++++++++++++
>> bsd-user/x86_64/target_arch_elf.h | 64 ++++++++++++++++++++++++
>> 3 files changed, 142 insertions(+), 79 deletions(-)
>> create mode 100644 bsd-user/i386/target_arch_elf.h
>> create mode 100644 bsd-user/x86_64/target_arch_elf.h


--Apple-Mail=_4C29FBA7-B043-4410-A70A-96F3F6542605
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpCdkACgkQbBzRKH2w
EQA1KRAAgJL1cSWe7dIu0szb5QfwXpH0EobXabk5oU+rmjRs9qL6KFwCNCvxXbCJ
vJooW2bV83N0QrVVEy3pE0SvIC5CqhJbfccMukXhuZlWUtuVuibMc5yqhJxR0MHQ
lJTaLp9En93JUwhjNSGtZdMSsBWUNEkfmpnSh8TxPOLR+7zCSGWyiLznfZRrjbOw
Cc9isxo7iiDnmUfFssnXRduFGCq1RO4jUygYWKkGmbymjuvAeujKoMyTmXvJ2sD1
FVDf9bpMlFogtnLpx4LRelsd6u2kxqEd9TFBgsFdZA+TnU0TSMFu/cpGis3STEi2
1MYHqDHIUNiSla3Sd5rL/xHayYjTIB5hKiN5fPhoIhGWubRy3YRPdZv2ASbfrTvL
HQj7ykxd64GXHAl14f0Iu6XwUUupE3GNZkOVs/9/+BZi37mKlJKPZx10R14xmbmT
2NoQ0KiY6TrTuUKCf/axklj/+WjEOMVAnVqR4+9rG2jjQ7OxwAey61oCqWnZnfm8
6thfv96APZPB/BIVdBt6T/g2O1Hr4bYEhhY/hufRfdtENoAhj+wZuqodQkzvSq52
8h9BuIpC0aSg7TdPKk3AQW4VEWBdxYS4wSffV4mdi9vlKj2ZEP20/J9Koe6ewx0+
I/5sciruzsMIQiS4EwZ5hTXAo2R+4ws+fgXoZkFGRUG55EuB4VY=
=GtA0
-----END PGP SIGNATURE-----

--Apple-Mail=_4C29FBA7-B043-4410-A70A-96F3F6542605--

