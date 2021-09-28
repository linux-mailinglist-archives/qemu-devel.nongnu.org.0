Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78541A8AE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 08:10:04 +0200 (CEST)
Received: from localhost ([::1]:43238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV6JX-0005LE-7j
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 02:10:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1mV6Hy-0004GW-JP
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:08:26 -0400
Received: from mail.ispras.ru ([83.149.199.84]:59302)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1mV6Hw-0001Nw-Fr
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 02:08:26 -0400
Received: from mail.ispras.ru (unknown [83.149.199.84])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7468F40A2BA5;
 Tue, 28 Sep 2021 06:08:15 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 09:08:15 +0300
From: dovgaluk@ispras.ru
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/5] More record/replay acceptance tests
In-Reply-To: <98dadfbf-589a-c088-dddb-bbbe33436f2c@redhat.com>
References: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
 <98dadfbf-589a-c088-dddb-bbbe33436f2c@redhat.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <2eb2a783d26efed2dbc71d6582933fa4@ispras.ru>
X-Sender: dovgaluk@ispras.ru
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84; envelope-from=dovgaluk@ispras.ru;
 helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org,
 wrampazz@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daudé писал 2021-09-27 19:37:
> On 7/27/21 10:45, Pavel Dovgalyuk wrote:
>> The following series adds new record/replay tests to the acceptance 
>> group.
>> 
>> The provided tests perform kernel boot and disk image boot scenarios.
>> For all of them recording and replaying phases are executed.
>> Tests were borrowed from existing boot_linux*.py tests.
>> 
>> New tests include kernel boot for s390x, alpha, nios2, and openrisc,
>> and Linux boot with cloudinit image for x86_64.
>> 
>> v3 changes:
>>  - rebased
>>  - removed duplicate ppc64 test
>> v2 changes:
>>  - moved ppc64 test to the right script
>> 
>> ---
>> 
>> Pavel Dovgaluk (1):
>>       tests/acceptance: Linux boot test for record/replay
>> 
>> Pavel Dovgalyuk (4):
>>       tests/acceptance: add replay kernel test for s390
>>       tests/acceptance: add replay kernel test for openrisc
>>       tests/acceptance: add replay kernel test for nios2
>>       tests/acceptance: add replay kernel test for alpha
> 
> Thanks Pavel, I apologize for the delay, and have now applied
> your series to my integration-testing tree.

Thank you.

