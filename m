Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213449BB27
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 19:21:04 +0100 (CET)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCQRD-0001Rx-0l
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 13:21:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCQMw-0006Rz-NH
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nCQMq-0006eM-7S
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 13:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643134591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFKvRWpac/k/tcD/7PSlRY2F8e3BMrDfE2T2pUtuuMI=;
 b=Cz0w1SGXjhIu5LtSiA83c9e4+NIrkLFrVqSwEvsbZRBn73wSRIYuY4ibIdlOeIa/O+hpfw
 OZD1eGpWFOG+/wgbbOB3RcPYCybNYtC4LHhbm2fFeyVIOjSip3RBEdxJhzqUBklZZEESIN
 5gsKCrD9tE6dx3/Eez3g1C4Fb6leDO4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-OkEaJH9PPtKe-RBYx6wEDQ-1; Tue, 25 Jan 2022 13:16:25 -0500
X-MC-Unique: OkEaJH9PPtKe-RBYx6wEDQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso14304476edb.5
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 10:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=71ZJGD/DijMxAkURI59OyT/kYxMjfhgqWOAHUeL78TU=;
 b=TftE02jDszdEAw+sGrvFTnVa486T7Aeb8Jo/oPrtvwqKL69oMRC1atD/e0BRew2fqG
 IPlJ1J2QTYbuYgvfzi/bX7+UafxBiiJt0p5K5WjkCZSHuU2lt2gCZXa2VDb113boQ1Fb
 k8WlIqTp9qCgVdD/brwgb1PsfutPXg9lhBC43hD+J395WiQ8rQQMQmppwxKlpbCsoS3I
 75uiYevaijCLl19ohH6q9jonX7gj8+M7JEGhVqwi+/tmWW7J7q3gzsnZ3h0joIJSs+YO
 RRqpiNhHpAWSFtzbSk/vmHEdtyABGEpHdWitmJG3KWanVYY3ZakkRLUY4ccAVtpszMYR
 9aKA==
X-Gm-Message-State: AOAM533byTkrXf/63uh+ulNgftXIZhx6d3g2Wv9MbKWV/a14Tq05R6Hk
 gD5SmV3leMVWycOqwr146Q2tWRwIxfBiKBqCuOA3Lxl2KwsO0teWe3war/iuXnry39yvyQeVZ6V
 2NiNWuhqfDvVEuqQ=
X-Received: by 2002:a17:907:1c9b:: with SMTP id
 nb27mr14034862ejc.433.1643134583852; 
 Tue, 25 Jan 2022 10:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDRVLA3u0Hs0z/3DtuliP4gdZ58CxWvaO9Gf15sWI7Tlsro/Fr8vGCScgqPV4SWoywfq+EhQ==
X-Received: by 2002:a17:907:1c9b:: with SMTP id
 nb27mr14034837ejc.433.1643134583559; 
 Tue, 25 Jan 2022 10:16:23 -0800 (PST)
Received: from redhat.com ([176.12.185.204])
 by smtp.gmail.com with ESMTPSA id c8sm8603181edr.70.2022.01.25.10.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 10:16:23 -0800 (PST)
Date: Tue, 25 Jan 2022 13:16:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 31/42] hw/pci-host/gpex-acpi: Add support for dsdt
 construction for pxb-cxl
Message-ID: <20220125131527-mutt-send-email-mst@kernel.org>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-32-Jonathan.Cameron@huawei.com>
 <87o83zd99r.fsf@linaro.org> <20220125181313.0000209c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220125181313.0000209c@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 06:13:13PM +0000, Jonathan Cameron wrote:
