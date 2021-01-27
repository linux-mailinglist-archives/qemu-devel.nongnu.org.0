Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763363053CC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:00:37 +0100 (CET)
Received: from localhost ([::1]:56012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4eoe-0000dX-Ey
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l4en2-0007uz-8K
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:58:57 -0500
Received: from mail.ispras.ru ([83.149.199.84]:52494)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1l4emu-0002e6-VA
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 01:58:55 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 89C8640D403D;
 Wed, 27 Jan 2021 06:58:42 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Increase the timeout in the replay tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20210127065222.48650-1-thuth@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <0f08150a-1890-b203-a339-1b1ee36b4d2f@ispras.ru>
Date: Wed, 27 Jan 2021 09:58:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127065222.48650-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.01.2021 09:52, Thomas Huth wrote:
> Our gitlab-CI just showed a failed test_ppc_mac99 since it was apparently
> killed some few seconds before the test finished. Allow it some more
> time to complete.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

> ---
>   Seen in this test log:
>   https://gitlab.com/qemu-project/qemu/-/jobs/987148065/artifacts/file/build/tests/results/latest/test-results/26-tests_acceptance_replay_kernel.py_ReplayKernelNormal.test_ppc_mac99/debug.log
> 
>   tests/acceptance/replay_kernel.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
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
> 


