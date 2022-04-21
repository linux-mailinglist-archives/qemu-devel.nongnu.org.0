Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB3509A9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 10:25:53 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhS8N-0007MH-VS
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 04:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhS4f-0004U7-43
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nhS4a-0006qX-CA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650529314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m88mp7vX4QKutxVi6JJur7K8dgY2s2JeJZbYSmfnQic=;
 b=RZwxXT/SuFwnDWIQ4Q0DqbhFHRX2j3lrxXc+64J6D2xHcqM7zPV8AyfYp902duD8tFUbvN
 q04zZwmc1TWXQGa11yx0ej9NIy2PvMKSLNqEBpZEXPcqxgGXWP4zITp2alqhYn2b4Jb9Ja
 opzMT0shIyxXKWwAyVaZdgvZasDdkp0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-sIIkzJ3XPJqtmqgTT6YfCA-1; Thu, 21 Apr 2022 04:21:51 -0400
X-MC-Unique: sIIkzJ3XPJqtmqgTT6YfCA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF13E1C05AAA;
 Thu, 21 Apr 2022 08:21:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA82463E1A;
 Thu, 21 Apr 2022 08:21:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CFE5121E6A1F; Thu, 21 Apr 2022 10:21:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH] qapi: Fix version of cpu0-id field
References: <20220420190129.3532623-1-dovmurik@linux.ibm.com>
Date: Thu, 21 Apr 2022 10:21:49 +0200
In-Reply-To: <20220420190129.3532623-1-dovmurik@linux.ibm.com> (Dov Murik's
 message of "Wed, 20 Apr 2022 19:01:29 +0000")
Message-ID: <87pmlavobm.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dov Murik <dovmurik@linux.ibm.com> writes:

> Commit 811b4ec7f8eb ("qapi, target/i386/sev: Add cpu0-id to
> query-sev-capabilities") wrongly stated that the new field is available
> since version 7.0.
>
> Fix the QAPI documentation to state that the cpu0-id field is included
> since 7.1.
>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  qapi/misc-target.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index bc9355b595..ed4a468aab 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -144,7 +144,7 @@
>  #
>  # @cert-chain:  PDH certificate chain (base64 encoded)
>  #
> -# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.0)
> +# @cpu0-id: Unique ID of CPU0 (base64 encoded) (since 7.1)
>  #
>  # @cbitpos: C-bit location in page table entry
>  #

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Queued, thanks!


