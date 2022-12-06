Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE89644228
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 12:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2WA3-0002dv-C1; Tue, 06 Dec 2022 06:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eadd4843470e5bcc0eee+7044+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2W9p-0002dG-Po
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:30:41 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+eadd4843470e5bcc0eee+7044+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2W9l-0005yy-73
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 06:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=68VuxKgNtKuylrx+wRggcd3I4+Xza1mlfDN2RfINUd0=; b=t+1LXb5Nj+v2s5Ywa6yE81gw79
 CPomDwM+qygZ42ull68XXDrW43BHA2t4ioSSxgl1Pg0+oa1HW3udrtZLN/Szp3rBrWBu5Fii9HO9A
 bkqs37s0A2mGDHyQrJyd2frMCxEp8M3l+e+12PZ5aDJqUWf2wewvyCJ9lXGmgGQqajprCcQbsxIqE
 o59Vx6m3l7i0f6kYyCudC22YT7TexE+O59hTfvmy9QPXJYhSmycH8VJ1rtkJtB3mCuDdR6xIpup8j
 qfY853JOs6Mpx7pPic1alA8owg+LXmH1TV2Xu1kaE6dc/Kzsi5dXjr4ikdyFfrpIauz/9Y+KQI9x8
 1Jgndf0A==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2W9P-004Nao-87; Tue, 06 Dec 2022 11:30:15 +0000
Message-ID: <9b5bf53e0703807323b46171e33b31150e4e312d.camel@infradead.org>
Subject: Re: [RFC PATCH 10/21] i386/xen: handle guest hypercalls
From: David Woodhouse <dwmw2@infradead.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Joao
 Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Thomas Huth <thuth@redhat.com>
