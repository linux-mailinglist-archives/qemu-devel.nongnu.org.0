Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460223B3397
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 18:09:55 +0200 (CEST)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwRvO-0005WP-3U
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 12:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwRuP-0004Uj-GZ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:08:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1lwRuK-0003Lk-TA
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 12:08:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 s17-20020a17090a8811b029016e89654f93so6226305pjn.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 09:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=NJa21YjSWDPM4+6/8NLGoCb3NFkSfamvuFHoC4J7Nes=;
 b=g9H2BDwrTIWpEJn4IzTqq+5dRrKqRsbiBq1XWbnJuLWZ+E+r+cLXJgvBro/a8MHtRx
 1hJDpYoewNScuNJvRfx4iHxqu9utKO/RevM0bolboBF2e7ksVe3Xghtz7PAOSv1xNuiK
 ooDfM4lhstgDjCJinJ7fL3/FPKNNwtlVrWsu+0yza1rGW/os3XCgwsk3S07QTS0nj44l
 3xjdgJO8g1xaWe1F+rrsAmPSGV+3cpJB62I/+DULpf5c/SdtwunyLpwKUwrS+klCT4wa
 C6YXlMBHzCodMZrRsb3BzbMPq1Bu1EwpoIHjI7ZLLaVQqUkzPycCuCbyfktuJPvDHmEb
 KeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=NJa21YjSWDPM4+6/8NLGoCb3NFkSfamvuFHoC4J7Nes=;
 b=c2bItzHWhRggNOClSy24EyGDx18tM+Ua4ywtQ94uiHqibsTX06YGg6z91H/JWLMC+d
 tn8F8j/IiC5+ldG1SC6UHn4PNh/kjrIpW+E75YxxNMdPB48eOk3j2zpCMI0WCphSdl4x
 VG6rFQXET/f2imE2reMBbuQfkKeopjAYfppfFyNFa4JvBWlYJ1ceIYihNhc5CPkcJR5Z
 FnaDOlcKgOHZgCnmvE+nihudd323rAPWBH1adQ1Fjeh1h/V+KBYQOpdd7m62MOsePZbs
 s6xf1X6ks9EpimRGibfubmmXNESUMIHe8SHe8orS9QP825fFIVTu5o2WhSpQDv4ne205
 1FOg==
X-Gm-Message-State: AOAM5324UWrROqiIJox6odjJMifMd4LA1cp5107gbTMvEx0WTLdZ3on8
 lPm3eHklhtzVCEIfeWqBzrGdaw==
X-Google-Smtp-Source: ABdhPJxXX+RH6WAWIyXPAfgyOLGRxHNUzETosMx1asMUpm0Nw/79YrhNBq8Y8oDgcZaC1fQujbZcEQ==
X-Received: by 2002:a17:90b:2504:: with SMTP id
 ns4mr3037641pjb.140.1624550926331; 
 Thu, 24 Jun 2021 09:08:46 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:e86b:acdf:b62a:76d6?
 ([2603:300b:6:5100:e86b:acdf:b62a:76d6])
 by smtp.gmail.com with ESMTPSA id go16sm7185357pjb.42.2021.06.24.09.08.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Jun 2021 09:08:45 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <F7D2C240-184F-4FAA-B4AD-13B492F6CAA0@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_E5F8C4C2-A685-40D2-9F1B-711C11105871";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH 9/9] hw/sd: Allow card size not power of 2 again
