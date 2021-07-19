Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116E3CDA1B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:14:05 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Uy4-0005ee-M9
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Uwy-0004YF-Ca
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:12:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Uwv-0005YO-Gc
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626707572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wtbWfvg+iZmOCpbSc7DYoiSMxFs5e1QtpNqEuRk688=;
 b=MeYwnuH05ILwA+GZq+vsX/Xc4q4ICUlzI3V16o5r+0/K4iuVwWxtgrovkUQdw4d36t5ff2
 fiXEPOdKLbO3/7bPsTjrEBi/GLLEYO99Aaw9w3HE3VyvHdo3lcEIyV1PpKKCM57TAJnbUd
 6P6o2flI15pu5SmS1+RF4zZ8T0gaLIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-uWDPBGRvNPGyu9gTOCdNHw-1; Mon, 19 Jul 2021 11:12:51 -0400
X-MC-Unique: uWDPBGRvNPGyu9gTOCdNHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1E841835AC2;
 Mon, 19 Jul 2021 15:12:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC44B19C44;
 Mon, 19 Jul 2021 15:12:45 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:12:44 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 02/10] tests: Add tpm_version field to TPMTestState
 and fill it
Message-ID: <20210719171244.156a6b3a@redhat.com>
In-Reply-To: <20210713201545.903754-3-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
 <20210713201545.903754-3-stefanb@linux.vnet.ibm.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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

On Tue, 13 Jul 2021 16:15:37 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v3:
>  - Added enum TPMVersion for when CONFIG_TPM is not defined
> ---
>  tests/qtest/bios-tables-test.c    |  5 +++--
>  tests/qtest/tpm-crb-test.c        |  1 +
>  tests/qtest/tpm-emu.c             | 13 ++++++++++---
>  tests/qtest/tpm-emu.h             |  8 ++++++++
>  tests/qtest/tpm-tis-device-test.c |  1 +
>  tests/qtest/tpm-tis-test.c        |  1 +
>  6 files changed, 24 insertions(+), 5 deletions(-)
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
> index b066ad63fb..610519883a 100644
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
> @@ -26,6 +27,12 @@ struct tpm_hdr {
>      char buffer[];
>  } QEMU_PACKED;
>  
> +#ifndef CONFIG_TPM
> +enum TPMVersion {
> +    TPM_VERSION_2_0 = 2,
> +};
> +#endif
> +
>  typedef struct TPMTestState {
>      GMutex data_mutex;
>      GCond data_cond;
> @@ -34,6 +41,7 @@ typedef struct TPMTestState {
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


