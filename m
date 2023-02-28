Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EACF6A5B73
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:13:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX1f4-0004vw-DH; Tue, 28 Feb 2023 10:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7d6b05f3cc01f0cae584+7128+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pX1ex-0004vm-5X
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:12:55 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7d6b05f3cc01f0cae584+7128+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pX1eu-0005hF-2z
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:12:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K8DMCyjWXxRXoQV3X5q6ImI5G3dSroxzQ69bckz63rY=; b=gliVpcv3JMP0dEVpefK5NJQ8n4
 AMtIFJJgj7HxOyP2hKk4Od/vNlqldqUvb0n9hGPtmuckFp6tbn2o+7+DNEdRXrg5ELvWTA7aM73XE
 fVyn8OQ42h4cEPX6vwhCXeoc/4Utb2ClU39iePT3Zq8kCZXJizDb5QhiBYu0dspv1ZdYbB37EXXT2
 J8t7OrvX/51aF30nTTPlhURLplHa8pFF2311jyCnfSrpCBlfQfreVW2E/ZWTDmdbnYNgewvcg0SIQ
 GWrvuFT+yTTskA4XqukW+266LtZEDVThCdtwLW8kWC0NcEjbWXH460cz/boDL5ZHsArAbNUbx0JzC
 L6nue7oQ==;
Received: from [2001:8b0:10b:5:15b6:2526:f3a7:87e2]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pX1ek-000wJB-PL; Tue, 28 Feb 2023 15:12:43 +0000
Message-ID: <998ee91a9e08b7e7a1797e2736a9aaa1f9e5a4a4.camel@infradead.org>
Subject: Re: Adopting abandoned patch?
From: David Woodhouse <dwmw2@infradead.org>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Dinah B
 <dinahbaum123@gmail.com>
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Date: Tue, 28 Feb 2023 15:12:42 +0000
In-Reply-To: <Y/24XKwyFcn56LV5@redhat.com>
References: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
 <874jr7juo5.fsf@linaro.org>
 <CAH50XRddEDTxJeCMXmbNg417vRojEuYpb8GzDrw75rt=OmF_uQ@mail.gmail.com>
 <CAH50XRe5EJG_CecVjwNJDuMbO4D-dJC4e8wrkR2G0Rn0VFF+oQ@mail.gmail.com>
 <Y/24XKwyFcn56LV5@redhat.com>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-0PzvLEbrOpMNsReNHDHI"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7d6b05f3cc01f0cae584+7128+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-0PzvLEbrOpMNsReNHDHI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-02-28 at 08:16 +0000, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Feb 27, 2023 at 04:34:12PM -0500, Dinah B wrote:
> > It looks like the author didn't include a "Signed off" in their patch d=
raft
> > and it doesn't look like Debian qemu-kvm maintainers ever merged it.
> > Does this change the patch adoption process?
> >=20
> > On Mon, Feb 27, 2023 at 4:23=E2=80=AFPM Dinah B <dinahbaum123@gmail.com=
> wrote:
> >=20
> > > Thanks, here's the original patch:
> > > https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D2;bug=3D621529;fi=
lename=3Dmultiboot2.patch;msg=3D15
>=20
> That is unfortunate. That patch is very large and complex, so I don't
> think we'd be willing to take it without a Signed-off-by from the
> original author.
>=20
> It is quite old, but try emailing the original author, you might
> get lucky and find their email addr still works

We added multiboot2 support to kexec-tools which you are welcome to
take code from.

I see there's an option ROM in the patch you referenced; I'm not quite
sure how that gets used, but here's one you can have that we use for
loading the Xen shim (in a KVM-pretending-to-be-Xen-HVM guest) to
launch Xen PV guests.

We do the multiboot processing in the VMM, load the executable and
modules into guest RAM, then just install an oprom which will launch it
when the BIOS invokes INT 18h.

Feel free to use this in QEMU under GPLv2 if it's useful. I'll be happy
to add a signed-off-by if you work it into individual patches, but for
now,
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

