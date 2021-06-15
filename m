Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F93A8BE0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 00:35:19 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltHeP-0000bl-Rr
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 18:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ltG26-0000on-8Y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:51:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ltG23-0002uO-Fr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:51:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id t17so91574pga.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=w6O3KsIYEDj6l3zMpesXbuFfbtl5M/ItfoN4KwxjFNI=;
 b=ZZeqIPvztK/qN+TW1hTzpjqiWFO0O2ugHt/sQ87JjBHiuqWlq02tRWeUrvac6TeaBM
 eUsVb9NhlS8m7q6Dn6Rc5AlJvYPYswcSf9gHvP2Z0k8cPCZrlJxGf0jwC/+iC8q2J3wV
 NKwa9HJ3EWL8vk8haKlCjR6kXogx9kZgSY0kqO2CeDQ8lB4a3MwSQ6ZC40NYYq5Ah85I
 tpUQ9CX67wi8dJkAiAAcc2NGVqPj6iFFzCdWlsC1jA+t4f8BZjtc3A0PVG7THe4ir6QP
 SlVHgUBvvbHr6i71bSlJKFkTossJP1TY517iH+KKWYEZ0AxaBnErpXjd0rWZM76++qUg
 djRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=w6O3KsIYEDj6l3zMpesXbuFfbtl5M/ItfoN4KwxjFNI=;
 b=MInqP/I7gg5PLIxesOISkew14577M36h9UbwCQTEqgYqjlz2O4jNLkSk0vRnHtKZUA
 AiCHwyICdYgBEWZXmiD4sIfSSuaQn81yFNnUmgVVi7OfqHvKEXfCDoZESkCU34bnEV6i
 XG3ExITfaOCtGnehg52mj33mscYDXGyl5WC+cZWlfrZ0mr1gAu6KAIMksf0ufLyDnRsd
 m0N1ck1Ivz+LmH/xuvFKHlSkxlqQTuZfl3Kt5nSyY61IrNge+4PCtZGuschwvGD1/wC+
 pV0pdGtueORjcQeFkvKnPK6xtWLq5nBsRdlC618jZJGuKOyM8suR/J+UbWpBagsHcah/
 G5YA==
X-Gm-Message-State: AOAM531j4rgTofX5CsPZ1woH42Q9DUvhbib6wWsRWA7sIR3b/jwaQtG4
 mYVnOD/Jb9yAKC8XwSzOkLnRDg==
X-Google-Smtp-Source: ABdhPJyTUSmdGDF7FzpmONGyyskk7YhaGJXG146I5Vt4AOmsTFQDOFKDCORBpniumtdy3q7bkvV8CA==
X-Received: by 2002:a62:7cca:0:b029:2e9:c89d:d8a9 with SMTP id
 x193-20020a627cca0000b02902e9c89dd8a9mr5954989pfc.55.1623790291158; 
 Tue, 15 Jun 2021 13:51:31 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:55a0:964e:987c:81fb?
 ([2603:300b:6:5100:55a0:964e:987c:81fb])
 by smtp.gmail.com with ESMTPSA id r6sm3276097pjm.12.2021.06.15.13.51.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:51:30 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <6072D4BB-9FF7-4475-868C-77906F32C7CD@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_5239587F-0427-4E96-B321-F63883BBE206";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
