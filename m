Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8D324FEC0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 15:22:42 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kACQr-0005sr-F7
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 09:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kACQ9-0005O4-LO
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 09:21:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50989
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kACQ8-0001xT-5w
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 09:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598275315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FqaUmHOTGYYKFr+8cBIx5E9YAPd+sxt9if0JGiX0Bao=;
 b=XT7hBdxO+zanJLoJiktAFEYZaFuJX3YOccjfWl+foFNk2yp3dVhpQFufBO8MMUl+A/hvIA
 IxWt3D8bGi47YNI7vtRREUTtfseEdcjJx/z8kbXGXc25gajyU/GcUl1rCNDgAtveyQW8wr
 M2uUKVzHnynCqdRzq6XNfENNhznCnEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-51gW-rYaOXysopDdTLmwaA-1; Mon, 24 Aug 2020 09:21:53 -0400
X-MC-Unique: 51gW-rYaOXysopDdTLmwaA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E63610ABDA9;
 Mon, 24 Aug 2020 13:21:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B312C60BF1;
 Mon, 24 Aug 2020 13:21:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 490941138648; Mon, 24 Aug 2020 15:21:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Subject: Re: [PATCH v6 3/4] qapi: add filter-node-name to block-stream
References: <1597785880-431103-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1597785880-431103-4-git-send-email-andrey.shinkevich@virtuozzo.com>
Date: Mon, 24 Aug 2020 15:21:50 +0200
In-Reply-To: <1597785880-431103-4-git-send-email-andrey.shinkevich@virtuozzo.com>
 (Andrey Shinkevich's message of "Wed, 19 Aug 2020 00:24:39 +0300")
Message-ID: <87364cqivl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:21:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey Shinkevich <andrey.shinkevich@virtuozzo.com> writes:

> Provide the possibility to pass the 'filter-node-name' parameter to the
> block-stream job as it is done for the commit block job. That will be
> needed for further iotests implementations.
>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
[...]
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 0b8ccd3..1db6ce1 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -2524,6 +2524,11 @@
>  #            'stop' and 'enospc' can only be used if the block device
>  #            supports io-status (see BlockInfo).  Since 1.3.
>  #
> +# @filter-node-name: the node name that should be assigned to the
> +#                    filter driver that the stream job inserts into the graph
> +#                    above @device. If this option is not given, a node name is
> +#                    autogenerated. (Since: 5.1)

It's (Since: 5.2) now.

> +#
>  # @auto-finalize: When false, this job will wait in a PENDING state after it has
>  #                 finished its work, waiting for @block-job-finalize before
>  #                 making any block graph changes.
> @@ -2554,6 +2559,7 @@
>    'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
>              '*base-node': 'str', '*backing-file': 'str', '*speed': 'int',
>              '*on-error': 'BlockdevOnError',
> +            '*filter-node-name': 'str',
>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
>  
>  ##


