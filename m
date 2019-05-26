Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8EE2A9F8
	for <lists+qemu-devel@lfdr.de>; Sun, 26 May 2019 15:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55655 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hUtaI-00018N-Lj
	for lists+qemu-devel@lfdr.de; Sun, 26 May 2019 09:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hUtYj-0000YF-BV
	for qemu-devel@nongnu.org; Sun, 26 May 2019 09:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hUtYf-0001hV-0T
	for qemu-devel@nongnu.org; Sun, 26 May 2019 09:51:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:2242)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hUtYe-0001BL-3J; Sun, 26 May 2019 09:51:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2019 06:51:15 -0700
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.255.31.212])
	([10.255.31.212])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
	26 May 2019 06:51:13 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
References: <20190518205428.90532-1-like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <a4acdca8-a060-1db5-a155-1b9ae7512f75@linux.intel.com>
Date: Sun, 26 May 2019 21:51:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190518205428.90532-1-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2019/5/19 4:54, Like Xu wrote:
> This patch series make existing cores/threads/sockets into machine
> properties and get rid of global smp_* variables they use currently.
> 
> The purpose of getting rid of globals is disentangle layer violations and
> let's do it one step at a time by replacing the smp_foo with qdev_get_machine()
> as few calls as possible and delay other related refactoring efforts.
> 

Hi Eduardo & Igor,
Do you have any comments on this new version of CpuTopology refactoring?

With this series of patch, we may move forward to review [Qemu-devel] 
[PATCH v2 0/5] Introduce cpu die topology and enable CPUID.1F for i386.

Thanks,
Like Xu

> ==changelog==
> 
> v3:
> 
> - rephrase commit messages
> - s/of/of present/ for CpuTopology comment
> - drop reduanct arguments such as cpu_type
> - use ms instead of macs in migration context
> - rebase to commit 1b46b4daa6
> 

<snip>

