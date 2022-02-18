Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B394BBF61
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:20:40 +0100 (CET)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7ry-0005Tr-WC
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:20:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nL7q3-000450-Ox
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:18:39 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nL7q1-0004DU-FW
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:18:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=tIN6sVY7Oe/2m4UpbndtiJBshYKLYrmld2Ws16lj5c0=; b=kIOnlcEME0RdlU5coiFWMXya9X
 Mn+O0oF02BfL7zbD6+Kj7GMYMAfv4AYam+Py2eyRc/1p+R5UNhR/DUluLqQRTkyDukQf/s6sUZLOy
 FgQvCEQLbUHXN9BS/kNsi1x2P41D6L06TpoEFBD76IpbGPab+7xiUigWPrLiWbScKDVMOx8SG451/
 h3k9xZ/vKWX9ZYR1iZM/IPNNSA2SDc6oYkx/mQrChADmIpp2qeAGU6Z0ipavRr48QxRA+ZhHaT6X6
 bYSv3jjL76XiGJMHPoLgztoUTOZiq0K0uf7r0PtOPYl8J3LIXtSrZX7IAA90FpvkNs4bEhPvylObo
 ZkA8ly8vNUEHnoP6HiNPkA+QbM3NKoLQAP2+8QvY7onmdI0cQzphEaqJ9F3unU1RISXzRZ6OvLAwm
 9dHq78izTQc7Hi2qHHi00l9gdrINgcm4FfNjFEXRBmIyTf08qfIPoFnv1CLdLr5vFc++Y8JFCcEt/
 gnWwenVptMnwvVRDpjTECFVe0fEaoS+ymunLmB/DA8AzmAb/U4UvT7z4kPR3etDMt8ACwZVtWF8fu
 1BwncGhSg5orwsPRRDAeHtrs0ry6b7hQfJ/jAhsNhOEhEb26YQfiyaJZYqJ4EskPJYVgoK8YKjA9B
 v/BbQZiC+XB+5WLGOEtfSR5/hX1hmY4hmxsiNaQEo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v6 11/15] ui/cocoa: Add Services menu
Date: Fri, 18 Feb 2022 19:18:33 +0100
Message-ID: <15522158.WG5ctWH4Vs@silver>
In-Reply-To: <CAMVc7JWuwTLsP__A33wBGsf7QFstuEuP1JAdJOtxdW9y-W0YWQ@mail.gmail.com>
References: <20220215080307.69550-1-f4bug@amsat.org>
 <CAFEAcA89pP021OxJM9pqivmTHWAjSSHGkNoGAJYB77OH1RpRyg@mail.gmail.com>
 <CAMVc7JWuwTLsP__A33wBGsf7QFstuEuP1JAdJOtxdW9y-W0YWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 18. Februar 2022 18:49:55 CET Akihiko Odaki wrote:
> On Sat, Feb 19, 2022 at 2:33 AM Peter Maydell <peter.maydell@linaro.org>=
=20
wrote:
> > On Tue, 15 Feb 2022 at 08:26, Philippe Mathieu-Daud=E9 via
> >=20
> > <qemu-devel@nongnu.org> wrote:
> > > From: Akihiko Odaki <akihiko.odaki@gmail.com>
> > >=20
> > > Services menu functionality of Cocoa is described at:
> > > https://developer.apple.com/design/human-interface-guidelines/macos/e=
xte
> > > nsions/services/>=20
> > I tested this, and while it does create a Services menu, none of
> > the items in it seem very relevant to QEMU (on my machine, there's
> > Activity Monitor, Time Profile Active Application, and some other
> > software-development related things). In fact, every app I looked
> > at exposed the same list of things in the Services menu. So I'm
> > not sure why this is even an application-specific menu that needs
> > specific code to support, rather than something system-wide that
> > Apple automatically adds to the UI where it wants it.
> >=20
> > -- PMM
>=20
> Actually I wanted to use those services from Xcode to debug QEMU. I
> have no idea why Apple decided to do it this way, but an application
> template from Xcode does the same although it uses an interface file
> instead of Objective-C code.
>=20
> Regards,
> Akihiko Odaki

Yes, that appearance of the "Services" menu is normal. I think the idea was=
 to=20
leave it completely to app developers how their app menus looks like exactl=
y,=20
instead of Apple injecting something there without being asked.

There are much bigger oddities in macOS's menu design than that IMO.

Best regards,
Christian Schoenebeck



