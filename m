Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3D20AF5E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 12:02:29 +0200 (CEST)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jolBe-00050F-LY
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 06:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jolAo-0004Yc-86
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:01:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29719
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jolAi-0004Gf-Bn
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 06:01:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593165683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OkD/7wMaEqAvzVGCze1pah8rlti7qzM6xVJG80Ekvys=;
 b=GKGUq0YDkQ3+4doxSZETg2uSdnKUaqM49bJ5X9zu0n0JH8kzn/lTLajWshqrAAdRFSkltC
 cKA6O/a3zve7EDVBgBTU1b+OUIqzYiNkPw0m3FwsjfX6Crdf1e0PszVLXHIDjjxz+efmH/
 mgY1uUaq/+NiMnC+Io2Bdzet9tSNuF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-pZD2GmdLPs6g0uSdXc6n_Q-1; Fri, 26 Jun 2020 06:01:19 -0400
X-MC-Unique: pZD2GmdLPs6g0uSdXc6n_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CB5EC1A1;
 Fri, 26 Jun 2020 10:01:17 +0000 (UTC)
Received: from gondolin (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40B1B7C1FB;
 Fri, 26 Jun 2020 10:01:09 +0000 (UTC)
Date: Fri, 26 Jun 2020 12:01:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Collin Walling <walling@linux.ibm.com>
Subject: Re: [PATCH v4 6/8] s390/sclp: add extended-length sccb support for
 kvm guest
Message-ID: <20200626120106.6ef7fddc.cohuck@redhat.com>
In-Reply-To: <20200624202312.28349-7-walling@linux.ibm.com>
References: <20200624202312.28349-1-walling@linux.ibm.com>
 <20200624202312.28349-7-walling@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, mst@redhat.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, svens@linux.ibm.com, pbonzini@redhat.com,
 mihajlov@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Jun 2020 16:23:10 -0400
Collin Walling <walling@linux.ibm.com> wrote:

> As more features and facilities are added to the Read SCP Info (RSCPI)
> response, more space is required to store them. The space used to store
> these new features intrudes on the space originally used to store CPU
> entries. This means as more features and facilities are added to the
> RSCPI response, less space can be used to store CPU entries.
> 
> With the Extended-Length SCCB (ELS) facility, a KVM guest can execute
> the RSCPI command and determine if the SCCB is large enough to store a
> complete reponse. If it is not large enough, then the required length
> will be set in the SCCB header.
> 
> The caller of the SCLP command is responsible for creating a
> large-enough SCCB to store a complete response. Proper checking should
> be in place, and the caller should execute the command once-more with
> the large-enough SCCB.
> 
> This facility also enables an extended SCCB for the Read CPU Info
> (RCPUI) command.
> 
> When this facility is enabled, the boundary violation response cannot
> be a result from the RSCPI, RSCPI Forced, or RCPUI commands.
> 
> In order to tolerate kernels that do not yet have full support for this
> feature, a "fixed" offset to the start of the CPU Entries within the
> Read SCP Info struct is set to allow for the original 248 max entries
> when this feature is disabled.
> 
> Additionally, this is introduced as a CPU feature to protect the guest
> from migrating to a machine that does not support storing an extended
> SCCB. This could otherwise hinder the VM from being able to read all
> available CPU entries after migration (such as during re-ipl).
> 
> Signed-off-by: Collin Walling <walling@linux.ibm.com>
> ---
>  hw/s390x/sclp.c                     | 24 +++++++++++++++++++++++-
>  include/hw/s390x/sclp.h             |  1 +
>  target/s390x/cpu_features_def.inc.h |  1 +
>  target/s390x/gen-features.c         |  1 +
>  target/s390x/kvm.c                  |  8 ++++++++
>  5 files changed, 34 insertions(+), 1 deletion(-)
> 

(...)

> @@ -111,6 +131,8 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
>      CPUEntry *entries_start = (void *)sccb + offset_cpu;
>  
>      if (!sccb_verify_length(sccb, machine->possible_cpus->len, offset_cpu)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "insufficient sccb size to store "
> +                      "read scp info response\n");

Not sure if logging needed/provided length would be helpful here.

>          return;
>      }
>  

(...)

Acked-by: Cornelia Huck <cohuck@redhat.com>


