Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FCD3F03FC
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:50:00 +0200 (CEST)
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGL14-0005Rl-Im
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mGKzs-0004ke-RB
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:48:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:37951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mGKzp-0004PZ-Td
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 08:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=eCRWZYgFSnkfDeAnZk/G63aieJqBGhtwYGkD29kD9Mk=; b=RuMCEBH2tyaGeQPtB7CBAR/cr9
 288sBkutMk2Cs1XpAPSRyFDlOQEFDmGBnkQ4s9SQu7WSMJm1ClmUSokVq0dSGeONg8gn2yiIbxktE
 jZJ+/90whyLxd4rHMzG2zy6OqZ7yFOCrDKf9b8CBy1obFpud29aQUfJ3xIepFeV9PtkLRdDofi2+j
 /epI+jL5NrEDHn3P0ioBL4h+JQxsQ+hxW+QcP3WMR4ipR0Y2fsgzqq6kK6fqNiKoVYFoQ1hI97s1g
 SavOzWk5F7nk06tvFiHz4gYD2nbSz1Bd1jCjgCGzHR6y9FRy0FbONHaQT3pP00noJH52nDRt9G4rQ
 /DB5+EZL2SA5x5lYESwAwhkuHh4eRIiHaOxqQSzLFkTfgNfAuurlgjPaF9tyBug0GQhYS19jmyhr1
 0tYayuSbYFU5ny2KjgRbVWjfUmFjmhZRIZ095KTJ+h0tTyxwZrRvZYk9gh9dS/SE6BZkkVKspvbAW
 QEcuQpgRlFCE9YwNHlqRFpY/VvJnXs/Z3+OO4AmpEgk/E+xlbEJJy9Mc1BXNRHlbuI3/aS85k2qKq
 OFMUNCERCRn/8nb60EUYoWRvHYzwlmMzURNqnfNZhRC3S8q5/rIM3dI/SWEgwaWQhFOymwX+u9jQP
 hRG0JRQphg5ww1QlDQiDkcYn0D5BfBLqoRxNf8qYo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>, clamky@hotmail.com,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Split Audio backends VS frontends
Date: Wed, 18 Aug 2021 14:48:37 +0200
Message-ID: <4074977.GUTxnQdd72@silver>
In-Reply-To: <0d7f824c-8392-9a94-90be-befa45b3a722@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <2098132.JuaFiSchrr@silver> <0d7f824c-8392-9a94-90be-befa45b3a722@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 17. August 2021 19:57:21 CEST Philippe Mathieu-Daud=E9 wrote:
> On 8/17/21 6:12 PM, Christian Schoenebeck wrote:
> > On Dienstag, 17. August 2021 14:41:27 CEST Gerd Hoffmann wrote:
> >>   Hi,
> >>  =20
> >>>> +Overall Audio frontends
> >>>=20
> >>> I would call that "Audio Hardware Emulation" instead of "Overall Audio
> >>> frontends".
> >>>=20
> >>>> +Overall Audio backends
> >>>=20
> >>> Likewise I would call this section "Shared/common QEMU audio library/
> >>> subsystem" or something like that instead of "Overall Audio backends".
> >>=20
> >> Well, frontend/backend is common qemu terminology, with "frontend" bei=
ng
> >> the emulated/virtual device as seen by the guest and "backend" being t=
he
> >> host-side wireup (i.e. -audiodev / -blockdev / -chardev / -netdev / ..=
=2E)
> >>=20
> >> take care,
> >>=20
> >>   Gerd
> >=20
> > Yeah, I was seeing this (like usual) more from an external/new developer
> > perspective where the semantic for "frontend"/"backend" is not that
> > obvious
> > here.
>=20
> "Audio Backends" is in the "Subsystems" meta-section, and
> "Audio Frontends" in the "Devices" one.
>=20
> Maybe we using the =3D=3D=3D separator for meta-sections (like rST)
> instead of --- would help seeing the difference.

No need for now. On the long-term the MAINTAINERS structure might be improv=
ed=20
in some way to make specific tree structures more clear, but for now it's O=
k.

Thanks!

Best regards,
Christian Schoenebeck



