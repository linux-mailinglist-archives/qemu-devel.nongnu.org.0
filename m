Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912AC4C59D5
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 07:59:10 +0100 (CET)
Received: from localhost ([::1]:33674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nODWP-0005gK-MZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 01:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODUe-0004J9-Rs
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 01:57:21 -0500
Received: from [2607:f8b0:4864:20::435] (port=46701
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODUd-0002Or-4C
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 01:57:20 -0500
Received: by mail-pf1-x435.google.com with SMTP id i21so8267859pfd.13
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 22:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=W+FuOp3jZdklFUdL1PtV/fIrqo1DaIRhwNzGmzzETSY=;
 b=M/MImTKUBrJsAMV5Wfc+En5pN0kt9idHW5q+wjia5linewptRoAF/DwEZqbS4cpCnN
 +GY2G4u6b63jQnoYUFqD1LxlkgNfezZn+M6DvK1X38EOBc+GPxJPM/TexFHkmYjtl3ev
 AB9Ymyi6azCJVpPRqMWqEn6UJspxLEBQBWIKhK7UnTr3zdo0mzj3tGQKw8PvFLcwzj7D
 YstSzgEYXn9nM/OUPwBobuJqYkixSU90bpbJWAYJaVqwL/ZQDECXS3lxEjTXTsPM7u8t
 Vxk0HTqzITL9hNV1Gs6SEu0QyGPXr6VQFOACdQgEZZqqyM2ViR1f8UQ+tgWPMxjWeC7P
 Kdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=W+FuOp3jZdklFUdL1PtV/fIrqo1DaIRhwNzGmzzETSY=;
 b=Z9jPaWiNOpIO+qMiY6i8I0+UFuhnQXemgtkQ5JpOKhPiyoi8/wBMIL5nz51mV1xR7Q
 Osb0zS/mMbBVauq9hR6TLq53Dmxe3NL/NEiUZYBVYkFzQuAheczaWRmMC8M88pXH3kes
 y9LbkJWO/DlF8XA6VeS+NhwpczYFTLKRWbK6BbMiGmGlGNuVgZjgybph7ASQLaR5HJaV
 5Z4IisRYO0rQI0FdcGtn1uOldRKwSxDi5l2X3dFEcKeiTXDpWP0BnsPrAphIxY0mUS6v
 49lwK6cVXEAMyUs5Te1s+UeQh0Ytr3rU9V4wLfAXnPYfCebRy3xDYRl8k68+AIh4l7J4
 9iTA==
X-Gm-Message-State: AOAM530orbLDEIeUFQaqb92kh3tDZHLPUDzfg65U9vYFu0h1YQx8Yy6Y
 eaxanDIiy3BQ7crqxjw9UMx6ag==
X-Google-Smtp-Source: ABdhPJwFLmjgTAu8cr74XhabwEM3SH5lmn5I10lAGkjFdpGCJySb3zxrImTYYqikjU6AnjETScleWw==
X-Received: by 2002:a63:9354:0:b0:34d:e4e7:543a with SMTP id
 w20-20020a639354000000b0034de4e7543amr12753750pgm.48.1645945037752; 
 Sat, 26 Feb 2022 22:57:17 -0800 (PST)
Received: from anisinha-lenovo ([115.96.134.68])
 by smtp.googlemail.com with ESMTPSA id
 p33-20020a056a000a2100b004dff55a7f08sm8989917pfh.21.2022.02.26.22.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 22:57:17 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 27 Feb 2022 12:27:12 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v3 2/4] tests/acpi: i386: allow FACP acpi table changes
In-Reply-To: <20220226063019.1112654-3-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202271226530.1249418@anisinha-lenovo>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-3-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x435.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Sat, 26 Feb 2022, Liav Albani wrote:

> The FACP table is going to be changed for x86/q35 machines. To be sure
> the following changes are not breaking any QEMU test this change follows
> step 2 from the bios-tables-test.c guide on changes that affect ACPI
> tables.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..7570e39369 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,5 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/FACP",
> +"tests/data/acpi/q35/FACP.nosmm",
> +"tests/data/acpi/q35/FACP.slic",
> +"tests/data/acpi/q35/FACP.xapic",
> --
> 2.35.1
>
>

