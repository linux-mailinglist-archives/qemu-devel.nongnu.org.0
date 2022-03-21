Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6B94E2FCA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:18:01 +0100 (CET)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMbQ-00066k-7J
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:18:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMZf-0005Dy-78
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWMZa-000563-OK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647886566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BCa2AXz+Wsx+lownzOY8oJn2oxUe8++ZpYZaiAKkyEs=;
 b=RlbF8HoL9VHM4zw1vxxeO0R5169vrCJSUtyEbSK3M9fbDquHoZfG1hB6yQ1oEzbSZnt4zZ
 57eEdaQYu6Bb+Rb+QbyU2MRMGF5bZJyEMCyIz5tEu/TLGMUU5+ZMKFpaQzd/5nQnw60Std
 g9dZDlsc0fKZ0hlHqMz6RzuQYppPnRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-pJQlFL9hMmi3Qmx9Hjr8sg-1; Mon, 21 Mar 2022 14:16:02 -0400
X-MC-Unique: pJQlFL9hMmi3Qmx9Hjr8sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E82802809;
 Mon, 21 Mar 2022 18:16:02 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D0D40CF8FB;
 Mon, 21 Mar 2022 18:16:02 +0000 (UTC)
Date: Mon, 21 Mar 2022 13:16:00 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 14/15] iotests: remove qemu_io_silent() and
 qemu_io_silent_check().
Message-ID: <20220321181600.wblgnqaqhjkkf27z@redhat.com>
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-15-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220318203655.676907-15-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 18, 2022 at 04:36:54PM -0400, John Snow wrote:
> Like qemu-img, qemu-io returning 0 should be the norm and not the
> exception. Remove all calls to qemu_io_silent that just assert the
> return code is zero (That's every last call, as it turns out), and
> replace them with a normal qemu_io() call.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/216                        | 12 +++++-----
>  tests/qemu-iotests/218                        |  5 ++---
>  tests/qemu-iotests/224                        |  4 ++--
>  tests/qemu-iotests/258                        | 12 +++++-----
>  tests/qemu-iotests/298                        | 16 ++++++--------
>  tests/qemu-iotests/310                        | 22 +++++++++----------
>  tests/qemu-iotests/iotests.py                 | 16 --------------
>  tests/qemu-iotests/tests/image-fleecing       |  4 ++--
>  .../tests/mirror-ready-cancel-error           |  2 +-
>  .../qemu-iotests/tests/stream-error-on-reset  |  4 ++--
>  10 files changed, 39 insertions(+), 58 deletions(-)

> +++ b/tests/qemu-iotests/258
> @@ -21,7 +21,7 @@
>  # Creator/Owner: Max Reitz <mreitz@redhat.com>
>  
>  import iotests
> -from iotests import log, qemu_img, qemu_io_silent, \
> +from iotests import log, qemu_img, qemu_io, \
>          filter_qmp_testfiles, filter_qmp_imgfmt
>  
>  # Returns a node for blockdev-add
> @@ -86,15 +86,15 @@ def test_concurrent_finish(write_to_stream_node):
>          if write_to_stream_node:
>              # This is what (most of the time) makes commit finish
>              # earlier and then pull in stream
> -            assert qemu_io_silent(node2_path,
> -                                  '-c', 'write %iK 64K' % (65536 - 192),
> -                                  '-c', 'write %iK 64K' % (65536 -  64)) == 0
> +            qemu_io(node2_path,
> +                    '-c', 'write %iK 64K' % (65536 - 192),
> +                    '-c', 'write %iK 64K' % (65536 -  64))
>  
>              stream_throttle='tg'
>          else:
>              # And this makes stream finish earlier
> -            assert qemu_io_silent(node1_path,
> -                                  '-c', 'write %iK 64K' % (65536 - 64)) == 0
> +            qemu_io(node1_path,
> +                    '-c', 'write %iK 64K' % (65536 - 64))

This could fit on one line.  But the split matches the instance
earlier in the hunk that needed two lines.

>  
>              commit_throttle='tg'
>  
> diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
> index fae72211b1..9d6d95d953 100755
> --- a/tests/qemu-iotests/298
> +++ b/tests/qemu-iotests/298
> @@ -129,16 +129,14 @@ class TestTruncate(iotests.QMPTestCase):
>          os.remove(refdisk)
>  
>      def do_test(self, prealloc_mode, new_size):
> -        ret = iotests.qemu_io_silent('--image-opts', '-c', 'write 0 10M', '-c',
> -                                     f'truncate -m {prealloc_mode} {new_size}',
> -                                     drive_opts)
> -        self.assertEqual(ret, 0)
> +        iotests.qemu_io('--image-opts', '-c', 'write 0 10M', '-c',
> +                        f'truncate -m {prealloc_mode} {new_size}',
> +                        drive_opts)
>  
> -        ret = iotests.qemu_io_silent('-f', iotests.imgfmt, '-c', 'write 0 10M',
> -                                     '-c',
> -                                     f'truncate -m {prealloc_mode} {new_size}',
> -                                     refdisk)
> -        self.assertEqual(ret, 0)
> +        iotests.qemu_io('-f', iotests.imgfmt, '-c', 'write 0 10M',
> +                        '-c',
> +                        f'truncate -m {prealloc_mode} {new_size}',

And as long as I'm pontificating on line wraps, putting '-c' and
f'truncate...' on the same line might make sense.

At any rate, whether or not you choose to do anything about my
observations on cosmetic line wraps:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


