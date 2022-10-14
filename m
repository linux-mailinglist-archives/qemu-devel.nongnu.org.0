Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0565FF04D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:27:45 +0200 (CEST)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLf6-00073l-Im
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ojLaU-00028e-76
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:22:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ojLaS-0007QY-LH
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:22:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665757375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Xml3HyeL34UJD0Zi1uKSHEJWK5t+84Le6f1kphykYU=;
 b=b8a0auPSkv9QhpdA6awpcM/drmskbSXNUGpaT0kzQTSP+P5U6BDYcuXwS8fM6lN5nzaZnH
 GHNRu8cE5b8dYM2fAxtE41mJomtXbIQJ+h+sGZZApLgdrbjltNKoooeoZgLc0r2QCFS02r
 9smj3QOvgz6M4Ds2QZFbrS3xAyIwwQo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-39--oWCc-I7MXa_djwPzmV0_w-1; Fri, 14 Oct 2022 10:22:54 -0400
X-MC-Unique: -oWCc-I7MXa_djwPzmV0_w-1
Received: by mail-ed1-f70.google.com with SMTP id
 f18-20020a056402355200b0045c13ee57d9so4156992edd.20
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Xml3HyeL34UJD0Zi1uKSHEJWK5t+84Le6f1kphykYU=;
 b=Rgu/CqqNyfVH1b8VyCOo07rYJNFwocCE5byo9asqTKVUYDa6ZeoxRDEiAnrwtnS9sn
 GyyhsmWfmsDgenBJd8JpRzZ3jAQcisiPFvg58rZKpgqOQEY7Q52h9oemxP7PSt7K/LmY
 7FnmBDL1SML0O8VdXf4M3eVh/PWaH9yDi0I0+GK08wS98DgSXSdkCZfUFb+1qpG0WXYK
 /31ElyswNPBIeOVT6W+CVQqlAKqrO7tnbJAqy5ZugbST1snI8Tqijs6TSgyIgKxHjDPn
 WoytSGbs9oK6uEkZpSDf9XYrnsaduK5+xKoGTJgnpihhdWUDp/gLMqIy0OFHdCPoPX9N
 GbFw==
X-Gm-Message-State: ACrzQf1kxvgAvwBxFas+nRoMfjkx/kcLaj7xxdCF92OQHjid/U0PIVH1
 xz3iVxGwHKlb+4Q1iMFUC+wxj+Jdtg9iaCw+VpTvavxPLzEMs8fRHjqKzERl/qPbf1SXIDU0hk6
 I1gQQh9mxnVscgDs=
X-Received: by 2002:a05:6402:428f:b0:454:c988:4bb1 with SMTP id
 g15-20020a056402428f00b00454c9884bb1mr4417372edc.196.1665757373656; 
 Fri, 14 Oct 2022 07:22:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sHmZHPBLcrxa+Cn+21XKopmGjEm6AxRpgxzT1Ya4kGi/SwHmzT1EeoK4j7G3ABwMgg8iu/g==
X-Received: by 2002:a05:6402:428f:b0:454:c988:4bb1 with SMTP id
 g15-20020a056402428f00b00454c9884bb1mr4417356edc.196.1665757373478; 
 Fri, 14 Oct 2022 07:22:53 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a50ec19000000b00459d0df08f0sm1863346edr.75.2022.10.14.07.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:22:52 -0700 (PDT)
Date: Fri, 14 Oct 2022 16:22:52 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>
Subject: Re: [PATCH v3 3/5] tests/acpi: allow changes for core_count2 test
Message-ID: <20221014162252.78e116b8@redhat.com>
In-Reply-To: <20221011111731.101412-4-jusual@redhat.com>
References: <20221011111731.101412-1-jusual@redhat.com>
 <20221011111731.101412-4-jusual@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 11 Oct 2022 13:17:29 +0200
Julia Suvorova <jusual@redhat.com> wrote:

> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Message-Id: <20220731162141.178443-4-jusual@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/data/acpi/q35/APIC.core-count2        | 0
>  tests/data/acpi/q35/DSDT.core-count2        | 0
>  tests/data/acpi/q35/FACP.core-count2        | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  4 files changed, 3 insertions(+)
>  create mode 100644 tests/data/acpi/q35/APIC.core-count2
>  create mode 100644 tests/data/acpi/q35/DSDT.core-count2
>  create mode 100644 tests/data/acpi/q35/FACP.core-count2
> 
> diff --git a/tests/data/acpi/q35/APIC.core-count2 b/tests/data/acpi/q35/APIC.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/DSDT.core-count2 b/tests/data/acpi/q35/DSDT.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/FACP.core-count2 b/tests/data/acpi/q35/FACP.core-count2
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..e81dc67a2e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/APIC.core-count2",
> +"tests/data/acpi/q35/DSDT.core-count2",
> +"tests/data/acpi/q35/FACP.core-count2",


