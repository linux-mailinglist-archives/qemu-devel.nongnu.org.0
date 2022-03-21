Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1514E2839
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:53:56 +0100 (CET)
Received: from localhost ([::1]:44596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWITr-0004ku-6u
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:53:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIP0-0002lY-1U
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIOu-0005MP-Rz
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647870528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O/HU6zA5Lh/wWHQpme/RgPK8xgyQdgrhItc05r04yco=;
 b=gCHwhI+ebYUpbdCvgO/tVkx/Odd3dE7y5Wp6S2S2yVlNb+S23gqYykXOOnsRBs0LFIM0uv
 N0T7clls5NwQ53323mbhVBjmZ0xP4xmF6Azo47cBFE0z/1NVFbklCuRu4vjZwS83FKfFus
 gFQaC2wx3wK0xP0HwIdt3ot8yn6V/Us=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-CaT4IZ3pM9iLFXtMMZhAHw-1; Mon, 21 Mar 2022 09:48:44 -0400
X-MC-Unique: CaT4IZ3pM9iLFXtMMZhAHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F525185A79C;
 Mon, 21 Mar 2022 13:48:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8D3D400F721;
 Mon, 21 Mar 2022 13:48:43 +0000 (UTC)
Date: Mon, 21 Mar 2022 08:48:41 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 03/15] iotests: Don't check qemu_io() output for specific
 error strings
Message-ID: <20220321134841.opvkipfeovfzmriz@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-4-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-4-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:43PM -0400, John Snow wrote:
> A forthcoming commit updates qemu_io() to raise an exception on non-zero
> return by default, and changes its return type.
> 
> In preparation, simplify some calls to qemu_io() that assert that
> specific error message strings do not appear in qemu-io's
> output. Asserting that all of these calls return a status code of zero
> will be a more robust way to guard against failure.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/040 | 33 ++++++++++++++++-----------------
>  tests/qemu-iotests/056 |  2 +-
>  2 files changed, 17 insertions(+), 18 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


