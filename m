Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2473937B0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 22:57:05 +0200 (CEST)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmN3w-0006TZ-At
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 16:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmN2l-0005Zq-RY
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmN2j-0002Ax-TF
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:55:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622148948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ni+6hZkXSLJW6jwPDxlTzbnxmvvtFCkE6EjrUKSV94=;
 b=Dl6xt6+e3313rqc7kPmeRPHiN9G+vpvEQ0/lSZXnLX2ZTmjeOxsT2FACe49u8i21s/BkJ6
 1aLTS0clyb20NvhxiWJtCjTpflBadKjWBx+s7px1qXUxKtd4itoPrXkvqBt6igziRiSJe6
 /u5i1NqEua83kGhgIGknGeOg5+n5wmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-1JOpoCinNia1tgIZzHnFqA-1; Thu, 27 May 2021 16:55:44 -0400
X-MC-Unique: 1JOpoCinNia1tgIZzHnFqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E237100AA27;
 Thu, 27 May 2021 20:55:39 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A39C5189C7;
 Thu, 27 May 2021 20:55:38 +0000 (UTC)
Date: Thu, 27 May 2021 16:55:37 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: [PATCH v3] target/i386/sev: add support to query the attestation
 report
Message-ID: <20210527205537.nesslxq4hcnrlo7w@habkost.net>
References: <20210429170728.24322-1-brijesh.singh@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210429170728.24322-1-brijesh.singh@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Tom Lendacky <Thomas.Lendacky@amd.com>, kvm@vger.kernel.org,
 armbru@redhat.com, James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 12:07:28PM -0500, Brijesh Singh wrote:
> The SEV FW >= 0.23 added a new command that can be used to query the
> attestation report containing the SHA-256 digest of the guest memory
> and VMSA encrypted with the LAUNCH_UPDATE and sign it with the PEK.
> 
> Note, we already have a command (LAUNCH_MEASURE) that can be used to
> query the SHA-256 digest of the guest memory encrypted through the
> LAUNCH_UPDATE. The main difference between previous and this command
> is that the report is signed with the PEK and unlike the LAUNCH_MEASURE
> command the ATTESATION_REPORT command can be called while the guest
> is running.
> 
> Add a QMP interface "query-sev-attestation-report" that can be used
> to get the report encoded in base64.
> 
> Cc: James Bottomley <jejb@linux.ibm.com>
> Cc: Tom Lendacky <Thomas.Lendacky@amd.com>
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: kvm@vger.kernel.org
> Reviewed-by: James Bottomley <jejb@linux.ibm.com>
> Tested-by: James Bottomley <jejb@linux.ibm.com>
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>

Queued, thanks!

-- 
Eduardo


