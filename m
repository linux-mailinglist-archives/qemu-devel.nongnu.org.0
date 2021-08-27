Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BC3F9C77
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:30:47 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJekb-0002GF-BI
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJej2-0001MK-N0
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:29:04 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mJej1-0000Jc-1J
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:29:04 -0400
Received: by mail-il1-x135.google.com with SMTP id h29so7582590ila.2
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=6ygkPXrPCRdf3B7WcZ4ZKsWlKAzMIzJvdyfEhZV6XIU=;
 b=YQHrpfAkB2afKec0xqbrjH9G8SAtBRPDZX8wb33XcWl8ubTD75l3XGdEQMAKgs8Kue
 APikPJx6tBzFbHqXNOOYb21hYvvdjgJ6qFPnOrf2bskc+TzWRC0SkEUutnAdP7Hmw6co
 EFkBl5L4Z3mdgKX2OrfYcWhBhcGo75ndGCPzITYbmadjM6vS6DON/hAPfY5FDchBoQGU
 007OAMJl63W8lj0GAv0uUb0oguXuxOHxKzco6TELDHDzlwLHyI9gRJoDAoPrS8enMyGK
 5SrGxckJvAKIQ0B5Kub4yZp+BHbkJILaP1sBNHmAv8Jj+3IEBUGWZyvb/2au4sQ4/sOG
 fteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=6ygkPXrPCRdf3B7WcZ4ZKsWlKAzMIzJvdyfEhZV6XIU=;
 b=kp5WktLHr32xxOG97ene0LyfLCKUkMgo7wOHgntrYLGiETzNb7eq4+oiA8rsxf+MMX
 Y2awIq5X3FKphZwGVlHaPn/v3DTvJGs78tiYbgenaJMxWJ2yxQYACp62EiIxwVZako4G
 flJVk6F59j25/CF+wGs+naQDzPYfjxNu/KVXs+im1nu6gIs2qJdUviSuW/SNyMJicYrd
 RZUGj+L7SslWhIMmwZtRaMDg65CqhVqMQ4vKz+6cOdaV45FyXyBdMHRC3Lz1dw0X09RD
 WYjqXC7q9rzibgaIhM5/x3jfmftxKsrNRFEKs+l4Zb7dq5aUY9y2Z+dNZjcOvwL3p0zm
 a3TQ==
X-Gm-Message-State: AOAM533TRMmf3J700pvAGqyhRb0W9wuN2hh1jcoZ+39xXM1t/9CmmaHm
 2IvVgfHu1NvbuV3BDHdEdyC1Rw==
X-Google-Smtp-Source: ABdhPJyhYS/GmtUYqkvoLwL+7E74PxTbwwwoeJqdsi743OJPqiamsALeN8ISZl19taP8dDIw7zKiHg==
X-Received: by 2002:a92:cc0d:: with SMTP id s13mr6768653ilp.95.1630081740664; 
 Fri, 27 Aug 2021 09:29:00 -0700 (PDT)
Received: from ?IPv6:2603:300b:6:5100:c17e:7522:3652:c9d4?
 ([2603:300b:6:5100:c17e:7522:3652:c9d4])
 by smtp.gmail.com with ESMTPSA id x21sm813386ioh.55.2021.08.27.09.28.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:28:59 -0700 (PDT)
From: Warner Losh <wlosh@bsdimp.com>
Message-Id: <C37E3FCC-67E4-4F45-90D8-8E970960621A@bsdimp.com>
Content-Type: multipart/signed;
 boundary="Apple-Mail=_A0CDEE6F-EE62-472F-B8B1-03D5554CE162";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH v2 30/43] bsd-user: Remove dead #ifdefs from elfload.c
Date: Fri, 27 Aug 2021 10:28:58 -0600
In-Reply-To: <e263b49f-4028-b4cd-4b76-787bb3047e0f@amsat.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-31-imp@bsdimp.com>
 <de44e02d-5da0-3347-c2b6-5bbb344ae354@amsat.org>
 <35C0402D-0451-478E-8BCF-446AF2BFBBD4@bsdimp.com>
 <e263b49f-4028-b4cd-4b76-787bb3047e0f@amsat.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=wlosh@bsdimp.com; helo=mail-il1-x135.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_A0CDEE6F-EE62-472F-B8B1-03D5554CE162
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 27, 2021, at 9:58 AM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>=20
> On 8/27/21 5:02 PM, Warner Losh wrote:
>>> On Aug 26, 2021, at 10:42 PM, Philippe Mathieu-Daud=C3=A9 =
<f4bug@amsat.org> wrote:
>>>=20
>>> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>>>> From: Warner Losh <imp@FreeBSD.org>
>>>>=20
>>>> LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. =
Remove it.
>>>> Likewise, remove an #if 0 block that's not useful
>>>>=20
>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>> ---
>>>> bsd-user/elfload.c | 20 --------------------
>>>> 1 file changed, 20 deletions(-)
>>>=20
>>> Move as patch #14?
>>=20
>> Are you suggesting I move this to be right after patch #14 or that I =
squash / fold it into patch #14?
>=20
> Move, if possible. If too much trouble (rebase conflict) then
> don't worry and let it here.

Yea, there=E2=80=99s rebase failures that aren=E2=80=99t trivial to =
resolve :(  Too many moving parts in this patch set.

>> Warner
>>=20
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


--Apple-Mail=_A0CDEE6F-EE62-472F-B8B1-03D5554CE162
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIzBAEBCgAdFiEEIDX4lLAKo898zeG3bBzRKH2wEQAFAmEpEsoACgkQbBzRKH2w
EQBrNw//S5962+7CM7+m1dfZjuRimyETwrKOZlPjVQeRqxk0is57B6PhzeL2IGvJ
1WAGJEHIL+y2CoO0i8iJMBlrcrJ+FCo0g/dzOuqiEEaOjPxFTqj8GJhYMG7PtP/B
NTphjoRRTCvZagwnOe4yceLGx1Ffzt0OGVkBeasqB0Fvr5mLLbTrpt88YUImXAyb
JBEPg2Qjvn1OwnTSNvhGjVa+6U099JhjTzPoL3fA75VTqjY4PwPCY9gf5mUZjBKM
H67E/URsXZwrNQT5yQ82yeOtqad9w5Z2lzqLXflRCAptzZOJZ/XRxhkDe2M7qTiO
GnKdB5q5DQ1p5ooYKuYojna8HDHjwj/CzmprxVTAR7Vj0cte35iCuOjrEdj8KLg9
ho9PDp9434xm31ztqqAiprSQX9GgnAmzBlNPv1lw2hlbYoRpK3i4F/DoBiGk8jh9
I1VnQb4dg8l0YhgibfvUVTzs6xcuADgQilxwFWiykP/eluPvVO4QUNM5Ng+55/IO
XLwu8jmqfRIYkyrnJJ3fXU+FK/eqQrBWgRYXs2ofrXMHA0JmBmvEuSSqlfi7bDL4
eOi0m5UimtdVvrT5wojqSFhSvbQlbwZsg4uDxMV1qlLr14K5wFHbZC8NdWLNmc55
ol4TOnB/1sLp3bHlsQLa+/llz4ZqkZSPdFGagjAXLzx2HNeWTKs=
=AIPB
-----END PGP SIGNATURE-----

--Apple-Mail=_A0CDEE6F-EE62-472F-B8B1-03D5554CE162--

