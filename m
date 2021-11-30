Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB97463467
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:35:45 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms2MJ-0003jZ-Ue
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:35:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d53dfa5199d6a29bf1d+6673+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1ms21M-0006u6-Bb
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:14:05 -0500
Received: from [2607:7c80:54:e::133] (port=35790 helo=bombadil.infradead.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d53dfa5199d6a29bf1d+6673+infradead.org+dwmw2@bombadil.srs.infradead.org>)
 id 1ms21I-0005Z9-20
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:14:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+fy2T4IpUER1Vhf+2qdfomK3lSpddD9LdGy2NhdYj3k=; b=usoAk8GySox8XPaU2lwLG1dXHw
 dgmPPv4KqC8HDza7eIOmv5Lq2N09gJki5MxouobACVD9ZLr0Im2KqKXH1RPNH0ugTRXS3oVY5oYk5
 SNA6raR+nmoArLQkkg5g7fuHlvrToeGReveSCTnTs2PACAx3Ft046HaIYkbIlkbD0c1eogiyiX2nE
 lM+g169TinKwOdfoadxcoRqIHN1lM20iG7srSK3gpxs6HxzHONDqgM+VYhUPb9dMJkmB80JDA9wAC
 ZG+RlalvBLrJM+rtlc3qTH6ZDg87vXHUyAQgbt5nkTdw3Q2zFridkJepE/c7zm5VWhvflhiv4VkEt
 eXsYAjqw==;
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=freeip.amazon.com)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms21A-0053N5-UN; Tue, 30 Nov 2021 12:13:53 +0000
Message-ID: <41878a65209a3e1fc00bdafd216004c9f71b90fa.camel@infradead.org>
Subject: Re: [PATCH for-6.1 v2] i386: do not call cpudef-only models
 functions for max, host, base
From: David Woodhouse <dwmw2@infradead.org>
To: Claudio Fontana <cfontana@suse.de>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>
Date: Tue, 30 Nov 2021 12:13:50 +0000
In-Reply-To: <9990ade1-ccfa-a712-94c0-1667f5b3094f@suse.de>
References: <20210723112921.12637-1-cfontana@suse.de>
 <1102c315addf2f2fffc49222ab5be118e7ae9b0f.camel@amazon.co.uk>
 <f5910284-14ca-8796-4e64-38fef246bd19@suse.de>
 <e57e2119df69ac190cdd763b7ac8d5894b110839.camel@infradead.org>
 <b613015e-3285-8d30-292f-6bf9816b1912@suse.de>
 <d579bf46d0babc9eece1dc3e8ec63c43b311b022.camel@infradead.org>
 <483ebe21-2972-90c0-bc9a-ce922518632d@suse.de>
 <bdd861f68aa1533b2ea752c6509c03ca7b9f0279.camel@infradead.org>
 <93efa230-fb6b-fdc7-a696-c555676da2b4@suse.de>
 <d437972602decfeb392b08563589952358bdd510.camel@infradead.org>
 <9990ade1-ccfa-a712-94c0-1667f5b3094f@suse.de>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-4sFofO65zAX2OoQMSMTP"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:7c80:54:e::133
 (failed)
Received-SPF: none client-ip=2607:7c80:54:e::133;
 envelope-from=BATV+3d53dfa5199d6a29bf1d+6673+infradead.org+dwmw2@bombadil.srs.infradead.org;
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
Cc: "lovemrd@gmail.com" <lovemrd@gmail.com>, "alxndr@bu.edu" <alxndr@bu.edu>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--=-4sFofO65zAX2OoQMSMTP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-11-30 at 10:00 +0100, Claudio Fontana wrote:
> I tend to agree that what we want if kvm_enable_x2apic fails is to abort =
QEMU if we have been requesting smp > 255,
> and if we did not request smp > 255 cpus, we want to not advertise the fe=
ature.
>=20
> This is not accomplished, neither by my snippet above, not by the existin=
g code at any point in git history, and not by yours in itself.
>=20
> Your change seems to accomplish the call to kvm_enable_x2apic, and abort =
if requested smp > 255,
> but it does not stop advertising X2APIC and ext-dest-id on kvm_enable_x2a=
pic failure for the case < 255, so we'd need to add that.