Date: Thu, 24 Jun 2021 10:08:42 -0600
In-Reply-To: <CAFEAcA-x-ZWKM0wEHm0-iqLydtyuFCm2ba+j6RGNwLyB0UEtTw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-10-f4bug@amsat.org>
 <CAGnHSE=CoXHKXeM+-PTv-EADcxisuqU3f91W1mCC0GTZO3UOuw@mail.gmail.com>
 <CAFEAcA-x-ZWKM0wEHm0-iqLydtyuFCm2ba+j6RGNwLyB0UEtTw@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=wlosh@bsdimp.com; helo=mail-pj1-x1035.google.com
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
Cc: =?utf-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?utf-8?Q?=22Daniel_P_=2E_Berrang=C3=A9=22?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 Tom Yan <tom.ty89@gmail.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_E5F8C4C2-A685-40D2-9F1B-711C11105871
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 24, 2021, at 4:56 AM, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Thu, 24 Jun 2021 at 11:27, Tom Yan <tom.ty89@gmail.com> wrote:
>> I really think we should get (/ have gotten) things clear first. What
>> exactly is the bug we have been talking about here? I mean like, =
where
>> does it occur and what's the nature of it.
>>=20
>> 1. Is it specific to a certain type / model of backend / physical
>> storage device that will be made use of by qemu for the emulated
>> storage? (I presume not since you mention about image, unless you
>> irrationally related/bound the emulated storage type and the physical
>> storage type together.)
>>=20
>> 2. Does it have anything to do with a certain flaw in qemu itself?
>> Like the code that does read/write operation is flawed that it cannot
>> be handled by a certain *proper* backend device?
>>=20
>> 3. Or is it actually a bug in a certain driver / firmware blob that
>> will be used by an *emulated* device in the guest? In that case, can
>> we emulate another model so that it won't be using the problematic
>> driver / firmware?
>=20
> Definitely agreed -- before we start changing QEMU code we need
> to identify clearly (a) what the real hardware does and (b) what
> the situation was we were originally trying to fix.

Real SD and MMC cards do not have power-of-two constraints in the
number of blocks. None of the SD/MMC bridges I=E2=80=99ve ever dealt =
with
have a power-of-two constraint on the size of the card. The only
constraint on the size related to the card is the block size.

If non-power-of-2 sized cards fail, that=E2=80=99s a cat-1 sev-1 bug =
that needs
to be fixed, rather than a warning be generated.

Warner

--Apple-Mail=_E5F8C4C2-A685-40D2-9F1B-711C11105871
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmDUrgoACgkQbBzRKH2w
EQDZQRAA4Sz+QB+abH23b2DVrM3dL4BAepgmQoX+Vh81ohJBGIfsT+unKk4s1k2D
lrBa52sJmTn10Vj/j1YFwXZiYHdxStw7NYsJgiLtnu3hGnFAhNfaR+gSZkjO+L/S
HW7HrtR2oHU4y4yEd7gqoQ149fkRv12MpFSQFaI+pJclCak+I5JSIwrHEuvyNGIk
A03pXkV2lgk8Pu7V1838noWZj5RVSLw8MN6WrC6tSlwJIOBjMetkQwEexkTjA67d
TbgN3Sx7XKMXQMzTHHeS6dGu1rhPawSN3WxuRNHtSv5/DiVKznbga0wUCOYmDmhZ
klcQeNTegxTbgLG5xCCN+fa3AHE8zbhB/UYDmq9TMQbgK39od197SUbf7a2Y7NG8
LbDdFnK1IGHhSObDP/G+iS/iSu3qR7zbfQ+JExs3fv2LqsRGDEkf9wYPVnGq0GdS
NcYQbL8t8nKDcPZkxEOW1cnY9vJtv/8gKY/9wHO4SKK203nO3KaB8f9YvARMZNHf
q4r2fRcP73p/UjonjKGUiCBOy1TRdLcFV3W2jTVYGdUEpAWiKrmrBJS1d1g2Ok1r
nkoYVED+DkAqhmmJsNApRJ4BwKhJNH6FOJo2znqw+BGETPeyI6vuocJsLtC8yP0V
RgI2GDQdGE7P65o8WAexMj9FQuVa+PR1E1D3o9JjHQyrBY4m4qM=
=/bmu
-----END PGP SIGNATURE-----

--Apple-Mail=_E5F8C4C2-A685-40D2-9F1B-711C11105871--

