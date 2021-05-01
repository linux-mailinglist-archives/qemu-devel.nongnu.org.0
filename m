Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E23705C1
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 07:51:14 +0200 (CEST)
Received: from localhost ([::1]:53376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lciX3-0000bl-ES
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 01:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lciWE-0008R4-2r
 for qemu-devel@nongnu.org; Sat, 01 May 2021 01:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lciWB-0007yr-7M
 for qemu-devel@nongnu.org; Sat, 01 May 2021 01:50:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619848217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AOPksk9J8Noc4lsPDIYoIE7Ocb3j4VlSIsWb5xUXVVE=;
 b=PeVW7ifmMDkuK6s3qlU266wz1c9pbhcCXr1m2NOkRWxKBiFkHtWaAuOMinMoNSvB5tSmLh
 nnIw4X7Qf2RC2ZQW4k292DvdOtudWr47l/iQ/kOjWunWh5bXj316UIp9yhvnYyMI1nfhvf
 8Ffex87GJFTjiiCcjyV/0mfx21IoFks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-H2s6ySoAMD2vCbURPpa2nw-1; Sat, 01 May 2021 01:50:15 -0400
X-MC-Unique: H2s6ySoAMD2vCbURPpa2nw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 155E9801B13;
 Sat,  1 May 2021 05:50:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FD646F43C;
 Sat,  1 May 2021 05:50:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E2AD1113525D; Sat,  1 May 2021 07:50:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [Trivial] docs: More precisely describe memory-backend-*::id's
 user
References: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
Date: Sat, 01 May 2021 07:50:10 +0200
In-Reply-To: <1619080922-83527-1-git-send-email-robert.hu@linux.intel.com>
 (Robert Hoo's message of "Thu, 22 Apr 2021 16:42:02 +0800")
Message-ID: <87sg37knot.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-trivial@nongnu.org, robert.hu@intel.com, mjt@tls.msk.ru,
 laurent@vivier.eu, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Robert Hoo <robert.hu@linux.intel.com> writes:

> 'id' of memory-backend-{file,ram} is not only for '-numa''s reference, but
> also other parameters like '-device nvdimm'.
> More clearly call out this to avoid misinterpretation.
>
> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> ---
>  qemu-options.hx | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002..635dc8a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4508,11 +4508,11 @@ SRST
>          the guest RAM with huge pages.
>  
>          The ``id`` parameter is a unique ID that will be used to
> -        reference this memory region when configuring the ``-numa``
> -        argument.
> +        reference this memory region in other parameters, e.g. ``-numa``,
> +        ``-device nvdimm``, etc.



>  
>          The ``size`` option provides the size of the memory region, and
> -        accepts common suffixes, eg ``500M``.
> +        accepts common suffixes, e.g. ``500M``.
>  
>          The ``mem-path`` provides the path to either a shared memory or
>          huge page filesystem mount.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


