Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F963B9FD7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 13:33:16 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzHQ3-0004l0-6y
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 07:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lzHOX-0003bC-5c
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:31:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lzHOU-0001Bn-7Z
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625225496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GBmiH9xK7S0IYsPm+YIUxE+4RCsOkEynbzOhxIGX2N8=;
 b=NHdVR+W6Bsd91hCDUyVoSxSABiLj7BZ/5MiCcfgGDNHML9NLE4leFCbNksxBk8/QvTUsWd
 w38nLlH3y+kOYxKnkcNuETgMgoa2vj3BFEaH026aucBx7Xe5U65dXN0v8n1ZyLmERmap8T
 YPcNDZ1Mg6gmauyjAbOnTgKlh6YL96M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-fPuxvAQ7ODuO9dZ2_T-Qqw-1; Fri, 02 Jul 2021 07:31:33 -0400
X-MC-Unique: fPuxvAQ7ODuO9dZ2_T-Qqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90EDD1926DA1;
 Fri,  2 Jul 2021 11:31:32 +0000 (UTC)
Received: from redhat.com (ovpn-114-65.ams2.redhat.com [10.36.114.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F945D6D3;
 Fri,  2 Jul 2021 11:31:31 +0000 (UTC)
Date: Fri, 2 Jul 2021 13:31:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ilya Dryomov <idryomov@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update block/rbd.c maintainer
Message-ID: <YN75EsVyKjUR7oRF@redhat.com>
References: <20210519112513.19694-1-idryomov@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210519112513.19694-1-idryomov@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.05.2021 um 13:25 hat Ilya Dryomov geschrieben:
> Jason has moved on from working on RBD and Ceph.  I'm taking over
> his role upstream.
> 
> Signed-off-by: Ilya Dryomov <idryomov@gmail.com>

Thanks, applied to the block branch.

Kevin


