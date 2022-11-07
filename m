Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF11D61F21A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 12:43:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os0Vq-00023h-Fi; Mon, 07 Nov 2022 06:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os0Vk-00023A-T7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1os0Vi-0005NM-RV
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 06:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667821308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ew/xAPahpZd98ntUUxpRM0rs3imNPEXVgxIEF5H2wPQ=;
 b=GeHWrN0ed1qcBR9ypu7ebxHgKkoB2J5Oie6T4C6RscJILIz1oON7gR676Gwc7WvqQIyU7T
 laGE+o+FtNyJ7p/nxPM02sOkrEmYFT2NVvd6q4SX2x2hy+FLQQNr1eqByu8+3XqUpkSjL2
 nberXKG5OKPnvnKi4MhAqwcKGbbsOhE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-6TmAQduXN0GjQIi0RP29-w-1; Mon, 07 Nov 2022 06:41:47 -0500
X-MC-Unique: 6TmAQduXN0GjQIi0RP29-w-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc40-20020a1709078a2800b007ae024e5e82so6172120ejc.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 03:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ew/xAPahpZd98ntUUxpRM0rs3imNPEXVgxIEF5H2wPQ=;
 b=CY0JceJDnDXirBlW674dr18FxyUcZTciJZj8bfpg4PeqrsYokh+5odyqKmEWbXk8/p
 oWOhH1ixhIDRdZBZu8AtIf0aLbW7fmCwuSHxq6Z4tJyhky5a9n9TYHq4PZ9TzvptNrpK
 0x9RsoCG29AAhrw1bP7rxlj9CLxV4Xo6tkBRiECCEVUb7nOhoijXHi5u/xWuYmlTTrko
 PjACZCnov2nUdVzNi+hEUPSAZjzNB7kAJDDP8S+Z6mO7x+npHFzLcxdOKKBXJJd8LU0b
 L7hpBxsRMaPzgUMcSFvVQKbmmwnreUUYNsmMBTMBHaVh5yuPBJ6TzcfuS5vPgAGfrgzm
 3iiA==
X-Gm-Message-State: ACrzQf0A7YYGHSwLlUMLGA2bCnGJzuZXcZB+4i9RHXt/owyEcYf+vny1
 nyYQGvznNPpbU81x7hb+o7qP4lkD8+qGPq08Ilrr0ga8gTRqHV0sSPY3AHoP6jxcZHMQ+2XR+aI
 4HnUsEU8czJiyj/0=
X-Received: by 2002:a17:906:fd85:b0:77b:b538:6472 with SMTP id
 xa5-20020a170906fd8500b0077bb5386472mr47376831ejb.48.1667821306432; 
 Mon, 07 Nov 2022 03:41:46 -0800 (PST)
X-Google-Smtp-Source: AMsMyM71I7Pk/+Jmmz6gFmpUCzMd5INwA9CEpINXkpwHDLc1/kx2la67WCD4EwV4ykHigFFAX0klOQ==
X-Received: by 2002:a17:906:fd85:b0:77b:b538:6472 with SMTP id
 xa5-20020a170906fd8500b0077bb5386472mr47376805ejb.48.1667821306152; 
 Mon, 07 Nov 2022 03:41:46 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 h11-20020aa7c60b000000b00461aaa39efbsm4128412edq.0.2022.11.07.03.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 03:41:45 -0800 (PST)
Message-ID: <8fac5092-86bb-869a-7a75-067d2cb11169@redhat.com>
Date: Mon, 7 Nov 2022 12:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] iotests: Test qemu-img checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-3-nsoffer@redhat.com>
 <81bd7016-70e7-b3de-2181-5610724f55d8@redhat.com>
 <CAMRbyysLRw6oLpagLyQR3KeRNcW_aPuckMvqVviWiHhhENNH2A@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAMRbyysLRw6oLpagLyQR3KeRNcW_aPuckMvqVviWiHhhENNH2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30.10.22 18:38, Nir Soffer wrote:
