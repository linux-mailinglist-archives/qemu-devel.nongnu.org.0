Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A9A3C212B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:04:40 +0200 (CEST)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mR5-0004Rs-Qu
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mOi-0000gt-Te
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1mOh-0000Gt-8m
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 05:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625821330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lwznl2+0alTNTdKntC/Kz8I/URgjnGy0Mv076sHxOoE=;
 b=DWdjDWUzYiui186jVQNg/n33YTU3OeZttnNhwx0KTWJ6j5HrWqoTmGJdpIzDC0ykG7tTtf
 pj0kfNAxtqIQQh4V0frwMXoXWLn29G/xSivqiB3GCZuDXDOBfCKMQXsbm2ZFGZpwLTEbm6
 y/j0/Fdx3Ucx7kyumw9Im+a7T5l/HtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-Q0vXK9ZkPVCORgaVCbuvHA-1; Fri, 09 Jul 2021 05:02:09 -0400
X-MC-Unique: Q0vXK9ZkPVCORgaVCbuvHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5002F81C878;
 Fri,  9 Jul 2021 09:02:02 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B0F92C00F;
 Fri,  9 Jul 2021 09:02:00 +0000 (UTC)
Date: Fri, 9 Jul 2021 11:01:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 4/9] tests: Add suffix 'tpm2' or 'tpm12' to ACPI
 table files
Message-ID: <20210709110159.6b191dd4@redhat.com>
In-Reply-To: <20210708183814.925960-5-stefanb@linux.vnet.ibm.com>
References: <20210708183814.925960-1-stefanb@linux.vnet.ibm.com>
 <20210708183814.925960-5-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>,
 philmd@redhat.com, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  8 Jul 2021 14:38:09 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 93c9d306b5..4ccbe56158 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1101,7 +1101,8 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      TPMTestState test;
>      test_data data;
>      GThread *thread;
> -    char *args, *variant = g_strdup_printf(".%s", tpm_if);
> +    const char *suffix = tpm_version == TPM_VERSION_2_0 ? "tpm2" : "tpm12";
> +    char *args, *variant = g_strdup_printf(".%s.%s", tpm_if, suffix);
>  
>      tpm_tis_base_addr = base;
>  


