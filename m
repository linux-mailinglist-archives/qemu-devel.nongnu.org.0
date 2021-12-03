Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3D84675EC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 12:08:52 +0100 (CET)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt6Qq-0002O0-So
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 06:08:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b09ca3440ca12902e654+6676+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1mt65k-0007R0-3w
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:47:00 -0500
Received: from [2607:7c80:54:e::133] (port=41934 helo=bombadil.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b09ca3440ca12902e654+6676+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1mt65f-0007ZV-Ti
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 05:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=00RmczPDDgNMsZyOCFwWbdd7sIMAXQ73fx26MnbbYkY=; b=Tk34OFb63Y8zXEYSwEHK0kZ5gh
 9XfG86tq9ZPugCg1G3I/2UkIu1v0jCZskIz4qJKH0o8bkRO5hy1wIywqx6716UzDz2Ri6yHouJ9xm
 zZ6OT5WA/kkTuAWY9r2jc7yZmyzhkJp4tF7hKjmm9uNolRWL2er74lzXmLb2rJgisH8HRiId9tHMk
 KumjjTGd49qPxoCKPLHG8zwPj3EqjYILLBu/lehT6n+CuJFZvy1Q0P21KmttNDzWHMAbMk2/noeSl
 74Yu7EFt/LFGbarSy4l0OZJS2ogYgzay6HxkIX7Gp65R1gdSvAxjKLgKIyBpxuHK/QwkBw/iIfxhn
 4km81gxw==;
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt65Z-00FEM0-C9; Fri, 03 Dec 2021 10:46:49 +0000
Message-ID: <e5d91ce70d40caa4d91e29d2227ad72ccf1a1bb6.camel@infradead.org>
Subject: Re: [PATCH 1/2] intel_iommu: Support IR-only mode without DMA
 translation
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Date: Fri, 03 Dec 2021 10:46:46 +0000
In-Reply-To: <YanJkBiLtxzt04Hn@xz-m1.local>
References: <20211201205113.57299-1-dwmw2@infradead.org>
 <CACGkMEuhnUZuKa-u1MDudmnLrwXO=B5WSp-siAC-UpUONey8xw@mail.gmail.com>
 <YanJkBiLtxzt04Hn@xz-m1.local>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-P5d2fQ8uktE1p1Z55Y0c"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:e::133
 (failed)
Received-SPF: none client-ip=2607:7c80:54:e::133;
 envelope-from=BATV+b09ca3440ca12902e654+6676+infradead.org+dwmw2@bombadil.srs.infradead.org;
 helo=bombadil.infradead.org
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-P5d2fQ8uktE1p1Z55Y0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-12-03 at 15:38 +0800, Peter Xu wrote:
> On Thu, Dec 02, 2021 at 11:49:25AM +0800, Jason Wang wrote:
> > On Thu, Dec 2, 2021 at 4:55 AM David Woodhouse <dwmw2@infradead.org> wr=
ote:
> > > From: David Woodhouse <dwmw@amazon.co.uk>
> > >=20
> > > By setting none of the SAGAW bits we can indicate to a guest that DMA
> > > translation isn't supported. Tested by booting Windows 10, as well as
> > > Linux guests with the fix at=20
> > > https://git.kernel.org/torvalds/c/c40aaaac10
> > >=20
> > >=20
> > > Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> > > ---
> > >  hw/i386/intel_iommu.c         | 14 ++++++++++----
> > >  include/hw/i386/intel_iommu.h |  1 +
> > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 294499ee20..ffc852d110 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -2202,7 +2202,7 @@ static void vtd_handle_gcmd_write(IntelIOMMUSta=
te *s)
> > >      uint32_t changed =3D status ^ val;
> > >=20
> > >      trace_vtd_reg_write_gcmd(status, val);
> > > -    if (changed & VTD_GCMD_TE) {
> > > +    if ((changed & VTD_GCMD_TE) && s->dma_translation) {
> > >          /* Translation enable/disable */
> > >          vtd_handle_gcmd_te(s, val & VTD_GCMD_TE);
> > >      }
> > > @@ -3100,6 +3100,7 @@ static Property vtd_properties[] =3D {
> > >      DEFINE_PROP_BOOL("caching-mode", IntelIOMMUState, caching_mode, =
FALSE),
> > >      DEFINE_PROP_BOOL("x-scalable-mode", IntelIOMMUState, scalable_mo=
de, FALSE),
> > >      DEFINE_PROP_BOOL("dma-drain", IntelIOMMUState, dma_drain, true),
> > > +    DEFINE_PROP_BOOL("dma-translation", IntelIOMMUState, dma_transla=
tion, true),
> > >      DEFINE_PROP_END_OF_LIST(),
> > >  };
> > >=20
> > > @@ -3605,12 +3606,17 @@ static void vtd_init(IntelIOMMUState *s)
> > >      s->next_frcd_reg =3D 0;
> > >      s->cap =3D VTD_CAP_FRO | VTD_CAP_NFR | VTD_CAP_ND |
> > >               VTD_CAP_MAMV | VTD_CAP_PSI | VTD_CAP_SLLPS |
> > > -             VTD_CAP_SAGAW_39bit | VTD_CAP_MGAW(s->aw_bits);
> > > +             VTD_CAP_MGAW(s->aw_bits);
> > >      if (s->dma_drain) {
> > >          s->cap |=3D VTD_CAP_DRAIN;
> > >      }
> > > -    if (s->aw_bits =3D=3D VTD_HOST_AW_48BIT) {
> > > -        s->cap |=3D VTD_CAP_SAGAW_48bit;
> > > +    if (s->dma_translation) {
> > > +            if (s->aw_bits >=3D VTD_HOST_AW_39BIT) {
> > > +                    s->cap |=3D VTD_CAP_SAGAW_39bit;
> > > +            }
> > > +            if (s->aw_bits >=3D VTD_HOST_AW_48BIT) {
> > > +                    s->cap |=3D VTD_CAP_SAGAW_48bit;
> > > +            }
> > >      }
> >=20
> > Just wonder if this is the hardware behaviour as I see 0 is reserved
> > for SAGAW in vtd 3.3 spec.
>=20
> Yes I have the same question.  But if latest Linux & Windows work fine th=
en it
> seems ok if we have explicit use scenario with enabling IR only.

Bit zero is reserved. The *value* zero is just what you get when none
of the bits are set.

	"A value of 1 in any of these bits indicates the corresponding
	adjusted guest address width is supported.The adjusted guest
	address widths corresponding to various bit positions within
	this field are:

	 =E2=80=A2 0: Reserved
	 =E2=80=A2 1: 39-bit AGAW (3-level page-table)
	 =E2=80=A2 2: 48-bit AGAW (4-level page-table)
	 =E2=80=A2 3: 57-bit AGAW (5-level page-table)
	 =E2=80=A2 4: Reserved

	Software must ensure that the adjusted guest address width used
	to set up the page tables is one of the supported guest address
	widths reported in this field.

	Hardware implementations reporting second-level translation
	support (SLTS) field as Clear also report this field as 0.
=20
> In that case commenting with some details would be more than welcomed, e.=
g.
> mentioning Linux commit c40aaaac1018 ("iommu/vt-d: Gracefully handle DMAR=
 units
> with no supported address widths", 2020-10-07) as comments above the code=
.
>=20
> One more question: SAGAW is a bitmask, is it intended to only set 1 bit o=
ut of
> the mask?  I'm afraid it could break guest OS that only support 39 bits w=
hen
> the qemu cmdline has aw-bits=3D48 specified.

No, we should set all bits that correspond to supported page table
depths. And I believe we still do; there's no 'else' in the patch above
so it will set *both* the 39-bit and 48-bit support bits if s->aw_bits
is high enough to support both.



--=-P5d2fQ8uktE1p1Z55Y0c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCECow
ggUcMIIEBKADAgECAhEA4rtJSHkq7AnpxKUY8ZlYZjANBgkqhkiG9w0BAQsFADCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTkwMTAyMDAwMDAwWhcNMjIwMTAxMjM1
OTU5WjAkMSIwIAYJKoZIhvcNAQkBFhNkd213MkBpbmZyYWRlYWQub3JnMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAsv3wObLTCbUA7GJqKj9vHGf+Fa+tpkO+ZRVve9EpNsMsfXhvFpb8
RgL8vD+L133wK6csYoDU7zKiAo92FMUWaY1Hy6HqvVr9oevfTV3xhB5rQO1RHJoAfkvhy+wpjo7Q
cXuzkOpibq2YurVStHAiGqAOMGMXhcVGqPuGhcVcVzVUjsvEzAV9Po9K2rpZ52FE4rDkpDK1pBK+
uOAyOkgIg/cD8Kugav5tyapydeWMZRJQH1vMQ6OVT24CyAn2yXm2NgTQMS1mpzStP2ioPtTnszIQ
Ih7ASVzhV6csHb8Yrkx8mgllOyrt9Y2kWRRJFm/FPRNEurOeNV6lnYAXOymVJwIDAQABo4IB0zCC
Ac8wHwYDVR0jBBgwFoAUgq9sjPjF/pZhfOgfPStxSF7Ei8AwHQYDVR0OBBYEFLfuNf820LvaT4AK
xrGK3EKx1DE7MA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMB0GA1UdJQQWMBQGCCsGAQUF
BwMEBggrBgEFBQcDAjBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEDBTArMCkGCCsGAQUFBwIBFh1o
dHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWls
Q0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9jcnQuY29tb2RvY2Eu
Y29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcnQwJAYI
KwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAeBgNVHREEFzAVgRNkd213MkBpbmZy
YWRlYWQub3JnMA0GCSqGSIb3DQEBCwUAA4IBAQALbSykFusvvVkSIWttcEeifOGGKs7Wx2f5f45b
nv2ghcxK5URjUvCnJhg+soxOMoQLG6+nbhzzb2rLTdRVGbvjZH0fOOzq0LShq0EXsqnJbbuwJhK+
PnBtqX5O23PMHutP1l88AtVN+Rb72oSvnD+dK6708JqqUx2MAFLMevrhJRXLjKb2Mm+/8XBpEw+B
7DisN4TMlLB/d55WnT9UPNHmQ+3KFL7QrTO8hYExkU849g58Dn3Nw3oCbMUgny81ocrLlB2Z5fFG
Qu1AdNiBA+kg/UxzyJZpFbKfCITd5yX49bOriL692aMVDyqUvh8fP+T99PqorH4cIJP6OxSTdxKM
MIIFHDCCBASgAwIBAgIRAOK7SUh5KuwJ6cSlGPGZWGYwDQYJKoZIhvcNAQELBQAwgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTE5MDEwMjAwMDAwMFoXDTIyMDEwMTIz
NTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBALL98Dmy0wm1AOxiaio/bxxn/hWvraZDvmUVb3vRKTbDLH14bxaW
/EYC/Lw/i9d98CunLGKA1O8yogKPdhTFFmmNR8uh6r1a/aHr301d8YQea0DtURyaAH5L4cvsKY6O
0HF7s5DqYm6tmLq1UrRwIhqgDjBjF4XFRqj7hoXFXFc1VI7LxMwFfT6PStq6WedhROKw5KQytaQS
vrjgMjpICIP3A/CroGr+bcmqcnXljGUSUB9bzEOjlU9uAsgJ9sl5tjYE0DEtZqc0rT9oqD7U57My
ECIewElc4VenLB2/GK5MfJoJZTsq7fWNpFkUSRZvxT0TRLqznjVepZ2AFzsplScCAwEAAaOCAdMw
ggHPMB8GA1UdIwQYMBaAFIKvbIz4xf6WYXzoHz0rcUhexIvAMB0GA1UdDgQWBBS37jX/NtC72k+A
CsaxitxCsdQxOzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEF
BQcDBAYIKwYBBQUHAwIwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAwUwKzApBggrBgEFBQcCARYd
aHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2Ny
bC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LmNvbW9kb2Nh
LmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0MCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAC20spBbrL71ZEiFrbXBHonzhhirO1sdn+X+O
W579oIXMSuVEY1LwpyYYPrKMTjKECxuvp24c829qy03UVRm742R9Hzjs6tC0oatBF7KpyW27sCYS
vj5wbal+TttzzB7rT9ZfPALVTfkW+9qEr5w/nSuu9PCaqlMdjABSzHr64SUVy4ym9jJvv/FwaRMP
gew4rDeEzJSwf3eeVp0/VDzR5kPtyhS+0K0zvIWBMZFPOPYOfA59zcN6AmzFIJ8vNaHKy5QdmeXx
RkLtQHTYgQPpIP1Mc8iWaRWynwiE3ecl+PWzq4i+vdmjFQ8qlL4fHz/k/fT6qKx+HCCT+jsUk3cS
jDCCBeYwggPOoAMCAQICEGqb4Tg7/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRp
b24gQXV0aG9yaXR5MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYT
AkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNV
BAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1u6zf
+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+RKwrB6vcf
WlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxyb4o4yNNwTqza
aPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/VCJv5ym6Q0mdCbDK
CMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCCATgwHwYDVR0jBBgwFoAU
u69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6WYXzoHz0rcUhexIvAMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1UdIAQKMAgwBgYEVR0gADBMBgNVHR8E
RTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9u
QXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMwOwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29t
b2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
cC5jb21vZG9jYS5jb20wDQYJKoZIhvcNAQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2
SQgG1NgvNc3fQP7TcePo7EIMERoh42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs
0j8CGpfb+SJA3GaBQ+394k+z3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDM
KVmU/PUWNMKSTvtlenlxBhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+
E2pvOUtY+hPebuPtTbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfH
M5tdhYF/8v5UY5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4
jkhJiA7EuTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1t
yZR2niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI8nAb
R9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYIDyjCCA8YCAQEwga0wgZcxCzAJBgNV
BAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAY
BgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRo
ZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA4rtJSHkq7AnpxKUY8ZlYZjANBglghkgB
ZQMEAgEFAKCCAe0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEx
MjAzMTA0NjQ2WjAvBgkqhkiG9w0BCQQxIgQgP3P9aErArjrHYel0dtTvP9f8VVha86dWbwHu8bA/
+U0wgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAGl/wOACDCqiuwEpbCJbKvsogKRPoLspUjX/mb6aWY2SXS2upEUJWGl8/HniIy4V
DhdesgOhlnm1WiVN+ONFp8jCFn1t6a0bQYzkXRa85L4JsQXtdy/sx7dfioNlz6BVITG8o0vshk0W
5Tg8Nytc5xLYe6WrEGN8nxc81w7lhjVlbiYubbx6BAqD1vEZSFlsHOpzsYR/eXn9la2ViC+AQHmj
9oKGK0yzvZlrVFIuqF9n+2VbY6d+T2X6vXBQdxMJ+5a5K9vMsx/8rHIP9MhKCGoKdF/fSLUnEEdF
Ifqiq3yCdzPGTwk4TNUrS1bjq94gfWj68eSKO2xlEv8vIawqxskAAAAAAAA=


--=-P5d2fQ8uktE1p1Z55Y0c--


