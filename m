Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3A3C1662
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:16 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WH5-0004p1-Rm
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Vo8-0003Uh-O7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1Vo6-00008r-Lo
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625757557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QaBUHUzXIdQYY5hjaKFVbdzM++G1KWBNfnPDBdkeKMI=;
 b=RSAcV29YL8maqy0wykVGlzLB2kfxNbH8oyGOktwFlVC/8qSYkPDQu5n/CiA/3NNPayBl2o
 22mBAfFRUBeqapzURgeLRt8uMPfmu8oduZtxBaOwXWsO5O4xBx2YtkttFqJ3YrE3ZQ/lxY
 rSJvpLyH9yGNe29Av8+5IEryohOf+kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-JH4iZLbaN46hsefBJySfkg-1; Thu, 08 Jul 2021 11:19:16 -0400
X-MC-Unique: JH4iZLbaN46hsefBJySfkg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC6F92501;
 Thu,  8 Jul 2021 15:19:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB976E71B;
 Thu,  8 Jul 2021 15:19:10 +0000 (UTC)
Date: Thu, 8 Jul 2021 17:19:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/7] test: tpm: Create TPM 1.2 response in TPM emulator
Message-ID: <20210708171909.4d1de74e@redhat.com>
In-Reply-To: <20210630153723.672473-5-stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-5-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 11:37:20 -0400
Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/tpm-emu.c | 5 +++++
>  tests/qtest/tpm-emu.h | 3 +++
>  2 files changed, 8 insertions(+)
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
> index f7b1e3c6ab..b5354ea101 100644
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


