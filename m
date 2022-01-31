Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AF44A48FC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:07:13 +0100 (CET)
Received: from localhost ([::1]:55854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXKq-0001dw-DS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:07:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEWdt-00035z-En
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:22:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nEWdp-0000yi-Tm
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643635320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=chcRft7TZYO6iQQ1TDSfGJPmTmVoYyx1d9BrtCtevaM=;
 b=C8iZgECq7pZg8cWgTlQ6FfwLpcF279XA9PEJk2XUPVgMbncA771GmW+zb4Xpw7Icxs7Q5i
 J3eSscZw5kYWi8EWggZJQELt7FQ3TXYWgVhNVulvkNfb2+75jmXDoePYFt80Uf2CvEpEn4
 gEfxaJY5dugIz4XOz6QjMvkiTzYBH+c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656--YSWRfx8Oxu58gFr-8njYQ-1; Mon, 31 Jan 2022 08:21:59 -0500
X-MC-Unique: -YSWRfx8Oxu58gFr-8njYQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 n7-20020a05640205c700b0040b7be76147so2422647edx.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=chcRft7TZYO6iQQ1TDSfGJPmTmVoYyx1d9BrtCtevaM=;
 b=JccYgDAl3/J9j76KfjQFYf7WD3v5+3x8zVluJ27xyWyvvg8aP0PuTlP9/AdW3qe0iJ
 Lp+YB4jz3t9C9JIbXU692JVsEy7rLA0dDGXn5eVjiYqaTNFG7uyYUb+RO3/0WKy2L9ig
 pWy3Bg4kUu88tmkWPABGHcxW1ZIF+oKMv6fLkdwzWwQbzelNrfOPQ6MRQ5I5ipcwIln1
 VhqMC1AYNf4OAdtvR1z9cIeFfRMVutA8za0uwCG4uhhKeOh7jUldgyBBtGh5g+cOwRFb
 WOOgvHbZIE/aeXxo/OZT2U9cpwY7eY9yZvJK68SMkNrMyJw5N2BuHlljpoHH9xDiw/ze
 nLTw==
X-Gm-Message-State: AOAM531URs4b0NdeMfen8+518NwlQKuOxz+yPVt/6Wd3v/yaitYZVI4/
 kGfYNITaxVA/vQIpOwr3uaf03VZiugwqzFxpBYdDGe+zxR9P7BRkNIz8aaEk/5HQlaXSjtoiG9O
 PJo1CQE4THH7rfDwbyrgSKTvlPprWjvKi8iBq7jebIYI7hmE+Ujx9D74VHF8CwNlDzuY=
X-Received: by 2002:a17:907:6d99:: with SMTP id
 sb25mr16826679ejc.10.1643635317450; 
 Mon, 31 Jan 2022 05:21:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWHFvX5HdAGGssIBXKJCRqBsoZt24YcQJoWXYwuzsJcL+N68kv3R13VVUDF4Smm2XGhbNcgg==
X-Received: by 2002:a17:907:6d99:: with SMTP id
 sb25mr16826669ejc.10.1643635317295; 
 Mon, 31 Jan 2022 05:21:57 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f2sm13627587eja.78.2022.01.31.05.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:21:56 -0800 (PST)
Date: Mon, 31 Jan 2022 14:21:56 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] acpi: fix short OEM [Table] ID padding
Message-ID: <20220131142156.1e4b1690@redhat.com>
In-Reply-To: <20220112130332.1648664-1-imammedo@redhat.com>
References: <20220112130332.1648664-1-imammedo@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Marian Postevca <posteuca@mutex.one>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 08:03:28 -0500
Igor Mammedov <imammedo@redhat.com> wrote:

> Since 6.0 the commit:
>   602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> regressed values of OEM [Table] ID fields in ACPI tables
> by padding them with whitespace is a value is shorter then
> max possible. That depending on vendor broke OEM [Table] ID patching
> with SLIC table values and as result licensing of Windows guests.
> 
> First reported here https://gitlab.com/qemu-project/qemu/-/issues/707

ping,
Michael can you pick it up so that downstreams could
backport the fix?

> 
> CC: Marian Postevca <posteuca@mutex.one>
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Ani Sinha <ani@anisinha.ca>
> 
> Igor Mammedov (4):
>   tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for test_oem_fields()
>     test
>   tests: acpi: whitelist nvdimm's SSDT and FACP.slic expected blobs
>   acpi: fix OEM ID/OEM Table ID padding
>   tests: acpi: update expected blobs
> 
>  hw/acpi/aml-build.c              |   4 ++--
>  tests/data/acpi/pc/SSDT.dimmpxm  | Bin 734 -> 734 bytes
>  tests/data/acpi/q35/FACP.slic    | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 734 bytes
>  tests/data/acpi/virt/SSDT.memhp  | Bin 736 -> 736 bytes
>  tests/qtest/bios-tables-test.c   |  15 ++++++---------
>  6 files changed, 8 insertions(+), 11 deletions(-)
> 


