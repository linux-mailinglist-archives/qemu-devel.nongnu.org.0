Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F25497E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 12:32:17 +0100 (CET)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBxa1-0008GG-CV
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 06:32:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBxVl-00068v-1A
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:27:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nBxVj-0001T6-74
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 06:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=xLR6XNO7Z8BBgBqDnW5R/6MME6ygCwiCr2i7K/WFswY=; b=eIzUcGIDtl2k1TexGuU0Dy9xKG
 NHz42a+h0sB3nlLOubKLQ+ypy/B4VHHLIh6IFmel+SduORynTxQ9d8U7+h3ucDWgiCfYggQQAsWm8
 Roo1ipEGESy9JPwZErwINempKMR27eltVDA2mo2L0CIyrBpYM0fHo90VEUPSRnP9kHn4NsnBcaSt+
 6nBf1SXzwGHOuvrNdjsf/8k/XZdli+cYB9Ts1DaaMehnHJE1JBh5chWR5kWHsDhiZLhq2UvVd8ifj
 Se3tEt9opklI9WoX8q2u+5zZvsAy+tSUTF7SPop2H3HRSzOdHS9H/AFa0zK9q+4FRwvZjq7YBpnF5
 /nBr8HoIg4JmqU0KnuUsB2OrB951Ha+TgQ7HOQ/8NEXNBHBfzIKsnu4N2KyXC4FclGMhG/Gn6hAbe
 VbonKiBnFj0DFWY0uzqu/Bntp609sEYgTdqbMLn5uPBo/MkqZ/M5Z/DIHbQWrNHv2MQyBsaYqV5OG
 dEgOMF8YuWAbIarThy59KJ2E+j6DJxX7WIZs1a7w2il5ftdovGtLFcbDMvS4WoLltjifZjalcf8D/
 C3t+x6lSylWEyK1hd68DsQDzCo1oKuz1NzoHGnjbp8+mb7QfrJGwzhMPvmdJQUq2KkwfT9cvUTUsJ
 37FK5Iii9wveqKsJ5f+un9WBKsj+lDBEdweZoSzqw=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <roman@roolebo.dev>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, peter.maydell@linaro.org,
 kraxel@redhat.com, alex.bennee@linaro.org, jasowang@redhat.com,
 phillip.ennen@gmail.com, dirty@apple.com, armbru@redhat.com,
 r.bolshakov@yadro.com, agraf@csgraf.de, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com,
 f4bug@amsat.org
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Date: Mon, 24 Jan 2022 12:27:40 +0100
Message-ID: <7053351.4JHWUSIRgT@silver>
In-Reply-To: <Ye53sOJekvKrM8iT@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Montag, 24. Januar 2022 10:56:00 CET Roman Bolshakov wrote:
> On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >=20
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >=20
> >  net/clients.h       |  11 ++++
> >  net/meson.build     |   7 +++
> >  net/net.c           |  10 ++++
> >  net/vmnet-bridged.m |  25 +++++++++
> >  net/vmnet-common.m  |  20 +++++++
>=20
> Hi Vladislav,
>=20
> It seems the last two files should have .c extension rather than .m.

I would not do that. Mind cross-compilers, please.

> Unlike Cocoa UI code, the files do not contain Objective-C classes. They =
are
> just C code with blocks (which is supported by compilers shipped with Xco=
de
> SDK), e.g this program can be compiled without extra compiler flags:
>=20
> $ cat block.c
> int main() {
>         int (^x)(void) =3D ^{
>                 return 0;
>         };
>=20
>         return x();
> }
> $ cc block.c && ./a.out
> $
>=20
> Regards,
> Roman

Such blocks are still Objective-C language specific, they are not C and=20
therefore won't work with GCC.

$ gcc block.c

block.c: In function =E2=80=98main=E2=80=99:
block.c:2:14: error: expected identifier or =E2=80=98(=E2=80=99 before =E2=
=80=98^=E2=80=99 token
         int (^x)(void) =3D ^{
              ^
block.c:6:16: warning: implicit declaration of function =E2=80=98x=E2=80=99=
 [-Wimplicit-
function-declaration]
         return x();
                ^
Best regards,
Christian Schoenebeck



