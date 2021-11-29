Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBDF461D00
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 18:49:58 +0100 (CET)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrkmq-0004ZY-6N
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 12:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33c26fee4c87d252def+6672+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1mrkHV-0005EX-1V
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:17:33 -0500
Received: from [2607:7c80:54:e::133] (port=33744 helo=bombadil.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+a33c26fee4c87d252def+6672+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1mrkHN-0001sC-A7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 12:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7K4v3fU6Avf/7I5ntlYx0LkWsGMMNNQqd8Gt9xp5Ba4=; b=mP7BTvZMGNPTOklEMS5NGVxDMV
 AbbwYBQrcIxNhQLNyv9NSJJy2vlsZTc9Kx7LRiVgptB2BAN1/ejJfTY8SZsmXordwOOGKXw5NSwuX
 Zpqcoxz2ilPtSjS5WCO/hC4Y3pZ5b5cP4FU2YYNFl2XmREWpQD2Ejt/prRi1CSZth+UDLfTIy6ELz
 0DMSbyxkrWk3QJ8cDOId/w8eaObQ592GxgBMe2y+/bKUoWBxSrwZabjgDMDGKex3QlJvjT17zUMGh
 1N6tdq/U3mqpdcjGO3XZ01J2q1D6qiI8V2BD1E9gbm1jsp6iiAI6PA3+fEVeCqJj6MtGbAZib64y+
 YKzxahgg==;
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=u3832b3a9db3152.ant.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrkHE-001Zh1-KR; Mon, 29 Nov 2021 17:17:17 +0000
Message-ID: <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models
 functions for max, host, base
From: David Woodhouse <dwmw2@infradead.org>
To: Claudio Fontana <cfontana@suse.de>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Date: Mon, 29 Nov 2021 17:17:13 +0000
In-Reply-To: <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-/s4MPWcznig7H8FTFGK2"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:e::133
 (failed)
Received-SPF: none client-ip=2607:7c80:54:e::133;
 envelope-from=BATV+a33c26fee4c87d252def+6672+infradead.org+dwmw2@bombadil.srs.infradead.org;
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alxndr@bu.edu" <alxndr@bu.edu>, "philmd@redhat.com" <philmd@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "lovemrd@gmail.com" <lovemrd@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-/s4MPWcznig7H8FTFGK2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-11-29 at 17:57 +0100, Claudio Fontana wrote:
> On 11/29/21 4:11 PM, David Woodhouse wrote:
> > On Mon, 2021-11-29 at 15:14 +0100, Claudio Fontana wrote:
> > > On 11/29/21 12:39 PM, Woodhouse, David wrote:
> > > > On Fri, 2021-07-23 at 13:29 +0200, Claudio Fontana wrote:
> > > > >  static void kvm_cpu_instance_init(CPUState *cs)
> > > > >  {
> > > > >      X86CPU *cpu =3D X86_CPU(cs);
> > > > > +    X86CPUClass *xcc =3D X86_CPU_GET_CLASS(cpu);
> > > > >=20
> > > > >      host_cpu_instance_init(cpu);
> > > > >=20
> > > > > -    if (!kvm_irqchip_in_kernel()) {
> > > > > -        x86_cpu_change_kvm_default("x2apic", "off");
> > > > > -    } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
> > > > > -        x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
> > > > > -    }
> > > > > -
> > > > > -    /* Special cases not set in the X86CPUDefinition structs: */
> > > > > +    if (xcc->model) {
> > > > > +        /* only applies to builtin_x86_defs cpus */
> > > > > +        if (!kvm_irqchip_in_kernel()) {
> > > > > +            x86_cpu_change_kvm_default("x2apic", "off");
> > > > > +        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()=
) {
> > > > > +            x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "o=
n");
> > > > > +        }
> > > > >=20
> > > > > -    x86_cpu_apply_props(cpu, kvm_default_props);
> > > > > +        /* Special cases not set in the X86CPUDefinition structs=
: */
> > > > > +        x86_cpu_apply_props(cpu, kvm_default_props);
> > > > > +    }
> > > > >=20
> > > >=20
> > > > I think this causes a regression in x2apic and kvm-msi-ext-dest-id
> > > > support. If you start qemu thus:
> > >=20
> > > If I recall correctly, this change just tries to restore the behavior=
 prior to
> > > commit f5cc5a5c168674f84bf061cdb307c2d25fba5448 ,
> > >=20
> > > fixing the issue introduced with the refactoring at that time.
> > >=20
> > > Can you try bisecting prior to
> > > f5cc5a5c168674f84bf061cdb307c2d25fba5448 , to see if the actual
> > > breakage comes from somewhere else?
> >=20
> > Hm, so it looks like it never worked for '-cpu host' *until* commit
> > f5cc5a5c16.
>=20
> Right, so here we are talking about properly supporting this for the firs=
t time.
>=20
> The fact that it works with f5cc5a5c16 is more an accident than anything =
else, that commit was clearly broken
> (exemplified by reports of failed boots).
>=20
> So we need to find the proper solution, ie, exactly which features should=
 be enabled for which cpu classes and models.
>=20
> >=20
> > It didn't matter before c1bb5418e3 because you couldn't enable that
> > many vCPUs without an IOMMU, and the *IOMMU* setup would call
> > kvm_enable_x2apic().
> >=20
> > But after that, nothing ever called kvm_enable_x2apic() in the '-cpu
> > host' case until commit f5cc5a5c16, which fixed it... until you
> > restored the previous behaviour :)
> >=20
> > This "works" to fix this case, but presumably isn't correct:
>=20
> Right, we cannot just enable all this code, or the original refactor woul=
d have been right.
>=20
> These kvm default properties have been as far as I know intended for the =
cpu actual models (builtin_x86_defs),
> and not for the special cpu classes max, host and base. This is what the =
revert addresses.
>=20
> I suspect what we actually need here is to review exactly in which specif=
ic cases kvm_enable_x2apic() should be called in the end.
>=20
> The code there is mixing changes to the kvm_default_props that are then a=
pplied using x86_cpu_apply_props (and that part should be only for xcc->mod=
el !=3D NULL),
> with the actual enablement of the kvm x2apic using kvm_vm_enable_cap(s, K=
VM_CAP_X2APIC_API, 0, flags) via kvm_enable_x2apic().
>=20
> One way is to ignore this detail and just move out those checks, since ch=
anges to kvm_default_props are harmless once we skip the x86_cpu_apply_prop=
s call,
> as such:=20
>=20
> ------
>=20
> static void kvm_cpu_instance_init(CPUState *cs)
> {
>     X86CPU *cpu =3D X86_CPU(cs);
>     X86CPUClass *xcc =3D X86_CPU_GET_CLASS(cpu);
>=20
>     host_cpu_instance_init(cpu);
>=20
>     /* only applies to builtin_x86_defs cpus */
>     if (!kvm_irqchip_in_kernel()) {
>         x86_cpu_change_kvm_default("x2apic", "off");
>     } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
>         x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
>     }
>=20
>     if (xcc->model) {
>         /* Special cases not set in the X86CPUDefinition structs: */
>         x86_cpu_apply_props(cpu, kvm_default_props);
>     }
>=20

