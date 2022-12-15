Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF3B64DD55
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 16:10:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5prS-0003Rn-Hn; Thu, 15 Dec 2022 10:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf@comsecuris.com>)
 id 1p5p15-0000ix-7z
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:15:20 -0500
Received: from www284.your-server.de ([188.40.28.234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralf@comsecuris.com>)
 id 1p5p13-0004YN-3j
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=comsecuris.com; s=default2101; h=To:References:Message-Id:
 Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
 Content-Type:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Tn91idY0g3tGfykVXmHI3UQcAj68CeIxpHWm0F9H3kE=; b=GjWnAZMOAdoPzGZr9s2yiqpggX
 ZQHCxikyX1852cm+tswT5Bs+Z8lHEvhcYPHUd/cOcKiVtkOj1/vYaIe9mwvVDIYZEUNqsG1IUiAEL
 0V3UhJY6BSUUHPCSiBt0QRx4Y4wLDtYED/de++/4Q/9AwwyM/zWs1sS36RPtPLP4RrAPfnOue4vUC
 j29Jty2t4IvU/jdvfbiRLLOEwIZ0bTs9Ue6bTjlDUg0Dqh3ZU+B76kDloxs+rCbO79F8tCrzvMO7m
 bF52wkQulBPX6i16ulmFMCue1gFFM+0ZjeMTfzt5pn1wQBg5NkZLOjAdwWcwIDBtj7M813ugpNH0J
 pLg5oImg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www284.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <ralf@comsecuris.com>)
 id 1p5p0z-000LHR-3i; Thu, 15 Dec 2022 15:15:13 +0100
Received: from [2a02:908:13b4:8700:e5c8:10eb:6b65:339c] (helo=smtpclient.apple)
 by sslproxy02.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <ralf@comsecuris.com>)
 id 1p5p0y-000KFp-Oc; Thu, 15 Dec 2022 15:15:12 +0100
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: QEMU PPC VLE support
From: Ralf-Philipp Weinmann <ralf@comsecuris.com>
In-Reply-To: <CAJSP0QWM0CyXfT1x=G50b7fPOD+3T7YuPLDxMsqtUNd=twkd3g@mail.gmail.com>
Date: Thu, 15 Dec 2022 15:15:01 +0100
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <816245C7-B07F-429D-96CB-68FF7D663AF5@comsecuris.com>
References: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
 <1F7AFCBF-66D5-4EC1-8FBE-FC8A4E5C88D2@comsecuris.com>
 <CAJSP0QWM0CyXfT1x=G50b7fPOD+3T7YuPLDxMsqtUNd=twkd3g@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Authenticated-Sender: ralf@comsecuris.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26751/Thu Dec 15 09:20:56 2022)
Received-SPF: pass client-ip=188.40.28.234; envelope-from=ralf@comsecuris.com;
 helo=www284.your-server.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Dec 2022 10:09:24 -0500
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



> On 15. Dec 2022, at 15:06, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>=20
> On Thu, 15 Dec 2022 at 08:51, Ralf-Philipp Weinmann =
<ralf@comsecuris.com> wrote:
>>> On 15. Dec 2022, at 14:37, Stefan Hajnoczi <stefanha@gmail.com> =
wrote:
>>>=20
>>> Hi,
>>> I came across this post where Ralf-Philipp is looking for a =
freelancer
>>> to implement PPC VLE support in QEMU:
>>> https://chaos.social/@rpw/109516326028642262
>>>=20
>>> It mentions upstreaming the code and I've included QEMU PPC
>>> maintainers in this email so they can discuss the project with
>>> Ralf-Philipp. That way the chances of a mergable result will be
>>> maximized.
>>>=20
>>> The Rust aspect is interesting, but QEMU does not have any existing
>>> targets implemented in Rust. It might be a major effort to create =
the
>>> necessary C<->Rust interfacing, so I'm not sure whether that's
>>> realistic given the timeframe for the project.
>>>=20
>>> Does anyone have time to take on this freelancing project or know
>>> someone who is available?
>>=20
>> Thank you, Stefan!
>=20
> It occurred to me that we could reach out to former QEMU Google Summer
> of Code and Outreachy interns. They have prior QEMU contribution
> experience and might have time to take on a freelancing gig.
>=20
> Please let me know if you want to do that and I can put you in touch =
with them.

Yes, please!

Best regards,
Ralf

--
Ralf-Philipp Weinmann
PGP: 4096R/8C07C5B7 D244D6F2E79B529BF5548F39B27967D58C07C5B7
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Comsecuris GmbH
Registered office: Diessemer Bruch 170, 47805 Krefeld
Commercial register: District Court Krefeld, HRB 18481
Director: Dr. Ralf-Philipp Weinmann


