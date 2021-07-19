Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84393CDA3D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:17:19 +0200 (CEST)
Received: from localhost ([::1]:39486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5V1C-0001Ln-Oz
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Uxf-0005Y0-Fn
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5Uxd-00061V-AI
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626707616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8tUiJanYMpWyugBpTF1DGv5Ui2+ntAxANnEaz/UZIg=;
 b=KAl968uIuuB1QEuyDWgnUfXJ+prgE6kooCy7o2pkQ8jdcg79TPGB3K8o+6p+seo3KKbKys
 gHQ3sbOyt5vgXtQjdC0IVXHUJtE6kIKL82hdyj5/+x/Q4+JZyg8CcOBgPtxwF9RgqIkxzE
 sdp0BmVv4HNxZVAtI3DDRacbafUjYEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-YqPHqMA8PTmnfHV85QmUGg-1; Mon, 19 Jul 2021 11:13:34 -0400
X-MC-Unique: YqPHqMA8PTmnfHV85QmUGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C14C6A40C0;
 Mon, 19 Jul 2021 15:13:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEF0460CCC;
 Mon, 19 Jul 2021 15:13:28 +0000 (UTC)
Date: Mon, 19 Jul 2021 17:13:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 06/10] tests: tpm: Create TPM 1.2 response in TPM
 emulator
Message-ID: <20210719171327.7705022e@redhat.com>
In-Reply-To: <20210713201545.903754-7-stefanb@linux.vnet.ibm.com>
References: <20210713201545.903754-1-stefanb@linux.vnet.ibm.com>
 <20210713201545.903754-7-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, 13 Jul 2021 16:15:41 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> ---
> v3:
>   - Added TPM_VERSION_1_2 enum for when CONFIG_TPM is not defined
> ---
>  tests/qtest/tpm-emu.c | 5 +++++
>  tests/qtest/tpm-emu.h | 4 ++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
> index 8baf49eafd..32c704194b 100644
> --- a/tests/qtest/tpm-emu.c
> +++ b/tests/qtest/tpm-emu.c
> @@ -62,6 +62,11 @@ static void *tpm_emu_tpm_thread(void *data)
>              s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
>              s->tpm_msg->code = cpu_to_be32(TPM_RC_FAILURE);
>              break;
> +        case TPM_VERSION_1_2:
> +            s->tpm_msg->tag = cpu_to_be16(TPM_TAG_RSP_COMMAND);
> +            s->tpm_msg->len = cpu_to_be32(sizeof(struct tpm_hdr));
> +            s->tpm_msg->code = cpu_to_be32(TPM_FAIL);
> +            break;
>          default:
>              g_debug("unsupport TPM version %u", s->tpm_version);
>              g_assert_not_reached();
> diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
> index 610519883a..fcb5d7a1d6 100644
> --- a/tests/qtest/tpm-emu.h
> +++ b/tests/qtest/tpm-emu.h
> @@ -16,6 +16,9 @@
>  #define TPM_RC_FAILURE 0x101
>  #define TPM2_ST_NO_SESSIONS 0x8001
>  
> +#define TPM_FAIL 9
> +#define TPM_TAG_RSP_COMMAND 0xc4
> +
>  #include "qemu/sockets.h"
>  #include "io/channel.h"
>  #include "sysemu/tpm.h"
> @@ -29,6 +32,7 @@ struct tpm_hdr {
>  
>  #ifndef CONFIG_TPM
>  enum TPMVersion {
> +    TPM_VERSION_1_2 = 1,
>      TPM_VERSION_2_0 = 2,
>  };
>  #endif


