Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A1D492CF5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:06:26 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9ssC-00069o-TT
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:06:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n9sp7-0004Qa-Dd
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1n9sp4-0004Nj-V5
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 13:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642528990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/W+jvV1R42VRScf0GKQ7ACWQqqbDZVb7VDb8WEwEsHw=;
 b=eeK6ZKZusm86Fxy4n5KYyHbedfK2CjTnE9/mKOwVFGCg4yucRBofdx8IGhtvDnijo9wiqh
 GoY4vp0tAa21t06BKpNLOy+7o0E+y0X8AYDyGWzhIEY0eY3C1KNv7f6Xvi6kEQiUqx8I7/
 gmVI3Acup4Jvhij7kw/bm8sCMCmcQ34=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-1tS1h2z5N9mQDxUKeHulrg-1; Tue, 18 Jan 2022 13:03:06 -0500
X-MC-Unique: 1tS1h2z5N9mQDxUKeHulrg-1
Received: by mail-lf1-f69.google.com with SMTP id
 k11-20020a0565123d8b00b00432719f58dbso2126383lfv.22
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 10:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/W+jvV1R42VRScf0GKQ7ACWQqqbDZVb7VDb8WEwEsHw=;
 b=BHUtxfhKJCWBbT1v4z2Fo0noyYZlCo9DnJ8XIzr/UsW9lew9JJETaRTwYemWGcNCNl
 OQzGVkKNx8X1rZyBl8v2Q0eaeFH4Vdvkn09gLc0fjYG42778yBfRVetTjxXbG1FONvwX
 TXIEjPs3OlU8Y0TdCkoOBrQj287fblaOlrKJMvRP6KUxghXoyj0c1pwUak+o4BvPjGxu
 i5s+MCTD//FTRXT3z7Sogi/eZ/5jODSVh4lzNhtX4ejMfPm7B6rjWuEkzlN1GLYqPQ5i
 bCqKdVgNRpS2EmQ4RrxJUDuo2No+xIRNYXtkdH0gSrTpmKok5fGKzMES96a0wF6VPQTH
 zK9A==
X-Gm-Message-State: AOAM531URR2vgwwHVnrGytUgIwjUCXRd+Zc9HFCAOYw6pgFnPJ7slBIa
 lrgcRJ4kVtrdVtUpTSnr4U22HBYHgWGi/dbfEY375ppMXd9R4bY1pfwOci2X/DkXDWAaU8ZuK6N
 0fBzo/1RBOuRS7f9one1ITCifxfajIpE=
X-Received: by 2002:a2e:8e74:: with SMTP id t20mr2123833ljk.293.1642528984825; 
 Tue, 18 Jan 2022 10:03:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwINJcFqegV/bq0i2brE9ELAEIOleftDThxeSrXC67kZBcQcJHFX64KwfIhBLRVel+IhkSlNIOSoI2WW76rs4Y=
X-Received: by 2002:a2e:8e74:: with SMTP id t20mr2123801ljk.293.1642528984362; 
 Tue, 18 Jan 2022 10:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20220118170000.49423-1-hreitz@redhat.com>
 <20220118170000.49423-3-hreitz@redhat.com>