I don't believe that works in the case when kvm_enable_x2apic() fails
on an older kernel. Although it sets the defaults, it still doesn't
then *apply* them so it makes no difference.

How about this:

--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -739,9 +739,9 @@ void pc_machine_done(Notifier *notifier, void *data)
=20
=20
     if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
-        !kvm_irqchip_in_kernel()) {
+        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
         error_report("current -smp configuration requires kernel "
-                     "irqchip support.");
+                     "irqchip and X2APIC API support.");
         exit(EXIT_FAILURE);
     }
 }


--=-/s4MPWcznig7H8FTFGK2
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
MTI5MTcxNzEzWjAvBgkqhkiG9w0BCQQxIgQgdw8vy8HS1igN0IkNJbjqG/N8j9TJkrukBE3BOC8F
6Awwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAA6g2dM9m7FkRIjr/jxYMDpvgSTsDrxHxGbezCvdNRDbDoU1MSxWbmQZbggjYKfU
0ognUsmbO3nyciilt21gTtjSgrwqAFtrZ751rWJkeokoKZ/dL9v+SD8E5vqeQCCwKOIbnqXUYHAL
6JXfbuevgtFIUYCuqi9Ew/C2pWOec9Ow2V4CaQQk1+wsK2+LCGyY5sZt9kmW9iwcYKkRhBAO4HbB
YSNnBkG7qTduKbRL/8Lv7nZ2pL3l9OrDWgBh0/APBb55UqaNIAiyuhpx7YniInwqYp00FGZiYx5D
Lh2MthYFGux+odiHVnTioJ90k9sbZ7BR1ROhA37deOH1jv7goZQAAAAAAAA=


--=-/s4MPWcznig7H8FTFGK2--


