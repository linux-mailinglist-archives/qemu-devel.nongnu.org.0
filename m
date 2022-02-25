Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09364C4D75
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:16:33 +0100 (CET)
Received: from localhost ([::1]:36872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNf8p-0002oE-2R
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:16:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNeKv-0001c9-No
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:25:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nNeKp-0003vQ-Kt
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645809889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sWUJB5z7ugr7h8RAttfLagLHJvMSDXB6r0Gt3qPPz2I=;
 b=JBwjMorj5EXD7BS41tUpR8jg59tAnZsGdxSmWdN5xtfKNNNIPAijl1izXJCZ9dsHeRXh2Q
 K9eARLBDxweY/4h9PxpaO3V2nrCqvtN15xBts9SrF+VPb8FGHsrt/2MKiikCmfx28LypX0
 n+X5bCAzCc6/Qd/vRrMqYbx8v2EQAQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-EMVm_by1Ma-YL6NfgNZC6Q-1; Fri, 25 Feb 2022 12:24:45 -0500
X-MC-Unique: EMVm_by1Ma-YL6NfgNZC6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A021854E21;
 Fri, 25 Feb 2022 17:24:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAAB286B8C;
 Fri, 25 Feb 2022 17:24:42 +0000 (UTC)
Date: Fri, 25 Feb 2022 11:24:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qapi: Belatedly adjust limitations documentation
Message-ID: <20220225172440.q2fsxvjvnvy6hsyv@redhat.com>
References: <20220225084538.218876-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225084538.218876-1-armbru@redhat.com>
User-Agent: NeoMutt/20211029-364-42e4ad
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 09:45:38AM +0100, Markus Armbruster wrote:
> Commit 57df0dff1a "qapi: Extend -compat to set policy for unstable
> interfaces" (v6.2.0) took care of covering experimental features, but
> neglected to adjust a comment suggesting to cover it.  Adjust it now.
> 
> Fixes: 57df0dff1a1f4c846aa74a082bfd595a8a990015
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/compat.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/compat.json b/qapi/compat.json
> index c53b69fe3f..39b52872d5 100644
> --- a/qapi/compat.json
> +++ b/qapi/compat.json
> @@ -41,7 +41,7 @@
>  #
>  # Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
>  # with feature 'deprecated'.  We may want to extend it to cover
> -# semantic aspects, CLI, and experimental features.
> +# semantic aspects and CLI.
>  #
>  # Limitation: deprecated-output policy @hide is not implemented for
>  # enumeration values.  They behave the same as with policy @accept.
> -- 
> 2.35.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