In-Reply-To: <20220118170000.49423-3-hreitz@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 18 Jan 2022 20:02:48 +0200
Message-ID: <CAMRbyys52dOnK6pw6spRd6SZ9bvWG4OGw6faG0KcSA=-HgsvYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iotests/block-status-cache: New test
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 7:12 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> Add a new test to verify that want_zero=false block-status calls do not
> pollute the block-status cache for want_zero=true calls.
>
> We check want_zero=true calls and their results using `qemu-img map`
> (over NBD), and want_zero=false calls also using `qemu-img map` over
> NBD, but using the qemu:allocation-depth context.
>
> (This test case cannot be integrated into nbd-qemu-allocation, because
> that is a qcow2 test, and this is a raw test.)
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/tests/block-status-cache   | 139 ++++++++++++++++++
>  .../qemu-iotests/tests/block-status-cache.out |   5 +
>  2 files changed, 144 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/block-status-cache
>  create mode 100644 tests/qemu-iotests/tests/block-status-cache.out
>
> diff --git a/tests/qemu-iotests/tests/block-status-cache b/tests/qemu-iotests/tests/block-status-cache
> new file mode 100755
> index 0000000000..6fa10bb8f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/block-status-cache
> @@ -0,0 +1,139 @@
> +#!/usr/bin/env python3
> +# group: rw quick
> +#
> +# Test cases for the block-status cache.
> +#
> +# Copyright (C) 2022 Red Hat, Inc.
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
> +import os
> +import signal
> +import iotests
> +from iotests import qemu_img_create, qemu_img_pipe, qemu_nbd
> +
> +
> +image_size = 1 * 1024 * 1024
> +test_img = os.path.join(iotests.test_dir, 'test.img')
> +
> +nbd_pidfile = os.path.join(iotests.test_dir, 'nbd.pid')
> +nbd_sock = os.path.join(iotests.sock_dir, 'nbd.sock')
> +
> +
> +class TestBscWithNbd(iotests.QMPTestCase):
> +    def setUp(self) -> None:
> +        """Just create an empty image with a read-only NBD server on it"""
> +        assert qemu_img_create('-f', iotests.imgfmt, test_img,
> +                               str(image_size)) == 0
> +
> +        # Pass --allocation-depth to enable the qemu:allocation-depth context,
> +        # which we are going to query to provoke a block-status inquiry with
> +        # want_zero=false.
> +        assert qemu_nbd(f'--socket={nbd_sock}',
> +                        f'--format={iotests.imgfmt}',
> +                        '--persistent',
> +                        '--allocation-depth',
> +                        '--read-only',
> +                        f'--pid-file={nbd_pidfile}',
> +                        test_img) \
> +            == 0
> +
> +    def tearDown(self) -> None:
> +        with open(nbd_pidfile, encoding='utf-8') as f:
> +            pid = int(f.read())
> +        os.kill(pid, signal.SIGTERM)
> +        os.remove(nbd_pidfile)
> +        os.remove(test_img)
> +
> +    def test_with_zero_bug(self) -> None:
> +        """
> +        Verify that the block-status cache is not corrupted by a
> +        want_zero=false call.
> +        We can provoke a want_zero=false call with `qemu-img map` over NBD with
> +        x-dirty-bitmap=qemu:allocation-depth, so we first run a normal `map`
> +        (which results in want_zero=true), then using said
> +        qemu:allocation-depth context, and finally another normal `map` to
> +        verify that the cache has not been corrupted.
> +        """
> +
> +        nbd_img_opts = f'driver=nbd,server.type=unix,server.path={nbd_sock}'
> +        nbd_img_opts_alloc_depth = nbd_img_opts + \
> +            ',x-dirty-bitmap=qemu:allocation-depth'
> +
> +        # Normal map, results in want_zero=true.
> +        # This will probably detect an allocated data sector first (qemu likes
> +        # to allocate the first sector to facilitate alignment probing), and
> +        # then the rest to be zero.  The BSC will thus contain (if anything)
> +        # one range covering the first sector.
> +        map_pre = qemu_img_pipe('map', '--output=json', '--image-opts',
> +                                nbd_img_opts)
> +
> +        # qemu:allocation-depth maps for want_zero=false.
> +        # want_zero=false should (with the file driver, which the server is
> +        # using) report everything as data.  While this is sufficient for
> +        # want_zero=false, this is nothing that should end up in the
> +        # block-status cache.
> +        # Due to a bug, this information did end up in the cache, though, and
> +        # this would lead to wrong information being returned on subsequent
> +        # want_zero=true calls.
> +        #
> +        # We need to run this map twice: On the first call, we probably still
> +        # have the first sector in the cache, and so this will be served from
> +        # the cache; and only the subsequent range will be queried from the
> +        # block driver.  This subsequent range will then be entered into the
> +        # cache.
> +        # If we did a want_zero=true call at this point, we would thus get
> +        # correct information: The first sector is not covered by the cache, so
> +        # we would get fresh block-status information from the driver, which
> +        # would return a data range, and this would then go into the cache,
> +        # evicting the wrong range from the want_zero=false call before.
> +        #
> +        # Therefore, we need a second want_zero=false map to reproduce:
> +        # Since the first sector is not in the cache, the query for its status
> +        # will go to the driver, which will return a result that reports the
> +        # whole image to be a single data area.  This result will then go into
> +        # the cache, and so the cache will then report the whole image to
> +        # contain data.
> +        #
> +        # Note that once the cache reports the whole image to contain data, any
> +        # subsequent map operation will be served from the cache, and so we can
> +        # never loop too many times here.
> +        for _ in range(2):
> +            # (Ignore the result, this is just to contaminate the cache)
> +            qemu_img_pipe('map', '--output=json', '--image-opts',
> +                          nbd_img_opts_alloc_depth)
> +
> +        # Now let's see whether the cache reports everything as data, or
> +        # whether we get correct information (i.e. the same as we got on our
> +        # first attempt).
> +        map_post = qemu_img_pipe('map', '--output=json', '--image-opts',
> +                                 nbd_img_opts)
> +
> +        if map_pre != map_post:
> +            print('ERROR: Map information differs before and after querying ' +
> +                  'qemu:allocation-depth')
> +            print('Before:')
> +            print(map_pre)
> +            print('After:')
> +            print(map_post)
> +
> +            self.fail("Map information differs")
> +
> +
> +if __name__ == '__main__':
> +    # The block-status cache only works on the protocol layer, so to test it,
> +    # we can only use the raw format
> +    iotests.main(supported_fmts=['raw'],
> +                 supported_protocols=['file'])
> diff --git a/tests/qemu-iotests/tests/block-status-cache.out b/tests/qemu-iotests/tests/block-status-cache.out
> new file mode 100644
> index 0000000000..ae1213e6f8
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/block-status-cache.out
> @@ -0,0 +1,5 @@
> +.
> +----------------------------------------------------------------------
> +Ran 1 tests
> +
> +OK
> --
> 2.33.1
>

The out file is not very useful, and even fragile - if the test framework
will change the output format, the test will fail. Ideally we depend only
on the relevant output of our tools, and using a different version of the test
framework on replacing it (e.g pytest) will not require modifying the out
files.

Regardless I would like to see this fix merged and this issue already
exists in other tests. Some tests in tests/ do have useful output that can
make debugging failures easier.

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


