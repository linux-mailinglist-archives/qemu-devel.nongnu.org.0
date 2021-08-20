Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C53F3755
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 01:37:29 +0200 (CEST)
Received: from localhost ([::1]:60890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHE4l-0006oB-G0
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 19:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mHE3l-000693-Hf
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 19:36:25 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mHE3j-0005wp-D7
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 19:36:25 -0400
Received: by mail-il1-x12a.google.com with SMTP id h29so11113070ila.2
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 16:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=vLIrpu+FUpUHJJDsbtRmiEtMmlYpYZ4gxHdIAbIeWiw=;
 b=TP4SD4FQYRIkCHqaQCbFaV/WeGDMY+NWphaonWe5dKKdae4nZu9N+HeM/2rSSYj+QV
 drZSw8SMO8VnAGNecn63oQvDx0klZKtB+UKCO5ChvQSLlklaxW38Ps0YdtkEtC+4Rj+5
 GwgAlt04oNXKIBnUOnHWth7Mu+uUdFUcyf9a5Jh2oO+SruAY67RqldElvLFhZ5khpiqv
 FqGBXV+FaEI+1t6OZYyQx3h6wumiYaN3zLN7g0sS4y3p7vdZrr1Z7gVaxxuvn3WFcBMQ
 k1EZeRXpq6a20HxFYEHRb0jxlG2dK8SwJMtg/YlL2uNDDw6N6KcEB65f2pfpi5WQ3v+7
 PZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=vLIrpu+FUpUHJJDsbtRmiEtMmlYpYZ4gxHdIAbIeWiw=;
 b=TSmxH7ptRXMpWpLAB36KWiHKKhXN5SwB+TytAWLt/yPn6BnfAxXuHh5SPzRVAEhcJA
 +70qOys+RMUQpBNIUdRch3pKZx4ASgLo+bUq03FUl+yAQKsE+G7NhzU+pkGGOQGlW1Af
 NEVOE4JqmSf5KxnOZ1RVy6Ax6mDuxqTAEvLH7dDD+8tIdzd0VGqZYVQlG1kM8kL+ukJd
 N8E7UkcfduJ7S+s5IQFyKdy4we/8UKcos7xx9qO3fy4nQIU50nsfB8/5pvmv2+PCtYhg
 ovsFxjsThwLItH9/VzxS0m2hjWHEKvh9b6lbhNb5YNrbPKfCE/eoV/LDNXeMtTTAWQwv
 6X+A==
X-Gm-Message-State: AOAM530E3/tPwvGRY1olRYuih/sCerbMuyjT8goSGTnxacDo4/E3db+a
 xoe1j/AT9U5ybE91W+5hrM1Ysg==
X-Google-Smtp-Source: ABdhPJw1Wy9zNqYZacn5dDMVQXqIcd7D1xIRPg4SphMiiowizR5goPXu26kHv26AcVEfFjGlsC/uPA==
X-Received: by 2002:a05:6e02:cc3:: with SMTP id
 c3mr15619719ilj.207.1629502581645; 
 Fri, 20 Aug 2021 16:36:21 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:984:1ce3:3c49:4a9e?
 ([2603:300b:6:5100:984:1ce3:3c49:4a9e])
 by smtp.gmail.com with ESMTPSA id p12sm4025130ilp.87.2021.08.20.16.36.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Aug 2021 16:36:20 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <791ED535-5AB2-49F1-9496-AF661DE849C1@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_B26D2F17-D856-489A-901A-B04AEC79087C";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH for 6.2 40/49] bsd-user: Add target_arch_reg to describe a
 target's register set
Date: Fri, 20 Aug 2021 17:36:19 -0600
In-Reply-To: <755a1305-a022-5ffa-3623-d1c965adeca4@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-41-imp@bsdimp.com>
 <755a1305-a022-5ffa-3623-d1c965adeca4@linaro.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x12a.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_B26D2F17-D856-489A-901A-B04AEC79087C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 10, 2021, at 10:44 AM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 8/7/21 11:42 AM, Warner Losh wrote:
>> From: Warner Losh<imp@FreeBSD.org>
>> target_reg_t is the normal register. target_fpreg_t is the floating
>> point registers. target_copy_regs copies the registers out of CPU
>> context for things like core dumps.
>> Signed-off-by: Stacey Son<sson@FreeBSD.org>
>> Signed-off-by: Warner Losh<imp@bsdimp.com>
>> ---
>>  bsd-user/i386/target_arch_reg.h   | 82 +++++++++++++++++++++++++++
>>  bsd-user/x86_64/target_arch_reg.h | 92 =
+++++++++++++++++++++++++++++++
>>  2 files changed, 174 insertions(+)
>>  create mode 100644 bsd-user/i386/target_arch_reg.h
>>  create mode 100644 bsd-user/x86_64/target_arch_reg.h
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> While this mirrors what linux-user does, I've wondered if this wasn't =
just pointless copying.  If a bit of code knows enough about a target to =
fill in its core dump, why wouldn't it just copy the data straight from =
CPUArchState instead of using these intermediaries?

I believe the forthcoming core dump code copies this opaque structure =
into the core dump=E2=80=A6.

However, this is an excellent todo item to see if there=E2=80=99s =
something that can be refined.

Warner


--Apple-Mail=_B26D2F17-D856-489A-901A-B04AEC79087C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEgPHMACgkQbBzRKH2w
EQB9VA//a1WnP4tbTtbLQey3xG+R8tX9MAecPCJraZcGl63T97p3F9xmsM5QJktd
iX8EV99kDKBcbZnVR1lepw/ractMp2tIDq/YfkbMA/2EFXJ8YY52ZMWPsX52/IIx
1Mmz8TDi2FQ2fImbz9UDqfC3aCifkagynfWY53S7DrVsvd41buWVfrFcFIHjdS3O
88Rmh4Nn0+lfPzY6CQ9QyuKGWpHxFfyIFve5PyljEF4pWghrDWk4pTa52v8xsMOv
KtuLRa2dhf7YOj42a8GT2sBT/t2cLtkA+z/zLbZ38XwzzXfiN7nfa2l8cKHMKS+P
viruvjAig3n/gCUg/O1s+Ef/iDPRuAPM7DoASG1hwUGc72p2lbDZs1H8SqWbpnxw
xFOxF2HLrSpQLcnibX0EWhA+1QnhVDpX+oOKk4EF18mHIPo9UEX++HkXeTGpkPwf
AnGTpdPBULZ+97+GuWKSnepeND4383+iOsNinvlWrtGTl1RJ00y9AsKopPG3Q4T3
HxHkHO0A5/fT6DvU2v+cVR1uZJB3j9nIPuQx5QSkMGbgqLxOL1e+EOXmmQC3eCaL
f7HN9pjxWpDWacZ5wtCo8ei0Gaf6xD+xWCit3FGu5PSDy21dnmZHzKNIAamREDVX
rOSmta1pVl7DxNtkvCxg4WqNqajaxz222ruGDbLwtqpI+4epF+E=
=xT/o
-----END PGP SIGNATURE-----

--Apple-Mail=_B26D2F17-D856-489A-901A-B04AEC79087C--

