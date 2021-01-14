Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B22F5E59
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 11:09:22 +0100 (CET)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzzZA-0005s1-Ls
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 05:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kzzXS-00043a-Py; Thu, 14 Jan 2021 05:07:34 -0500
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:45972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1kzzXR-0004vD-2O; Thu, 14 Jan 2021 05:07:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id AD25625A6C9;
 Thu, 14 Jan 2021 11:07:28 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 14 Jan
 2021 11:07:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a3ce3b89-2be7-4dd6-a28b-2751e61105ee,
 0A7C53367AF3A9CD096E542ECC3C8B2C2D100868) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Thu, 14 Jan 2021 11:07:26 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 09/13] confidential guest support: Update documentation
Message-ID: <20210114110726.189ee7fa@bahia.lan>
In-Reply-To: <20210113235811.1909610-10-david@gibson.dropbear.id.au>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-10-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 482ab6a6-6e0e-4269-8191-07b76130d318
X-Ovh-Tracer-Id: 1720375058512583068
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdehgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhguihdrkhhlvggvnhesihhnthgvlhdrtghomh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=groug@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 andi.kleen@intel.com, thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

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
> @@ -0,0 +1,43 @@
> +Confidential Guest Support
> +==========================
> +
> +Traditionally, hypervisors such as qemu have complete access to a
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


