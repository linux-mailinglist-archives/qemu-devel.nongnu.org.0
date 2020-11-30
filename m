Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122982C8153
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 10:47:50 +0100 (CET)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjfmf-0007X9-4V
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 04:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjfk1-00061s-1B
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:45:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjfjy-0006SU-Ct
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 04:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606729500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4NsACzf87QCA9zGgBn5B0wXiOL+43t88jaGMzaeKVvA=;
 b=DmTGBvjRTCs9vVTfNINhdhFDCOKxxUHshl+dhkSnCSX4/JdcNmFCmC1wG/KthLtmDy705S
 IJYipHFp471zVbyKz8Ms7Lv2nbFt2njiWhtbMObMOlKDVlOaRhelFulEwZuUTpVCc9sSqD
 xu4B/yVuI3dwp2vSLveM/kdzG41x1pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-9CPsWIcdMhiHzLeN486aew-1; Mon, 30 Nov 2020 04:44:58 -0500
X-MC-Unique: 9CPsWIcdMhiHzLeN486aew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF6B105207B;
 Mon, 30 Nov 2020 09:44:57 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F7915C1BB;
 Mon, 30 Nov 2020 09:44:56 +0000 (UTC)
Date: Mon, 30 Nov 2020 10:44:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Re: [PATCH] python 3.5 compatibility
Message-ID: <20201130094454.GA5078@merkur.fritz.box>
References: <20201127183619.8958-1-info@metux.net>
MIME-Version: 1.0
In-Reply-To: <20201127183619.8958-1-info@metux.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.11.2020 um 19:36 hat Enrico Weigelt, metux IT consult geschrieben:
> Several stable distros are still on python-3.5, so qemu cannot be
> built there, w/o backporting the whole python stack. In order to
> make qemu build there, make it running w/ python-3.5. The changes
> are mostly removing the new type annotations (which, IMHO, just
> serve for documentation purpose)

While type hints are valuable documentation, they are more than just
that. They help to find and prevent avoidable bugs in the code. We are
actively in the process of adding them to everything in the QAPI
generator to improve maintainability rather than removing them.

Kevin

> and replacing f-strings by classic
> string formatting.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  configure                          |  4 +--
>  scripts/block-coroutine-wrapper.py | 56 ++++++++++++++++++--------------------
>  scripts/qapi/commands.py           |  2 +-
>  scripts/qapi/common.py             |  2 +-
>  scripts/qapi/events.py             |  2 +-
>  scripts/qapi/gen.py                | 10 +++----
>  scripts/qapi/main.py               |  6 ++--
>  scripts/qapi/schema.py             |  2 +-
>  scripts/qapi/source.py             | 10 +++----
>  9 files changed, 46 insertions(+), 48 deletions(-)


