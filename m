Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B811D436D36
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:04:58 +0200 (CEST)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdgBF-0000cD-5y
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcus.haehnel@kernkonzept.com>)
 id 1mdg2p-00035n-R8
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:56:17 -0400
Received: from serv1.kernkonzept.com ([2a01:4f8:1c1c:b490::2]:42535
 helo=mx.kernkonzept.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcus.haehnel@kernkonzept.com>)
 id 1mdg2i-00007L-7c
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t5+c+a0iWDYNRkstPg5GSlNTxpQXFQIomvyLc0eaFus=; b=n8mdquADteXtroa2S9pJdxAK4T
 VnixBbXrvGhA4oKo3mhx6SE/s9Na1pTuvELyMC8C3Hts5iGCtbGDqKCSric0Aj31pEs8qDnr0djD+
 EXO0uZFH//M4Nxal1I7pI5Xh6K5mbo/E8Bq1p69rT176RrotgHjWJsne0ggYIGACuFADBsNw1eIJT
 erwruyJ6ICsBhBem8NTOrYF4K7yAKCF1Jf7weGwAMs0m1srbL/ylSMfWZNNz8ZeBAfJcrVUTQ3wdo
 4ES4/qd628O3L4PQ3/3XIDesBBqKDT1R0GwATsNjikULRrLr/+z+BNiPxge/Yj5HLo0xB5cdtM3Wo
 xRoOuZBA==;
Received: from i5e8604c4.versanet.de ([94.134.4.196] helo=amethyst.localnet)
 by mx.kernkonzept.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
 id 1mdg2b-00FjAu-Nc; Thu, 21 Oct 2021 23:56:02 +0200
From: Marcus =?ISO-8859-1?Q?H=E4hnel?= <marcus.haehnel@kernkonzept.com>
To: Adam Lackorzynski <adam@l4re.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH] multiboot: Use DMA instead port-based transfer
Date: Thu, 21 Oct 2021 23:55:41 +0200
Message-ID: <2800151.e9J7NaK4W3@amethyst>
In-Reply-To: <da674bf3-fc7f-28c8-7c45-f98754ecb5d1@redhat.com>
References: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de>
 <da674bf3-fc7f-28c8-7c45-f98754ecb5d1@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3137432.aeNJFYEL58";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
Received-SPF: pass client-ip=2a01:4f8:1c1c:b490::2;
 envelope-from=marcus.haehnel@kernkonzept.com; helo=mx.kernkonzept.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nextPart3137432.aeNJFYEL58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Marcus =?ISO-8859-1?Q?H=E4hnel?= <marcus.haehnel@kernkonzept.com>
To: Adam Lackorzynski <adam@l4re.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] multiboot: Use DMA instead port-based transfer
Date: Thu, 21 Oct 2021 23:55:41 +0200
Message-ID: <2800151.e9J7NaK4W3@amethyst>
In-Reply-To: <da674bf3-fc7f-28c8-7c45-f98754ecb5d1@redhat.com>
References: <YWM6jboU9fUib6Iy@os.inf.tu-dresden.de> <da674bf3-fc7f-28c8-7c45-f98754ecb5d1@redhat.com>

On Tuesday, October 19, 2021 6:45:44 PM CEST Paolo Bonzini wrote:
> On my system (a relatively recent laptop) I get 15-20 MiB per second,=20
> which is slow but not as slow as what you got.  Out of curiosity, can=20
> you test what you get with the following kernel patch?
>=20
> diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
> index 798508e8b6f5..5853ae93bcb2 100644
> --- a/arch/x86/kvm/kvm_emulate.h
> +++ b/arch/x86/kvm/kvm_emulate.h
> @@ -272,7 +272,7 @@ struct fetch_cache {
>   };
>=20
>   struct read_cache {
> -	u8 data[1024];
> +	u8 data[4096];
>   	unsigned long pos;
>   	unsigned long end;
>   };

Hi Paolo,

Thank you very much for the cleaned up and improved patch in the other
thread, which solves our issue perfectly! Your work is much appreciated.

Regarding your question above I made some quick benchmark runs. Using a
195kB kernel image and measuring from QEmu start until the first complete
line is sent over the serial output I get the following timings, all=20
numbers in seconds:

 kvm?  | DMA Multiboot | Old Multiboot |
=2D------|---------------|---------------|
no-kvm |  0.209 =B1 0.01 | 15.283 =B1 0.19 |
kvm    |  0.207 =B1 0.01 | 20.771 =B1 0.26 |
kvm-4k |  0.208 =B1 0.01 | 19.878 =B1 0.22 |

The tests were run 10 times using perf stat -r10. The table shows the
averages and standard deviation. While perf does have some overhead
the general issue is independent of that.

Changing the read cache to 4k has a negligible impact compared to running
without kvm. The numbers for DMA are roughly two orders of magnitude better
in all cases.

Hardware: Lenovo T480, Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz
Software: Gentoo, Custom Linux 5.14.9 kernel
          QEmu master with your DMA multiboot patches applied, v6.1.0-1564-=
g1a510366d8-dirty
          configured without any options, only the x86_64 softmmu as target
Commandline: qemu-system-x86_64 -enable-kvm -kernel /path/to/kernel -serial=
 stdio -nographic -monitor none -m 512

General ballpark of results was confirmed on a different T480 with
another OS and QEmu version and on a server system. As you can see we get
not MiB/s when booting through multiboot without DMA but KiB/s.


=2D Marcus

--nextPart3137432.aeNJFYEL58
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgT4APPdHbf52NFOF/DQnC9omn0QFAmFx4d0ACgkQ/DQnC9om
n0S2VAgAlsMtPx6XS4LggjfyVRzkZBwSjJYqJy7LRcTyQOHPHuHDSoWC8KXW4FK5
BOsz4nmHZ9HENwUeczJDjtWs9x9SIsUrvw+XBJOPz6JC0ZkPyN5+YjZFs4SQ1iKY
w67t/txUsc3Bmk+s7/bRqJCBdTdO4nnaSBX0t+qi6NF0Oi0vt/LumgNbq06CQ7Sb
5SfxX2AwjsEqf99QMlDILMF22+vj7Zr/gZWPDANeoTn0SWWNzv30eHpHY2jHHH+l
NU1xGteOmy6/83/bDCCAngerqu4geyvUI5PTbCWK1doJPpwm7YFG/RNc/T7alqvi
hDFRznYKo6NCCO1q7AZedmJRM/zTdA==
=y75+
-----END PGP SIGNATURE-----

--nextPart3137432.aeNJFYEL58--




