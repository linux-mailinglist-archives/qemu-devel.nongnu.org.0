Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDB24992E0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:32:25 +0100 (CET)
Received: from localhost ([::1]:48036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC60m-00025z-MC
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:32:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nC5XS-0005nj-Vf
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:02:09 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:47655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nC5WQ-0000qI-JT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nKB0opESDl6tDr7DOEL+9mzFznFs7DWeVnLRRM5byBw=; b=pyMNEb8mKI9PSRrLHxsWxa2MbU
 +rk+tnxh8Hq1DjJtNVAjuTHhJolB1ZT2HvNYJKztgav7+UGZEzN1Ov1nyILENRDtrTNHJXBb8MUAA
 9mrTY0LdOPjMdKWNxfyHuzfC8Di+Bs34tW6uY5L/1ftQ/onpJ+uKDE1tus7Fudw9/N+2OiiA0dTLt
 5hk0NcnRfO8cQjouDHmCBMwCc+vqzGND81SUnbvsIodSZ4PRpP5QlJjciE0RACYqnojpoJl2zo2mX
 QoDbs+j0MHWXCa2L1+yJc1zFvfVf1jE3gnKq7cGomVDHUtG3T4EmkxUjuZYkuKSzPtSUBdzbMLlrG
 mo6WfBwg4b30w9iVysIaN6vbSoaWMUAyRxqCNKATSvO3fM0+QiGvkx9VYfmcJPoA2+8wVY3PYvq6E
 UccUliMth312LG3Znl+D1A+hvhdKtSCQIwGrqSLCXvtRFZoE8YBQko8ZDdjCr7Ac7n3WklNGU6Jof
 CS6lB7usVC1GnbxQAwCYVT0h1yxe523p1+n6FZb4eUPKoyTaHwAN62HVKTyvoQg+9XfeXd1bikKr0
 ytCMqHZaruEGgE94XHmV1UAUKs4TAv/GKD/1IBgZJDWXzOyr3XSH8EaDmuyCcGa0YZHfZrua0PkS+
 k3v+aZNgS5VP7uLhRo3MFZi8OuiIDxRFXCUXXu9h8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <roman@roolebo.dev>, peter.maydell@linaro.org,
 f4bug@amsat.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 eblake@redhat.com, jasowang@redhat.com, phillip.ennen@gmail.com,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 kraxel@redhat.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 alex.bennee@linaro.org, phillip@axleos.com
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Date: Mon, 24 Jan 2022 21:00:55 +0100
Message-ID: <15953310.Q2fixzbDzB@silver>
In-Reply-To: <Ye7mwcl/rB714vgl@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <7053351.4JHWUSIRgT@silver> <Ye7mwcl/rB714vgl@roolebo.dev>
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

On Montag, 24. Januar 2022 18:49:53 CET Roman Bolshakov wrote:
> On Mon, Jan 24, 2022 at 12:27:40PM +0100, Christian Schoenebeck wrote:
> > On Montag, 24. Januar 2022 10:56:00 CET Roman Bolshakov wrote:
> > > On Thu, Jan 13, 2022 at 08:22:14PM +0300, Vladislav Yaroshchuk wrote:
> > > >  net/vmnet-bridged.m |  25 +++++++++
> > > >  net/vmnet-common.m  |  20 +++++++
> > >=20
> > > It seems the last two files should have .c extension rather than .m.
> >=20
> > I would not do that. Mind cross-compilers, please.
>=20
> Hi Christian,
>=20
> Cross-compilers for Apple platforms can be constructed using =C3=A0 la ca=
rte
> approach where toolchain comes from the source, SDK from Apple and a
> port of cctools from GitHub (mind all library dependencies of QEMU).
> That's quite an effort!
>=20
> I very much doubt this is a relevant and typical case for QEMU on macOS.
> And if cross-compiler is constructed properly it'll pass required flags
> that enable blocks and will link block runtime in its default build
> recipe like all cross-compilers do for the platform of interest.
>=20
> Gladly, there's osxcross [1] and crossbuild image with Darwin support [2].
> They can deal with blocks just fine:
>=20
>   # CROSS_TRIPLE=3Di386-apple-darwin
>   $ cc block.c && file a.out
>   a.out: Mach-O i386 executable,
> flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|NO_HEAP_EXECUTION>
>=20
>   # CROSS_TRIPLE=3Dx86_64-apple-darwin
>   $ cc block.c && file a.out
>   $ file a.out
>   a.out: Mach-O 64-bit x86_64 executable,
> flags:<NOUNDEFS|DYLDLINK|TWOLEVEL|PIE>
> > > Unlike Cocoa UI code, the files do not contain Objective-C classes. T=
hey
> > > are just C code with blocks (which is supported by compilers shipped
> > > with Xcode SDK), e.g this program can be compiled without extra
> > > compiler flags:
> > >=20
> > > $ cat block.c
> > > int main() {
> > >=20
> > >         int (^x)(void) =3D ^{
> > >        =20
> > >                 return 0;
> > >        =20
> > >         };
> > >        =20
> > >         return x();
> > >=20
> > > }
> > > $ cc block.c && ./a.out
> > > $
> >=20
> > Such blocks are still Objective-C language specific, they are not C and
> > therefore won't work with GCC.
>=20
> I'm not sure why blocks are Objective-C specific. All the data I have
> shows the opposite [3][4][5]. They're just extensively used in Apple APIs.

Because blocks are automatically available if you are using an Objective-C =
or=20
Objective-C++ frontend, but not necessarily if you use a C or C++ frontend.

> > $ gcc block.c
> >=20
> > block.c: In function =E2=80=98main=E2=80=99:
> > block.c:2:14: error: expected identifier or =E2=80=98(=E2=80=99 before =
=E2=80=98^=E2=80=99 token
> >=20
> >          int (^x)(void) =3D ^{
> >         =20
> >               ^
> >=20
> > block.c:6:16: warning: implicit declaration of function =E2=80=98x=E2=
=80=99 [-Wimplicit-
> > function-declaration]
> >=20
> >          return x();
> >         =20
> >                 ^
>=20
> You might do this on Linux and it'll work:
>=20
> $ clang -g -fblocks -lBlocksRuntime block.c && ./a.out

Yes, which is an unnecesary complicated & limiting variant of just:

	clang/gcc block.m

Don't get me wrong, I don't care too much about this issue. It's just that =
I=20
really see no advantage in renaming this into a C file, but I do see=20
disadvantages. That's all.

> However, vmnet code won't be compiled on non-Apple platforms because the
> compilation happens only if vmnet is available which happens only if
> appleframeworks dependency is available, that is not available on
> non-OSX hosts [6]:
>=20
>   "These dependencies can never be found for non-OSX hosts."
>=20
> 1. https://github.com/tpoechtrager/osxcross
> 2. https://github.com/multiarch/crossbuild
> 3. http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1370.pdf
> 4. https://clang.llvm.org/docs/BlockLanguageSpec.html
> 5. https://clang.llvm.org/docs/Block-ABI-Apple.html
> 6. https://mesonbuild.com/Dependencies.html#appleframeworks
>=20
> Regards,
> Roman



