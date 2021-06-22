Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5512A3AFD73
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:54:14 +0200 (CEST)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaIX-0007nK-75
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lvaGq-0005TN-8u
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:52:28 -0400
Received: from mail.ispras.ru ([83.149.199.84]:52128)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lvaGo-0005Ij-50
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:52:28 -0400
Received: from [10.0.41.144] (unknown [80.250.189.91])
 by mail.ispras.ru (Postfix) with ESMTPSA id E8DCF40755CD;
 Tue, 22 Jun 2021 06:52:12 +0000 (UTC)
Subject: Re: [PATCH 0/6] More record/replay acceptance tests
To: qemu-devel@nongnu.org
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <52709e4e-063d-1c55-6ead-052380a6d668@ispras.ru>
Date: Tue, 22 Jun 2021 09:52:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, crosa@redhat.com, alex.bennee@linaro.org,
 wrampazz@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 10.06.2021 14:24, Pavel Dovgalyuk wrote:
> The following series adds new record/replay tests to the acceptance group.
> 
> The provided tests perform kernel boot and disk image boot scenarios.
> For all of them recording and replaying phases are executed.
> Tests were borrowed from existing boot_linux*.py tests.
> 
> New tests include kernel boot for s390x, ppc64, alpha, nios2, and openrisc,
> and Linux boot with cloudinit image for x86_64.
> 
> ---
> 
> Pavel Dovgaluk (1):
>        tests/acceptance: Linux boot test for record/replay
> 
> Pavel Dovgalyuk (5):
>        tests/acceptance: add replay kernel test for s390
>        tests/acceptance: add replay kernel test for ppc64
>        tests/acceptance: add replay kernel test for openrisc
>        tests/acceptance: add replay kernel test for nios2
>        tests/acceptance: add replay kernel test for alpha
> 
> 
>   MAINTAINERS                            |   1 +
>   tests/acceptance/boot_linux_console.py |  12 +++
>   tests/acceptance/replay_kernel.py      |  39 +++++++++
>   tests/acceptance/replay_linux.py       | 116 +++++++++++++++++++++++++
>   4 files changed, 168 insertions(+)
>   create mode 100644 tests/acceptance/replay_linux.py
> 
> --
> Pavel Dovgalyuk
> 


