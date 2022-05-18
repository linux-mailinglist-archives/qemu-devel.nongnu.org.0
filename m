Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8852B595
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:08:18 +0200 (CEST)
Received: from localhost ([::1]:37830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFfE-0001pp-KY
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrFaZ-0006od-2H
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:03:29 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrFaX-0004FS-3q
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:03:26 -0400
Received: by mail-ej1-x62c.google.com with SMTP id wh22so2335379ejb.7
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ealinpp3gZE+IRZLd/+uhHQ6vmj+/ZYhWPAcfUfMW5s=;
 b=OE1+k6kxf7txfCWLdyUpHOLjl4EvsKYaJXIUh5DMtwa8Aqn30lu/Uy04KgtWzWZa6w
 rLt0sX9fT4vKpMlEMHVIew6Qz1iuk2zc88+xFP6AhWhW9R1euXDwaqTT2fAxB38NakUW
 cwrq4lcShGYyHMsEt0RYCtSX/k4IGRN8GQcftiSWWgymO3mIAllmDQRbD0byw0BNE1zU
 Qtry78r//xhsNiy7gXmrCg6LKBFqlAPdGjSFl8UDNXVDwDngeXJ9iu1V9Q/JVefL8T4p
 OnSikmL9ZoEdfeVczrOeq1mNw0dZIdeWHrPMNBHDGUGVIVKJXuzzFpaRSIDquc27RxWr
 eQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ealinpp3gZE+IRZLd/+uhHQ6vmj+/ZYhWPAcfUfMW5s=;
 b=j39kGDe/dZszRpHw2gWq+f9R2iavPA4MZv6KcjMqGZ2Fzvkk9cm4SlXE//t1vKg1Ow
 0lXb32nvPbD0rtGApgDlEjs9ZIryWAhhnTQSE4IiHgqieSakXvIux4wQBf0SSmTh360G
 MpBo7jyptASLNcVOqDl5r6R/O8i6J78ZzhaoTOvOPOyD495kP6Di6yXLAXlWF4jiH7gb
 uq/XePdkR8O2ZDtzaqtbl4wFCLo3605JhBaWjhNPjxFT1BZBOfvShAqMACEzZ12LWonD
 YkQjDpl8GAtTsaJ86eT2AwPDJTz8kx0jou0cOaXUDUwL6vNIOfAvy+QDrKF+hbC6khcX
 hNQQ==
X-Gm-Message-State: AOAM532PrBgM+dnQnftqKHNt7yVvno6qMe8nfs8Z4BHV3u5c3BgINbNf
 f8mI2WCWGRa/E4QqRRruIJ0MvDmtRdtOCdBSLto6rg==
X-Google-Smtp-Source: ABdhPJxQQLlle6Ua0GlDdZhihAUav1vgTjcZ4N94xzoxFbIQ2SWL1KidOHbdQXXBS6OY/mFcC8an/QxwIgeZ+vigwz0=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr23034576ejc.64.1652864603494; Wed, 18
 May 2022 02:03:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-32-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-32-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 14:33:12 +0530
Message-ID: <CAARzgwxP-JQ3O34oa95mQuJ=q7Pm0jVsqNOpQudvkeU_==oBwQ@mail.gmail.com>
Subject: Re: [PATCH 31/35] acpi: pc/q35: tpm-tis: fix TPM device scope
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
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

On Mon, May 16, 2022 at 8:57 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> tpm-tis, is not a PCI device but ISA one, move it
> under ISA scope to fix incorrect placement.

This description is a little misleading. What we fix here is for
TPM-tis 2.0 only. TPM 1.2 was already previously under ISA scope.
>
> Fixes: 24cf5413aa0 (acpi: Make TPM 2.0 with TIS available as MSFT0101)
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

modulo that above comment,
Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a42f41f373..85a7313cad 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1764,15 +1764,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>
>  #ifdef CONFIG_TPM
>              if (TPM_IS_TIS_ISA(tpm)) {
> +                dev = aml_device("ISA.TPM");
>                  if (misc->tpm_version == TPM_VERSION_2_0) {
> -                    dev = aml_device("TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_string("MSFT0101")));
>                      aml_append(dev,
>                                 aml_name_decl("_STR",
>                                               aml_string("TPM 2.0 Device")));
>                  } else {
> -                    dev = aml_device("ISA.TPM");
>                      aml_append(dev, aml_name_decl("_HID",
>                                                    aml_eisaid("PNP0C31")));
>                  }
> --
> 2.31.1
>

