Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BB2F7FBD
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:38:25 +0100 (CET)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RBA-0006Cv-JU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0R9x-0004VL-HY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:37:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1l0R9u-0003gA-I3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610725025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfcFWEUkq1XDvrKtOfvXgBhHwBlztowWw4UTv6iuSJY=;
 b=Uf/AzMjiBF7Cd/OVLoOdJ+GhKpi/wS/n53qKdHydRktTi5dtJBVYZnPqPbaa8Y79BtRUW8
 cU2NQCNTwkmfEj5Ugo9YzlrS2ieRaR+msGhKWp7XALRHGCd2cWzcheFlJ9zAHnoOXbcqOP
 0mxue7yTFCk+//JkFpmC1lIQP3n+kKM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-7_VsT0NsPqC4bV3TWIZRhg-1; Fri, 15 Jan 2021 10:37:02 -0500
X-MC-Unique: 7_VsT0NsPqC4bV3TWIZRhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A667C80A5C0;
 Fri, 15 Jan 2021 15:36:59 +0000 (UTC)
Received: from gondolin (ovpn-114-124.ams2.redhat.com [10.36.114.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1405E5C3E9;
 Fri, 15 Jan 2021 15:36:48 +0000 (UTC)
Date: Fri, 15 Jan 2021 16:36:46 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 09/13] confidential guest support: Update documentation
Message-ID: <20210115163646.2ecdc329.cohuck@redhat.com>
In-Reply-To: <20210113235811.1909610-10-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-10-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, pragyansri.pathi@intel.com, mst@redhat.com,
 mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 10:58:07 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> Now that we've implemented a generic machine option for configuring various
> confidential guest support mechanisms:
>   1. Update docs/amd-memory-encryption.txt to reference this rather than
>      the earlier SEV specific option
>   2. Add a docs/confidential-guest-support.txt to cover the generalities of
>      the confidential guest support scheme
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  docs/amd-memory-encryption.txt      |  2 +-
>  docs/confidential-guest-support.txt | 43 +++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 docs/confidential-guest-support.txt
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 80b8eb00e9..145896aec7 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -73,7 +73,7 @@ complete flow chart.
>  To launch a SEV guest
>  
>  # ${QEMU} \
> -    -machine ...,memory-encryption=sev0 \
> +    -machine ...,confidential-guest-support=sev0 \
>      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
>  
>  Debugging
> diff --git a/docs/confidential-guest-support.txt b/docs/confidential-guest-support.txt
> new file mode 100644
> index 0000000000..2790425b38
> --- /dev/null
> +++ b/docs/confidential-guest-support.txt

Maybe make this a proper .rst from the start and hook this up into the
system guide? It is already almost there.

> @@ -0,0 +1,43 @@
> +Confidential Guest Support
> +==========================
> +
> +Traditionally, hypervisors such as qemu have complete access to a

s/qemu/QEMU/ ?

> +guest's memory and other state, meaning that a compromised hypervisor
> +can compromise any of its guests.  A number of platforms have added
> +mechanisms in hardware and/or firmware which give guests at least some
> +protection from a compromised hypervisor.  This is obviously
> +especially desirable for public cloud environments.
> +
> +These mechanisms have different names and different modes of
> +operation, but are often referred to as Secure Guests or Confidential
> +Guests.  We use the term "Confidential Guest Support" to distinguish
> +this from other aspects of guest security (such as security against
> +attacks from other guests, or from network sources).
> +
> +Running a Confidential Guest
> +----------------------------
> +
> +To run a confidential guest you need to add two command line parameters:
> +
> +1. Use "-object" to create a "confidential guest support" object.  The
> +   type and parameters will vary with the specific mechanism to be
> +   used
> +2. Set the "confidential-guest-support" machine parameter to the ID of
> +   the object from (1).
> +
> +Example (for AMD SEV)::
> +
> +    qemu-system-x86_64 \
> +        <other parameters> \
> +        -machine ...,confidential-guest-support=sev0 \
> +        -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
> +
> +Supported mechanisms
> +--------------------
> +
> +Currently supported confidential guest mechanisms are:
> +
> +AMD Secure Encrypted Virtualization (SEV)
> +    docs/amd-memory-encryption.txt
> +
> +Other mechanisms may be supported in future.

LGTM.


