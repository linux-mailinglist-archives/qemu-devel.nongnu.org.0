Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB875FBF86
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 05:29:14 +0200 (CEST)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiSQj-0000gL-Pg
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 23:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiSP2-0007LE-AW
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:27:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiSP0-0002TQ-9y
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:27:28 -0400
Received: by mail-pg1-x52d.google.com with SMTP id r18so14424791pgr.12
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 20:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=yvTbyvzcqITM3lDqWBEPjbS93arClejppyDYwGYkZ8Y=;
 b=mYtPpcUn3urkZKpUEWa62PWm4VXbdzwWY3eGGPW+SN/EGKOwaLItrP40RwwcptR5CM
 amN/2/fbG3e/dVNQDl8BZ3ltB2bWboLNr7LhpLxbsY+OlIxEZ+j3A0yLBsbj54j7A3L5
 wH9G4SNmbtw4LmnkjEU+YrK6h4AXvPBiDVRb0XmXnQpW3cgg8qumCkFXBMIlZ7/bRfvr
 5eEEmKrpBF/VazH7/ZSnt3T/E9ak+iUpzlm7TqZsOcFE1FHQgF1YEIX8GwLThwGZC9Hj
 4WUydqFXA8OFwrm9yPfcaMycdPz/hnRswRTgDP9T/rr33VcMy7QLUEGOTTB5pSlbmZPi
 jjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yvTbyvzcqITM3lDqWBEPjbS93arClejppyDYwGYkZ8Y=;
 b=TPWNKvvBTyxlwvJqwmIhu85kmQMz6yrG/+faS/h1qQk6qP9Pao88pYG/PVeqpUEDzO
 0ASf+OC4O8N/Lq7au9EDqeWCvIQdpKxZ9ISHA8jXa+LjbZkMtJIha+YBsRgswXcnF7tb
 AvA3HUrK0vFSIxfi6oP7vjV/83K06qUXeGyXO1378zpUUfoxMQIuCue3o6log9vzBy7/
 5NuZzuBgN0PStEFFdzf5kKU9/12dvNJhjKyJV1Z18rCyp1d2UeXDCJy9KxhEA2JxybOJ
 oYSAZzLV2nrnPhoLMIfgGEID8n1uwC3XCuiCsic+mxVVY6gDGv/yr6WwHp5rK0MGnbZ8
 5O0w==
X-Gm-Message-State: ACrzQf0HrQc7f61+QKCr12RLdv8gcjrqOEM4DMzpUiVp8iznOPT70bZz
 p7U55Z6iLH9OwjKngGyTzl0t4w==
X-Google-Smtp-Source: AMsMyM4QguTUdmF60hKn5fnmAeRgwVGM9RZT7NLyDLnxlofpvi+sQz/V+el8u7t22W/nHwvnJH5mAg==
X-Received: by 2002:a63:db14:0:b0:44d:e4f3:b45c with SMTP id
 e20-20020a63db14000000b0044de4f3b45cmr23157094pgg.267.1665545244659; 
 Tue, 11 Oct 2022 20:27:24 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.117.164])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a62d141000000b00562664d5027sm9738373pfl.61.2022.10.11.20.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 20:27:24 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 12 Oct 2022 08:57:18 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 1/4] tests/acpi: virt: allow acpi MADT and FADT changes
In-Reply-To: <20221011181730.10885-2-miguel.luis@oracle.com>
Message-ID: <fb6b0af-3fe5-ae4f-66ff-b1ab8ccbdfe5@anisinha.ca>
References: <20221011181730.10885-1-miguel.luis@oracle.com>
 <20221011181730.10885-2-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 11 Oct 2022, Miguel Luis wrote:

> Step 3 from bios-tables-test.c documented procedure.
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..8dc50f7a8a 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/FACP",
> +"tests/data/acpi/virt/FACP.numamem",
> +"tests/data/acpi/virt/FACP.memhp",
> +"tests/data/acpi/virt/APIC",
> +"tests/data/acpi/virt/APIC.memhp",
> +"tests/data/acpi/virt/APIC.numamem",
> --
> 2.37.3
>
>

