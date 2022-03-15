Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D146E4D92AD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:36:37 +0100 (CET)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTx36-0005Eh-Rz
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:36:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nTx1k-0004OZ-L4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:35:12 -0400
Received: from [2607:f8b0:4864:20::436] (port=37855
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nTx1i-0004j2-W8
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:35:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id t5so17287746pfg.4
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 19:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ua3TUcAFl172K0Qz/7V2vceX5xBfssNtCSCndTfoxmk=;
 b=TUiLVy/kvz1QOPDC9o/53OaXYOvuQNoWTxWDWZGccSHb/Vbz6wUoTp+Z62Gzobbedl
 5KefmB/o6X/mup5EwKud291Y0JfVrmWoQm+hlX7yajhPorsjU/SxH286oLZItHM+seYB
 6pBbbEPGD9KAEm4jXeXp68JQLm7ZNoGN2Q1TC9xJE0xrHPWDzPzTb3nEvVY6nFMdP2mn
 rlASMdH+0wHPlzm+O0Cubs7DTHrxEG6sRqh2jEdbbq5mxHojDt9PWULLaCI60JzDCNjS
 O0rmzvT4JcjO52HPS4P7+LSfBjZh4KFMwajE+a+X0DeVIjosBFRV1TkwudW9AVz0kBnj
 W0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ua3TUcAFl172K0Qz/7V2vceX5xBfssNtCSCndTfoxmk=;
 b=Qp4WHBlesAaxxbF7MgdGX1aKPc7OVl1ffmXSjSxv0s7OwVoh98ymNKZ7kNUJMvY6jp
 WpZ6RhtwVHsKaB1NF/mVcZmpTQ4YBdwKiILiD6dMU+Z99gL50lc//LRdBgMrn4J8Vu1S
 BcGWBYHx/uZUBJHPPI1CL18QEZFuL3ILFPTPC7ifG5q916KwcdqmqbrWYzhwA+lAeWHT
 wvLuQhw+Qfys5l1+5kNdWeyqulJjsabFbc0Hq3VCCOKF+hfgQfj5WKxjKLLVh3FB76eS
 vaMRsIOC36vLkDhENud2NqK40SCVRelJ3/B6YqPfxUH7mBMPtYQ1XowPl41s2wjrzxEf
 tm3g==
X-Gm-Message-State: AOAM531xQGMFf3ry3jPJM5/izVPfDzDq974vNi5ye+b406OArDBVKAjm
 Vcqzs1ljV9wuGKJkxQSrGGENCg==
X-Google-Smtp-Source: ABdhPJzR8zjUWvFW9MOAWcTG6O6RRb/JF4Q9XLodTRdcBx9M2qEK0qTdvFvHrDOYulzJY/TVCqF6bQ==
X-Received: by 2002:a63:fb44:0:b0:372:9ec8:745a with SMTP id
 w4-20020a63fb44000000b003729ec8745amr22133973pgj.551.1647311708865; 
 Mon, 14 Mar 2022 19:35:08 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.199.52])
 by smtp.googlemail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm852376pju.15.2022.03.14.19.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 19:35:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 15 Mar 2022 08:05:01 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Andrew Deason <adeason@sinenomine.net>
Subject: Re: [PATCH v2 2/3] hw/i386/acpi-build: Avoid 'sun' identifier
In-Reply-To: <20220315022025.18908-3-adeason@sinenomine.net>
Message-ID: <alpine.DEB.2.22.394.2203150804080.2676946@anisinha-lenovo>
References: <20220315022025.18908-1-adeason@sinenomine.net>
 <20220315022025.18908-3-adeason@sinenomine.net>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Daniel_P_=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 14 Mar 2022, Andrew Deason wrote:

> On Solaris, 'sun' is #define'd to 1, which causes errors if a variable
> is named 'sun'. Slightly change the name of the var for the Slot User
> Number so we can build on Solaris.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4ad4d7286c..dcf6ece3d0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -576,32 +576,32 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
>  }
>
>  Aml *aml_pci_device_dsm(void)
>  {
>      Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
>      Aml *acpi_index = aml_local(0);
>      Aml *zero = aml_int(0);
>      Aml *bnum = aml_arg(4);
>      Aml *func = aml_arg(2);
>      Aml *rev = aml_arg(1);
> -    Aml *sun = aml_arg(5);
> +    Aml *sunum = aml_arg(5);
>
>      method = aml_method("PDSM", 6, AML_SERIALIZED);
>
>      /*
>       * PCI Firmware Specification 3.1
>       * 4.6.  _DSM Definitions for PCI
>       */
>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>      {
> -        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
> +        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sunum), acpi_index));
>          ifctx1 = aml_if(aml_equal(func, zero));
>          {
>              uint8_t byte_list[1];
>
>              ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
>              {
>                  /*
>                   * advertise function 7 if device has acpi-index
>                   * acpi_index values:
>                   *            0: not present (default value)
> --
> 2.11.0
>
>

