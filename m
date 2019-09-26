Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3814BEF8E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 12:26:20 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDQyZ-0005ij-NT
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 06:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iDQuC-0001Gt-Bq
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iDQuB-0003JM-BL
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:21:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iDQuB-0003Ik-24
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 06:21:47 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE1285859E
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 10:21:45 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id 32so734090wrk.15
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 03:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to;
 bh=smZP7Ak6TUdAStHczxY+TFyiyW4XCmuQsrVLOpFovYM=;
 b=Xe0x5zWorMZUlV5J2uC8fJazhRXKO9VvHq9aDA4QmZJOAUWh/o5+qDCbd4jiPZHABA
 Zu83k9QX/WHN3kADfKfdTXGwWQRq62AsG06E23f7ORVI0XyxX1sPXCS3GC6q/jqN8hVu
 I6VgWkdUa7hTN8Mr6w6md91XI64bTBEjyrYldwr4m9xDDLYyjP2n224xbWcKzDFWCKRS
 18ydmHqUvssFfgbILxnB2aFPRzghR9BU4N/0n70JfT9zVl9ZD6VjuYbZuuZHCkBlxkri
 FS8hMFOx7rj9RXm67CcNTTo3EiyDkGUzgGH732uMludj2jT8CMmox+zwRvddfFSXv5+J
 1Y0A==
X-Gm-Message-State: APjAAAXKWUkHUS2Ga8bfCL+4UAe98Qu6VHFC+iu8FwAvY7uDYVSLx7KD
 qcnQtIS8wc3qQBCNfmoliSVLDE8qRxf30rnk2x+dP69xl7eaRnbZgN8WjJnMDi8ZHHQI5QS2MDx
 dwPn5WLgmVC7MxKk=
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr2252019wrm.396.1569493304503; 
 Thu, 26 Sep 2019 03:21:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEM1fJqjAcO3LNo8fGTeDwLMKXZ7bAIxM/22o/XdAKAvgSAD+0JBY98xZxQ2RFhxoJt3IYgQ==
X-Received: by 2002:adf:e4c9:: with SMTP id v9mr2251984wrm.396.1569493304168; 
 Thu, 26 Sep 2019 03:21:44 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36?
 ([2001:b07:6468:f312:9520:22e6:6416:5c36])
 by smtp.gmail.com with ESMTPSA id x6sm2565779wmf.35.2019.09.26.03.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2019 03:21:43 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] docs/microvm.txt: document the new microvm machine
 type
To: Sergio Lopez <slp@redhat.com>
References: <20190924124433.96810-1-slp@redhat.com>
 <20190924124433.96810-8-slp@redhat.com>
 <23a6e891-c3ba-3991-d627-433eb1fe156d@redhat.com> <87a7ass9ho.fsf@redhat.com>
 <d70d3812-fd84-b248-7965-cae15704e785@redhat.com> <87o8z737am.fsf@redhat.com>
 <92575de9-da44-cac4-5b3d-6b07a7a8ea34@redhat.com> <87k19v2whk.fsf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b02ada95-9853-ff21-cc14-ca0acf48782a@redhat.com>
Date: Thu, 26 Sep 2019 12:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87k19v2whk.fsf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9YieZgL59Jn4Hc9ihwvFTlw1Wh8CxdCFs"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com, lersek@redhat.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 imammedo@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9YieZgL59Jn4Hc9ihwvFTlw1Wh8CxdCFs
Content-Type: multipart/mixed; boundary="Qm5zknIqrXaGsQ4AktEFQXxQ0ieqpoL6p";
 protected-headers="v1"
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 marcel.apfelbaum@gmail.com, rth@twiddle.net, ehabkost@redhat.com,
 philmd@redhat.com, lersek@redhat.com, kraxel@redhat.com,
 mtosatti@redhat.com, kvm@vger.kernel.org
Message-ID: <b02ada95-9853-ff21-cc14-ca0acf48782a@redhat.com>
Subject: Re: [PATCH v4 7/8] docs/microvm.txt: document the new microvm machine
 type
References: <20190924124433.96810-1-slp@redhat.com>
 <20190924124433.96810-8-slp@redhat.com>
 <23a6e891-c3ba-3991-d627-433eb1fe156d@redhat.com> <87a7ass9ho.fsf@redhat.com>
 <d70d3812-fd84-b248-7965-cae15704e785@redhat.com> <87o8z737am.fsf@redhat.com>
 <92575de9-da44-cac4-5b3d-6b07a7a8ea34@redhat.com> <87k19v2whk.fsf@redhat.com>
In-Reply-To: <87k19v2whk.fsf@redhat.com>

--Qm5zknIqrXaGsQ4AktEFQXxQ0ieqpoL6p
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 26/09/19 12:16, Sergio Lopez wrote:
>> If KVM is in use, the
>> LAPIC timer frequency is known to be 1 GHz.
>>
>> arch/x86/kernel/kvm.c can just set
>>
>> 	lapic_timer_period =3D 1000000000 / HZ;
>>
>> and that should disabled LAPIC calibration if TSC deadline is absent.
> Given that they can only be omitted when an specific set of conditions
> is met, I think I'm going to make them optional but enabled by default.=


Please do introduce the infrastructure to make them OnOffAuto, and for
now make Auto the same as On.  We have time to review that since microvm
is not versioned.

Thanks,

Paolo

> I'll also point to this in the documentation.




--Qm5zknIqrXaGsQ4AktEFQXxQ0ieqpoL6p--

--9YieZgL59Jn4Hc9ihwvFTlw1Wh8CxdCFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8TM4V0tmI4mGbHaCv/vSX3jHroMFAl2MkTUACgkQv/vSX3jH
roMM2ggAnECT7ubOBQLjvDUBtboi+CrQQam36JptZSdfukZ+IOvo8HeLcvVLjNYa
wkCBraN7W92ZXp2tlJUUuADE6Jhaij+J1Vx0Bw8foVtpsDufNd97FhxIHhu9SeV9
VS3z3pyDQSWDunuAqRn+TvHkbYFrURiXPsxb7Lw03VxRSVC3sGdjt1pUuWzO26YW
zsKPPwqdD4TJ5zTSSJWXeOFN/x02sOlCMZWAq2ND0mej793VAYLOwIUVS13xaBCX
3Asa7f0sAqRvCW5wyHEfMJuC4fUxPq3pI9vuSlzKmO5Hx4v7lxi2MgZplje6L2V4
hFFTOvohRluh378NNk93f6Xc6LRcAw==
=COY9
-----END PGP SIGNATURE-----

--9YieZgL59Jn4Hc9ihwvFTlw1Wh8CxdCFs--