We don't need kvm_enable_x2apic() at all if all APIC IDs are <255.

The kvm_enable_x2apic() call sets two flags. The first (USE_32BIT_IDS)
makes KVM take the high bits of the target APIC ID from the high bits
of the MSI address. So is only relevant if we ever want to deliver
interrupts to CPUs above 255.

The second (DISABLE_BROADCAST_QUIRK) prevents APIC ID 255 from being
interpreted as a broadcast. This is relevant if you ever want to
deliver interrupts to APIC #255.

So we need kvm_enable_x2apic() *if* we have APICs >=3D 255, but we don't
care about it if we have fewer CPUs.

Note the condition is '>=3D 255'. Not '> 255'.

With APIC IDs < 256 it also doesn't matter whether we advertise the
ext-dest-id feature to the guest or not, since that only tells them
where to put the upper bits... and there aren't any upper bits.

> Do I understand it right? Do we need to wrap all of this logic in a if (k=
vm_enabled()) ?

For Xen because we aren't really emulating CPUs or APICs at all, it
doesn't matter and you can have as many CPUs as you like.

For TCG or (KVM && !kvm_irqchip_in_kernel()) we are limited to 254
because our userspace lapic doesn't emulate x2apic at all. But in the
TCG case, even if KVM isn't *built*, kvm_irqchip_in_kernel() will
return false. So all we need to check is kvm_irqchip_in_kernel().

