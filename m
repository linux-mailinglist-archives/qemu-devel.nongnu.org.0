Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B188C3BE675
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:41:37 +0200 (CEST)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14zo-0007zC-R5
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m14yo-0007By-9X
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m14yl-0000zY-B1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625654428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fxHBeb7YWNaFyxh94EJvc2cnScr0al05ZVNEw36Q92U=;
 b=eHz/5xWvbzoeQzxrDsbZEhaNNPeWXyfCbVkeACDmN3+Sqok86TJEnspfp0wYwsrtH5G1GJ
 xuvq0UfNUERYNBRnRK/20u+Eej96hzdtlHVcWU6HKhGs76saAZSFxEDRqQFqRChWnl0mbk
 KsNZ9qmONvi73eLt7iSjMFBkAzv1w+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-5TX2s6gHNPWQqJDZHey7pA-1; Wed, 07 Jul 2021 06:40:27 -0400
X-MC-Unique: 5TX2s6gHNPWQqJDZHey7pA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 454301084F5F;
 Wed,  7 Jul 2021 10:40:26 +0000 (UTC)
Received: from redhat.com (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A0A60BD9;
 Wed,  7 Jul 2021 10:40:23 +0000 (UTC)
Date: Wed, 7 Jul 2021 12:40:22 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 6/6] iotests/fuse-allow-other: Test allow-other
Message-ID: <YOWElpoQUfM1R559@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
 <20210625142317.271673-7-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210625142317.271673-7-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.06.2021 um 16:23 hat Max Reitz geschrieben:
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/fuse-allow-other     | 175 ++++++++++++++++++
>  tests/qemu-iotests/tests/fuse-allow-other.out |  88 +++++++++
>  2 files changed, 263 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/fuse-allow-other
>  create mode 100644 tests/qemu-iotests/tests/fuse-allow-other.out
> 
> diff --git a/tests/qemu-iotests/tests/fuse-allow-other b/tests/qemu-iotests/tests/fuse-allow-other
> new file mode 100755
> index 0000000000..a513dbce66
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/fuse-allow-other
> @@ -0,0 +1,175 @@
> +#!/usr/bin/env bash
> +# group: rw
> +#
> +# Test FUSE exports' allow-other option
> +#
> +# Copyright (C) 2021 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +seq=$(basename "$0")
> +echo "QA output created by $seq"
> +
> +status=1	# failure is the default!
> +
> +_cleanup()
> +{
> +    _cleanup_qemu
> +    _cleanup_test_img
> +    rm -f "$EXT_MP"
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +. ../common.rc
> +. ../common.filter
> +. ../common.qemu
> +
> +_supported_fmt generic
> +
> +_supported_proto file # We create the FUSE export manually
> +
> +sudo -n -u nobody true || \
> +    _notrun 'Password-less sudo as nobody required to test allow_other'
> +
> +# $1: Export ID
> +# $2: Options (beyond the node-name and ID)
> +# $3: Expected return value (defaults to 'return')
> +# $4: Node to export (defaults to 'node-format')
> +fuse_export_add()
> +{
> +    allow_other_not_supported='option allow_other only allowed if'
> +
> +    output=$(
> +        success_or_failure=yes _send_qemu_cmd $QEMU_HANDLE \
> +            "{'execute': 'block-export-add',
> +              'arguments': {
> +                  'type': 'fuse',
> +                  'id': '$1',
> +                  'node-name': '${4:-node-format}',
> +                  $2
> +              } }" \
> +            "${3:-return}" \
> +            "$allow_other_not_supported" \
> +            | _filter_imgfmt
> +    )
> +
> +    if echo "$output" | grep -q "$allow_other_not_supported"; then
> +        # Shut down qemu gracefully so it can unmount the export
> +        _send_qemu_cmd $QEMU_HANDLE \
> +            "{'execute': 'quit'}" \
> +            'return'
> +
> +        wait=yes _cleanup_qemu
> +
> +        _notrun "allow_other not supported"
> +    fi
> +
> +    echo "$output"
> +}
> +
> +EXT_MP="$TEST_DIR/fuse-export"
> +
> +_make_test_img 64k
> +touch "$EXT_MP"
> +
> +echo
> +echo '=== Test permissions ==='
> +
> +# Test that you can only change permissions on the export with allow-other=true.
> +# We cannot really test the primary reason behind allow-other (i.e. to allow
> +# users other than the current one access to the export), because for that we
> +# would need sudo, which realistically nobody will allow this test to use.
> +# What we can do is test that allow-other=true also enables default_permissions,
> +# i.e. whether we can still read from the file if we remove the read permission.

I don't think this comment is accurate any more now that you're actually
using sudo.

> +# $1: allow-other value ('true' or 'false')

on/off/auto, actually.

I can fix this up while applying, removing the comment block above, and
adjusting this line.

Kevin


