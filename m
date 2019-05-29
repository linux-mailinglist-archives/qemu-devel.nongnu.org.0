Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13F2D2E2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 02:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVmcb-0001Qp-Af
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 20:39:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hVmb9-0000nN-LC
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:37:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hVmb8-0002JZ-R2
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:37:43 -0400
Received: from mga04.intel.com ([192.55.52.120]:40450)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hVmb8-0002If-Ik
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:37:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2019 17:37:41 -0700
Received: from unknown (HELO [10.239.196.126]) ([10.239.196.126])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
	28 May 2019 17:37:40 -0700
From: Like Xu <like.xu@linux.intel.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20190518205428.90532-1-like.xu@linux.intel.com>
	<a4acdca8-a060-1db5-a155-1b9ae7512f75@linux.intel.com>
Organization: Intel OTC
Message-ID: <86df836c-54a1-2904-be59-4043d13c61bf@linux.intel.com>
Date: Wed, 29 May 2019 08:37:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a4acdca8-a060-1db5-a155-1b9ae7512f75@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-devel] [PATCH v3 00/10] Refactor cpu topo into machine
 properties
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for [PATCH v3 00/10] Refactor cpu topo into machine properties.

On 2019/5/26 21:51, Like Xu wrote:
> On 2019/5/19 4:54, Like Xu wrote:
>> This patch series make existing cores/threads/sockets into machine
>> properties and get rid of global smp_* variables they use currently.
>>
>> The purpose of getting rid of globals is disentangle layer violations and
>> let's do it one step at a time by replacing the smp_foo with 
>> qdev_get_machine()
>> as few calls as possible and delay other related refactoring efforts.
>>
> 
> Hi Eduardo & Igor,
> Do you have any comments on this new version of CpuTopology refactoring?
> 
> With this series of patch, we may move forward to review [Qemu-devel] 
> [PATCH v2 0/5] Introduce cpu die topology and enable CPUID.1F for i386.
> 
> Thanks,
> Like Xu
> 
>> ==changelog==
>>
>> v3:
>>
>> - rephrase commit messages
>> - s/of/of present/ for CpuTopology comment
>> - drop reduanct arguments such as cpu_type
>> - use ms instead of macs in migration context
>> - rebase to commit 1b46b4daa6
>>
> 
> <snip>
> 
> 


