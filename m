Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E956913AF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 23:47:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQFgW-0005cc-HM; Thu, 09 Feb 2023 17:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQFgT-0005c3-TG
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:46:29 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQFgS-00069o-48
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 17:46:29 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o36so2585551wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 14:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HVKJaPqjeSA03fz8B69YBoP2f+1NhoBzN/XPmsAD3sU=;
 b=cV9wWTlMLZkZSUIiymBRaNQgD7FO8ozXzemYhK45uBu/eV6TvFjy3WqMigY/M/RF56
 zmRz1myWY05O7TuUwj9jVkgcP6BNW6HgnLkQNUPvJTmkW9DFBZ0m1SunzSJ+vGqISBAz
 p7U8pA9CuJ7oUpmpR1XbFPgREJA1QloO/TAKXN6FlOv0+OPkZHCElenGntlliRLk8SdS
 ip+IXnWF77uXYNjQNiLua9TvZ3CiPEOkAFt4AnPsCvHOxQ75qD/8wdv2SHiYm3DKc1zg
 QPxuZm+blGzK3gVu9elb2YTvFb9FmnK64ohH1UkJcnTTCwxjdzGbLFqyWJUqIa3vBvyK
 8Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HVKJaPqjeSA03fz8B69YBoP2f+1NhoBzN/XPmsAD3sU=;
 b=SC9jllTEW7rzGnpiLUUIfAcOvdntFhTg3PecOWvf6QRJx+8m4jYzzMduJlqs0VcXSR
 9+890OzWDdBHocKV2hqdj2IqEXeJaVIA5ZwCPDUe2RHWWL6VPGZ7DYCsgvS1cjDPEAPz
 73FDoqAAToajSilAoEoNMYyQo/VnLjXNwY/+IiKz/etRtXSlFTV07ZOoPOUozHkMWDn1
 OVF8szxPekdHcxQMQoTh/zVSDlLqjKN0ePHV/q9ebLr0mEezLK/SErc5agCn5mQrZ7k9
 YJA9pVPp2+qg1a0n+one3IYSiKyyKDFxWVCzzEO2gdMIiHi6usX6u/60x8HCBQFHlMoj
 fdZw==
X-Gm-Message-State: AO0yUKWp/sapnF6m4VMliwjuNYY86VMlBfiO52IymBdUMpAAHiz1d15H
 epVJB2d6lwubkcL7UyTknifibQ==
X-Google-Smtp-Source: AK7set8yRrFHt+oQhDnHnRObTvxTvnfoxt4lDA7U2XnpW5hcn8itZtaAvs/vqnFHvRoixX55GoVDTA==
X-Received: by 2002:a05:600c:3b8b:b0:3df:f124:f997 with SMTP id
 n11-20020a05600c3b8b00b003dff124f997mr7766057wms.19.1675982786102; 
 Thu, 09 Feb 2023 14:46:26 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c4eca00b003dec22de1b1sm3424052wmq.10.2023.02.09.14.46.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 14:46:25 -0800 (PST)
Message-ID: <9a51b2a6-2e56-d090-5083-b710048fdbbc@linaro.org>
Date: Thu, 9 Feb 2023 23:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v7 2/2] Update bench-code for addressing CI problem
Content-Language: en-US
To: ling xu <ling1.xu@intel.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, Zhou Zhao
 <zhou.zhao@intel.com>, Jun Jin <jun.i.jin@intel.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20221116152923.1087185-1-ling1.xu@intel.com>
 <20221116152923.1087185-3-ling1.xu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221116152923.1087185-3-ling1.xu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/11/22 16:29, ling xu wrote:
> Unit test code is in test-xbzrle.c, and benchmark code is in xbzrle-bench.c
> for performance benchmarking. we have modified xbzrle-bench.c to address
> CI problem.
> 
> Signed-off-by: ling xu <ling1.xu@intel.com>
> Co-authored-by: Zhou Zhao <zhou.zhao@intel.com>
> Co-authored-by: Jun Jin <jun.i.jin@intel.com>
> ---
>   tests/bench/meson.build    |   4 +
>   tests/bench/xbzrle-bench.c | 469 +++++++++++++++++++++++++++++++++++++
>   tests/unit/test-xbzrle.c   |  39 ++-
>   3 files changed, 507 insertions(+), 5 deletions(-)
>   create mode 100644 tests/bench/xbzrle-bench.c


> diff --git a/tests/bench/xbzrle-bench.c b/tests/bench/xbzrle-bench.c
> new file mode 100644
> index 0000000000..8848a3a32d
> --- /dev/null
> +++ b/tests/bench/xbzrle-bench.c
> @@ -0,0 +1,469 @@
> +/*
> + * Xor Based Zero Run Length Encoding unit tests.
> + *
> + * Copyright 2013 Red Hat, Inc. and/or its affiliates
> + *
> + * Authors:
> + *  Orit Wasserman  <owasserm@redhat.com>

Is Orit the real author? Or is it based on migration/xbzrle.c?

> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/cutils.h"
> +#include "../migration/xbzrle.h"

Interesting migration include path. Similarly:

$ git grep -F '#include "../' tests | egrep -v 
'(../libqtest.h|tests/tcg/mips|../multiarch)'
tests/qtest/netdev-socket.c:12:#include "../unit/socket-helpers.h"
tests/unit/test-qgraph.c:20:#include "../qtest/libqos/qgraph.h"
tests/unit/test-qgraph.c:21:#include "../qtest/libqos/qgraph_internal.h"

tests/migration/aarch64/a-b-kernel.S:14:#include "../migration-test.h"
tests/unit/test-vmstate.c:27:#include "../migration/migration.h"
tests/unit/test-vmstate.c:30:#include "../migration/qemu-file.h"
tests/unit/test-vmstate.c:31:#include "../migration/savevm.h"
tests/unit/test-xbzrle.c:15:#include "../migration/xbzrle.h"

$ ls -1 migration/*.h
migration/block.h
migration/channel-block.h
migration/channel.h
migration/dirtyrate.h
migration/exec.h
migration/fd.h
migration/migration.h      [*]
migration/multifd.h
migration/page_cache.h
migration/postcopy-ram.h
migration/qemu-file.h      [*]
migration/ram.h
migration/rdma.h
migration/savevm.h         [*]
migration/socket.h
migration/threadinfo.h
migration/tls.h
migration/trace.h
migration/xbzrle.h         [*]
migration/yank_functions.h

$ ls -1 include/migration/*.h
include/migration/blocker.h
include/migration/colo.h
include/migration/cpu.h
include/migration/failover.h
include/migration/global_state.h
include/migration/misc.h
include/migration/qemu-file-types.h
include/migration/register.h
include/migration/snapshot.h
include/migration/vmstate.h

Do the 4 files marked [*] belong to include/migration/?

