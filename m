Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF5747DF81
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 08:22:47 +0100 (CET)
Received: from localhost ([::1]:35444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0IR4-0000T1-VC
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 02:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IJ3-0005T2-6m
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:14:29 -0500
Received: from [2607:f8b0:4864:20::434] (port=38901
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IJ1-0003YX-PH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:14:28 -0500
Received: by mail-pf1-x434.google.com with SMTP id b22so4495452pfb.5
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 23:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kX8dx9b5WA4NrJIhqAVKKSnpuJl8bxAQWcz0M6Xp0G8=;
 b=nxFhnvhz/xCGtDmcXtdINDfcdkhbYLRxecvcnQD01LkOFD3ts/+wFDA2ZMmOCeg9ss
 JxHAsUtINA9Xah7/8L673fFzheqyXnrqqzYDVXdhY81G+scodPafMGVakGXr7iyxzyg8
 7BDtIiCVA3R+5Oz2wKPgkcSLVpeb4PsuLdwgYp+I0LuDLMTkoxe0s1SJk2mGydMsryhd
 c9BkOdXU69Xj9hzYp48o+BB0zZO5bta/cIMmcMyBq+FszTt9EiCI8Yx1y57MsmGlK6NW
 PBjy5Hlgur+aM0t+WA3WSgUIvbqavLZx6qfXSxQLe23M4XG1P4PQutvOE9bcO9nR+iXG
 o/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kX8dx9b5WA4NrJIhqAVKKSnpuJl8bxAQWcz0M6Xp0G8=;
 b=g+i4aQ9fDiKFdwJ4BIXMhJbtm6zjQy1/+1jLGH207lnz4pOfrVwjHdPgdtVkyBOP5b
 5e0vo7NztL1Xggl1x6+Y2rvH+LCpLUli8g8P7z7RrrxiqZasu/yUE8xl0+sfio+7+DFo
 6DU/xqpNrmERwo6emLD7DiO8rT1zkQmgyTL0homsLQKdwJItsyto0ma88MU40OBRn9h5
 lespEUCs989f2qXnQuJJyTH8/gdlMRV/xVhJn7CYoD501mTVDdp8tUXL/N0RN4ELwYBq
 S1Y8V5v5aMRmyBbzwsEbbcsxZbhuia/PoCtegQB/kniCk67S+RdwYho7A9MsHo+2ZC0J
 T/9Q==
X-Gm-Message-State: AOAM531PVPYZZAN8aNOCh2zZnLsbEYUFSzJtW3w7bEjQiDBzqNSrgMUh
 a3P4N8ofS+UxgxTWJgAUG11NZA==
X-Google-Smtp-Source: ABdhPJwLEL0BPOFDh/PEiAGnpVxMc3X9kCQvPaHV3GlMOUJZQ3bff892vUZ39QtHBv1EjBpgRZDoOA==
X-Received: by 2002:a63:9c7:: with SMTP id 190mr1101722pgj.527.1640243666314; 
 Wed, 22 Dec 2021 23:14:26 -0800 (PST)
Received: from [192.168.1.7] ([115.96.109.44])
 by smtp.googlemail.com with ESMTPSA id j20sm6468182pjl.3.2021.12.22.23.14.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Dec 2021 23:14:25 -0800 (PST)
Date: Thu, 23 Dec 2021 12:44:20 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 3/3] tests: acpi: Add updated TPM related tables
In-Reply-To: <20211223022310.575496-4-stefanb@linux.ibm.com>
Message-ID: <alpine.OSX.2.20.2112231243580.2839@athabasca.local>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-4-stefanb@linux.ibm.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 22 Dec 2021, Stefan Berger wrote:

> The updated TPM related tables have the following additions:
>
>    Device (TPM)
>    {
>        Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
> +      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
> +      Name (_UID, One)  // _UID: Unique ID
>        Name (_STA, 0x0F)  // _STA: Status
>        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> Message-id: 20211110133559.3370990-4-stefanb@linux.ibm.com
> ---
>  tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8900 bytes
>  tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8921 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  3 files changed, 2 deletions(-)
>
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
> index 0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8..fb9dd1f0599afd6b555ea570ecd00a3bb227aa84 100644
> GIT binary patch
> delta 50
> zcmdnzdc>8>CD<k8h!O(><KvB7q6(a@S~2m#PVoZ1lQk6FnOs#T7b=LdgnGI#Zf;Sq
> GVgdkr91X<)
>
> delta 45
> zcmX@&y3du%CD<iopArKDqxwcJQ3Xza&6xOLr+5MP$r=joO#Uj93l&5+_b6B}0RSYz
> B3@!iw
>
> diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
> index dcbb7f0af377425db53130e8ba1c62c09c22e006..00d732e46f5d9d056e557bd026fa30f9db3b8c30 100644
> GIT binary patch
> delta 70
> zcmdnzdefE5CD<k8rV;}KBgaNAQ3Wn9?U?vrr+5J;?a7)7ZcJWklM5BZ#e;Z50(=#W
> a^b8bSQp+-vQyDnoLp@y>H@7HQF#!OXcoHoD
>
> delta 46
> zcmccVy3du%CD<iopArKD<D-pSq6%F8nlbUgPVoZnnv*pZ+?f1TCKoD*Z(gim#smOL
> C=M6sq
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 5d80e408d4..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,3 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/DSDT.tis.tpm12",
> -"tests/data/acpi/q35/DSDT.tis.tpm2",
> --
> 2.31.1
>
>

