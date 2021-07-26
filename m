Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FD3D5BB9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:32:57 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81f6-0008Kz-W4
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m81d8-00051E-Sn
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:30:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m81d6-0004m5-6a
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627309851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=leLa3adT+x6CVkAaUdr3Us4XcGNMzIkRO1u1Z5wqN5Y=;
 b=LG5MCVoLC6H2FgTcyY46vKkN9lIQF+urR2gdFD8Z+Ces8W6U7jUJfpvzS9NAqhXyKIMiNE
 NAl9MekkqnF1ZlP70Rgb1DPUH0Nq6LLGd3QYVuTfeq2qIPxGvtZBM+UU9JtXgKWuC37n4Y
 icdpspNgMqpqdsmCvIKQ+VNtnLXMkBs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-1i-MaOkfNt--e1qE5DhwjA-1; Mon, 26 Jul 2021 10:30:45 -0400
X-MC-Unique: 1i-MaOkfNt--e1qE5DhwjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB39C801AEB;
 Mon, 26 Jul 2021 14:30:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 711AA179B3;
 Mon, 26 Jul 2021 14:30:43 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.1 06/10] docs/system/s390x/protvirt.rst: Format
 literals correctly
In-Reply-To: <20210726142338.31872-7-peter.maydell@linaro.org>
Organization: Red Hat GmbH
References: <20210726142338.31872-1-peter.maydell@linaro.org>
 <20210726142338.31872-7-peter.maydell@linaro.org>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 26 Jul 2021 16:30:41 +0200
Message-ID: <875ywx5er2.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 26 2021, Peter Maydell <peter.maydell@linaro.org> wrote:

> In rST markup, single backticks `like this` represent "interpreted
> text", which can be handled as a bunch of different things if tagged
> with a specific "role":
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#interpreted-text
> (the most common one for us is "reference to a URL, which gets
> hyperlinked").
>
> The default "role" if none is specified is "title_reference",
> intended for references to book or article titles, and it renders
> into the HTML as <cite>...</cite> (usually comes out as italics).
>
> To format a literal (generally rendered as fixed-width font),
> double-backticks are required.
>
> protvirt.rst consistently uses single backticks when double backticks
> are required; correct it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/s390x/protvirt.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


