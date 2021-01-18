Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3812FA266
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:03:31 +0100 (CET)
Received: from localhost ([::1]:39342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1V7y-0002Tt-6c
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1V6Q-0001xH-4y
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l1V6H-0008UG-Ud
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610978503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaUPNb7lmHOsXcm+gxLYWymE4UWZrId02DGDyWUXjh8=;
 b=By7Qe4FOf+R5xK2J/x5C5NGR+Ij4+TLNvqf7eydbk2ZlKvreVPZYPod19IAt0/B5xiohFR
 lt2hQ338guOqJbhpvQARaBjUBcEXDEDjArs+4ubXURe+rGJXwmgr5KOKAAJTYcWM32WJUu
 39s94T9IesMt7dqaPJ7BnElbzFCZ3c4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-9OJu_UcjMLakkPDWjKffww-1; Mon, 18 Jan 2021 09:01:41 -0500
X-MC-Unique: 9OJu_UcjMLakkPDWjKffww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D31DA9CDC1;
 Mon, 18 Jan 2021 14:01:39 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-253.ams2.redhat.com
 [10.36.114.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6593910023AD;
 Mon, 18 Jan 2021 14:01:37 +0000 (UTC)
Subject: Re: [PATCH v4 23/23] simplebench: add bench-backup.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210116214705.822267-24-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <321fd458-d915-b373-5037-a8350f10c13f@redhat.com>
Date: Mon, 18 Jan 2021 15:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210116214705.822267-24-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.01.21 22:47, Vladimir Sementsov-Ogievskiy wrote:
> Add script to benchmark new backup architecture.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench-backup.py | 167 ++++++++++++++++++++++++++++
>   1 file changed, 167 insertions(+)
>   create mode 100755 scripts/simplebench/bench-backup.py
> 
> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
> new file mode 100755
> index 0000000000..2cf7a852e0
> --- /dev/null
> +++ b/scripts/simplebench/bench-backup.py
> @@ -0,0 +1,167 @@
> +#!/usr/bin/env python3
> +#
> +# Bench backup block-job
> +#
> +# Copyright (c) 2020 Virtuozzo International GmbH.
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
> +import argparse
> +import json
> +
> +import simplebench
> +from results_to_text import results_to_text
> +from bench_block_job import bench_block_copy, drv_file, drv_nbd
> +
> +
> +def bench_func(env, case):
> +    """ Handle one "cell" of benchmarking table. """
> +    cmd_options = env['cmd-options'] if 'cmd-options' in env else {}
> +    return bench_block_copy(env['qemu-binary'], env['cmd'],
> +                            cmd_options,
> +                            case['source'], case['target'])
> +
> +
> +def bench(args):
> +    test_cases = []
> +
> +    sources = {}
> +    targets = {}
> +    for d in args.dir:
> +        label, path = d.split(':')  # paths with colon not unsupported

s/ un//, I think.

Adding these comments (and the assert below) instead of using splitn() 
is fine for me.

Max


