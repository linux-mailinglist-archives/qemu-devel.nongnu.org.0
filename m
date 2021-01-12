Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489EA2F333F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:52:02 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzL1d-0003Xl-Cl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzKzx-00024t-T6
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzKzv-0002Y5-QX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610463014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+Kz1a1VZZMX3NmF1elul9loFz996AmeD0BwVXPUVds=;
 b=P0H1eZCR7/WCJnLDr7dXuWeh56E9NM9/23rAhLFspAiD7GB8fE57xz0NgKm8OEA8ZGWHwD
 lnttTwqas4jPQvB5UcEBnGswAi710CBr1bV2OlBhYgfHTlUIWRDTKxlHOBH64l+zt2WsND
 qRU9Weycm1h+sioq/ywFauwBFRW9/9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-Rn10lLAiMnKpEGImDU3omA-1; Tue, 12 Jan 2021 09:50:09 -0500
X-MC-Unique: Rn10lLAiMnKpEGImDU3omA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D99381006C81;
 Tue, 12 Jan 2021 14:50:07 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-115-161.ams2.redhat.com
 [10.36.115.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9447010023AD;
 Tue, 12 Jan 2021 14:50:03 +0000 (UTC)
Subject: Re: [PATCH v3 25/25] simplebench: add bench-backup.py
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-26-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8860dd8a-1a7a-2a5a-3daf-e163a99d8963@redhat.com>
Date: Tue, 12 Jan 2021 15:50:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-26-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 26.10.20 18:18, Vladimir Sementsov-Ogievskiy wrote:
> Add script to benchmark new backup architecture.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   scripts/simplebench/bench-backup.py | 165 ++++++++++++++++++++++++++++
>   1 file changed, 165 insertions(+)
>   create mode 100755 scripts/simplebench/bench-backup.py
Loose review, because I’m not too involved, and this is “just” a 
performance test, too.

Result: Looks good to me, two minor things below.

> diff --git a/scripts/simplebench/bench-backup.py b/scripts/simplebench/bench-backup.py
> new file mode 100755
> index 0000000000..5c62b1a7ed
> --- /dev/null
> +++ b/scripts/simplebench/bench-backup.py

[...]

> +def bench(args):
> +    test_cases = []
> +
> +    sources = {}
> +    targets = {}
> +    for d in args.dir:
> +        label, path = d.split(':')

Should this be d.split(':', 1) to accommodate path names with colons in 
them?

> +        sources[label] = drv_file(path + '/test-source')
> +        targets[label] = drv_file(path + '/test-target')
> +
> +    if args.nbd:
> +        nbd = args.nbd.split(':')
> +        host = nbd[0]
> +        port = '10809' if len(nbd) == 1 else nbd[1]
> +        drv = drv_nbd(host, port)
> +        sources['nbd'] = drv
> +        targets['nbd'] = drv
> +
> +    for t in args.test:
> +        src, dst = t.split(':')
> +
> +        test_cases.append({
> +            'id': t,
> +            'source': sources[src],
> +            'target': targets[dst]
> +        })
> +
> +    binaries = []  # list of (<label>, <path>, [<options>])
> +    for i, q in enumerate(args.env):
> +        name_path = q.split(':')

(Same here)

> +        if len(name_path) == 1:
> +            label = f'q{i}'
> +            path_opts = name_path[0].split(',')
> +        else:
> +            label = name_path[0]
> +            path_opts = name_path[1].split(',')
> +
> +        binaries.append((label, path_opts[0], path_opts[1:]))
> +
> +    test_envs = []
> +
> +    bin_paths = {}
> +    for i, q in enumerate(args.env):
> +        opts = q.split(',')
> +        label_path = opts[0]
> +        opts = opts[1:]
> +
> +        if ':' in label_path:
> +            label, path = label_path.split(':')

(And here)

> +            bin_paths[label] = path
> +        elif label_path in bin_paths:
> +            label = label_path
> +            path = bin_paths[label]
> +        else:
> +            path = label_path
> +            label = f'q{i}'
> +            bin_paths[label] = path

[...]

> +if __name__ == '__main__':
> +    p = argparse.ArgumentParser('Backup benchmark', epilog='''
> +ENV format
> +
> +    (LABEL:PATH|LABEL|PATH)[,max-workers=N][,use-copy-range=(on|off)][,mirror]
> +
> +    LABEL                short name for the binary
> +    PATH                 path to the binary
> +    max-workers          set x-perf.max-workers of backup job
> +    use-copy-range       set x-perf.disable-copy-range of backup job

s/disable/use/?

Max


