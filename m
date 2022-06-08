Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0BA5432AD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:37:05 +0200 (CEST)
Received: from localhost ([::1]:42760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywnx-0002jg-0d
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nywAK-0005sw-Dz
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:56:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nywAI-0004xG-Pk
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y3GTIcrik+pI4w5E2pRnRXAdLJA1m8WfGOgWT57e8sg=;
 b=Spw9BovhRwPmtYtkkgm15Go50PC/isYr3dCud30Mh4snSmob8908sIaeSbwrUzKb9JBu0G
 IN7tRGyMdr2f5KxwwDi5bYbZx84oUESpjTLQASq9nyE7T0aJtchbkvJCbliD94awu4Iv2X
 8aS6sT4Gid+tRz9XS9AgcnrqwWRKtf0=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-QLvlxFf6Plu_XzTWL5O0dA-1; Wed, 08 Jun 2022 09:56:04 -0400
X-MC-Unique: QLvlxFf6Plu_XzTWL5O0dA-1
Received: by mail-oi1-f197.google.com with SMTP id
 i129-20020aca3b87000000b0032e75128546so7179059oia.0
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 06:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y3GTIcrik+pI4w5E2pRnRXAdLJA1m8WfGOgWT57e8sg=;
 b=sCT2ONRi33MUtitxWPasklHoexskS/gVzssfaFzVJGOhNsLCnx9L5tPCr7QiZCXYHQ
 +fUsKosteZSk1ADsmeyh8WiT0FasRxtNMSY08JF3Q8oEb/xnv8UnhNoREPGPiMHfmwMT
 C0S7GzbSEvxYIqxEyvkFoBBX44DtsFq5jRRMuZV54xAAQ7IoKKybBp83PrgPECr+KMJW
 EF9iiWDSLCX0Kl7wo/1On690ZzNv+0BQFhuqi25650jKO2CdOdPRznm/LTy8nEDSQ6S+
 ewUoy2XpS6Zg+lUf1l/9jCDyMvQIzyMxL9CX4YEyEsIFXij3OQ8Gb8w9+q004k6ojjYv
 lQhA==
X-Gm-Message-State: AOAM532NwuXRR0SqnNfA7gu0+0vDZeXpGWh1wI6BUakEfRlQzzQu2UEP
 MK1z+vcgFQ5GevKWCYjQElEDTDOOzjyGwkp1rrM+Qwbyqr9B4kKK9uBMLIroJWOltLd8VQPCf1Y
 LD7QKUpJ1TB+u6PfApszoWojZV01nWYw=
X-Received: by 2002:a9d:19aa:0:b0:60b:d2ce:2eed with SMTP id
 k39-20020a9d19aa000000b0060bd2ce2eedmr11447589otk.38.1654696564032; 
 Wed, 08 Jun 2022 06:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiw03wQJgkWT2p3OX39HP4vvdtn2idE12KzmNeUxg3oOdnmDQ/f8nKwGRv0RfZWgoCMYIwMmkE0gDrFTnyqK4=
X-Received: by 2002:a9d:19aa:0:b0:60b:d2ce:2eed with SMTP id
 k39-20020a9d19aa000000b0060bd2ce2eedmr11447580otk.38.1654696563776; Wed, 08
 Jun 2022 06:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220608113311.2144610-1-stefanb@linux.ibm.com>
In-Reply-To: <20220608113311.2144610-1-stefanb@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 8 Jun 2022 17:55:52 +0400
Message-ID: <CAMxuvaw-+E3mYe1OOmbaV5GKJuYW_jm5D9kUaYPMq6qQ5sFq2w@mail.gmail.com>
Subject: Re: [PATCH] edk2: Use TPM2_ENABLE and TPM2_CONFIG_ENABLE for newer
 edk2
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Wed, Jun 8, 2022 at 3:33 PM Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Recent changes to edk2 switched the x86_64 build from using TPM_ENABLE

You can quote the relevant change: commit 4de8d61bcec ("OvmfPkg:
rework TPM configuration")

> to TPM2_ENABLE and TPM1_ENABLE to be similar to the ARM build. Adapt
> the QEMU edk2 Makefile to build with TPM2_ENABLE. QEMU v7.0.0 had lost
> the TPM 2 support in edk2 and this restores it.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  roms/Makefile.edk2 | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
> index 485f2244b1..a6eb14f215 100644
> --- a/roms/Makefile.edk2
> +++ b/roms/Makefile.edk2
> @@ -101,8 +101,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE
> +               -D TPM2_ENABLE
>         cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_C=
ODE.fd $@
>
>  ../pc-bios/edk2-i386-secure-code.fd: submodules
> @@ -113,8 +112,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE \
> +               -D TPM2_ENABLE \
>                 -D SECURE_BOOT_ENABLE \
>                 -D SMM_REQUIRE
>         cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_C=
ODE.fd $@
> @@ -127,8 +125,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE
> +               -D TPM2_ENABLE
>         cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_=
CODE.fd $@
>
>  ../pc-bios/edk2-x86_64-secure-code.fd: submodules
> @@ -140,8 +137,7 @@ submodules:
>                 -D NETWORK_IP6_ENABLE \
>                 -D NETWORK_HTTP_BOOT_ENABLE \
>                 -D NETWORK_TLS_ENABLE \
> -               -D TPM_ENABLE \
> -               -D TPM_CONFIG_ENABLE \
> +               -D TPM2_ENABLE \
>                 -D SECURE_BOOT_ENABLE \
>                 -D SMM_REQUIRE
>         cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF=
_CODE.fd $@
> --
> 2.35.3
>


