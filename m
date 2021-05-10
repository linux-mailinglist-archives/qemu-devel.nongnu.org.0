Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F3A3780CE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:05:20 +0200 (CEST)
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2mt-0003nG-JC
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lg2kZ-0001hJ-B8
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lg2kW-0001kf-Ge
 for qemu-devel@nongnu.org; Mon, 10 May 2021 06:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620640971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hK96/QLcWyWgD74SgbRk6g66mkqQm5qYMaanakWD4I=;
 b=Yx9q2OqcSlfwqXPgYeSYfsC3VeL/pbkMRJuWibVAT51wKBxh8+gWBkoMYJdVp8NdhBQpWX
 cUaPngfk166oXXpY3CIMhTcAh0+NhlcIrX6Kh6iZCr/F/QX4K7FNnntqvMPlps5LZO3e7z
 q6Gnpmn0S9xAW+jBDplBEedLtj3nZ+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-bSgqIDY1My2mnneS6D_uKA-1; Mon, 10 May 2021 06:02:50 -0400
X-MC-Unique: bSgqIDY1My2mnneS6D_uKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E88DE8BEDAC;
 Mon, 10 May 2021 10:02:48 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 278BB5E1B5;
 Mon, 10 May 2021 10:02:48 +0000 (UTC)
Date: Mon, 10 May 2021 12:02:46 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH trivial] qapi: spelling fix (addtional)
Message-ID: <YJkExu14294jutI/@merkur.fritz.box>
References: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
In-Reply-To: <20210508093315.393274-1-mjt@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.05.2021 um 11:33 hat Michael Tokarev geschrieben:
> Fixes: 3d0d3c30ae3a259bff176f85a3efa2d0816695af
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

I'm also applying this to my block branch because this is how the patch
that introduced it was merged, but if qemu-trivial merges first, this is
fine.

Kevin


