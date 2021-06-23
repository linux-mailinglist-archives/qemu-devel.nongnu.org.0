Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A13B1A45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:34:39 +0200 (CEST)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw25W-0007Y8-LZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw23u-00069x-AQ
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw23r-0000Pp-9Y
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624451573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uYpwQSVp2FNqDfb06yKPNjwHrEd+M2Iqy31O4uk0lCA=;
 b=XWqAv1NyXvzGVJVlAP0In7R5qM0CEHGORciZPyaOW7HQ3oFhDagzEIjq5JIerfrx+WyoMA
 XkY6kyht0oXPSlUBJ1cZ9FEC9CHmyZSf2ZkLflgIsjBSo41jyCXdBL1Ti0fvKVzYksAw8P
 NpJpFHcRXxZU2iireZkSN4vESfNWnDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-gqlzct91MVeHHDbphq2rkQ-1; Wed, 23 Jun 2021 08:32:49 -0400
X-MC-Unique: gqlzct91MVeHHDbphq2rkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B294218D6A2A;
 Wed, 23 Jun 2021 12:32:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A8A319D7C;
 Wed, 23 Jun 2021 12:32:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C7266180060E; Wed, 23 Jun 2021 14:32:45 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:32:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Ahmed Abouzied <admin@aabouzied.com>
Subject: Re: [PATCH v3] Add display suboptions to man pages
Message-ID: <20210623123245.glx7hnfodzym4aja@sirius.home.kraxel.org>
References: <20210601174117.661-1-email@aabouzied.com>
MIME-Version: 1.0
In-Reply-To: <20210601174117.661-1-email@aabouzied.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Ahmed Abouzied <email@aabouzied.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 07:41:18PM +0200, Ahmed Abouzied wrote:
> From: Ahmed Abouzied <email@aabouzied.com>
> 
> Add display suboptions to man pages
> 
>   Updates man pages with the suboptions for the `-display`.
> 
>   Resolves: https://gitlab.com/qemu-project/qemu/-/issues/128
>   Buglink: https://bugs.launchpad.net/qemu/+bug/1620660
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>

Added to UI patch queue.

thanks,
  Gerd