Date: Tue, 06 Dec 2022 11:30:07 +0000
In-Reply-To: <13c836aa-ec54-453c-d8fc-01f3efe631f8@linaro.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-11-dwmw2@infradead.org>
 <efef965d-3c9b-abc0-ac5f-c252b10722bd@linaro.org>
 <cb4cdc7944c74ee1918667ba455b9afd0fae351c.camel@infradead.org>
 <d203e13d-e2f9-5816-030d-c1449bde364d@linaro.org>
 <af9c1310fafaeee28f3ce33c6f2cc2c5f260cd9f.camel@infradead.org>
 <13c836aa-ec54-453c-d8fc-01f3efe631f8@linaro.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-MC2mUibBJLIjnC7wW5go"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+eadd4843470e5bcc0eee+7044+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--=-MC2mUibBJLIjnC7wW5go
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-12-06 at 12:07 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 6/12/22 10:40, David Woodhouse wrote:
> > On Tue, 2022-12-06 at 09:16 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> > > +Thomas
> > >=20
> > > On 6/12/22 02:10, David Woodhouse wrote:
> > > > On Mon, 2022-12-05 at 23:11 +0100, Philippe Mathieu-Daud=C3=A9
> > > > wrote:
> > > > > On 5/12/22 18:31, David Woodhouse wrote:
> > > > > > +#ifdef CONFIG_XEN
> > > > >=20
> > > > > CONFIG_XEN is set when the _host_ has Xen development files
> > > > > available.
> > > > >=20
> > > > > IIUC here you want to check if Xen HVM guest support is
> > > > > enabled.
> > > > >=20
> > > > > You might want to use a different CONFIG_XEN_xxx key, which
> > > > > itself
> > > > > depends on CONFIG_XEN.
> > > >=20
> > > > Yeah, I'd be interested in opinions on that one.
> > > >=20
> > > > Strictly, the only one that *needs* to be a configure option is
> > > > CONFIG_XEN for the Xen libraries, which is support for actually
> > > > running
> > > > on Xen.
> > > >=20
> > > > Any time KVM is present, we *could* pull in the rest of the
> > > > xenfv
> > > > machine support unconditionally, since that's no longer
> > > > dependent on
> > > > true Xen.
> > > >=20
> > > > But because there's a non-trivial amount of code in the event
> > > > channel
> > > > and grant table stuff, *perhaps* we want to make it optional? I
> > > > don't
> > > > really want to call that CONFIG_KVM_XEN since as noted, it's
> > > > theoretically possible to do it with TCG or other accelerators
> > > > too. So
> > > > we could call it CONFIG_XEN_EMULATION.
> > >=20
> > > I concur CONFIG_KVM_XEN is confusing; CONFIG_XEN_EMULATION /
> > > CONFIG_XEN_EMU sounds better.
> > >=20
> > > Is it useful to have the CONFIG_XEN_EMU code under target/i386/
> > > built
> > > without having the xenfv machine built in?
> >=20
> > It isn't useful, no.
> >=20
> > > I rather have hw/ and target/ features disentangled, so I'd use
> > > CONFIG_XEN_EMU under target/ and CONFIG_XENFV_MACHINE under hw/,
> > > eventually having CONFIG_XEN_EMU depending on
> > > CONFIG_XENFV_MACHINE
> > > and -- for now -- CONFIG_KVM.
> >=20
> > Hm, I was thinking of XENFV_MACHINE as the parts which are needed
> > by
> > *both* XEN_EMU and real Xen. I think there are arch-independent
> > things
> > which want to go into hw/ like event channels and grant table
> > support;
> > you can think of those as an IRQ chip and an IOMMU respectively.
> > Since
> > those are emulation-only, they want to be conditional on XEN_EMU,
> > not
> > XENFV_MACHINE.
> >=20
> > The core hypercall support lives in target/ and would call directly
> > to
> > gnttab_op/evtchn_op functions in hw/xen/ but I think that's OK. The
> > vCPU-specific things like timers and runstate can also stay in
> > target/.
> >=20
> > Nothing in hw/ should explicitly mention KVM; the code in
> > target/i386/xen.c should wrap the KVM-specific implementations
> > unless
> > the pretence of future TCG support is really making it look awful.
> >=20
> > Does that sound reasonable? Probably close enough, and we can take
> > an
> > other look at it once we see how it works out.
> >=20
> > > > I don't think we'd make that depend on CONFIG_XEN though, since
> > > > none of
> > > > the actual Xen libraries would be needed once everything's
> > > > implemented
> > > > and cleaned up.
> > >=20
> > > Agreed.
> > >=20
> > > > So things like the xenfv machine code would then depend on
> > > > (CONFIG_XEN || CONFIG_XEN_EMULATION)... or we could make a new
> > > > automatic config symbol CONFIG_XEN_MACHINE which has the same
> > > > effect?
> > >=20
> > > So per what you just cleared, not CONFIG_XEN but CONFIG_KVM.
> >=20
> > I think it looks something like this...
> >=20
> >  From 0a90999e37ec48b7fbd0467c243769b9bf726401 Mon Sep 17 00:00:00
> > 2001
> > From: David Woodhouse <
> > dwmw@amazon.co.uk
> > >
> > Date: Tue, 6 Dec 2022 09:03:48 +0000
> > Subject: [PATCH] Add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU
> > options for Xen
> >   emulation
> >=20
> > The XEN_EMU option will cover core Xen support in target/, which
> > exists
> > only for x86 with KVM today but could theoretically also be
> > implemented
> > on Arm/Aarch64 and with TCG or other accelerators. It will also
> > cover
> > the support for architecture-independent grant table and event
> > channel
> > support which will be added in hw/xen/.
> >=20
> > The XENFV_MACHINE option is for the xenfv platform support, which
> > will
> > now be used both by XEN_EMU and by real Xen.
> >=20
> > The XEN option remains dependent on the Xen runtime libraries, and
> > covers
> > support for real Xen. Some code which currently resides under
> > CONFIG_XEN
> > will be moving to CONFIG_XENFV_MACHINE over time.
> >=20
> > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > ---
> >   accel/Kconfig  | 2 ++
> >   hw/Kconfig     | 1 +
> >   hw/xen/Kconfig | 2 ++
> >   meson.build    | 1 +
> >   target/Kconfig | 3 +++
> >   5 files changed, 9 insertions(+)
> >   create mode 100644 hw/xen/Kconfig
> >=20
> > diff --git a/accel/Kconfig b/accel/Kconfig
> > index 8bdedb7d15..87d2880cad 100644
> > --- a/accel/Kconfig
> > +++ b/accel/Kconfig
> > @@ -15,7 +15,9 @@ config TCG
> >  =20
> >   config KVM
> >       bool
> > +    select XEN_EMU if (I386 || X86_64)
>=20
> We certainly can build KVM without XEN_EMU...
>=20
> You might want to s/select/imply/ here.

OK.

> >   config XEN
> >       bool
> >       select FSDEV_9P if VIRTFS
> > +    select XENFV_MACHINE
>=20
> This is the XEN (host) accelerator switch... You said previously
> it is not related to the guest xenfv machine.

The xenfv platform definition, and various other things like the Xen
PCI platform device, are currently covered by CONFIG_XEN.

The idea is that we'd change that to CONFIG_XENFV_MACHINE so that they
can be present if *either* CONFIG_XEN or CONFIG_XEN_EMU are enabled.

So (given your later comment about target features not selecting a a
hw/machine component) I've made it:

config XENFV_MACHINE
    bool
    default y if (XEN || XEN_EMU)

How's this...

=46rom eaff99027a888aac8a5df554ef22f37dc271be66 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Tue, 6 Dec 2022 09:03:48 +0000
Subject: [PATCH] Add CONFIG_XENFV_MACHINE and CONFIG_XEN_EMU options for Xe=
n
 emulation

