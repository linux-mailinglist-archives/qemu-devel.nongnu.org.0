Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21792A7742
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 06:54:03 +0100 (CET)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaYDi-0008HO-OW
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 00:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kaYCS-0007bN-15
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 00:52:44 -0500
Received: from mail.ispras.ru ([83.149.199.84]:45410)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kaYCQ-0006BM-FR
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 00:52:43 -0500
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 743B240A1DDF;
 Thu,  5 Nov 2020 05:52:40 +0000 (UTC)
Subject: Re: [PATCH v2] target/s390x: fix execution with icount
To: Cornelia Huck <cohuck@redhat.com>
References: <160430921917.21500.1486722139653938240.stgit@pasha-ThinkPad-X280>
 <20201104183106.6c823c57.cohuck@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <f9bb8d23-ea54-a833-bb19-274c3adb5f7b@ispras.ru>
Date: Thu, 5 Nov 2020 08:52:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104183106.6c823c57.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 00:51:58
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
Cc: thuth@redhat.com, david@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.11.2020 20:31, Cornelia Huck wrote:
> On Mon, 02 Nov 2020 12:26:59 +0300
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
> 
>> This patch adds some gen_io_start() calls to allow execution
>> of s390x targets in icount mode with -smp 1.
>> It enables deterministic timers and record/replay features.
>>
>> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
>>
>> ---
>>
>> v2:
>>   - added IF_IO flag to reuse icount code in translate_one()
>>     (suggested by Richard Henderson)
>> ---
>>   target/s390x/insn-data.def |   70 ++++++++++++++++++++++----------------------
>>   target/s390x/translate.c   |   15 +++++++++
>>   2 files changed, 50 insertions(+), 35 deletions(-)
> 
> <looking for s390x patches to pick>
> 
> So, will there be a v3, or should I pick this one?
> 

Sent v3, please take that one.


Pavel Dovgalyuk



