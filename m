Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D33E1D45
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 22:19:54 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjqK-0007UV-Vu
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 16:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBjpW-0006KK-OF
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mBjpU-0006vF-2p
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 16:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628194738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hN01nazuxUjnk77Jwe633N4621rXXahOrC9KxbfjsOk=;
 b=bGwgHuPiYStrUSuagDCuJWRH4runw8/PQh+MDRfjTz6XsdHXjcHi++R/7HbWdKSWrqWQjM
 atx7W1hzUHc6HBiN5iAUdl8/MRTDrQivyXxdWPwcPdUQh+I8JKU/bxcqMkSfYguclw1Xhh
 7+o9aIWQkNOQ+znuwImDJSUOjcM/NK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-eAbAXbdpP8yPMtl-pTpvDg-1; Thu, 05 Aug 2021 16:18:55 -0400
X-MC-Unique: eAbAXbdpP8yPMtl-pTpvDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C60D3107ACF5;
 Thu,  5 Aug 2021 20:18:53 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE691617E;
 Thu,  5 Aug 2021 20:18:52 +0000 (UTC)
Date: Thu, 5 Aug 2021 15:18:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v4 03/14] migration.json: add AMD SEV specific migration
 parameters
Message-ID: <20210805201851.7ff7xq6jtbkaz5cg@redhat.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
MIME-Version: 1.0
In-Reply-To: <d6a23bde6b6e10162282e6ea3b4f94ed331f4b3f.1628076205.git.ashish.kalra@amd.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 11:54:43AM +0000, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> AMD SEV migration flow requires that target machine's public Diffie-Hellman
> key (PDH) and certificate chain must be passed before initiating the guest
> migration. User can use QMP 'migrate-set-parameters' to pass the certificate
> chain. The certificate chain will be used while creating the outgoing
> encryption context.
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
> +++ b/qapi/migration.json
> @@ -743,6 +743,15 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @sev-pdh: The target host platform diffie-hellman key encoded in base64
> +#           (Since 4.2)

6.2, not 4.2.

> +#
> +# @sev-plat-cert: The target host platform certificate chain encoded in base64
> +#                 (Since 4.2)

And again; I'll quit pointing it out.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


