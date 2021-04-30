Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33083700EB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:01:51 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYOc-0000pB-Dc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lcYMH-00006T-Tr
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:59:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lcYMF-0004dK-Iv
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 14:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619809161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1xy2OAyzK2Xzj5nWZVAWhLgMHrb2MW2sFdLtfKhFPAE=;
 b=jB+ISRdIspLL7j8KGMzKwinB8D7v4S8KnKjDDFq16MHU7IjXXhBOzJlu8+yYyPLD7rFILQ
 2O4NuV7Mb1ZSQDrkURjHwvFN5bOSIwioAe/lIEHfYS/83jNRBsPTaxJLFmkpKD16kVOUg3
 nkOdXg2tvwhxqBx0nnqRhcmLscsm5Ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-O1RiqAeUNP2y8gCxI7bmBQ-1; Fri, 30 Apr 2021 14:59:17 -0400
X-MC-Unique: O1RiqAeUNP2y8gCxI7bmBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 656D7501F0;
 Fri, 30 Apr 2021 18:59:16 +0000 (UTC)
Received: from [10.3.114.144] (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD3842C15A;
 Fri, 30 Apr 2021 18:59:15 +0000 (UTC)
Subject: Re: [PATCH] Remove the deprecated moxie target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Anthony Green <green@moxielogic.com>
References: <20210430160355.698194-1-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f0ccb3bf-da66-6af2-86af-35be23ce234c@redhat.com>
Date: Fri, 30 Apr 2021 13:59:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430160355.698194-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/21 11:03 AM, Thomas Huth wrote:
> There are no known users of this CPU anymore, and there are no
> binaries available online which could be used for regression tests,
> so the code has likely completly bit-rotten already. It's been

completely

> marked as deprecated since two releases now and nobody spoke up
> that there is still a need to keep it, thus let's remov it now.

remove

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


