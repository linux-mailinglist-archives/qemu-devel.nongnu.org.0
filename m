Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5B5F633B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 11:04:45 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogMo8-00009M-De
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 05:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogMOM-00084B-FP
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:38:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogMOK-0006aT-Lk
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 04:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665045480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WTWLQp4V1quM0R+RrPIcVT9Pc0U7SSczMDcK79PFZJQ=;
 b=YrEr/NMNLB/70zEUvh6QSQvM8zOUU7N1Nx1pYxkS1iJduAKcNwfkhaWLWOdX2BP1jvA55k
 ftNMVEtm0UeVZ3djA11/sZuCME74cQ+NlsuMpRiklAzedJ33E7xhODBlHpVpr4K13d7nwQ
 JHaP7G2wTowWfRvqZzOj6Arshn5t+5k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-tWbWGbYNM6mmis2Y0iy1Fw-1; Thu, 06 Oct 2022 04:37:56 -0400
X-MC-Unique: tWbWGbYNM6mmis2Y0iy1Fw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ED181C09C9E
 for <qemu-devel@nongnu.org>; Thu,  6 Oct 2022 08:37:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4C2F4A9255;
 Thu,  6 Oct 2022 08:37:55 +0000 (UTC)
Date: Thu, 6 Oct 2022 10:37:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] coroutine: Drop coroutine_fn annotation from
 qemu_coroutine_self()
Message-ID: <Yz6T4tOa8yLx/NbM@redhat.com>
References: <20221005175209.975797-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005175209.975797-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.10.2022 um 19:52 hat Alberto Faria geschrieben:
> qemu_coroutine_self() can be called from outside coroutine context,
> returning the leader coroutine, and several such invocations currently
> exist (mostly in qcow2 tracing calls).
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Thanks, applied to the block branch.

Kevin


