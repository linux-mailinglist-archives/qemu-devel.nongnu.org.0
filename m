Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1840695D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:55:40 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOdFz-00085L-TR
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOdES-0006hM-UZ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOdEQ-0006CE-SW
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631267642;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EhXtwHSt1V0EnqxjbWpMXtusnddP9ykSwvLsNu9YsJ8=;
 b=O2tdxrmzL+HyZ625kcXwC8Lnpr31WtQV1J+M8j+fomBXxGux0cfGQBkuQzoW6cNCNEJkQn
 3nKxtZLjhI7N0QfEv1Q5Dp0gbbiU6A3hPm2FB0ZlfxYSZ49zq4DMirqvAb+lA9I/jeLLem
 oyHM3dQnmFFSlF2Xw23d9BZ7nTxRM7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-HUNwlgqMN4m-oqvWsNk1dA-1; Fri, 10 Sep 2021 05:54:00 -0400
X-MC-Unique: HUNwlgqMN4m-oqvWsNk1dA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D5180124F;
 Fri, 10 Sep 2021 09:53:58 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCA74180;
 Fri, 10 Sep 2021 09:53:56 +0000 (UTC)
Date: Fri, 10 Sep 2021 10:53:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Subject: Re: [PATCH v4 02/14] doc: update AMD SEV to include Live migration
 flow
Message-ID: <YTsrMsYwMsm/yWBe@redhat.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
 <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
MIME-Version: 1.0
In-Reply-To: <0e2b3d80e3d61b121ff4b508e5299e3c23f7b090.1628076205.git.ashish.kalra@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, tobin@ibm.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 11:53:47AM +0000, Ashish Kalra wrote:
> From: Brijesh Singh <brijesh.singh@amd.com>
> 
> Signed-off-by: Brijesh Singh <brijesh.singh@amd.com>
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
> ---
>  docs/amd-memory-encryption.txt | 46 +++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
> index 12ca25180e..0d9184532a 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/amd-memory-encryption.txt
> @@ -126,7 +126,51 @@ TODO
>  
>  Live Migration
>  ----------------

> +NOTE:
> +To protect against the memory clone SEV APIs are designed to make the VM
> +unrunnable in case of the migration failure.

Can you expand on this, as the limited explanation does not make a
whole lot of sense. What is the threat model here, what actions
are being taken to ensure unrunnability and who or what enforces
that ?  Which VM is this referring to - the src VM or dst VM ?

I comes across like you're trying to protect against the case where
the same VM is executing on both hosts concurrently, but I'm not
clear how that ties into migration failure.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


