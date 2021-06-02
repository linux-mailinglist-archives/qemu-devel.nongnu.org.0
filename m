Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC23986F2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 12:50:29 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOSC-0007hx-6H
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 06:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOQI-0006AT-DQ
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:48:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1loOQF-0004dP-OM
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 06:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622630903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8NdQzGnZDRiLahWvwdf8ZSiUbx5HhAiSq6gIDG+UBMY=;
 b=IEFhq+rCqM5PRJKJRpt30fsOLHmG6ev8SLRtcmL9Zibu25N3ur67T4xbLVUaRR9mq1hy1S
 K8h0IqbfBiV6KQjOSwKlnT2HmQxPobjcQL3BcsJuipk9qaeE+jNGFlhJfrAOmTbKR8t42P
 cEfqldd2kbkgilaAEq90avSAHo+d2EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-TNnKMeGRO-y9QN7DB-DBNA-1; Wed, 02 Jun 2021 06:48:22 -0400
X-MC-Unique: TNnKMeGRO-y9QN7DB-DBNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4EBE801ADA;
 Wed,  2 Jun 2021 10:48:20 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35ECD1B49E;
 Wed,  2 Jun 2021 10:48:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [RFC v4 14/14] MAINTAINERS: update s390x directories
In-Reply-To: <20210524025256.22252-14-acho@suse.com>
Organization: Red Hat GmbH
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-14-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 02 Jun 2021 12:48:15 +0200
Message-ID: <87pmx4pmog.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, cfontana@suse.de,
 pbonzini@redhat.com, acho@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directories:
>
> target/s390x/kvm/
> target/s390x/tcg/
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  MAINTAINERS | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 89741cfc19..8578927961 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -293,7 +293,7 @@ S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
>  S: Maintained
> -F: target/s390x/
> +F: target/s390x/tcg
>  F: hw/s390x/
>  F: disas/s390.c
>  F: tests/tcg/s390x/
> @@ -389,14 +389,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
>  M: Cornelia Huck <cohuck@redhat.com>
>  M: Christian Borntraeger <borntraeger@de.ibm.com>
>  S: Supported
> -F: target/s390x/kvm.c
> -F: target/s390x/kvm_s390x.h
> -F: target/s390x/kvm-stub.c
> +F: target/s390x/kvm/
>  F: target/s390x/ioinst.[ch]
>  F: target/s390x/machine.c
>  F: target/s390x/sigp.c
>  F: target/s390x/cpu_features*.[ch]
> -F: target/s390x/cpu_models.[ch]
> +F: target/s390x/cpu_models*.[ch]

Having the cpu model stuff in the kvm section only is wrong (it was
covered for tcg by the previous pattern); add it explicitly to the tcg section?

>  F: hw/s390x/pv.c
>  F: include/hw/s390x/pv.h
>  F: hw/intc/s390_flic.c