/**************************************************************************=
****
 *
 * PV Shim as an expansion ROM.
 *
 * We already have an ELF and Multiboot loader in Brimstone, which is
 * precisely what Xen needs. We can't *just* go directly into the Xen
 * multiboot entry point though, since it does expect *some* form of
 * BIOS to be present.
 *
 * So we perform the Elf/Multiboot load, placing Xen where it wants to
 * be at 0x200000, and then allow xenloader/ROMBIOS to initialise as
 * normal. But we install an 'expansion ROM' at 0xE0000 which will
 * register itself as a bootable target (BEV), so ROMBIOS will invoke
 * it instead of trying to boot from the disk once everything's set up.
 *
 * When invoked, the BEV entry point just switches to 32-bit mode,
 * loads the two registers with the Multiboot magic and pointer to the
 * data structure that Brimstone set up earlier, and jumps to Xen's
 * entry point.
 */

#define OPROM_SIG 0xaa55;
struct oprom_hdr {
	uint16_t sig;
	uint8_t romlen; /* in 512-byte blocks */
	uint8_t entry[21];
	uint16_t pci;
	uint16_t expansion;
};
static_assert(sizeof(struct oprom_hdr) =3D=3D 28);

#define PNP_SIG 0x506e5024 /* '$PnP' */
struct pnp_hdr {
	uint32_t sig;
	uint8_t rev;
	uint8_t len; /* in 16-byte counts */
	uint16_t next_header;
	uint8_t reserved1;
	uint8_t checksum;
	uint32_t device_id;
	uint16_t mfr_name;
	uint16_t product_name;
	uint8_t device_type_code[3];
	uint8_t device_indicators;
	uint16_t bcv;
	uint16_t bev;
	uint16_t reserved2;
	uint16_t resource_vector;
};
static_assert(sizeof(struct pnp_hdr) =3D=3D 32);

union pvshim_rom {
	uint8_t bytes[512];
	struct {
		struct oprom_hdr oprom;
		struct pnp_hdr pnp;
		uint32_t mbi_gpa;
		uint16_t idt[3];
		uint16_t gdt_len;
		uint32_t gdt_addr;
		uint64_t gdt[3];
		uint8_t code16[64];
		uint8_t code32[64];
	};
};
static_assert(!(sizeof(union pvshim_rom) % 512));

/* The UMB location at which we install our expansion ROM */
#define PVSHIM_ROM_ADDR 0xe0000

/* The fixed entry point of PV Shim itself */
#define PVSHIM_ENTRY_ADDR 0x200000

/* Segments used by the GDT that we manually create */
#define CODE32_SEG 0x08
#define DATA32_SEG 0x10

/* Assembler trampoline. There are a whole 16 instructions here;
 * it would have been theoretically possible to build them from
 * a .S file or inline asm, and jump through various hoops to
 * get the relocations and internal/external references to work.
 * Or we could just emit them as bytes; life's too short. */

/* Emit a word or dword as consecutive bytes in little-endian order */
#define le16word(x) static_cast<uint8_t>((x) & 0xff), static_cast<uint8_t>(=
(x) >> 8)
#define le32dword(x) le16word(x), le16word((x)>>16)

/* Helper macro to emit the offset of a field in the pvshim_rom
 * structure, as two bytes */
#define le16ofs(field) le16word(offsetof(union pvshim_rom, field))

/* ROMBIOS / CMOS boot sequence configuration */
#define PORT_CMOS_INDEX		0x70
#define PORT_CMOS_DATA		0x71

#define CMOS_BOOT_DEVICE_1_2	0x3d
#define CMOS_BOOT_DEVICE_BEV	0x04

/* Initial setup entry point of the PV Shim option ROM.
 * Just set the CMOS boot order to boot from the BEV. */
static uint8_t pvshim_init[] =3D
{
	0xb0, CMOS_BOOT_DEVICE_1_2,			// mov $CMOS_BOOT_DEVICE_1_2, %al
	0xe6, PORT_CMOS_INDEX,				// out %al, $PORT_CMOS_INDEX
	0xb0, CMOS_BOOT_DEVICE_BEV,			// mov $CMOS_BOOT_DEVICE_BEV, %al
	0xe6, PORT_CMOS_DATA,				// out %al, $PORT_CMOS_DATA
	0xcb						// lret
};

/* This is the 16-bit BEV entry point of the PV Shim "option ROM",
 * invoked when ROMBIOS is done with its setup, and it's time to
 * start PV Shim. */
