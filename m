Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBE6F05B7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:26:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0hl-0004OC-Q2; Thu, 27 Apr 2023 08:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps0hh-0004Ns-Us
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:26:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ps0hf-0006jj-Vf
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682598387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9GFjjXJqzPwV8fx4e6mfvb/rgR/vjAp0VEg0nsVjqa8=;
 b=hBMWHX6i6wigeqEeRlNuzgu0i4x7hccmoAsZgtJKh3fjJwhlpD+oNPZOfW7ul60+WyBpjC
 OI8wlK3IgBqVcbypl6e8+ALqHoRLCN5P0h8+F5GqZAtL26SpR6cLULjhg3DDJP/foQKJM7
 BQJudRK+9tPEZ+zg9vE1+yqN8GEXFSI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-dLYc1KqWO0K62u1RQ5rgMg-1; Thu, 27 Apr 2023 08:26:24 -0400
X-MC-Unique: dLYc1KqWO0K62u1RQ5rgMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B98C63847083;
 Thu, 27 Apr 2023 12:26:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F18240C6EC4;
 Thu, 27 Apr 2023 12:26:23 +0000 (UTC)
Date: Thu, 27 Apr 2023 14:26:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] block: add missing coroutine_fn annotations
Message-ID: <ZEpp7XXz7z6DxY1s@redhat.com>
References: <20230406101752.242125-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406101752.242125-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 06.04.2023 um 12:17 hat Paolo Bonzini geschrieben:
> After the recent introduction of many new coroutine callbacks,
> a couple calls from non-coroutine_fn to coroutine_fn have sneaked
> in; fix them.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks, applied to the block branch.

Kevin


