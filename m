Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014F936C844
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:05:43 +0200 (CEST)
Received: from localhost ([::1]:39178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPHR-0006lj-Ut
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbPDF-0004pc-Fc
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbPCy-0006CP-BC
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VqcvrAEs6c5OV4XIlqt8yB/bZvtJwYg/x378QAXSWrs=;
 b=HVmX9zxCvO1mxXGpjoTdyyEwzW6pL8D48nQklcFezqxhkGigE2rkURG6hNsKyNRR7NX96a
 WYNcPnB+ZAFqsRcJ16ZG06SFEO/oeuxBLf25EZKPr8U3aEZs/FhC1bq1/+TAgJuA7kk2GX
 rjbqzC54yPBok2H4KUZGGtaM2ntDdNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Pi-6u3IrNku7f1YvBUZrqw-1; Tue, 27 Apr 2021 11:00:58 -0400
X-MC-Unique: Pi-6u3IrNku7f1YvBUZrqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BDC4107ACED;
 Tue, 27 Apr 2021 15:00:55 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-176.ams2.redhat.com
 [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76FD35C260;
 Tue, 27 Apr 2021 15:00:50 +0000 (UTC)
Date: Tue, 27 Apr 2021 17:00:47 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v3 13/13] MAINTAINERS: update s390x directories
Message-ID: <20210427170047.2cf0d6c0.cohuck@redhat.com>
In-Reply-To: <20210422115430.15078-14-cfontana@suse.de>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-14-cfontana@suse.de>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Apr 2021 13:54:30 +0200
Claudio Fontana <cfontana@suse.de> wrote:

> After the reshuffling, update MAINTAINERS accordingly.
> Make use of the new directories:
> 
> target/s390x/kvm/
> target/s390x/tcg/

Is there anything left in target/s390x/ that is neither in kvm/ nor in
tcg/? It seems that will only be covered by the general s390
maintainers entry.

> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  MAINTAINERS | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7de873c9f5..3d738bd4fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -315,7 +315,7 @@ S390 TCG CPUs
>  M: Richard Henderson <richard.henderson@linaro.org>
>  M: David Hildenbrand <david@redhat.com>
>  S: Maintained
> -F: target/s390x/
> +F: target/s390x/tcg
>  F: hw/s390x/

Unrelated: I'm wondering how much sense it makes to have the whole of
hw/s390x/ under the tcg section... but if the maintainers are not
complaining, I'm happy to leave it there :)

>  F: disas/s390.c
>  F: tests/tcg/s390x/
> @@ -417,14 +417,12 @@ M: Halil Pasic <pasic@linux.ibm.com>
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
>  F: hw/s390x/pv.c
>  F: include/hw/s390x/pv.h
>  F: hw/intc/s390_flic.c