> On Tue, 25 Jan 2022 17:15:58 +0000
> Alex Benn=E9e <alex.bennee@linaro.org> wrote:
>=20
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:
> >=20
> > > This adds code to instantiate the slightly extended ACPI root port
> > > description in DSDT as per the CXL 2.0 specification.
> > >
> > > Basically a cut and paste job from the i386/pc code. =20
> >=20
> > This fails to build on all machines:
> >=20
> >   FAILED: qemu-system-mips64el=20
> >   c++ -m64 -mcx16  -o qemu-system-mips64el qemu-system-mips64el.p/softm=
mu_main.c.o <snip> subprojects/libvhost-user/libvhost-user.a libmigration.f=
a libhwcore.fa libqom.fa libio.fa libcrypto.fa libauthz.fa libblockdev.fa l=
ibblock.fa libchardev.fa libqmp.fa @block.syms @qemu.syms /usr/lib/x86_64-l=
inux-gnu/libpixman-1.so -lepoxy /usr/lib/x86_64-linux-gnu/libcapstone.so /u=
sr/lib/x86_64-linux-gnu/libspice-server.so -Xlinker --dynamic-list=3D/home/=
alex/lsrc/qemu.git/plugins/qemu-plugins.symbols /usr/lib/x86_64-linux-gnu/l=
ibz.so /usr/lib/x86_64-linux-gnu/libpng16.so /usr/lib/x86_64-linux-gnu/libj=
peg.so /usr/lib/x86_64-linux-gnu/libgnutls.so -lsasl2 /usr/lib/x86_64-linux=
-gnu/libpmem.so /usr/lib/x86_64-linux-gnu/libseccomp.so -lnuma -lgio-2.0 -l=
gobject-2.0 -lglib-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lrdmacm -libverb=
s -libumad /usr/lib/gcc/x86_64-linux-gnu/10/../../../x86_64-linux-gnu/libzs=
td.so /usr/lib/x86_64-linux-gnu/libslirp.so /usr/lib/x86_64-linux-gnu/libgl=
ib-2.0.so -lvdeplug /usr/lib/x86_64-linux-gnu/libudev.so /usr/lib/x86_64-li=
nux-gnu/libbpf.so /usr/lib/x86_64-linux-gnu/libasound.so /usr/lib/x86_64-li=
nux-gnu/libpulse.so -lbrlapi /usr/lib/x86_64-linux-gnu/libvirglrenderer.so =
/usr/lib/x86_64-linux-gnu/libusb-1.0.so /usr/lib/x86_64-linux-gnu/libusbred=
irparser.so /usr/lib/x86_64-linux-gnu/libcacard.so -lncursesw -ltinfo -pthr=
ead -lgmodule-2.0 -lglib-2.0 /usr/lib/x86_64-linux-gnu/libgbm.so /usr/lib/x=
86_64-linux-gnu/libgtk-3.so /usr/lib/x86_64-linux-gnu/libgdk-3.so /usr/lib/=
x86_64-linux-gnu/libpangocairo-1.0.so /usr/lib/x86_64-linux-gnu/libpango-1.=
0.so /usr/lib/x86_64-linux-gnu/libharfbuzz.so /usr/lib/x86_64-linux-gnu/lib=
atk-1.0.so /usr/lib/x86_64-linux-gnu/libcairo-gobject.so /usr/lib/x86_64-li=
nux-gnu/libcairo.so /usr/lib/x86_64-linux-gnu/libgdk_pixbuf-2.0.so /usr/lib=
/x86_64-linux-gnu/libgio-2.0.so /usr/lib/x86_64-linux-gnu/libgobject-2.0.so=
 /usr/lib/x86_64-linux-gnu/libvte-2.91.so /usr/lib/x86_64-linux-gnu/libX11.=
