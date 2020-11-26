Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64842C5334
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:46:08 +0100 (CET)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFiy-0000m0-0I
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kiFWG-0005sI-7Z
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:33:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kiFWD-0007IP-OA
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:33:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A4VzM89+B1kbLu4FP1nkCxNu4ki1wkBj7rDJNlLQ1Ec=;
 b=BApxxD8kKFdUeLeWz+ZlHd9SYJKqFwlLts+VnJmPsAH98s7S/MdqnCC3YuUtQR1fYydelz
 u+6IFBwQw5pDfRigsxl93Zxi1P4W5T95OXoqUVTXeyk1H2+yo+DvbKGnc22DClAusN8HBI
 Urkb3+EKyQEHl8oJJl+QCLkT0jmeRC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-e0aTw514OhikCK983ZqxBA-1; Thu, 26 Nov 2020 06:32:54 -0500
X-MC-Unique: e0aTw514OhikCK983ZqxBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCCA680475E;
 Thu, 26 Nov 2020 11:32:52 +0000 (UTC)
Received: from starship (unknown [10.35.206.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDA0760636;
 Thu, 26 Nov 2020 11:32:49 +0000 (UTC)
Message-ID: <2b8297fe6d6a1b4ee2d09bcb5c3a939f55b5a81d.camel@redhat.com>
Subject: Re: [PATCH] iotests: Add test for the regression fixed in c8bf9a9169
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Date: Thu, 26 Nov 2020 13:32:48 +0200
In-Reply-To: <20201125185551.20475-1-berto@igalia.com>
References: <20201125185551.20475-1-berto@igalia.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-11-25 at 19:55 +0100, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> Suggested-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  tests/qemu-iotests/313     | 103 +++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/313.out |  29 +++++++++++
>  tests/qemu-iotests/group   |   1 +
>  3 files changed, 133 insertions(+)
>  create mode 100755 tests/qemu-iotests/313
>  create mode 100644 tests/qemu-iotests/313.out
> 
> diff --git a/tests/qemu-iotests/313 b/tests/qemu-iotests/313
> new file mode 100755
> index 0000000000..0a5202ad49
> --- /dev/null
> +++ b/tests/qemu-iotests/313
> @@ -0,0 +1,103 @@
> +#!/usr/bin/env bash
> +#
> +# Test for the regression fixed in commit c8bf9a9169
> +#
> +# Copyright (C) 2020 Igalia, S.L.
> +# Author: Alberto Garcia <berto@igalia.com>
> +# Based on a test case by Maxim Levitsky <mlevitsk@redhat.com>
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
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>;.
> +#
> +
> +# creator
> +owner=berto@igalia.com
> +
> +seq=`basename $0`
> +echo "QA output created by $seq"
> +
> +status=1    # failure is the default!
> +
> +_cleanup()
> +{
> +    _cleanup_test_img
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +. ./common.rc
> +. ./common.filter
> +
> +_supported_fmt qcow2
> +_supported_proto file
> +_supported_os Linux
> +_unsupported_imgopts cluster_size refcount_bits extended_l2 compat=0.10 data_file
> +
> +# The cluster size must be at least the granularity of the mirror job (4KB)
> +# Note that larger cluster sizes will produce very large images (several GBs)
> +cluster_size=4096
> +refcount_bits=64 # Make it equal to the L2 entry size for convenience
> +options="cluster_size=${cluster_size},refcount_bits=${refcount_bits}"
> +
> +# Number of refcount entries per refcount blocks
> +ref_entries=$(( ${cluster_size} * 8 / ${refcount_bits} ))
> +
> +# Number of data clusters needed to fill a refcount block
> +# Equals ${ref_entries} minus two (one L2 table and one refcount block)
> +data_clusters_per_refblock=$(( ${ref_entries} - 2 ))
> +
> +# Number of entries in the refcount cache
> +ref_blocks=4
> +
> +# Write enough data clusters to fill the refcount cache and allocate
> +# one more refcount block.
> +# Subtract 3 clusters from the total: qcow2 header, refcount table, L1 table
> +total_data_clusters=$(( ${data_clusters_per_refblock} * ${ref_blocks} + 1 - 3 ))
> +
> +# Total size to write in bytes
> +total_size=$(( ${total_data_clusters} * ${cluster_size} ))
> +
> +echo
> +echo '### Create the image'
> +echo
> +TEST_IMG_FILE=$TEST_IMG.base _make_test_img -o $options $total_size | _filter_img_create_size
> +
> +echo
> +echo '### Write data to allocate more refcount blocks than the cache can hold'
> +echo
> +$QEMU_IO -c "write -P 1 0 $total_size" $TEST_IMG.base | _filter_qemu_io
> +
> +echo
> +echo '### Create an overlay'
> +echo
> +_make_test_img -F $IMGFMT -b $TEST_IMG.base -o $options | _filter_img_create_size
> +
> +echo
> +echo '### Fill the overlay with zeroes'
> +echo
> +$QEMU_IO -c "write -z 0 $total_size" $TEST_IMG | _filter_qemu_io
> +
> +echo
> +echo '### Commit changes to the base image'
> +echo
> +$QEMU_IMG commit $TEST_IMG
> +
> +echo
> +echo '### Check the base image'
> +echo
> +$QEMU_IMG check $TEST_IMG.base
> +
> +# success, all done
> +echo "*** done"
> +rm -f $seq.full
> +status=0
> diff --git a/tests/qemu-iotests/313.out b/tests/qemu-iotests/313.out
> new file mode 100644
> index 0000000000..adb9f7bd95
> --- /dev/null
> +++ b/tests/qemu-iotests/313.out
> @@ -0,0 +1,29 @@
> +QA output created by 313
> +
> +### Create the image
> +
> +Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=SIZE
> +
> +### Write data to allocate more refcount blocks than the cache can hold
> +
> +wrote 8347648/8347648 bytes at offset 0
> +7.961 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +### Create an overlay
> +
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=SIZE backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
> +
> +### Fill the overlay with zeroes
> +
> +wrote 8347648/8347648 bytes at offset 0
> +7.961 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +
> +### Commit changes to the base image
> +
> +Image committed.
> +
> +### Check the base image
> +
> +No errors were found on the image.
> +Image end offset: 8396800
> +*** done
> diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
> index 2960dff728..df339f1720 100644
> --- a/tests/qemu-iotests/group
> +++ b/tests/qemu-iotests/group
> @@ -316,3 +316,4 @@
>  305 rw quick
>  307 rw quick export
>  309 rw auto quick
> +313 rw auto quick


Tested this and it reproduces the bug just fine.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



