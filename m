Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0E4E3259
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:33:27 +0100 (CET)
Received: from localhost ([::1]:43828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPeX-0000vt-WA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPdD-0007zl-4Z
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPd9-0004T3-GZ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647898318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PK+n9GDeLUKcwl9yx5DIgAQojHJ3wILuG43fMxG5K0E=;
 b=G55ym8T1G6SKz2Tq7/ftZjxwTP/2ruzMT4aS3II5hYs4LArMPLjLq5tcPiER/5rzP8Gc+3
 xmUJjCFNbnqWQ97bu4ceSIB+IBe2xRD1hXO6S3AchPjgTaIVUbfkDMMkh7n3Hi21BddQ2U
 UhoNbjSz1msMnvo87NifbkzCu8ve1hE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-0xgBrCIVPfyXVV-jh2Y5Mw-1; Mon, 21 Mar 2022 17:31:54 -0400
X-MC-Unique: 0xgBrCIVPfyXVV-jh2Y5Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3B063C14CCA;
 Mon, 21 Mar 2022 21:31:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D1D11121314;
 Mon, 21 Mar 2022 21:31:53 +0000 (UTC)
Date: Mon, 21 Mar 2022 16:31:51 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 17/18] iotests: remove qemu_img_pipe_and_status()
Message-ID: <20220321213151.ox7wneobhru66awn@redhat.com>
References: <20220321201618.903471-1-jsnow@redhat.com>
 <20220321201618.903471-18-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220321201618.903471-18-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 21, 2022 at 04:16:17PM -0400, John Snow wrote:
> With the exceptional 'create' calls removed in the prior commit, change
> qemu_img_log() and img_info_log() to call qemu_img() directly
> instead.
> 
> For now, allow these calls to qemu-img to return non-zero on the basis
> that any unusual output will be logged anyway. The very next commit
> begins to enforce a successful exit code by default even for the logged
> functions.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


