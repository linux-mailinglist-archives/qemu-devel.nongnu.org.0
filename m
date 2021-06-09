Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D03A1BBE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 19:26:23 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr1yA-0002HW-Km
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 13:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr1xN-0001Xp-7d
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr1xK-0000Qc-2g
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 13:25:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623259528;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0mt3eraojlsrWsQg7WGdCaN1d7k15mZ0ckv8S/+Ac4=;
 b=LmIqDArYu7LcEw6TExLg6jTnTm+kSKmkkPvu1fe1QkcCxI9C7IuyBbVAmo4PR18xMWGj1J
 e+IBxa5P2TjbF7fCF7a+ykmnfj9AioBshZMLyLXuQSks+xF0If6DnrpymN8hj6UohKWHu5
 NmSc9lc73NBWeBRnT5z4kebfgCviL90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-DHn5h6HWOM2m7Pf9mJhQsw-1; Wed, 09 Jun 2021 13:25:24 -0400
X-MC-Unique: DHn5h6HWOM2m7Pf9mJhQsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CA56101F7AA;
 Wed,  9 Jun 2021 17:25:23 +0000 (UTC)
Received: from redhat.com (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D415D6BA;
 Wed,  9 Jun 2021 17:25:17 +0000 (UTC)
Date: Wed, 9 Jun 2021 18:25:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/4] scripts: helper to generate x86_64 CPU ABI compat
 info
Message-ID: <YMD5Z5TJALZOaYW1@redhat.com>
References: <20210607135843.196595-1-berrange@redhat.com>
 <20210607135843.196595-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210607135843.196595-4-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 02:58:42PM +0100, Daniel P. Berrangé wrote:
> This script is what is used to generate the docs data table in:
> 
>   docs/system/cpu-models-x86-abi.csv
> 
> It can be useful to run if adding new CPU models / versions and
> the csv needs updating.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  scripts/cpu-x86-uarch-abi.py | 194 +++++++++++++++++++++++++++++++++++
>  1 file changed, 194 insertions(+)
>  create mode 100644 scripts/cpu-x86-uarch-abi.py

Sorry I messed up just before sending this when I deleted some
code and incorrectly fixed up argv handling. Since you mentioned
you've queued it, it needs two changes

> 
> diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
> new file mode 100644
> index 0000000000..08acc52a81
> --- /dev/null
> +++ b/scripts/cpu-x86-uarch-abi.py
> @@ -0,0 +1,194 @@
> +#!/usr/bin/python3
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# A script to generate a CSV file showing the x86_64 ABI
> +# compatibility levels for each CPU model.
> +#
> +
> +from qemu import qmp
> +import sys
> +
> +if len(sys.argv) != 1:

s/1/2/

> +    print("syntax: %s QMP-SOCK\n\n" % __file__ +
> +          "Where QMP-SOCK points to a QEMU process such as\n\n" +
> +          " # qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait " +
> +          "-display none -accel kvm", file=sys.stderr)
> +    sys.exit(1)
> +
> +# Mandatory CPUID features for each microarch ABI level
> +levels = [
> +    [ # x86-64 baseline
> +        "cmov",
> +        "cx8",
> +        "fpu",
> +        "fxsr",
> +        "mmx",
> +        "syscall",
> +        "sse",
> +        "sse2",
> +    ],
> +    [ # x86-64-v2
> +        "cx16",
> +        "lahf-lm",
> +        "popcnt",
> +        "pni",
> +        "sse4.1",
> +        "sse4.2",
> +        "ssse3",
> +    ],
> +    [ # x86-64-v3
> +        "avx",
> +        "avx2",
> +        "bmi1",
> +        "bmi2",
> +        "f16c",
> +        "fma",
> +        "abm",
> +        "movbe",
> +    ],
> +    [ # x86-64-v4
> +        "avx512f",
> +        "avx512bw",
> +        "avx512cd",
> +        "avx512dq",
> +        "avx512vl",
> +    ],
> +]
> +
> +# Assumes externally launched process such as
> +#
> +#   qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait -display none -accel kvm
> +#
> +# Note different results will be obtained with TCG, as
> +# TCG masks out certain features otherwise present in
> +# the CPU model definitions, as does KVM.
> +
> +
> +sock = sys.argv[1]
> +cmd = sys.argv[2]

Delete this line since sys.argv[2] is not required

> +shell = qmp.QEMUMonitorProtocol(sock)
> +shell.connect()
> +
> +models = shell.cmd("query-cpu-definitions")


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


