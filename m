Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6553079D5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:35:35 +0100 (CET)
Received: from localhost ([::1]:47206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59KW-0001NO-Uk
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l59Gu-00079i-LR
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l59Gs-0000Hd-V1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611847906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eq3Z32Q2Jhe983+mtIVbmVF+rUzABMPB7JLx2+SrB6s=;
 b=IEAuv/USPkrxP3ZpWNnMkF280cQH8p2Y5tQKdoqBo96erqf8wuJD1tcUSoTASUM5hO/pPq
 uHrCuf+GWKJuv7TMzbIsci44is3Q92yYrUguYoAe5CpZZOqZpjAbjkq63LE4Bi8X6576VW
 aRhJUMuYUGvQfi55mCtdOTSoKyeIujg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-H_pxz2wtOwCS8a51qlYeBw-1; Thu, 28 Jan 2021 10:31:43 -0500
X-MC-Unique: H_pxz2wtOwCS8a51qlYeBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49E02180A092;
 Thu, 28 Jan 2021 15:31:42 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 778F362464;
 Thu, 28 Jan 2021 15:31:38 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Increase the timeout in the replay tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20210127065222.48650-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4651541c-093e-21b4-6416-ac1b29bbc53b@redhat.com>
Date: Thu, 28 Jan 2021 12:31:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210127065222.48650-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/27/21 3:52 AM, Thomas Huth wrote:
> Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
> killed some few seconds before the test finished. Allow it some more
> time to complete.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Seen in this test log:
>   https://gitlab.com/qemu-project/qemu/-/jobs/987148065/artifacts/file/build/tests/results/latest/test-results/26-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/debug.log
>
>   tests/acceptance/replay_kernel.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index 772633b01d..c1cb862468 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -31,7 +31,7 @@ class ReplayKernelBase(LinuxKernelTest):
>       terminates.
>       """
>   
> -    timeout = 90
> +    timeout = 120
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=1 panic=-1 '
>   
>       def run_vm(self, kernel_path, kernel_command_line, console_pattern,


