Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162032B63C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 10:38:59 +0100 (CET)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHNy6-00053J-3j
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 04:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHNvy-0004KF-BN
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:36:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHNvt-000661-JE
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614764199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yJvUkxBCrR6ZZqXpjZX7LJ6noYzNuJnQfcLciEGn2fY=;
 b=FYqs3g1QdVQl+JQfMnxcKlwLnzCRB4mERobHWe7ZnkIVTFejpvKe8Fp+38yMYjegAtooGi
 51r2deyWCiVkrtcflbdGRiKw8KJO82G1JnQXSgdn247z2t6ef5GnncbglqYk7gmKJ/A2s/
 ILzfR2hOw0yc+LOaKQYc25z9p2+f9Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-k4kYG80QO7qNMUTwGJTSSA-1; Wed, 03 Mar 2021 04:36:38 -0500
X-MC-Unique: k4kYG80QO7qNMUTwGJTSSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0366C195D560;
 Wed,  3 Mar 2021 09:36:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-195.ams2.redhat.com [10.36.113.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC69189CE;
 Wed,  3 Mar 2021 09:36:35 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:36:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 0/2] docs: show how to spawn qemu-storage-daemon with
 fd passing
Message-ID: <20210303093634.GB5254@merkur.fritz.box>
References: <20210301172728.135331-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301172728.135331-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.03.2021 um 18:27 hat Stefan Hajnoczi geschrieben:
> v3:
>  * Explain how to detect launch errors and that the listen socket must be
>    closed in the parent process in order for this to work [Daniel]
> 
> v2:
>  * Use /var/run/qmp.sock instead of /tmp/qmp-$PID.sock to prevent security
>    issues with world-writeable directories [Rich, Daniel]
>  * Add Patch 2 to fix insecure examples in the documentation [Rich, Daniel]
> 
> Add an example of how to spawn qemu-storage-daemon with fd passing. This
> approach eliminates the need to busy wait for the QMP, NBD, or vhost-user
> socket to become available.

Thanks, applied to the block branch.

Kevin