The XEN_EMU option will cover core Xen support in target/, which exists
only for x86 with KVM today but could theoretically also be implemented
on Arm/Aarch64 and with TCG or other accelerators. It will also cover
the support for architecture-independent grant table and event channel
support which will be added in hw/xen/.

The XENFV_MACHINE option is for the xenfv platform support, which will
now be used both by XEN_EMU and by real Xen.

The XEN option remains dependent on the Xen runtime libraries, and covers
support for real Xen. Some code which currently resides under CONFIG_XEN
will be moving to CONFIG_XENFV_MACHINE over time.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 accel/Kconfig  | 1 +
 hw/Kconfig     | 1 +
 hw/xen/Kconfig | 3 +++
 meson.build    | 1 +
 target/Kconfig | 4 ++++
 5 files changed, 10 insertions(+)
 create mode 100644 hw/xen/Kconfig

diff --git a/accel/Kconfig b/accel/Kconfig
index 8bdedb7d15..41e089e610 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,6 +15,7 @@ config TCG
=20
 config KVM
     bool
+    imply XEN_EMU if (I386 || X86_64)
=20
 config XEN
     bool
diff --git a/hw/Kconfig b/hw/Kconfig
index 38233bbb0f..ba62ff6417 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -41,6 +41,7 @@ source tpm/Kconfig
 source usb/Kconfig
 source virtio/Kconfig
 source vfio/Kconfig
+source xen/Kconfig
 source watchdog/Kconfig
=20
 # arch Kconfig
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
new file mode 100644
index 0000000000..755c8b1faf
--- /dev/null
+++ b/hw/xen/Kconfig
@@ -0,0 +1,3 @@
+config XENFV_MACHINE
+    bool
+    default y if (XEN || XEN_EMU)
diff --git a/meson.build b/meson.build
index 5c6b5a1c75..9348cf572c 100644
--- a/meson.build
+++ b/meson.build
@@ -3828,6 +3828,7 @@ if have_system
   if xen.found()
     summary_info +=3D {'xen ctrl version':  xen.version()}
   endif
+  summary_info +=3D {'Xen emulation':     config_all.has_key('CONFIG_XEN_E=
MU')}
 endif
 summary_info +=3D {'TCG support':       config_all.has_key('CONFIG_TCG')}
 if config_all.has_key('CONFIG_TCG')
diff --git a/target/Kconfig b/target/Kconfig
index 83da0bd293..e19c9d77b5 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -18,3 +18,7 @@ source sh4/Kconfig
 source sparc/Kconfig
 source tricore/Kconfig
 source xtensa/Kconfig
+
+config XEN_EMU
+    bool
+    depends on KVM && (I386 || X86_64)
--=20
2.25.1


--=-MC2mUibBJLIjnC7wW5go
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIxMjA2MTEzMDA3WjAvBgkqhkiG9w0BCQQxIgQgkm2mTyEc
P/kSYIzICTARe5Z1MEAEze/HYy/IXnFOgvgwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBF5ZO9HZhjwqbsq6tbEyfnl/KLE92qJgeV
Rv7tjeWocgsxwTJZa7ZxAn16KUgEz+iELNk9gnvqOF/W/33oJrE/DpZDVZQ+DMnEXOEmlblb0KS4
Gft47FL8/LZvs/9Qq9FrvPcROvqza8V/8FUo2jApdA9I4dKLzDg4TPmVdDpaJlNFqHifjEWkjki9
UpTE/CoRT9J/hRAJ9HhBzPOqQ2/kEbSsLy0JgZ/Yuef0HMYd177D/QjKgxOEgpEBW3QJfueXMR+3
6WSjNe3XhPeV3+4hbx42QQNToiXQWH122loV8xW3ac/qqiiGHIANHMtFdKHm8aTMFhPZdrmNLWo5
p3Egj3mqiSjcQBBHwGfFKuO+iH6wYOowH49w9Zo6+56lSvt4IK01SxxpdhyWNdN8XGmXQ+2G0IcT
WnGjWsPEzg4gvOqxy+MYQFUPEeOvOWKEMYG8nr1R23jsuc1kIwkXbsc15lBkKlWSmk7vy7vu8nHn
I6QTGvUYhFlzb/wDVcghNYJ2hxb3g6fe7jEyLsQy3oXIOJ8czrEIMY9qtONG25fFO+YFVZ/6OZ2V
YQHhbATOZyqVf+/+R/nVvPGKBKQpdDuNxsZZKEAO1kXmGO8yScLEXOh3nVpXm6vqk50E6vR0icQE
/PMk7zUdsTO2OxeS47YfUXb8UtHsBpbOx0kZ8Iwt2gAAAAAAAA==


--=-MC2mUibBJLIjnC7wW5go--


