Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CC43D3629
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:10:50 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qGf-0006mx-SZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qF3-0005K7-9x
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6qF1-0000Uo-Px
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627027747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l43IJLPq16sERQ+z3JT3SxKTh55SHJr6msz2JGvWwuQ=;
 b=JyjalAc1MU5Y2puEPwQ3iwULaJWhxUinsmWOHIt5IwaS35L8FtMZBYugL8l2QC3ZVaE8rV
 XV5lDfQ6u53Fl/sovGRS4V94RxOZ+6xdL38keeoZ3qIigGe1YRt8s2FBxd2su92pz/VDHc
 htP7JM53JU+2h12CuCk1gp470IsA9jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-v0BRUn9CPkuE0-SXFrk_mA-1; Fri, 23 Jul 2021 04:09:03 -0400
X-MC-Unique: v0BRUn9CPkuE0-SXFrk_mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7C9764ADF;
 Fri, 23 Jul 2021 08:09:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42FFB6A8F8;
 Fri, 23 Jul 2021 08:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9273011326B9; Fri, 23 Jul 2021 10:08:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1 2/2] docs: Move licence/copyright from HTML
 output to rST comments
References: <20210722192016.24915-1-peter.maydell@linaro.org>
 <20210722192016.24915-3-peter.maydell@linaro.org>
Date: Fri, 23 Jul 2021 10:08:25 +0200
In-Reply-To: <20210722192016.24915-3-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 22 Jul 2021 20:20:16 +0100")
Message-ID: <87k0lhcv0m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> Our built HTML documentation now has a standard footer which
> gives the license for QEMU (and its documentation as a whole).
> In almost all pages, we either don't bother to state the
> copyright/license for the individual rST sources, or we put
> it in an rST comment. There are just three pages which render
> copyright or license information into the user-visible HTML.
>
> Quoting a specific (different) license for an individual HTML
> page within the manual is confusing. Downgrade the license
> and copyright info to a comment within the rST source, bringing
> these pages in line with the rest of our documents.
>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


