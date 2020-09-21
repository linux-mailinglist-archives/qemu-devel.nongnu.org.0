Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58465271B18
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 08:49:49 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKFe0-0002BB-EI
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 02:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKFdJ-0001gA-9i
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 02:49:05 -0400
Received: from mail.ispras.ru ([83.149.199.84]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKFdH-0005Dd-1c
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 02:49:05 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4837B40A2077;
 Mon, 21 Sep 2020 06:48:59 +0000 (UTC)
Subject: Re: [PATCH v4 00/15] Reverse debugging
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <160006358590.31457.16757371597343007847.stgit@pasha-ThinkPad-X280>
 <ad338011-6abf-7833-6553-cf724b4fb23d@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <81870ddb-5bde-898c-fdb8-a2770ccafa4a@ispras.ru>
Date: Mon, 21 Sep 2020 09:48:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ad338011-6abf-7833-6553-cf724b4fb23d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 02:03:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 alex.bennee@linaro.org, mtosatti@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, stefanha@redhat.com, crosa@redhat.com, philmd@redhat.com,
 zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.09.2020 10:58, Paolo Bonzini wrote:
> On 14/09/20 08:06, Pavel Dovgalyuk wrote:
>> GDB remote protocol supports reverse debugging of the targets.
>> It includes 'reverse step' and 'reverse continue' operations.
>> The first one finds the previous step of the execution,
>> and the second one is intended to stop at the last breakpoint that
>> would happen when the program is executed normally.
>>
>> Reverse debugging is possible in the replay mode, when at least
>> one snapshot was created at the record or replay phase.
>> QEMU can use these snapshots for travelling back in time with GDB.
> 
> I had queued this, it is a very nice patch series.  Unfortunately, the
> tests failed on gitlab:
> 
> https://gitlab.com/bonzini/qemu/-/jobs/745795080

There are other tests that were disabled on gitlab for the unknown reason.

https://patchwork.kernel.org/patch/11636515/
https://patchwork.kernel.org/patch/11701681/

The latter is related to machine_rx_gdbsim.py
Could it be the same avocado/python/etc issue with socket interaction?


Pavel Dovgalyuk



