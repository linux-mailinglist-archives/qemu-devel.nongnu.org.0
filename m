Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6C3536AEC
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 07:30:38 +0200 (CEST)
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nup25-0002Jh-6R
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 01:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nup09-0001Yz-84
 for qemu-devel@nongnu.org; Sat, 28 May 2022 01:28:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nup07-00028H-HT
 for qemu-devel@nongnu.org; Sat, 28 May 2022 01:28:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m1so5855904plx.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 22:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=txseGbSPevK/HcOSghhC45FFqLewgPQymjI8vkl/nO0=;
 b=68tCx1EVQRrow+AFmR0Jmmokam+5uq35wHLYC/tkKsrvKN12CzvQgwl8UVd002LAz1
 bNPR+OHaPypYqamvb8Ov9VETCLu7AjXgTU9fu9RgpCpqm90aFIjmX3nzEJ4yetmk2fyQ
 Dh6JSnHGbvxUkPAL4ORcxUeHZKRUkeTlFGX7PbkgP/cnEN4djjdhNgNAW6n0WyaAzGlh
 p18aWLI6ZiVMtQbRxEcOzs45raiTixGU0MmjiqTvbrJsBCkLo58E3etf6eC79Vu7TaA/
 1TJC4NVDRzsdRGeEi/X037Wm+7+VV4YFTTRFAf8x8kNFDL6rCFOaeDx8AdrA+bXlW1lr
 E49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=txseGbSPevK/HcOSghhC45FFqLewgPQymjI8vkl/nO0=;
 b=hGORSZ91AKl66JWvib4uorCv0XpSfOY6I/5GkCXNDGFpndn5KpQzoUK2yRcu0jsZxn
 fr4WjsAgW2rj3+FU9gGunrw3SEvA7Siomr0TjalnsTKxvfI3vXawm396RhlSNv5YW4sX
 HpqZxVDFDWOuDSLAFxAac0OZ/BBgTAPSviTgxjN2Hbg2VIaR2fiGjxw8IL1PxG25UVi0
 nZ4e9SI3tJL1y79xt5dslMegMZLh7RioBlgcNI/wmlFgNep9KFmcIGieV6MPjuGLEV4H
 IDkBRMiM4uJM6h3KPh6ugvwkrMFxPb4TlBUoe0uIEQIfq1qpe71yvPEAvLR8o/hn/jw2
 4t4w==
X-Gm-Message-State: AOAM530bokDJrSf07CSiCtv0RltGV67eikr/z+Zuvbb2f+HSpKHiNLbv
 dQg1J93MFmF0aeYTX3TEqDYPBA==
X-Google-Smtp-Source: ABdhPJz6ltEVF7cpeG1H50AE0XMcdnjyStUPeZ4njt8uM3nonf9ZEZk6sQQxrz2FJyJBR0RPjg6Hsg==
X-Received: by 2002:a17:90a:bb0e:b0:1dc:a406:3566 with SMTP id
 u14-20020a17090abb0e00b001dca4063566mr11990284pjr.135.1653715712461; 
 Fri, 27 May 2022 22:28:32 -0700 (PDT)
Received: from anisinha-lenovo ([116.73.134.210])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a170902f54900b0016223016d79sm4750977plf.90.2022.05.27.22.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 22:28:32 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sat, 28 May 2022 10:58:27 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Julia Suvorova <jusual@redhat.com>
cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 3/5] tests/acpi: allow changes for core_count2 test
In-Reply-To: <20220527165651.28092-4-jusual@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2205281058020.153682@anisinha-lenovo>
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-4-jusual@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Fri, 27 May 2022, Julia Suvorova wrote:

> Signed-off-by: Julia Suvorova <jusual@redhat.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/APIC.core-count2        | 0
>  tests/data/acpi/q35/DSDT.core-count2        | 0
>  tests/data/acpi/q35/FACP.core-count2        | 0
>  4 files changed, 3 insertions(+)
>  create mode 100644 tests/data/acpi/q35/APIC.core-count2
>  create mode 100644 tests/data/acpi/q35/DSDT.core-count2
>  create mode 100644 tests/data/acpi/q35/FACP.core-count2
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..e81dc67a2e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/APIC.core-count2",
> +"tests/data/acpi/q35/DSDT.core-count2",
> +"tests/data/acpi/q35/FACP.core-count2",
> diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> --
> 2.35.1
>
>

