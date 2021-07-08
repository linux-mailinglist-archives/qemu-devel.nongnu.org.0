Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4FA3C1527
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:26:56 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UzP-0000cJ-KC
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Ux1-0006gW-4c
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Uwz-0006bF-92
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625754264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpszfwnPplZaXYQGicedbJhwI6pALSM92zIg15qo7+c=;
 b=jCqfOhRaYgZuS/ufhfVDyIYqtUqODD7lvW8JV1NE05va8EBmInDihqbXaHAuL5hymCth9E
 N27AXHjY4u1GDsgYg/ZcBQfFIAZ7nvVN5tNdmkScVOKLwEJC7C9bDI1GJUxPl/G07dUN5X
 NRlhMx1mR4075R4NErUROE1N4trmXpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-v8P48uhhO_Kh_f3iIGhoeQ-1; Thu, 08 Jul 2021 10:24:22 -0400
X-MC-Unique: v8P48uhhO_Kh_f3iIGhoeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B1AD802923;
 Thu,  8 Jul 2021 14:24:21 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7CEE2FA;
 Thu,  8 Jul 2021 14:24:16 +0000 (UTC)
Date: Thu, 8 Jul 2021 16:24:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/7] tests: Add tpm_version field to TPMTestState and
 fill it
Message-ID: <20210708162415.297bf975@redhat.com>
In-Reply-To: <20210630153723.672473-3-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-3-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 11:37:18 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c    |  5 +++--
>  tests/qtest/tpm-crb-test.c        |  1 +
>  tests/qtest/tpm-emu.c             | 13 ++++++++++---
>  tests/qtest/tpm-emu.h             |  2 ++
>  tests/qtest/tpm-tis-device-test.c |  1 +
>  tests/qtest/tpm-tis-test.c        |  1 +
>  6 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index a622f91a37..93c9d306b5 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1092,7 +1092,7 @@ static void test_acpi_piix4_tcg_numamem(void)
>  uint64_t tpm_tis_base_addr;
>  
>  static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
> -                              uint64_t base)
> +                              uint64_t base, enum TPMVersion tpm_version)
>  {
>  #ifdef CONFIG_TPM
>      gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
> @@ -1113,6 +1113,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      g_mutex_init(&test.data_mutex);
>      g_cond_init(&test.data_cond);
>      test.data_cond_signal = false;
> +    test.tpm_version = tpm_version;
>  
>      thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
>      tpm_emu_test_wait_cond(&test);
> @@ -1145,7 +1146,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>  
>  static void test_acpi_q35_tcg_tpm_tis(void)
>  {
> -    test_acpi_tcg_tpm("q35", "tis", 0xFED40000);
> +    test_acpi_tcg_tpm("q35", "tis", 0xFED40000, TPM_VERSION_2_0);
>  }
>  
>  static void test_acpi_tcg_dimm_pxm(const char *machine)
> diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
> index 50936f1482..7b94453390 100644
> --- a/tests/qtest/tpm-crb-test.c
> +++ b/tests/qtest/tpm-crb-test.c
> @@ -156,6 +156,7 @@ int main(int argc, char **argv)
>      g_mutex_init(&test.data_mutex);
>      g_cond_init(&test.data_cond);
>      test.data_cond_signal = false;
> +    test.tpm_version = TPM_VERSION_2_0;
>  
>      thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
>      tpm_emu_test_wait_cond(&test);
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index b9cddcc240..8baf49eafd 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -56,9 +56,16 @@ static void *tpm_emu_tpm_thread(void *data)
>          s->tpm_msg->code = be32_to_cpu(s->tpm_msg->code);
>  
>          /* reply error */
> -        s->tpm_msg->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
> -        s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
> -        s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
> +        switch (s->tpm_version) {
> +        case TPM_VERSION_2_0:
> +            s->tpm_msg->tag = cpu_to_be16(TPM2_ST_NO_SESSIONS);
> +            s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
> +            s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
> +            break;
> +        default:
> +            g_debug("unsupport TPM version %u", s->tpm_version);
> +            g_assert_not_reached();
> +        }
>          qio_channel_write(ioc, (char *)s->tpm_msg, be32_to_cpu(s->tpm_msg->len),
>                            &error_abort);
>      }
> diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
> index b066ad63fb..f7b1e3c6ab 100644
> --- a/tests/qtest/tpm-emu.h
> +++ b/tests/qtest/tpm-emu.h
> @@ -18,6 +18,7 @@
>  
>  #include "qemu/sockets.h"
>  #include "io/channel.h"
> +#include "sysemu/tpm.h"
>  
>  struct tpm_hdr {
>      uint16_t tag;
> @@ -34,6 +35,7 @@ typedef struct TPMTestState {
>      QIOChannel *tpm_ioc;
>      GThread *emu_tpm_thread;
>      struct tpm_hdr *tpm_msg;
> +    enum TPMVersion tpm_version;
>  } TPMTestState;
>  
>  void tpm_emu_test_wait_cond(TPMTestState *s);
> diff --git a/tests/qtest/tpm-tis-device-test.c b/tests/qtest/tpm-tis-device-test.c
> index d36ae20243..3ddefb51ec 100644
> --- a/tests/qtest/tpm-tis-device-test.c
> +++ b/tests/qtest/tpm-tis-device-test.c
> @@ -46,6 +46,7 @@ int main(int argc, char **argv)
>      g_mutex_init(&test.data_mutex);
>      g_cond_init(&test.data_cond);
>      test.data_cond_signal = false;
> +    test.tpm_version = TPM_VERSION_2_0;
>  
>      thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
>      tpm_emu_test_wait_cond(&test);
> diff --git a/tests/qtest/tpm-tis-test.c b/tests/qtest/tpm-tis-test.c
> index 6fee4779ea..a4a25ba745 100644
> --- a/tests/qtest/tpm-tis-test.c
> +++ b/tests/qtest/tpm-tis-test.c
> @@ -40,6 +40,7 @@ int main(int argc, char **argv)
>      g_mutex_init(&test.data_mutex);
>      g_cond_init(&test.data_cond);
>      test.data_cond_signal = false;
> +    test.tpm_version = TPM_VERSION_2_0;
>  
>      thread = g_thread_new(NULL, tpm_emu_ctrl_thread, &test);
>      tpm_emu_test_wait_cond(&test);


