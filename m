Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0193C151D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:24:40 +0200 (CEST)
Received: from localhost ([::1]:52316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UxD-0006R0-ON
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1UwQ-0005g2-4V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:23:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1UwM-0006Pp-Ae
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625754224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPzKepcjDbpfIcM9YWsHrNVzX1CKNyJj4Ig+YjZdswE=;
 b=RmgafDmuF51oOZbh/EOk05OKUDM6UAY1KIVzLOiA7IAdHORRjXWR0vP1IOwXbskN//S1Ls
 ALi8vj5gV7Gcda4p+7Xpbes4noZTQRC5QNZ7aAjUojcrqKrWW5DLTrCDEJIT6OF2APQoBO
 oHKwYCixXr4Hu30iSZU6Znhq8o47BrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-ChAXZqe8OIW7RPLdvETGEw-1; Thu, 08 Jul 2021 10:23:43 -0400
X-MC-Unique: ChAXZqe8OIW7RPLdvETGEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D527E824F88;
 Thu,  8 Jul 2021 14:23:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 431A060843;
 Thu,  8 Jul 2021 14:23:38 +0000 (UTC)
Date: Thu, 8 Jul 2021 16:23:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/7] tests: Rename TestState to TPMTestState
Message-ID: <20210708162337.1dfa43b4@redhat.com>
In-Reply-To: <20210630153723.672473-2-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-2-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Wed, 30 Jun 2021 11:37:17 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c    | 2 +-
>  tests/qtest/tpm-crb-test.c        | 4 ++--
>  tests/qtest/tpm-emu.c             | 6 +++---
>  tests/qtest/tpm-emu.h             | 6 +++---
>  tests/qtest/tpm-tis-device-test.c | 2 +-
>  tests/qtest/tpm-tis-test.c        | 2 +-
>  tests/qtest/tpm-tis-util.c        | 2 +-
>  7 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 51d3a4e239..a622f91a37 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1098,7 +1098,7 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                            machine, tpm_if);
>      char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> -    TestState test;
> +    TPMTestState test;
>      test_data data;
>      GThread *thread;
>      char *args, *variant = g_strdup_printf(".%s", tpm_if);
> diff --git a/tests/qtest/tpm-crb-test.c b/tests/qtest/tpm-crb-test.c
> index ed533900d1..50936f1482 100644
> --- a/tests/qtest/tpm-crb-test.c
> +++ b/tests/qtest/tpm-crb-test.c
> @@ -26,7 +26,7 @@ uint64_t tpm_tis_base_addr = TPM_TIS_ADDR_BASE;
>  
>  static void tpm_crb_test(const void *data)
>  {
> -    const TestState *s = data;
> +    const TPMTestState *s = data;
>      uint32_t intfid = readl(TPM_CRB_ADDR_BASE + A_CRB_INTF_ID);
>      uint32_t csize = readl(TPM_CRB_ADDR_BASE + A_CRB_CTRL_CMD_SIZE);
>      uint64_t caddr = readq(TPM_CRB_ADDR_BASE + A_CRB_CTRL_CMD_LADDR);
> @@ -145,7 +145,7 @@ int main(int argc, char **argv)
>      int ret;
>      char *args, *tmp_path = g_dir_make_tmp("qemu-tpm-crb-test.XXXXXX", NULL);
>      GThread *thread;
> -    TestState test;
> +    TPMTestState test;
>  
>      module_call_init(MODULE_INIT_QOM);
>      g_test_init(&argc, &argv, NULL);
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 2e8eb7b94f..b9cddcc240 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -18,7 +18,7 @@
>  #include "qapi/error.h"
>  #include "tpm-emu.h"
>  
> -void tpm_emu_test_wait_cond(TestState *s)
> +void tpm_emu_test_wait_cond(TPMTestState *s)
>  {
>      gint64 end_time = g_get_monotonic_time() + 5 * G_TIME_SPAN_SECOND;
>  
> @@ -36,7 +36,7 @@ void tpm_emu_test_wait_cond(TestState *s)
>  
>  static void *tpm_emu_tpm_thread(void *data)
>  {
> -    TestState *s = data;
> +    TPMTestState *s = data;
>      QIOChannel *ioc = s->tpm_ioc;
>  
>      s->tpm_msg = g_new(struct tpm_hdr, 1);
> @@ -71,7 +71,7 @@ static void *tpm_emu_tpm_thread(void *data)
>  
>  void *tpm_emu_ctrl_thread(void *data)
>  {
> -    TestState *s = data;
> +    TPMTestState *s = data;
>      QIOChannelSocket *lioc = qio_channel_socket_new();
>      QIOChannel *ioc;
>  
> diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
> index 73f3bed0c4..b066ad63fb 100644
> --- a/tests/qtest/tpm-emu.h
> +++ b/tests/qtest/tpm-emu.h
> @@ -26,7 +26,7 @@ struct tpm_hdr {
>      char buffer[];
>  } QEMU_PACKED;
>  
> -typedef struct TestState {
> +typedef struct TPMTestState {
>      GMutex data_mutex;
>      GCond data_cond;
>      bool data_cond_signal;
> @@ -34,9 +34,9 @@ typedef struct TestState {
>      QIOChannel *tpm_ioc;
>      GThread *emu_tpm_thread;
>      struct tpm_hdr *tpm_msg;
> -} TestState;
> +} TPMTestState;
>  
> -void tpm_emu_test_wait_cond(TestState *s);
> +void tpm_emu_test_wait_cond(TPMTestState *s);
>  void *tpm_emu_ctrl_thread(void *data);
>  
>  #endif /* TESTS_TPM_EMU_H */
> diff --git a/tests/qtest/tpm-tis-device-test.c b/tests/qtest/tpm-tis-device-test.c
> index 63ed36440f..d36ae20243 100644
> --- a/tests/qtest/tpm-tis-device-test.c
> +++ b/tests/qtest/tpm-tis-device-test.c
> @@ -33,7 +33,7 @@ int main(int argc, char **argv)
>  {
>      char *tmp_path = g_dir_make_tmp("qemu-tpm-tis-device-test.XXXXXX", NULL);
>      GThread *thread;
> -    TestState test;
> +    TPMTestState test;
>      char *args;
>      int ret;
>  
> diff --git a/tests/qtest/tpm-tis-test.c b/tests/qtest/tpm-tis-test.c
> index 79ffbc943e..6fee4779ea 100644
> --- a/tests/qtest/tpm-tis-test.c
> +++ b/tests/qtest/tpm-tis-test.c
> @@ -29,7 +29,7 @@ int main(int argc, char **argv)
>      int ret;
>      char *args, *tmp_path = g_dir_make_tmp("qemu-tpm-tis-test.XXXXXX", NULL);
>      GThread *thread;
> -    TestState test;
> +    TPMTestState test;
>  
>      module_call_init(MODULE_INIT_QOM);
>      g_test_init(&argc, &argv, NULL);
> diff --git a/tests/qtest/tpm-tis-util.c b/tests/qtest/tpm-tis-util.c
> index 9aff503fd8..939893bf01 100644
> --- a/tests/qtest/tpm-tis-util.c
> +++ b/tests/qtest/tpm-tis-util.c
> @@ -373,7 +373,7 @@ void tpm_tis_test_check_access_reg_release(const void *data)
>   */
>  void tpm_tis_test_check_transmit(const void *data)
>  {
> -    const TestState *s = data;
> +    const TPMTestState *s = data;
>      uint8_t access;
>      uint32_t sts;
>      uint16_t bcount;


