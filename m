Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138D4023D7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 09:08:37 +0200 (CEST)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNVDg-00086p-Gd
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 03:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNV7r-0007tR-Ki
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNV7o-0004YD-OL
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 03:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630998151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F3mhJan8ywxd9Sx7hi45fU6A3A+1Ay23w95AkNMpVN4=;
 b=GjsHzbOf1Y4Ors7C3TDACJwJ61LWBikF/wK1dhZFgRCJ++lAZZye7m0U8kbSdAxv6zlvYV
 kHhp/16ks6q70LpeZqDln6o9RhSXs/0841qzR9Uj6kzKb9HW5m+1dI+QJieFXhfykNigNb
 Am+ZEcopZsiUFYlZWmkSNPl3y5nSNes=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-H9x7tol4NvWRbinHU5eChg-1; Tue, 07 Sep 2021 03:02:29 -0400
X-MC-Unique: H9x7tol4NvWRbinHU5eChg-1
Received: by mail-ej1-f72.google.com with SMTP id
 bx10-20020a170906a1ca00b005c341820edeso3207761ejb.10
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 00:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F3mhJan8ywxd9Sx7hi45fU6A3A+1Ay23w95AkNMpVN4=;
 b=h/x0qWxCCGUoj6Q4pjs7gkvGH9uOh4YDD26im6B+VY0dn8yfH2CYwWzAg6emvbgmL2
 rPyN26kQj9MTuSPF40FWSkY+4txKbWkREZ7GLaFcP0S9Mc6/as7J2fz0wkHmXcO2q4P3
 Zf/nEneAOkdBDLx0ZZH4JbwFXE1DinWAkVldBleKwmbZTwXjwr/McTtz8+nTPCkJ+HS/
 iFbMq3uh/sX/jSHQPMdjYxUBzJXXsQ3DMjDcUW554JVUWcSj9UppNKm1yHQV3FtM6Zf+
 cFFbGDRw+i3J75PecYKJ34g9BM4I8Jd7X/8LWk2DqKv+Ax79CfyufzpOk5NDB2Mz6DRf
 PQgA==
X-Gm-Message-State: AOAM532q8KMfXsqWCuH9iricmda5rOYG4uZBULWoiZyIZl+fvJsvVL6q
 QsSjjUcmeCi5DqiA5C0Ohuo/cTvnN8q51HFbWnH3a2ZdnNvHjB7Rx0b4xJk60Bkp2i0m5jA3eih
 1veDo7Y04wXdoLL4=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr17276112edu.273.1630998148012; 
 Tue, 07 Sep 2021 00:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNHbJD5VgNfZN57x6+kzK01tMVNJlOlIDnWW06/g1/sNj2jSwqits6WMRhHRGKigvdWMi7wg==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr17276058edu.273.1630998147207; 
 Tue, 07 Sep 2021 00:02:27 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cf11sm5922308edb.65.2021.09.07.00.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 00:02:26 -0700 (PDT)
Date: Tue, 7 Sep 2021 09:02:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210907090225.3c8d3d96@redhat.com>
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
References: <20210906123139.93593-1-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Sep 2021 14:31:36 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v2 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables


FYI: I'm preparing to post v3 today, with so far received feedback
addressed. Change that will affect 3/3 is
 s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/


> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.
> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: dbg2-v2-igor-v2-fix
> 
> History:
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test

>   bios-tables-test: Generate reference table for virt/DBG2
>   hw/arm/virt_acpi_build: Generate DBG2 table

I'd swap 2/3 and 3/3, so it would be obvious where DBG2 comes from.

> 
>  hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 


