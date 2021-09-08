Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A44039A6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:22:15 +0200 (CEST)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwak-0000aB-6a
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mNwWl-0005uo-JG
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mNwWk-00049B-4S
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:18:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631103483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iuKTHBPWuaVoURsAPRjAi/vjChAOyU9ZXWl+vHq0dYc=;
 b=K32b9VqxHDSUTojiCbrfHohMajFFvR+jmfO+kc70pT8U/JsRiSOFGH5yTZbY6ra5W9MSFQ
 VPTATYobTz/OSH8JD/VCgaP2OSJpCdiOiihcBWoapIl+R7UEHY5zeFQyM4w4yQM0BGuNbX
 nlehVvui59/TAIUv9qkjQ2WiShEMe8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-xajgtGtlOdC_rMkZjlg_sw-1; Wed, 08 Sep 2021 08:18:02 -0400
X-MC-Unique: xajgtGtlOdC_rMkZjlg_sw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D36F8464D4
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:18:01 +0000 (UTC)
Received: from fedora (unknown [10.43.2.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F631001281;
 Wed,  8 Sep 2021 12:18:00 +0000 (UTC)
Date: Wed, 8 Sep 2021 14:17:57 +0200
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/5] target/i386: convert to use format_state instead of
 dump_state
Message-ID: <YTip9eS5bip7Q3Ui@fedora>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908103711.683940-4-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uQaMm0z9q0BIvDfS"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uQaMm0z9q0BIvDfS
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Wednesday in 2021, Daniel P. Berrang=E9 wrote:
>Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>
>---
> target/i386/cpu-dump.c | 325 ++++++++++++++++++++++-------------------
> target/i386/cpu.c      |   2 +-
> target/i386/cpu.h      |   2 +-
> 3 files changed, 174 insertions(+), 155 deletions(-)
>
>diff --git a/target/i386/cpu-dump.c b/target/i386/cpu-dump.c
>index 02b635a52c..8e19485a20 100644
>--- a/target/i386/cpu-dump.c
>+++ b/target/i386/cpu-dump.c

[...]

>@@ -355,107 +359,116 @@ void x86_cpu_dump_state(CPUState *cs, FILE *f, int=
 flags)

[...]

>     {
>-        qemu_fprintf(f, "GDT=3D     %08x %08x\n",
>-                     (uint32_t)env->gdt.base, env->gdt.limit);
>-        qemu_fprintf(f, "IDT=3D     %08x %08x\n",
>-                     (uint32_t)env->idt.base, env->idt.limit);
>-        qemu_fprintf(f, "CR0=3D%08x CR2=3D%08x CR3=3D%08x CR4=3D%08x\n",
>-                     (uint32_t)env->cr[0],
>-                     (uint32_t)env->cr[2],
>-                     (uint32_t)env->cr[3],
>-                     (uint32_t)env->cr[4]);
>+        g_string_append_printf(buf, "GDT=3D     %08x %08x\n",
>+                               (uint32_t)env->gdt.base, env->gdt.limit);
>+        g_string_append_printf(buf, "IDT=3D     %08x %08x\n",
>+                               (uint32_t)env->idt.base, env->idt.limit);
>+        g_string_append_printf(buf, "CR0=3D%08x CR2=3D%08x CR3=3D%08x CR4=
=3D%08x\n",
>+                               (uint32_t)env->cr[0],
>+                               (uint32_t)env->cr[2],
>+                               (uint32_t)env->cr[3],
>+                               (uint32_t)env->cr[4]);
>         for(i =3D 0; i < 4; i++) {
>-            qemu_fprintf(f, "DR%d=3D" TARGET_FMT_lx " ", i, env->dr[i]);
>+            g_string_append_printf(buf, "DR%d=3D" TARGET_FMT_lx
>+                                   " ", i, env->dr[i]);

The formatting string can comfortably fit on the first line here.

Jano

>         }
>-        qemu_fprintf(f, "\nDR6=3D" TARGET_FMT_lx " DR7=3D" TARGET_FMT_lx =
"\n",
>-                     env->dr[6], env->dr[7]);
>+        g_string_append_printf(buf, "\nDR6=3D" TARGET_FMT_lx
>+                               " DR7=3D" TARGET_FMT_lx "\n",
>+                               env->dr[6], env->dr[7]);

--uQaMm0z9q0BIvDfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmE4qfAACgkQAk1z5KIM
l5Rflgf/aqN5UDP7XglN8T9MdMHZY9C/xg4bQEFXTSR9+CPI7rEil6KJtnQMWr3Y
dTGKhI35yYI6IX9ZNkhQDvUti2LBM5str0tWFfhdBKODiC52JkSkycmQHTWHBHiW
oUg8UTG0OxKfPizovUtXaQGU056RlXGxjFOtZcZm+mxRmgQwVNkQ86cw9qEg+t6l
H+TGfoaYXmXaFTtX02ROAwiMTBBUzsglFBneUY7XhCTOPpvfdcdnc6vOjpWooJgL
kQ+fASh8pXJvQyDpp0F/yzhoNKwP8aKCuc1CYpMSOcxDbicyKKSGzkvU1GJq3Clq
SmK+vRJVX50a3EVZ4bX3yIRk9SMr7A==
=k1NI
-----END PGP SIGNATURE-----

--uQaMm0z9q0BIvDfS--


