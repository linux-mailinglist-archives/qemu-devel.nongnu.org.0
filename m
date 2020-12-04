Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EAA2CEEA7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:11:46 +0100 (CET)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAsD-0004dM-Fy
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAqv-0003y1-Ko
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:10:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAqu-0003km-8k
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607087423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HmMQeMwJr/sXBh2GvU9XsEsWuFtoMDgEB5xcDGiFpiA=;
 b=EOcU0MahvhChz9STrHWEKVLj/DaECMvZGcYilHfZ6eguEUDWAkVLkH+0q8KOqR4P04hU8t
 CYuHH7JHHUjuDhLKL/sKaTtmcYBCT95I2G9MO/gO34+ZcGUmXxcNQwgagS+dTfTYAnL/3v
 qR8k0bKGYQQVGZSr8HDsdVaebJV+eQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-YOPC6lTlPq-EuqvpJug2lg-1; Fri, 04 Dec 2020 08:10:20 -0500
X-MC-Unique: YOPC6lTlPq-EuqvpJug2lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2230A18C89C4;
 Fri,  4 Dec 2020 13:10:18 +0000 (UTC)
Received: from gondolin (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A315C1D1;
 Fri,  4 Dec 2020 13:10:07 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:10:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 03/13] securable guest memory: Handle memory
 encryption via interface
Message-ID: <20201204141005.07bf61dd.cohuck@redhat.com>
In-Reply-To: <20201204054415.579042-4-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-4-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, frankja@linux.ibm.com,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, david@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, berrange@redhat.com,
 thuth@redhat.com, pbonzini@redhat.com, rth@twiddle.net,
 mdroth@linux.vnet.ibm.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Dec 2020 16:44:05 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> At the moment AMD SEV sets a special function pointer, plus an opaque
> handle in KVMState to let things know how to encrypt guest memory.
> 
> Now that we have a QOM interface for handling things related to securable
> guest memory, use a QOM method on that interface, rather than a bare
> function pointer for this.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/kvm/kvm-all.c                   |  36 +++++---
>  accel/kvm/sev-stub.c                  |   9 +-
>  include/exec/securable-guest-memory.h |   2 +
>  include/sysemu/sev.h                  |   5 +-
>  target/i386/monitor.c                 |   1 -
>  target/i386/sev.c                     | 116 ++++++++++----------------
>  6 files changed, 77 insertions(+), 92 deletions(-)
> 

> @@ -224,7 +224,7 @@ int kvm_get_max_memslots(void)
>  
>  bool kvm_memcrypt_enabled(void)
>  {
> -    if (kvm_state && kvm_state->memcrypt_handle) {
> +    if (kvm_state && kvm_state->sgm) {

If we want to generalize the concept, maybe check for encrypt_data in
sgm here? There's probably room for different callbacks in the sgm
structure.

>          return true;
>      }
>  