> On Wed, Oct 26, 2022 at 4:31 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 01.09.22 16:32, Nir Soffer wrote:
>     > Add simple tests creating an image with all kinds of extents,
>     different
>     > formats, different backing chain, different protocol, and different
>     > image options. Since all images have the same guest visible
>     content they
>     > must have the same checksum.
>     >
>     > To help debugging in case of failures, the output includes a
>     json map of
>     > every test image.
>     >
>     > Signed-off-by: Nir Soffer <nsoffer@redhat.com>
>     > ---
>     >   tests/qemu-iotests/tests/qemu-img-checksum    | 149
>     ++++++++++++++++++
>     >   .../qemu-iotests/tests/qemu-img-checksum.out  |  74 +++++++++
>     >   2 files changed, 223 insertions(+)
>     >   create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
>     >   create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out
>     >
>     > diff --git a/tests/qemu-iotests/tests/qemu-img-checksum
>     b/tests/qemu-iotests/tests/qemu-img-checksum
>     > new file mode 100755
>     > index 0000000000..3a85ba33f2
>     > --- /dev/null
>     > +++ b/tests/qemu-iotests/tests/qemu-img-checksum
>     > @@ -0,0 +1,149 @@
>     > +#!/usr/bin/env python3
>     > +# group: rw auto quick
>     > +#
>     > +# Test cases for qemu-img checksum.
>     > +#
>     > +# Copyright (C) 2022 Red Hat, Inc.
>     > +#
>     > +# This program is free software; you can redistribute it and/or
>     modify
>     > +# it under the terms of the GNU General Public License as
>     published by
>     > +# the Free Software Foundation; either version 2 of the License, or
>     > +# (at your option) any later version.
>     > +#
>     > +# This program is distributed in the hope that it will be useful,
>     > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>     > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     > +# GNU General Public License for more details.
>     > +#
>     > +# You should have received a copy of the GNU General Public License
>     > +# along with this program.  If not, see
>     <http://www.gnu.org/licenses/>.
>     > +
>     > +import re
>     > +
>     > +import iotests
>     > +
>     > +from iotests import (
>     > +    filter_testfiles,
>     > +    qemu_img,
>     > +    qemu_img_log,
>     > +    qemu_io,
>     > +    qemu_nbd_popen,
>     > +)
>     > +
>     > +
>     > +def checksum_available():
>     > +    out = qemu_img("--help").stdout
>     > +    return re.search(r"\bchecksum .+ filename\b", out) is not None
>     > +
>     > +
>     > +if not checksum_available():
>     > +    iotests.notrun("checksum command not available")
>     > +
>     > +iotests.script_initialize(
>     > +    supported_fmts=["raw", "qcow2"],
>     > +    supported_cache_modes=["none", "writeback"],
>
>     It doesn’t work with writeback, though, because it uses -T none below.
>
>
> Good point
>
>
>     Which by the way is a heavy cost, because I usually run tests in
>     tmpfs,
>     where this won’t work.  Is there any way of not doing the -T none
>     below?
>
>
> Testing using tempfs is problematic since you cannot test -T none.In 
> oVirt
> we alway use /var/tmp which usually uses something that supports 
> direct I/O.
>
> Do we have a way to specify cache mode in the tests, so we can use -T none
> only when the option is set?

`./check` has a `-c` option (e.g. `./check -c none`), which lands in 
`iotests.cachemode`.  That isn’t automatically passed to qemu-img calls, 
but you can do it manually (i.e. `qemu_img_log("checksum", "-T", 
iotests.cachemode, disk_top)` instead of `"-T", "none"`).

>
>     > +    supported_protocols=["file", "nbd"],
>     > +    required_fmts=["raw", "qcow2"],
>     > +)
>     > +
>     > +print()
>     > +print("=== Test images ===")
>     > +print()
>     > +
>     > +disk_raw = iotests.file_path('raw')
>     > +qemu_img("create", "-f", "raw", disk_raw, "10m")
>     > +qemu_io("-f", "raw",
>     > +        "-c", "write -P 0x1 0 2m",      # data
>     > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
>     > +        "-c", "write -z 4m 2m",         # zero allocated
>     > +        "-c", "write -z -u 6m 2m",      # zero hole
>     > +                                        # unallocated
>     > +        disk_raw)
>     > +print(filter_testfiles(disk_raw))
>     > +qemu_img_log("map", "--output", "json", disk_raw)
>     > +
>     > +disk_qcow2 = iotests.file_path('qcow2')
>     > +qemu_img("create", "-f", "qcow2", disk_qcow2, "10m")
>     > +qemu_io("-f", "qcow2",
>     > +        "-c", "write -P 0x1 0 2m",      # data
>     > +        "-c", "write -P 0x0 2m 2m",     # data with zeroes
>     > +        "-c", "write -z 4m 2m",         # zero allocated
>     > +        "-c", "write -z -u 6m 2m",      # zero hole
>     > +                                        # unallocated
>     > +        disk_qcow2)
>     > +print(filter_testfiles(disk_qcow2))
>     > +qemu_img_log("map", "--output", "json", disk_qcow2)
>
>     This isn’t how iotests work, generally.  When run with -qcow2
>     -file, it
>     should only test qcow2 on file, not raw on file, not raw on nbd.
>     Perhaps
>     this way this test could even support other formats than qcow2 and
>     raw.
>
>
> For this type of tests, running the same code with raw, qcow2 (and 
> other formats)
> and using file or nbd is the best way to test this feature - one test 
> verifies all the
> use cases.

Yes, I see, but that’s a general thing in the iotests.  The design is 
such that tests don’t cycle through their test matrix themselves, but 
that they always only test a single combination of format+protocol on 
each run, and the user is responsible for cycling through the desired 
test matrix.

I’m not saying that was definitely the best design decision, but the 
problem now that if a test cycles through its test matrix by itself, it 
must also ensure that it is run only once when the user cycles through 
the same test matrix.  For example, a reasonable run of the iotests 
consists of `./check -raw`, `./check -qcow2`, and `./check -nbd`.  This 
test here would then run in all three configurations, but do the same 
thing every time (specifically, test all of those configurations every 
time).

So there’s a conflict.  Either the test follows the existing design and 
only tests a single configuration, as iotests are expected to do, or we 
have the question of how to deal with the fact that users will run the 
test suite in multiple configurations, but one run of this test would 
already cover them all.

I’m not sternly against cycling through the possible combinations right 
here in the test, but I want to lay out the problems with that approach.

> I can change this to use the current format (raw, qcow2, ...), 
> protocol (file, nbd, ...)
> and cache value (none, writeback), but I'm not sure how this can work 
> with the
> out files. The output from nbd is different from file. Maybe we need 
> different out
> files for file and nbd (qemu-img-checksum.file.out, 
> qemu-img-checksum.nbd.out)?

We already have that for the format (e.g. 178.out.{qcow2,raw}).  If you 
decide to do that, it shouldn’t be too difficult to implement 
(testrunner.py’s `TestRunner.find_reference()`).  Alternatively, it’s 
also possible to basically ignore the reference output and verify the 
expected output right in the test code.

Hanna


