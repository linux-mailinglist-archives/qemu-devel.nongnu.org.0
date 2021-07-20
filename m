Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE24A3CFA80
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:26:45 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5plk-0003ZX-PP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pkF-0002CM-QN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:25:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pkE-0007YR-2P
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626787509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AK2dWVvP2d+Ov6ILZt7D1jCEKZE5uO0WdGX9/iXUNdk=;
 b=HDPjFy299oo23B9AlCc32xstknTdFbTNfXjBse+SpgiPJ1nhl1dQTZPZYzp3dh9B6W5VaZ
 pOh1mSNtm2/FbAy9hU9qlx4gpbGNiC8HW3vobVfs1KLxm3/V5pt3vpPSBsDbi0TpgVupYx
 K/UDst9UB9/7vkbP5yxF0i1W34BqOwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585--Ri2FnBDO02naELbS9Ya7w-1; Tue, 20 Jul 2021 09:25:08 -0400
X-MC-Unique: -Ri2FnBDO02naELbS9Ya7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1BA0192297A;
 Tue, 20 Jul 2021 13:25:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC21660BD8;
 Tue, 20 Jul 2021 13:25:00 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:24:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 10/10] ACPI ERST: step 6 of bios-tables-test.c
Message-ID: <20210720152459.050b229d@redhat.com>
In-Reply-To: <1625080041-29010-11-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-11-git-send-email-eric.devolder@oracle.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 15:07:21 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> Following the guidelines in tests/qtest/bios-tables-test.c, this
> is step 6, the re-generated ACPI tables binary blobs.

looks like test case itself got lost somewhere along the way.
 
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  tests/data/acpi/microvm/ERST                | Bin 0 -> 976 bytes
>  tests/data/acpi/pc/ERST                     | Bin 0 -> 976 bytes
>  tests/data/acpi/q35/ERST                    | Bin 0 -> 976 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>  4 files changed, 4 deletions(-)
> 
> diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..db2adaa8d9b45e295f9976d6bb5a07a813214f52 100644
> GIT binary patch
> literal 976
> zcmaKqTMmLS5Jd+l50TdfOjv?(1qNf{pGN#}aW2XoVQ=kJawAMa;r8^<4tl<ik9Q&x
> z9fs@aGWNsscIs_KB7$e!_x3{VFxa)yyAdhW<ewtq@KMTR;_(*;o)AYwsc#_I{R=ny
> z8zx&whJ53fsGoYS{%e8zX-SD^^!|)F8lIhx`_IYG$#;3?dmQ>N$k#r!KbMbUbUyg_
> zK(;pcerufGzoGM$#7pML|ITms2HKLp#iT7ge?`3d;=pU-HFM;Z{u=Td@?Bo=v9u+>
> bCEw+h{yXwJ@?BooAHQFxe`xQi@1uMGuJKX<
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
> GIT binary patch
> literal 976
> zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
> z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
> z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
> z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ  
> c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..7236018951f9d111d8cacaa93ee07a8dc3294f18 100644
> GIT binary patch
> literal 976
> zcmaKqSq_3Q6h#Y^dE9^rOK=GWV&b1h{BUvZ#VzQD#NN_}<VJW2!{zj}Jj(Gp++KlF
> z-m^RRr=jicm%cUSDW!0a>)srw9ZqJfYH@yl5T!<U;}M6C67CcCCp`0jI3h}X4Z*CR
> z@cQFuhiLM(wSRu-xcHA1F8zhXBbq;Aj)oWS$Nk6T$K>0*@ExA}PsmTmxA~y7^f&wF
> z`=C;Mzb#Jlr!;>?JY$ah@BPi%Ksot29-5N<Er=Hro_R^UWRASiUqyaJzRfE>hSucQ  
> c<lDT_e?xvlzRfG^WB(fYq22#4zMDpU0r#ed0RR91
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index e004c71..dfb8523 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,5 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/pc/ERST",
> -"tests/data/acpi/q35/ERST",
> -"tests/data/acpi/microvm/ERST",
> -