Date: Tue, 15 Jun 2021 14:51:28 -0600
In-Reply-To: <B111FE5C-A365-427E-A266-0928A4DAEFD2@bsdimp.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
 <8a1e344e-cc2e-9e4e-87f4-ed3119aacfe5@amsat.org>
 <B111FE5C-A365-427E-A266-0928A4DAEFD2@bsdimp.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=wlosh@bsdimp.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Jun 2021 18:32:09 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, wainersm@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_5239587F-0427-4E96-B321-F63883BBE206
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 15, 2021, at 2:09 PM, Warner Losh <wlosh@bsdimp.com> wrote:
>=20
>=20
>=20
>> On Jun 15, 2021, at 10:55 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>>=20
>> On 5/31/21 10:53 PM, Wainer dos Santos Moschetta wrote:
>>> Hi,
>>>=20
>>> On 5/31/21 7:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Install more dependencies to increase code coverage.
>>>>=20
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>  tests/vm/freebsd | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>=20
>>> With or without this patch I got an error when `make =
vm-build-freebsd`.
>>> It fails to install packages.
>>>=20
>>> For example, with this patch I got:
>>>=20
>>> < Output omitted>
>>>=20
>>> ### Installing packages ...
>>> Failed to prepare guest environment
>>> Traceback (most recent call last):
>>>  File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in =
main
>>>    return vm.build_image(args.image)
>>>  File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in =
build_image
>>>    self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>>>  File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
>>> ssh_root_check
>>>    self._ssh_do(self._config["root_user"], cmd, True)
>>>  File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in =
_ssh_do
>>>    raise Exception("SSH command failed: %s" % cmd)
>>> Exception: SSH command failed: pkg install -y git pkgconf bzip2 =
python37
>>> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo =
png
>>> sdl2 gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
>>>=20
>>> Is it a known issue?
>>=20
>> I'll defer that to Warner, I suppose the package repository got =
updated
>> and I am not hitting that because my VM installed them earlier? =
(Similar
>> to the problems with Docker packages). Is there a way to use a =
snapshot
>> mirror of FreeBSD packages?
>=20
> I=E2=80=99m still trying to replicate this, but I do know FreeBSD=E2=80=99=
s packages moved
> from python 3.7 to 3.8 by default recently=E2=80=A6.

It=E2=80=99s not this=E2=80=A6 I=E2=80=99m seeing inability to pull from =
the pkg repo, I think, as the root cause=E2=80=A6 Still unclear why=E2=80=A6=
 Sometimes it dies part way into the download. I=E2=80=99ve not yet =
worked out why it gets to different spots different times.

Warner

--Apple-Mail=_5239587F-0427-4E96-B321-F63883BBE206
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmDJEtAACgkQbBzRKH2w
EQBJ3BAA3nkBlTjL2cEDQSpm6ouW/SEi5XOaHnJCvEevGs9GE4ddH/IGSdN5i/oS
4s3UMulimDAeSSu4J4hvSl5iq3Kn3KCGc+Hvrg3htyLeyRe/9TMYEqt27DKbzX+5
6zyaFOFedt+mkp3Y+2SBGjKtl/qvWxQzWnp2ogHLGK4DuMnUjeeybClkhXkw8an0
mWo9jjGOP1cISf0UMrfzIOf3uVSLoSPsn1ICPdRr3LisbEnIlONsHCi4JIY39i8z
0xiJ8yPtKSlgoMP1GfTmG+j1BjUvYkyH1+T2412SCl10pwqTWz4kUNmBYNzxqbGu
pPAnk0c860A2YISJ1/vnppkhsNDFgMnZxAUz+X+Oq+tpKIx90l1r45446qWBj/88
dfecLBxjtAxjyxHkga98iqOURE6BW1zHM7aOHZF10vBRUXq7JuYtPGfbamxve3Kw
k1umrFUQtCT0ReKL0X2Qtp9kiVyelPo3Esf6fYXdUuKCyKGtWg4hT5RjcAMRSYeq
WqqtYPsevOM+ETXhrsg56L3NTnVSdrMWcarMVa9N+otGgAS94nUBI0EwCM410Y4X
TZW2VVQHEHKTCXcmPKOOylC/ssqBdYyBfF8uUcLNuOT62Irdp+FJXiQ4MW15D+xq
XLh1Ahms8ZIfJQn6eEerkRRpwTlX2WBJ0SUZJ/0rOgLLqjN/C0c=
=sRro
-----END PGP SIGNATURE-----

--Apple-Mail=_5239587F-0427-4E96-B321-F63883BBE206--

