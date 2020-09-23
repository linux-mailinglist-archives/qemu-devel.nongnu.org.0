Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F97275158
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 08:23:40 +0200 (CEST)
Received: from localhost ([::1]:56952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKyBn-0000Vs-Mv
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 02:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKyB6-00005O-Sk
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 02:22:56 -0400
Received: from mail.ispras.ru ([83.149.199.84]:48456)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kKyB4-0006Om-Px
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 02:22:56 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2E71640A207D;
 Wed, 23 Sep 2020 06:22:51 +0000 (UTC)
Subject: Re: [PATCH v5 13/15] docs: convert replay.txt to rst
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <160077693745.10249.9707329107813662236.stgit@pasha-ThinkPad-X280>
 <160077701288.10249.16846150592069982759.stgit@pasha-ThinkPad-X280>
 <2c0c42c8-8dd7-b208-2430-a241ba5f938e@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <eb4cd4e4-6111-1640-a551-e83c2903dd14@ispras.ru>
Date: Wed, 23 Sep 2020 09:22:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c0c42c8-8dd7-b208-2430-a241ba5f938e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 02:22:51
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

On 22.09.2020 16:13, Paolo Bonzini wrote:
> On 22/09/20 14:16, Pavel Dovgalyuk wrote:
>> +
>> +When you need to use snapshots with diskless virtual machine,
>> +it must be started with 'orphan' qcow2 image. This image will be used
>> +for storing VM snapshots. Here is the example of the command line for this:
>> +
>> +  qemu-system-i386 -icount shift=3,rr=replay,rrfile=record.bin,rrsnapshot=init \
>> +    -net none -drive file=empty.qcow2,if=none,id=rr
>> +
>> +empty.qcow2 drive does not connected to any virtual block device and used
>> +for VM snapshots only.
> 
> This is not rST.  Are you sure you included the right patch.
> 
> No problem though, I can just skip it.

Ok, please skip it, I'll update it later.

Pavel Dovgalyuk



