Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9E4E2BC0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:18:08 +0100 (CET)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJnL-0001US-Cc
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:18:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJjt-0006vi-4A
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJjq-0000XF-89
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647875669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0fE2FSkZWe1Prnj3nr05EXtA58ilE8eJb5fZeyh2pwU=;
 b=gxxNha4Ik5QYWAJIQfApXtpAd4zKp58oJRqbbgtcJUotOkKwBafwUVFKGXbkyuTxKxm0X1
 FeolwDSr3ugqjVWnTPzQ1sCHjrdWz0VIpe+H3StKPZl2fD5usk7WzEW5/uQOTitRWHLkgO
 /ZNV5ZEWMS518ZLxfMRqrxZoTN9JM9g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-AUK2wu7jOmOekeOQenwesQ-1; Mon, 21 Mar 2022 11:14:26 -0400
X-MC-Unique: AUK2wu7jOmOekeOQenwesQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1077D185A7A4;
 Mon, 21 Mar 2022 15:14:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E24AA43485F;
 Mon, 21 Mar 2022 15:14:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C08B621A3F41; Mon, 21 Mar 2022 16:14:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: Update maintainers for Guest x86 HAXM
 CPUs
References: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
Date: Mon, 21 Mar 2022 16:14:24 +0100
In-Reply-To: <DM6PR11MB40905967203E4917E78C773487119@DM6PR11MB4090.namprd11.prod.outlook.com>
 (Wenchao Wang's message of "Wed, 16 Mar 2022 00:47:52 +0000")
Message-ID: <875yo7pcbz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Yuan,
 Hang" <hang.yuan@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perhaps this can go via qemu-trivial (cc'ed).

"Wang, Wenchao" <wenchao.wang@intel.com> writes:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2e9ce1da2..36f877cf74 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -492,7 +492,6 @@ Guest CPU Cores (HAXM)
> ---------------------
> X86 HAXM CPUs
> M: Wenchao Wang <wenchao.wang@intel.com>
> -M: Colin Xu <colin.xu@intel.com>
> L: haxm-team@intel.com
> W: https://github.com/intel/haxm/issues
> S: Maintained
> --
> 2.17.1

Patch git-am fails with "error: corrupt patch at line 7".

For a trivial patch like this one, the maintainer may be willing to work
around.  To post real work, you'll have to fix your mail sending, I'm
afraid.

Patch makes sense; mail to colin.xu@intel.com bounces.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