static uint8_t pvshim_trampoline16[] =3D
{
	/* The Multiboot handoff expects the multiboot_info struct in %ebx.
	 * Do that now from 16-bit mode so that we don't have to mess with
	 * %rip-relative addressing to load it. */
	0x2e, 0x66, 0x8b, 0x1e, le16ofs(mbi_gpa),	// mov %cs:mbi_gpa, %ebx

	/* Clear interrupts, load the IDT and GDT that were set up for us. */
	0xfa,						// cli
	0x2e, 0x0f, 0x01, 0x1e, le16ofs(idt),		// lidtw %cs:idt
	0x2e, 0x0f, 0x01, 0x16, le16ofs(gdt_len),	// lgdtw %cs:gdt_len

	/* Set CR0.PE to enter protected mode. */
	0x31, 0xc0,					// xor %ax,%ax
	0x40,						// inc %ax
	0x0f, 0x01, 0xf0,				// lmsw %ax

	/* Jump to the 32-bit mode trampoline. */
	0x66, 0xea, le16ofs(code32), le16word(PVSHIM_ROM_ADDR >> 16),
	le16word(CODE32_SEG)				// ljmpl $CODE32_SEG,code32
};

static uint8_t pvshim_trampoline32[] =3D
{
	/* Load the 32-bit data segment into the segment registers */
	0xb8, le32dword(DATA32_SEG),			// mov $DATA32_SEG, %eax
	0x8e, 0xd8,					// mov %eax, %ds
	0x8e, 0xc0,					// mov %eax, %es
	0x8e, 0xe0,					// mov %eax, %fs
	0x8e, 0xe8,					// mov %eax, %gs
	0x8e, 0xd0,					// mov %eax, %ss

	/* The Multiboot handoff requires the magic value in %eax */
	0xb8, le32dword(MULTIBOOT_BOOTLOADER_MAGIC),	// mov $MULTIBOOT_BOOTLOADER_=
MAGIC, %eax

	/* Go go go! */
	0xea, le32dword(PVSHIM_ENTRY_ADDR), le16word(CODE32_SEG)
							// ljmpl $CODE32_SEG,$PVSHIM_ENTRY_ADDR
};

static const char *pvshim_cmdline =3D
	"loglvl=3Dall guest_loglvl=3Dnone console=3Dcom1 console_timestamps=3Ddate=
ms xsave=3D0 xpti=3Dfalse";

