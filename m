Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742FD2DAC58
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 12:49:57 +0100 (CET)
Received: from localhost ([::1]:58200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp8q4-0008HH-Ef
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 06:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kp8m7-0004pI-Bq
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:45:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kp8m5-0000BR-FO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 06:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608032748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldS1J7wGI5856oRlyFwiQvFcG4BV7UZaA4YAKir6cWo=;
 b=fhjLoBq9DQTXhecOH+BAY6+rObD0sAiI+rgTYcz9R/sEkisNMPjR2BqMxKgidoEQJ1WnMo
 pk9aPI119N38w5MXXL6Ke456QeGtSbsIfDqXDzKzuFannkVVwYGLEBjdri0qO95cLNJQX0
 vEIMcP0/U3yp3WJ63B7jZ4XXoVo6tSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-r2-c6gfyPh-q2Lyxb7nHrw-1; Tue, 15 Dec 2020 06:45:44 -0500
X-MC-Unique: r2-c6gfyPh-q2Lyxb7nHrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 781A510054FF;
 Tue, 15 Dec 2020 11:45:42 +0000 (UTC)
Received: from gondolin (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCC9D5D9CA;
 Tue, 15 Dec 2020 11:45:29 +0000 (UTC)
Date: Tue, 15 Dec 2020 12:45:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 13/13] s390: Recognize securable-guest-memory option
Message-ID: <20201215124526.7c33dc8d.cohuck@redhat.com>
In-Reply-To: <20201204054415.579042-14-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-14-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri,  4 Dec 2020 16:44:15 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> At least some s390 cpu models support "Protected Virtualization" (PV),
> a mechanism to protect guests from eavesdropping by a compromised
> hypervisor.
> 
> This is similar in function to other mechanisms like AMD's SEV and
> POWER's PEF, which are controlled bythe "securable-guest-memory" machine

s/bythe/by the/

> option.  s390 is a slightly special case, because we already supported
> PV, simply by using a CPU model with the required feature
> (S390_FEAT_UNPACK).
> 
> To integrate this with the option used by other platforms, we
> implement the following compromise:
> 
>  - When the securable-guest-memory option is set, s390 will recognize it,
>    verify that the CPU can support PV (failing if not) and set virtio
>    default options necessary for encrypted or protected guests, as on
>    other platforms.  i.e. if securable-guest-memory is set, we will
>    either create a guest capable of entering PV mode, or fail outright

s/outright/outright./

> 
>  - If securable-guest-memory is not set, guest's might still be able to

s/guest's/guests/

>    enter PV mode, if the CPU has the right model.  This may be a
>    little surprising, but shouldn't actually be harmful.
> 
> To start a guest supporting Protected Virtualization using the new
> option use the command line arguments:
>     -object s390-pv-guest,id=pv0 -machine securable-guest-memory=pv0
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/s390x/pv.c         | 58 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/s390x/pv.h |  1 +
>  target/s390x/kvm.c    |  3 +++
>  3 files changed, 62 insertions(+)
> 

Modulo any naming changes etc., I think this should work for s390. I
don't have the hardware to test this, however, and would appreciate
someone with a PV setup giving this a go.


