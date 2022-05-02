Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACE7516C8F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:53:16 +0200 (CEST)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRnt-0000QX-Ur
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlRl3-0007WW-Ek
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:50:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlRl0-0008MB-Ls
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651481413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjIqC85Rf2OKUUlKk6ttGk3mgwSSaN7HmKPrDCLhyiw=;
 b=LmXZdDu5M6vucrMH2+KGwfPJg1JEFkehv7dm3crW9IZ9OzafZXJhQ2Pf4bYbDcwekFvO/b
 N9O7X0cT1mLxbBSwCam6sYzllFyXQJ+LhhgSAXp8+4vutmtTl366DS6ISWWbSpVAjhDyut
 RH1+O5GslZRxwapu8+FI3PMMsnSshhg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-ThuQYSZgMCCf3cIANGy5pA-1; Mon, 02 May 2022 04:50:10 -0400
X-MC-Unique: ThuQYSZgMCCf3cIANGy5pA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABA39811E75;
 Mon,  2 May 2022 08:50:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE08F400E547;
 Mon,  2 May 2022 08:50:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA11321E66D0; Mon,  2 May 2022 10:50:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 6/7] qapi: Drop unnecessary horizontal spacing in comments
References: <20220429154758.354610-1-abologna@redhat.com>
 <20220429154758.354610-7-abologna@redhat.com>
Date: Mon, 02 May 2022 10:50:07 +0200
In-Reply-To: <20220429154758.354610-7-abologna@redhat.com> (Andrea Bolognani's
 message of "Fri, 29 Apr 2022 17:47:57 +0200")
Message-ID: <874k28s4hs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> Care was taken not to break vertical alignment.
>
> Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> ---
>  qapi/block-core.json   | 62 +++++++++++++++++++++---------------------
>  qapi/block-export.json |  2 +-
>  qapi/block.json        |  2 +-
>  qapi/char.json         |  2 +-
>  qapi/control.json      | 10 +++----
>  qapi/crypto.json       | 44 +++++++++++++++---------------
>  qapi/dump.json         |  4 +--
>  qapi/machine.json      |  8 +++---
>  qapi/misc-target.json  |  6 ++--
>  qapi/misc.json         |  6 ++--
>  qapi/run-state.json    |  4 +--
>  qapi/sockets.json      |  6 ++--
>  qapi/ui.json           | 18 ++++++------
>  13 files changed, 87 insertions(+), 87 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 2bce5bb0ae..5fd66ea676 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -337,9 +337,9 @@
>  #
>  # Cache mode information for a block device
>  #
> -# @writeback:   true if writeback mode is enabled
> -# @direct:      true if the host page cache is bypassed (O_DIRECT)
> -# @no-flush:    true if flush requests are ignored for the device
> +# @writeback: true if writeback mode is enabled
> +# @direct:    true if the host page cache is bypassed (O_DIRECT)
> +# @no-flush:  true if flush requests are ignored for the device

I'm no fan of horizontally aligning descriptions, because when you add a
longer name, you either realign (I hate the churn) or live with the
inconsistency (I hate that, too).

For what it's worth, the example in docs/devel/qapi-code-gen.rst does
not align.

I doubt changing to a different alignment now is useful.  The next
patch, however, drops the alignment entirely.  Possibly useful.

Thoughts?

>  #
>  # Since: 2.3
>  ##
> @@ -604,7 +604,7 @@
>  # @inserted: @BlockDeviceInfo describing the device if media is
>  #            present
>  #
> -# Since:  0.14
> +# Since: 0.14

This one is TAG: TEXT, whereas the one above is a multiple @NAME:
DESCRIPTION.  Extra space in the latter can provide alignment.  Extra
space in the former is always redundant.  I'd take a patch dropping
these obviously redundant spaces without debate :)

[...]


