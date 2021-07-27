Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839783D7867
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:24:13 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O0C-0003pb-Js
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8NzP-00032A-O2
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:23:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8NzL-0000qT-HA
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8QLxIZ0MiJX2mA6MO66m+iedRHy2Z7GUujwR0nz0eQ=;
 b=IHk4XBJU2nCgqUKutbFg43ABi+r9dAuJsAZCkew/kMgrDtBcb6colVKwckiabyUI3ycvjW
 +DPeUbnngCPT8np8KIDvRWYIrptFGaDcm5Y/MMp04KhjNGRs42W66+nFmDOAQiLOid222Q
 /ppxKpxsLirYYqXFTOJwCT03bTDvNs8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-lmSpagsYNguShmIvyxmaug-1; Tue, 27 Jul 2021 10:23:16 -0400
X-MC-Unique: lmSpagsYNguShmIvyxmaug-1
Received: by mail-wr1-f71.google.com with SMTP id
 n6-20020a5d67c60000b0290153b1422916so1343077wrw.2
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G8QLxIZ0MiJX2mA6MO66m+iedRHy2Z7GUujwR0nz0eQ=;
 b=n+x9bMFX/YagwilyqSZZ68G2aQBOAvTy1ahAB5cYmvkEfGnFqkhTRrRME165YNx6r2
 grYAZAncpPopqj3LU75txB9HQoxJO+cD9RVHuilEhghqcXDOfc/Rjg/faDcsYmx5W0LG
 sLcspIDZ0dV8pOGcrg4zZMGxfocJoY8JQxsZeh05WDe1iEwYP6pTqjFj2kF2AchCs0s7
 Pq1chhjJyBsEAe5Z+sctkNo5aQrHrYl1oMk/kRLaS/I9Wu90DXB2bCqB46PkzoKcfP6v
 HM2F2QUcdeU9qloKcyk8WMmXEBsFldwVkDjobQgkKcEWikYsltCUFXxLlLHsaHxbbazs
 uJlQ==
X-Gm-Message-State: AOAM5313YIcI2qthUKdZjm4jR54E/K1Jibvxz50S9v6k9h1B6XYoxsb+
 nlF5QxwuPUdHDEpHfBN/njfbKe89Lxirs7hzSjjsUp69AMjp+4xqh/qNu79FJkg+lwWzsbyPfq0
 bMFr+eLFc7PU5R3o=
X-Received: by 2002:a05:6000:10d0:: with SMTP id
 b16mr25251850wrx.332.1627395795599; 
 Tue, 27 Jul 2021 07:23:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1zggleon/I9+3HJp7e+BYPiL+WgMQPB227hyyj4CHxAjpp8ilY2hpPXf87IF1sNclbc9ALw==
X-Received: by 2002:a05:6000:10d0:: with SMTP id
 b16mr25251821wrx.332.1627395795366; 
 Tue, 27 Jul 2021 07:23:15 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8352f.dip0.t-ipconnect.de.
 [217.232.53.47])
 by smtp.gmail.com with ESMTPSA id q14sm3563553wrs.8.2021.07.27.07.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 07:23:14 -0700 (PDT)
Subject: Re: Transient fail of iotests 215 and 197
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <YPhX1TakNJjH0RaA@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <31132251-1f39-e830-a0fd-63628529be53@redhat.com>
Date: Tue, 27 Jul 2021 16:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPhX1TakNJjH0RaA@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 19.22, Daniel P. Berrangé wrote:
> Peter caught the following transient fail on the staging tree:
> 
>    https://gitlab.com/qemu-project/qemu/-/jobs/1438817749
> 
> --- /builds/qemu-project/qemu/tests/qemu-iotests/197.out
> +++ 197.out.bad
> @@ -12,13 +12,12 @@
>   128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   read 0/0 bytes at offset 0
>   0 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -read 2147483136/2147483136 bytes at offset 1024
> -2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +./common.rc: Killed                  ( VALGRIND_QEMU="${VALGRIND_QEMU_IO}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
>   read 1024/1024 bytes at offset 3221226496
>   1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Can't use copy-on-read on read-only device
> -2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
> -1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x80010000)
> +2 GiB (0x80000000) bytes     allocated at offset 0 bytes (0x0)
> +1 GiB (0x40000000) bytes not allocated at offset 2 GiB (0x80000000)
>   64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
>   1023.938 MiB (0x3fff0000) bytes not allocated at offset 3 GiB (0xc0010000)
>   No errors were found on the image.
> 
> 
> --- /builds/qemu-project/qemu/tests/qemu-iotests/215.out
> +++ 215.out.bad
> @@ -12,13 +12,12 @@
>   128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   read 0/0 bytes at offset 0
>   0 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -read 2147483136/2147483136 bytes at offset 1024
> -2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +./common.rc: Killed                  ( VALGRIND_QEMU="${VALGRIND_QEMU_IO}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
>   read 1024/1024 bytes at offset 3221226496
>   1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Block node is read-only
> -2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
> -1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x80010000)
> +2 GiB (0x80000000) bytes     allocated at offset 0 bytes (0x0)
> +1 GiB (0x40000000) bytes not allocated at offset 2 GiB (0x80000000)
>   64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
>   1023.938 MiB (0x3fff0000) bytes not allocated at offset 3 GiB (0xc0010000)
>   No errors were found on the image.
> 
> 
> Looks like the process might have been killed off by the OS part way
> through.
> 
> Interestingly both test cases have a comment:
> 
>    #                                        Since a 2G read may exhaust
>    # memory on some machines (particularly 32-bit), we skip the test if
>    # that fails due to memory pressure.
> 
> 
> I'm wondering if the logic for handling this failure is flawed, as being
> killed by the OS for exhuasting memory limits for the CI container looks
> like a plausible scenario to explain the failure.
> 
> The CI shared runners supposedly have 3.75 GB of RAM for the VM as a whole.
> If the tests are run in parallel this could still be an issue.
> 
> Maybe we need to skip these tests by default if they are known to require
> a significant amount of memory to run ?

The tests are not in the "auto" group, so they are not running by default - 
but I once added them to the build-tcg-disabled job since they were working 
fine in the gitlab-CI.

If they are now dying because of out-of-memory issues, that means that 
either they are using more memory now, or that the containers changed and 
provide less free memory now. Anyway, it sounds like the tests are not 
suited for the gitlab-CI anymore, and since they are not in the "auto" group 
anyway, I'd suggest to simply disable them in the build-tcg-disabled job 
again. I'll send a patch...

  Thomas