so @block.syms -lutil -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lgio-2.0 -lgobjec=
t-2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lm -lgmodule-2.0 -lglib-2.0 /usr=
/lib/x86_64-linux-gnu/libiscsi.so -laio /usr/lib/x86_64-linux-gnu/libcurl.s=
o -lgmodule-2.0 -lglib-2.0 -lbz2 /usr/lib/x86_64-linux-gnu/libacl.so /usr/l=
ib/x86_64-linux-gnu/libgfapi.so /usr/lib/x86_64-linux-gnu/libglusterfs.so /=
usr/lib/x86_64-linux-gnu/libgfrpc.so /usr/lib/x86_64-linux-gnu/libgfxdr.so =
/usr/lib/x86_64-linux-gnu/libuuid.so /usr/lib/x86_64-linux-gnu/libnfs.so -l=
rbd -lrados /usr/lib/x86_64-linux-gnu/libssh.so -lstdc++ -Wl,--end-group
> >   /usr/bin/ld: /lib/x86_64-linux-gnu/libtirpc.so.3: warning: common of =
`rpc_createerr@@GLIBC_2.2.5' overridden by definition from /lib/x86_64-linu=
x-gnu/libc.so.6
> >   /usr/bin/ld: libcommon.fa.p/hw_pci-host_gpex-acpi.c.o: in function `a=
cpi_dsdt_add_gpex':
> >   /home/alex/lsrc/qemu.git/builds/all/../../hw/pci-host/gpex-acpi.c:191=
: undefined reference to `build_cxl_osc_method'
> >   collect2: error: ld returned 1 exit status
> >   [1600/2203] Linking target qemu-system-or1k
> >=20
> >=20
> > >
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> > > ---
> > >  hw/arm/Kconfig          |  1 +
> > >  hw/pci-host/gpex-acpi.c | 22 +++++++++++++++++++---
> > >  2 files changed, 20 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 2e0049196d..3df419fa6d 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -29,6 +29,7 @@ config ARM_VIRT
> > >      select ACPI_APEI
> > >      select ACPI_VIOT
> > >      select VIRTIO_MEM_SUPPORTED
> > > +    select ACPI_CXL
> > > =20
> > >  config CHEETAH
> > >      bool
> > > diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> > > index e7e162a00a..fb60aa517f 100644
> > > --- a/hw/pci-host/gpex-acpi.c
> > > +++ b/hw/pci-host/gpex-acpi.c
> > > @@ -5,6 +5,7 @@
> > >  #include "hw/pci/pci_bus.h"
> > >  #include "hw/pci/pci_bridge.h"
> > >  #include "hw/pci/pcie_host.h"
> > > +#include "hw/acpi/cxl.h"
> > > =20
> > >  static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
> > >  {
> > > @@ -139,6 +140,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXCo=
nfig *cfg)
> > >          QLIST_FOREACH(bus, &bus->child, sibling) {
> > >              uint8_t bus_num =3D pci_bus_num(bus);
> > >              uint8_t numa_node =3D pci_bus_numa_node(bus);
> > > +            bool is_cxl;
> > > =20
> > >              if (!pci_bus_is_root(bus)) {
> > >                  continue;
> > > @@ -153,9 +155,19 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXC=
onfig *cfg)
> > >                  nr_pcie_buses =3D bus_num;
> > >              }
> > > =20
> > > +            is_cxl =3D pci_bus_is_cxl(bus);
> > > +
> > >              dev =3D aml_device("PC%.02X", bus_num);
> > > -            aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A0=
8")));
> > > -            aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A0=
3")));
> > > +            if (is_cxl) {
> > > +                struct Aml *pkg =3D aml_package(2);
> > > +                aml_append(dev, aml_name_decl("_HID", aml_string("AC=
PI0016")));
> > > +                aml_append(pkg, aml_eisaid("PNP0A08"));
> > > +                aml_append(pkg, aml_eisaid("PNP0A03"));
> > > +                aml_append(dev, aml_name_decl("_CID", pkg));
> > > +            } else {
> > > +                aml_append(dev, aml_name_decl("_HID", aml_string("PN=
P0A08")));
> > > +                aml_append(dev, aml_name_decl("_CID", aml_string("PN=
P0A03")));
> > > +            }
> > >              aml_append(dev, aml_name_decl("_BBN", aml_int(bus_num)))=
;
> > >              aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)))=
;
> > >              aml_append(dev, aml_name_decl("_STR", aml_unicode("pxb D=
evice")));
> > > @@ -175,7 +187,11 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXC=
onfig *cfg)
> > >                              cfg->pio.base, 0, 0, 0);
> > >              aml_append(dev, aml_name_decl("_CRS", crs));
> > > =20
> > > -            acpi_dsdt_add_pci_osc(dev);
> > > +            if (is_cxl) {
> > > +                build_cxl_osc_method(dev); =20
> >=20
> > Either we need an #ifdef gate on CONFIG_ACPI_CXL
>=20
>  error: attempt to use poisoned "CONFIG_ACPI_CXL"
>=20
> > or possibly a stub
> > implementation (with a g_assert_not_reached()).
> That works.
>=20
> Turns out I was too lazy thinking riscv was enough to exercise the
> not CXL support case.
>=20
> Lesson learned - mips64el now in my standard config :)
> I'd not realized there were ACPI supporting MIPS machines...
>=20
> Thanks,
>=20
> Jonathan

Fine for development but before you post you really should pass make
check with all machine types. Subtle interactions are not uncommon.

>=20
>=20
> >=20
> > > +            } else {
> > > +                acpi_dsdt_add_pci_osc(dev);
> > > +            }
> > > =20
> > >              aml_append(scope, dev);
> > >          } =20
> >=20
> >=20


