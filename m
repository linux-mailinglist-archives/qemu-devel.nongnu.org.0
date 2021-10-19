Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67057432C05
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 05:03:33 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcfPY-0006bQ-Fp
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 23:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcfOB-0005v6-Fp
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:02:07 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcfO9-0003w3-EG
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 23:02:07 -0400
Received: by mail-pf1-x42c.google.com with SMTP id i76so14214956pfe.13
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 20:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=gINBCHh0jEEXNfEBt+rCN/Txr/VOk/fylull419w+MA=;
 b=CifsxsEWw9qU5xOZaGIyrqGXLZ9K6X/H+xlCe0qVw+dTBCKJFZqewE9BKNcJ2dJZ+7
 rYTkF1J1TzcTtJDBjpfhZI2k4YroY4kTAJSwrQL0erVHjJcMqAR4+OO6T0B8Z/kWVFUZ
 Vjr7XLYAA/I+SUyib4YUQ6cy1IxVgqC7bKR0OGyP/+pEmlmqBWzAx00Er3YiJ2qD2IHy
 2r5RlzsMrcd+raIcZtz2nWKRSTCRBWjLGE5xzYj8625FGEnGqEhBs8d9LnwHFPvBIRLA
 pqhvDA6y/5ucyWR3Bo/jWjV6zi+V9ZpNh24sOvMEoK/3Y1/uyZUISTuN2NGL3HMkpMVT
 Lt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=gINBCHh0jEEXNfEBt+rCN/Txr/VOk/fylull419w+MA=;
 b=kHpwdhX+AEqQTq6j4mZ6OMi6riGGwCfCEdJ9cFhdN2iB8P2+rdLbOFgA/Kk1XeiZ3a
 hMQXt7/JXBUEK+thos/wVHTsAx3JZwYNBeY+NIu1Fk7nEcCSFca41QrrJFDb+aDIMo8q
 YYfjsEaVWL2e9W2EcQmsyFgJ9mpQfUg4L9ZGC9m7dLIB7tIP7gLGLo655p1d1bvAdf23
 sv16pZ5LpaWnHxlPqOF0+0aGZADk9sTuOytaf/3rdSXNcjHjvTJs6D6o8Jwwvcf6/JpU
 cZ3XSv5cmV1mzkqOIRWchzPn4u7IGFem2Qdhf/VmsvIpVVHbvMofaQiwKUaCgfgTMnZy
 gp/w==
X-Gm-Message-State: AOAM532xKunYp7LI0eWcU70KjDM/Dj6EScg1XTZjaONsVYciwErxfC/d
 NHlBF32UDgf9IrfiskRYVJFdEg==
X-Google-Smtp-Source: ABdhPJzuopU2lrBuc26UNUR4qH08xgG4gG7dlIYQZhf3sV2MaCS8yxklggUVWdQSvrpYKPHmUK7mlQ==
X-Received: by 2002:a62:5804:0:b0:44b:b75b:ec8f with SMTP id
 m4-20020a625804000000b0044bb75bec8fmr32285180pfb.63.1634612522621; 
 Mon, 18 Oct 2021 20:02:02 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.197.251])
 by smtp.googlemail.com with ESMTPSA id ob5sm791537pjb.30.2021.10.18.20.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 20:02:02 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 19 Oct 2021 08:31:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] rebuild-expected-aml.sh: allow partial target list
In-Reply-To: <20211018212632.299857-1-mst@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2110190829120.147377@anisinha-lenovo>
References: <20211018212632.299857-1-mst@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::42c;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 18 Oct 2021, Michael S. Tsirkin wrote:

> Only rebuild AML for configured targets.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/data/acpi/rebuild-expected-aml.sh | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/tests/data/acpi/rebuild-expected-aml.sh b/tests/data/acpi/rebuild-expected-aml.sh
> index fc78770544..dcf2e2f221 100755
> --- a/tests/data/acpi/rebuild-expected-aml.sh
> +++ b/tests/data/acpi/rebuild-expected-aml.sh
> @@ -12,7 +12,7 @@
>  # This work is licensed under the terms of the GNU GPLv2.
>  # See the COPYING.LIB file in the top-level directory.
>
> -qemu_bins="./qemu-system-x86_64 ./qemu-system-aarch64"
> +qemu_arches="x86_64 aarch64"
>
>  if [ ! -e "tests/qtest/bios-tables-test" ]; then
>      echo "Test: bios-tables-test is required! Run make check before this script."
> @@ -20,6 +20,26 @@ if [ ! -e "tests/qtest/bios-tables-test" ]; then
>      exit 1;
>  fi
>
> +if grep TARGET_DIRS= config-host.mak; then
> +    for arch in $qemu_arches; do
> +        if  grep TARGET_DIRS= config-host.mak | grep "$arch"-softmmu;
> +        then
> +            qemu_bins="$qemu_bins ./qemu-system-$arch"
> +        fi
> +    done
> +else
> +    echo "config-host.mak missing!"
> +    echo "Run this script from the build directory."
> +    exit 1;
> +fi
> +
> +if [ -z "$qemu_bins" ]; then
> +    echo "Only the following architectures are currently supported: $qemu_arches"
> +    echo "None of these configured!"
> +    echo "To fix, run configure --target-list=x86_64-softmmu,aarch64-softmmu"
> +    exit 1;
> +fi
> +
>  for qemu in $qemu_bins; do
>      if [ ! -e $qemu ]; then
>          echo "Run 'make' to build the following QEMU executables: $qemu_bins"
> --
> MST
>
>

