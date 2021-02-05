Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBD9310E04
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:41:06 +0100 (CET)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84AF-0002U3-Ih
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l845F-0006jW-Ok
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:35:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l845D-0001pi-AF
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612542946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNWh3ySWKVW4moNUlw4BNwoRASk4c2nPcuS/T1yXv5o=;
 b=UtQ2uyl1DqwXMYM5xAfn+ul9yG0aISaxfIzSQ+LY6qPe9xRHFRhHlDQY/Luh+N00UPq9iT
 1SpwLCwvOf+WHz2pYpBaW0FeXL6OAig1YV5kI3ZeNJkGxFx/pVtEFHLHbVwcgXKmYwUjol
 fT7fl/k8njBOH0XW2tU2y+Nrm5CqTsA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-AHPVg022MbK9JYZxK1sivA-1; Fri, 05 Feb 2021 11:35:44 -0500
X-MC-Unique: AHPVg022MbK9JYZxK1sivA-1
Received: by mail-ej1-f71.google.com with SMTP id x22so7170046ejb.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZNWh3ySWKVW4moNUlw4BNwoRASk4c2nPcuS/T1yXv5o=;
 b=nsxkDB2R7dGZnDMJ96zn15tLxBjimnfBHgCOR877ukEqq/HfHTPsZuhOKWdS1RzP5Z
 KuIocmIAmfnZQuw+CF1Yl5FQzTe7q/1aSOZyzoyClkzkWWQf/uly2zpc/+0ra7QEQr8b
 hkt2Y+f5vE+JtVQ05uPrNRjIMBXLzUH+ESZvKrvHFNBflRwlR/cEXFyKocjKOmE9eVcg
 MLiNleVA7C/zQmE2t0F4f9qbJ/iQ2t84WG2P7SaHFU28Rvja47dcS84o/MrvJwl95e47
 TmoeUrqxtSmmKANWD2Uke0amuJF51cFvPNkzFfVw2px1Zq1O5tSkeeb9pxTdQrKPG1x2
 3GnQ==
X-Gm-Message-State: AOAM531NIT5MisAp9guTfuOI0c9Tdcs0HPvnxXxbqySmnuUZIbPmRV0v
 UqyLLWorVYdHLUe3+3Y5p8V6uR4pBO60QDiGIMqu6cunZ9l/8q7nU1Rlsxb7YP1SVE3UlCYZaAg
 bFUo6Bhw0XAqmBBQ=
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4332464edc.186.1612542943222; 
 Fri, 05 Feb 2021 08:35:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweJU2wncdw9vlFCZTY0u6dqtynfWBEvc3EcpdzydtSVa32WsRkyoFZ2weF4p2hSFTi+UNH7g==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4332451edc.186.1612542943088; 
 Fri, 05 Feb 2021 08:35:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e11sm4111206ejz.94.2021.02.05.08.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 08:35:42 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Increase the timeout in the replay tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20210127065222.48650-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <878747af-79b2-093d-456d-29b9cd80915d@redhat.com>
Date: Fri, 5 Feb 2021 17:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127065222.48650-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 7:52 AM, Thomas Huth wrote:
> Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
> killed some few seconds before the test finished. Allow it some more
> time to complete.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Seen in this test log:
>  https://gitlab.com/qemu-project/qemu/-/jobs/987148065/artifacts/file/build/tests/results/latest/test-results/26-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/debug.log
> 
>  tests/acceptance/replay_kernel.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hopefully this buy us time. Applied to my acceptance-testing tree.


