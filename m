Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658693F86E5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:01:30 +0200 (CEST)
Received: from localhost ([::1]:32958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJE4H-0007Vu-JH
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:01:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJE2f-0006cR-3y
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJE2d-0001Bz-6z
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629979169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPR+llgbWzAU7DPHDE6MElS8i/z920HRUiHSJg5v62w=;
 b=XU/Fg+bD1raFmf2N/TIgnSpxSM0Wpx0NECZj+qxEE2y+EwLfPuZXRWlCCFI6UQEu+hJxlO
 1RW3DaXTgiDufkzMOTxkF/l8P4+p8eMyDrgq/ejpd0uArKxG3DTA/7x5FY1xeHC7C4+Ebl
 YhsIdAQ5cVok/pkjE748z6wD4T+QpPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-7OSwrG8iPVGjqyllnCqo0w-1; Thu, 26 Aug 2021 07:59:26 -0400
X-MC-Unique: 7OSwrG8iPVGjqyllnCqo0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62841C73A0;
 Thu, 26 Aug 2021 11:59:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19A5060C0F;
 Thu, 26 Aug 2021 11:59:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5347B18003AA; Thu, 26 Aug 2021 13:59:17 +0200 (CEST)
Date: Thu, 26 Aug 2021 13:59:17 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 33/44] qmp: add query-tdx-capabilities query-tdx
 command
Message-ID: <20210826115917.x67c4zjxkd2vw2rz@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <f9391aea17154c05a8d51da8a15b8aec4e2d5873.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9391aea17154c05a8d51da8a15b8aec4e2d5873.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: isaku.yamahata@intel.com, Chenyi Qiang <chenyi.qiang@intel.com>,
 cohuck@redhat.com, ehabkost@redhat.com, kvm@vger.kernel.org, mst@redhat.com,
 seanjc@google.com, alistair@alistair23.me, xiaoyao.li@intel.com,
 qemu-devel@nongnu.org, mtosatti@redhat.com, erdemaktas@google.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +##
> +# @TDXInfo:
> +#
> +# Information about Trust Domain Extensions (TDX) support
> +#
> +# @enabled: true if TDX is active
> +#
> +##
> +{ 'struct': 'TDXInfo',
> +    'data': { 'enabled': 'bool' },
> +  'if': 'defined(TARGET_I386)'
> +}

I think a generic 'ConfidentialComputing' enum with 'none', 'sev' and
'tdx' would be better.

Hmm, I see sev already has a collection of sev-specific commands, so not
sure whenever going that route now buys us much though ...

take care,
  Gerd