static void pvshim_load()
{
	service_vm::bz_image_metadata bz_image_metadata;
	std::string pvshim_image_name =3D "pvshim";
	unique_fd pvshim_fd =3D service_image_fetch(pvshim_image_name, bz_image_me=
tadata);
	die_on(pvshim_fd < 0, "Failed to open PV Shim image");

	size_t mmap_size =3D PAGE_ROUND_UP(bz_image_metadata.offset + bz_image_met=
adata.size);
	void *image =3D mmap(NULL, mmap_size, PROT_READ, MAP_SHARED, pvshim_fd, 0)=
;
	die_on(image =3D=3D MAP_FAILED, "failed to mmap PV Shim image");

	unsigned char *bytes =3D static_cast<unsigned char *>(image) + bz_image_me=
tadata.offset;
	size_t bytes_size =3D bz_image_metadata.size;

	struct gzip_tail gz_tail;
	unsigned char *gz_bytes =3D parse_gzip_header(bytes, bytes_size, &gz_tail)=
;
	if (gz_bytes) {
		size_t gz_size =3D bytes_size - (gz_bytes - bytes);

		/* Impose a sane size limit on the decompressed PV Shim image */
		die_on(gz_tail.size > 4 * MiB, "PV Shim decompressed image size too large=
 (%d bytes)",
		       gz_tail.size);

		void *elf_bytes =3D malloc(gz_tail.size);
		die_on(!elf_bytes, "Failed to allocate %d bytes for PV Shim decompression=
",
		       gz_tail.size);

		decompress_gzip_stream(&gz_tail, elf_bytes, gz_bytes, gz_size);
		log_info("Decompressed %d bytes of PV Shim image", gz_tail.size);

		load_multiboot(elf_bytes, gz_tail.size, pvshim_cmdline);
		free(elf_bytes);
	} else {
		/* Not compressed; load it directly */
		load_multiboot(bytes, bytes_size, pvshim_cmdline);
	}
	die_on(munmap(image, mmap_size) !=3D 0, "Failed to munmap PV Shim image da=
ta %p", image);

	/* Install an expansion ROM which will invoke it once ROMBIOS has done the=
 setup */
	union pvshim_rom rom =3D { };

	rom.oprom.sig =3D OPROM_SIG;
	rom.oprom.romlen =3D sizeof(rom) / 512;
	rom.oprom.expansion =3D offsetof(union pvshim_rom, pnp);

	rom.pnp.sig =3D PNP_SIG;
	rom.pnp.rev =3D 1;
	rom.pnp.len =3D sizeof(rom.pnp) / 16;
	rom.pnp.bev =3D offsetof(union pvshim_rom, code16);

	/* Grab the Multiboot info struct from where load_multiboot() put it */
	rom.mbi_gpa =3D static_cast<uint32_t>(thread_pvcpu->kvm.regs.rbx);
	die_on(thread_pvcpu->kvm.regs.rip !=3D PVSHIM_ENTRY_ADDR,
	       "PV Shim entry point 0x%x is not expected 0x%x",
	       static_cast<uint32_t>(thread_pvcpu->kvm.regs.rip),
	       PVSHIM_ENTRY_ADDR);

	rom.gdt_len =3D sizeof(rom.gdt) - 1;
	rom.gdt_addr =3D PVSHIM_ROM_ADDR + offsetof(union pvshim_rom, gdt);
	rom.gdt[1] =3D 0x00cf9a000000ffff; /* CODE32_SEG (0x0008) */
	rom.gdt[2] =3D 0x00cf92000000ffff; /* DATA32_SEG (0x0010) */

	/* Copy assembler code into place */
	static_assert(sizeof(rom.oprom.entry) >=3D sizeof(pvshim_init));
	memcpy(rom.oprom.entry, pvshim_init, sizeof(pvshim_init));

	static_assert(sizeof(rom.code16) >=3D sizeof(pvshim_trampoline16));
	memcpy(rom.code16, pvshim_trampoline16, sizeof(pvshim_trampoline16));

	static_assert(sizeof(rom.code32) >=3D sizeof(pvshim_trampoline32));
	memcpy(rom.code32, pvshim_trampoline32, sizeof(pvshim_trampoline32));

	/* Calculate the OpROM checksum */
	uint8_t sum =3D 0;
	for (unsigned i =3D 0; i < sizeof(rom) - 1; i++)
		sum =3D static_cast<uint8_t>(sum + rom.bytes[i]);
	rom.bytes[sizeof(rom) - 1] =3D static_cast<uint8_t>(-sum);

	/* Drop into guest memory where ROMBIOS will find it as an OpROM */
	memory_write_region(PVSHIM_ROM_ADDR, &rom, sizeof(rom));
}


--=-0PzvLEbrOpMNsReNHDHI
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMjI4MTUxMjQyWjAvBgkqhkiG9w0BCQQxIgQgYaSeQ2sA
rFehyo5OlLM5KGjEGGa0ecSBzddIZEjE3iMwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCr6Q6oESQ8pvb+nVdOXBKQlIG+lUyr1M8H
VqqwUulWhg39YfSKJO5++gJK/Dv9QyjCxFZc8rIypKGlLJZvEOocXkyryl4WOH15yvwhAZNd35bD
wlduWWI6m7Uq4mxJwG/O3yINqLByHh6XrkIOTbrEVPQ1FpC5V70QygRQmJKQO7d2hopCLg8ZfuQb
1iI/KalS3aF13ZHPUJxreSpB8Byw3eFTEuztmbxYb7Jhbl+z99aGEeYf7xEulYewZDeziQZMP/Fd
XjLe7Z0CgjesWU3vl5oHCdbBbPxeIF82ZwiKS1H/YNYlSmYUnHAPzK4b12wJgFz6jnQ/1zzqWR6O
4hVP1VZbgGulTQtvjdtwJC/ckbpYU8O25p0G4kg4P+DxMMkTaIvTPNAwxfhjy8bnkCcr4JrpmAXe
rTbDrD3lSH2/6PVVVyaLyl5XhAsjabfquU7imAsdtV3qM/6NXk/nfU4olGZjsDaDWNIB3r7v4Niu
lAPgW79esUfsIjXQtOQn80TORhmlZk1OF9bpsj2dE5pCpHh/vchrl4GM9mzvbkj5dTqCqj7IZCLK
6rLh1Q4aY0x1fyH6g3AKsaSd+KOKrFjw4BSMzTCNXpvCD8uE62Iuv5SHfZfwKkXgzRmao+KdG0n3
FsDFvmFzrbCHh0Zbv+47zenj0McsuGtNva3Jc69WPQAAAAAAAA==


--=-0PzvLEbrOpMNsReNHDHI--