I think the correct check is what I had in pc_machine_done() with the
off-by-one error fixed:

    if (x86ms->apic_id_limit >=3D 255 && !xen_enabled() &&
        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {

But that doesn't help microvm unless we copy it there too.=20

Let's take a look at the code we were already looking at in
kvm_cpu_instance_init():

        /* only applies to builtin_x86_defs cpus */
        if (!kvm_irqchip_in_kernel()) {
            x86_cpu_change_kvm_default("x2apic", "off");

That part is purely cosmetic because kvm_arch_get_supported_cpuid() is
*already* going to mask out the X2APIC bit if(!kvm_irqchip_in_kernel())
anyway.

        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
		x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
        }

That part makes sense but there's a check missing here because even
*without* ext-dest-id we can't support APIC ID 255 without using
kvm_enable_x2apic().

And by the time we're in kvm_cpu_instance_init() for the CPU with APIC
ID #255, it's too late to disable x2apic support for all the previous
CPUs.

So... we either do the check in pc_machine_done() and also a similar
check for microvm, or we actually abort in kvm_cpu_instance_init() if
this CPU's APIC ID is >=3D255 and kvm_enable_x2apic() has failed.

Either way, the call in intel_iommu can die.




> >=20
> > In that case it needs to turn x2apic support *off*. But simply calling
> > (or not calling) x86_cpu_change_kvm_default() makes absolutely no
> > difference unless those defaults are *applied* by calling
> > x86_cpu_apply_props()
>=20
> right, it makes absolutely no difference, and we cannot use kvm_default_p=
rops, as they are for something else entirely.
>=20
> > or making the same change by some other means.
>=20
> right, we need to change it by other means.
>=20
> It is still unclear to me for which cpu classes and versioned models we s=
hould behave like this. Thoughts?
>=20
> "max"? "base"? versioned models: depending on the model features?
>=20
> >=20
> >=20
> > > > So what I care about (in case =E2=88=83 APIC IDs >=3D 255) is two t=
hings:
> > > >=20
> > > >  1. Qemu needs to call kvm_enable_x2apic().
> > > >  2. If that *fails* qemu needs to *stop* advertising X2APIC and ext=
-dest-id.
>=20
> Understand. We also need though:
>=20
> 3. Not call kvm_enable_x2apic() when it should not be called (non-KVM acc=
elerator, which cpu classes and models)
> 4. Not stop advertising X2APIC and ext-dest-id when we shouldn't stop adv=
ertising it.
>=20
> > > >=20
> > > >=20
> > > > That last patch snippet in pc_machine_done() should suffice to achi=
eve
> > > > that, I think. Because if kvm_enable_x2apic() fails and qemu has be=
en
> > > > asked for that many CPUs, it aborts completely. Which seems right.
>=20
> see comments above, and should we limit that code to when kvm is enabled?
>=20
> > > >=20
> > >=20
> > > seems right to abort if requesting > 255 APIC IDs cannot be satisfied=
, I agree.
> > >=20
> > > So I think in the end, we want to:
> > >=20
> > > 1) make sure that when accel=3Dkvm and smp > 255 for i386, using cpu =
"host", kvm_enable_x2apic() is called and successful.
> > >=20
> > > 2) in addressing requirement 1), we do not break something else (othe=
r machines, other cpu classes/models, TCG, ...).
> > >=20
> > > 3) as a plus we might want to cleanup and determine once and for all =
where kvm_enable_x2apic() should be called:
> > >    we have calls in intel_iommu.c and in the kvm cpu class instance i=
nitialization here in kvm-cpu.c today:
> > >    before adding a third call we should really ask ourselves where th=
e proper initialization of this should happen.
> > >=20
> >=20
> > I think the existing two calls to kvm_enable_x2apic() become mostly
> > redundant. Because in fact the vtd_decide_config() and
> > kvm_cpu_instance_init() callers would both by perfectly OK without
> > kvm_enable_x2apic() if there isn't a CPU with an APIC ID >=3D 255
> > anyway.=20
> >=20
> > And that means that with my patch, pc_machine_done() will have
> > *aborted* if their conditions aren't met.
>=20
> I think it is good to abort early if we figure out that the user request =
of APIC ID >=3D 255 cannot be satisfied.=20
>=20
> >=20
> > But then again, if since kvm_enable_x2apic() is both the initial
> > initialisation *and* a cached sanity check that it has indeed been
> > enabled successfully, there perhaps isn't any *harm* in having them do
> > the check for themselves?
> >=20
>=20
> Well the harm in my mind is, do we need to handle the error condition cor=
rectly at each single place?=20
> Do we risk slightly different behavior and advertised features depending =
on where the call happens?
>=20
> Seems that we can reduce the complexity and long term risk by handling th=
ings in one single place, if we definitely find what that place should be.
>=20
> Thanks,
>=20
> Claudio
>=20


--=-4sFofO65zAX2OoQMSMTP
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
MTMwMTIxMzUwWjAvBgkqhkiG9w0BCQQxIgQgiRy+DLDBjguEF9EPg4nCPdcm8fi47Pr6VsUjmkcO
eDMwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIg
TWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1h
aWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMIHABgsqhkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgG
A1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDiu0lIeSrsCenEpRjxmVhmMA0GCSqGSIb3
DQEBAQUABIIBAC5R1KMJ+dDOsallsUFw7ouGpFRv/5Rn0bPXCQkZ+2kt0v4FFWI4oJHr9xiv8VvN
6u14e12C9C+k3OfHmyU+dB/Fzjee8HFStgHbClayWrNB0J/9TGcbpzz5tkh7F8utsDwMRkH4V+5i
dYkQMYTC7+DmjjXo1Mqdn/O5TWkjp0aSFFMjJsU2Kvxhi+/+cQ8ZLrEX3bIY9ctoFuE+4A+eNUbs
pHfh504wqvPLSh5gp0SRFkLVX9OuKIyyWH+qeClvzpxGn7QXovjhhRsQdWxFGH338koe9AeyQ7WN
Rw7+IPynd+FaxAqFA/jYIyjdVTfngNHNj21oaRL/ZbqFtEJ34/QAAAAAAAA=


--=-4sFofO65zAX2OoQMSMTP--


