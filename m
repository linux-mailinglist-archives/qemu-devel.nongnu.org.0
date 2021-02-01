Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FD30AC3E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:05:44 +0100 (CET)
Received: from localhost ([::1]:57018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bhv-0002EE-7v
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bY6-0000Ns-FI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6bY0-0001vc-0F
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:55:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LehB1DSLXvLMWc1h2Ece8L7qHCZMm2/Ag/6uEpWJVqU=;
 b=BY15VNqdLgYiN/zIDtOpJNAwO9O3PEZ8U9JuYWztMdfyJT1P1t336EjwxbK7I9wFL54wFV
 8JgFiKRunBG/PIzKXZiXL5TbuVN7wGmBRzh97RfOxeRASE8S8NjrAvVXyoPtexGMV4C6uI
 oAS5ECAkbk0xwGBD4miWRxD7uYzUFF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-OAEM_GV9PQm0rY5NNUI5SQ-1; Mon, 01 Feb 2021 10:55:23 -0500
X-MC-Unique: OAEM_GV9PQm0rY5NNUI5SQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1742584A5E0;
 Mon,  1 Feb 2021 15:55:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B6C910013C0;
 Mon,  1 Feb 2021 15:55:20 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:55:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] iotests: check: return 1 on failure
Message-ID: <20210201155519.GG13157@merkur.fritz.box>
References: <20210201085041.3079-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210201085041.3079-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2021 um 09:50 hat Vladimir Sementsov-Ogievskiy geschrieben:
> We should indicate failure by exit code, not only output.
> 
> Reported-by: Peter Maydell
> Fixes: f203080bbd9f9e5b31041b1f2afcd6040c5aaec5
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


