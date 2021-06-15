Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E33A8BDF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 00:33:50 +0200 (CEST)
Received: from localhost ([::1]:47086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltHcz-0007PX-0o
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 18:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ltFND-0006gY-9M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:09:23 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ltFNA-00023N-LL
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:09:23 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 11so9039314plk.12
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=VJljp6VRTri+heGlcyWRDdmQvHh2CQnJaUumVt/QH9c=;
 b=qlO+JxDkPgM1R7IlRFQZfHSzx7FBQQNistzQI9QJoSj+NqUjvI4jzPEsUjUUMseeIX
 q2qHmhfnnKdWFEdjlOMWXHa7ZYvEkkKZW+8RUu/LjiomkhYnh65tryK3iCZPrQqt3nEa
 brr8NTM1n2d71erMYYys+to4veQ+ayzsqpw7b2oH04aVQAyEx1G9s1K1hHKKWF7a50qx
 c+wHimAm+O8SuiaRWG1IGLXYMq5KwUv2Q4D0JM4AEChMCnYWezSoOG6PqzCSuSKviciA
 /euJFr3Kxthkxja/cpjTZxs3cMWb4gOjxBMpiDKkQCsAGos5fQM/H7myr9WKLjUJwIfY
 h4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=VJljp6VRTri+heGlcyWRDdmQvHh2CQnJaUumVt/QH9c=;
 b=WPpiDQyvP9d4cV/gnzLW0rd2uzjsONhSXexLWONm8VximKs2D/D2PS7AePBdVGONj4
 jpmFuva0Xg9qdteH1snKBpnWNP7gjKsjSm/sQGmEQi1YXw1QR2De+Lb75CKDAfNiiNbp
 lIfWQfRliJHCS2sTB6w1Djd3evpTQjnYYQE1dunFG7DxTfzyn7TVGu3MvT3+2dW6MZev
 V3QHyqKSz5c6Q/anuHb01RAXYe1vPdyxPTFO0gx70ryjk/XNU8BIleQrDzbVFVvhjFJY
 272E+DRcPFpOT1L5VQAbKM8ZMWtILQOZJBRAaZ0H51rOm1wU28W6j6BtZxIfo2iWbo0W
 fUCw==
X-Gm-Message-State: AOAM533TC3NS5reEpHjwBcx04418GiIEF7+GfnMfNlO+Sj20TMqjinF3
 hzmFhZvit0WcvdkpOH8ADAnsGA==
X-Google-Smtp-Source: ABdhPJzVjxaT1GI/YzrS9M155pSu2UfzVNi6/Uy8zLMoAGNqW63UQwPKPzWvgCtqgpnfxBJ3QoezTA==
X-Received: by 2002:a17:90a:6984:: with SMTP id s4mr72243pjj.27.1623787758431; 
 Tue, 15 Jun 2021 13:09:18 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:55a0:964e:987c:81fb?
 ([2603:300b:6:5100:55a0:964e:987c:81fb])
 by smtp.gmail.com with ESMTPSA id l128sm17193968pgl.18.2021.06.15.13.09.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jun 2021 13:09:17 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <B111FE5C-A365-427E-A266-0928A4DAEFD2@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_0AE11C69-E0A9-4E60-8D3A-36B421D0BEE4";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] tests/vm/freebsd: Increase code coverage
Date: Tue, 15 Jun 2021 14:09:15 -0600
In-Reply-To: <8a1e344e-cc2e-9e4e-87f4-ed3119aacfe5@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210531100348.1655156-1-f4bug@amsat.org>
 <ccb9dd6f-e41a-1be6-b193-0ecad89b5732@redhat.com>
 <8a1e344e-cc2e-9e4e-87f4-ed3119aacfe5@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=wlosh@bsdimp.com; helo=mail-pl1-x62d.google.com
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


--Apple-Mail=_0AE11C69-E0A9-4E60-8D3A-36B421D0BEE4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 15, 2021, at 10:55 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 5/31/21 10:53 PM, Wainer dos Santos Moschetta wrote:
>> Hi,
>>=20
>> On 5/31/21 7:03 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Install more dependencies to increase code coverage.
>>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>   tests/vm/freebsd | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>=20
>> With or without this patch I got an error when `make =
vm-build-freebsd`.
>> It fails to install packages.
>>=20
>> For example, with this patch I got:
>>=20
>> < Output omitted>
>>=20
>> ### Installing packages ...
>> Failed to prepare guest environment
>> Traceback (most recent call last):
>>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 634, in =
main
>>     return vm.build_image(args.image)
>>   File "/home/wmoschet/src/qemu/tests/vm/freebsd", line 206, in =
build_image
>>     self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 255, in
>> ssh_root_check
>>     self._ssh_do(self._config["root_user"], cmd, True)
>>   File "/home/wmoschet/src/qemu/tests/vm/basevm.py", line 242, in =
_ssh_do
>>     raise Exception("SSH command failed: %s" % cmd)
>> Exception: SSH command failed: pkg install -y git pkgconf bzip2 =
python37
>> ninja bash gmake gsed gettext cyrus-sasl gnutls nettle jpeg-turbo png
>> sdl2 gtk3 libxkbcommon pixman libepoxy mesa-libs zstd usbredir
>>=20
>> Is it a known issue?
>=20
> I'll defer that to Warner, I suppose the package repository got =
updated
> and I am not hitting that because my VM installed them earlier? =
(Similar
> to the problems with Docker packages). Is there a way to use a =
snapshot
> mirror of FreeBSD packages?

I=E2=80=99m still trying to replicate this, but I do know FreeBSD=E2=80=99=
s packages moved
from python 3.7 to 3.8 by default recently=E2=80=A6.

Warner

--Apple-Mail=_0AE11C69-E0A9-4E60-8D3A-36B421D0BEE4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmDJCOsACgkQbBzRKH2w
EQBeqA/+M+oT8CCcx/hiwUQbw16LlZl/6QEQDwFX3iVGaCA0QAupv5A98OWQpnt2
0vIbxa5BbqPv7Vs+7hMN6nOKOhuqEWU8fWc1OtTeUKUnwcJi+VjbxmlpaTd81ifv
YiLcjoOlapFIRAtrSX2Wmmk2ZtBsGzLgVcBnHI1RFleq1ZgScImVB8J/DPOXLP2r
qECkx0LQzH2XiZs4dxnCTWyLajrQ6uh+6H5CIVrSo1DyX2cHnq/6haXdLPWk2M/+
gH9OTNgIG+MVq/YGtPHxC3LU/31T/0D4217Z0womaI1BlQGo4eHj8EN3sTMeFok+
yJNkro2w7tw9ExkWKj9FfsvWijF9X6d8zIhpJuUkHJTap3wd0HGUlkP0za8XJptx
HeGftBEVVNItdhAz/iaGleigl/w8A6AVYTlzkQPNKhNRIxR1oYNr2kty1HBFbqB8
Hm1TaeDtWJ7yUA5Yeu4uEmLcgNqAvvf0HyrYf210SGw3dAmyRNrIedQJyQdYI7iR
Q2NydXev5AbK+/gU9MriAxrViQ/kcTGLb/Ogeci5DuxTaKdiqeZkbQ1dQUbdsGjl
5wKw7J1XY5K87hIbc4caoNMWVUwuonFcMAGyMAwAX8+Vwuopx+Kp/s8U+4qg43sf
rPBfF2/hEXdAHwXAQDTfTeaYTMo5jYV6+dJf8hVpuPmMEujexmM=
=j0xu
-----END PGP SIGNATURE-----

--Apple-Mail=_0AE11C69-E0A9-4E60-8D3A-36B421D0BEE4--

