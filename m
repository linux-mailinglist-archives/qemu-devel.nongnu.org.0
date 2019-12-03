Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59B10F81F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 07:53:27 +0100 (CET)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic23q-0007bT-6G
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 01:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1ic21t-0006xv-TD
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1ic21p-0005mS-IZ
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:51:23 -0500
Received: from mga12.intel.com ([192.55.52.136]:36020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1ic21n-0005aN-KV
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 01:51:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 22:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; d="scan'208";a="385195873"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.197.115])
 ([10.239.197.115])
 by orsmga005.jf.intel.com with ESMTP; 02 Dec 2019 22:51:07 -0800
Subject: Re: [PATCH v20 0/8] Build ACPI Heterogeneous Memory Attribute Table
 (HMAT)
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20191129075634.682-1-tao3.xu@intel.com>
 <a31eeaf7-406f-01c4-5183-cd25835af616@intel.com>
 <20191203003445-mutt-send-email-mst@kernel.org>
 <87y2vu7xt6.fsf@dusky.pond.sub.org>
 <20191203010755-mutt-send-email-mst@kernel.org>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <d3c4b107-45c7-ff8e-a4e2-92babcfa96bd@intel.com>
Date: Tue, 3 Dec 2019 14:51:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203010755-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "Du, Fan" <fan.du@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "Liu,
 Jingqi" <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/2019 2:25 PM, Michael S. Tsirkin wrote:
> On Tue, Dec 03, 2019 at 07:00:53AM +0100, Markus Armbruster wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>
>>> On Tue, Dec 03, 2019 at 08:53:30AM +0800, Tao Xu wrote:
>>>> Hi Michael,
>>>>
>>>> Could this patch series be queued?
>>>> Thank you very much!
>>>>
>>>> Tao
>>>
>>> QEMU is in freeze, so not yet. Please ping after the release.
>>
>> Just to avoid confusion: it's Michael's personal preference not to
>> process patches for the next version during freeze.  Other maintainers
>> do, and that's actually the project's policy:
>>
>> Subject: QEMU Summit 2017: minutes
>> Message-ID: <CAFEAcA-b9oDkPfZbntWfhWSv1HOnbUf75p_xB_tF74h_NBGPmw@mail.gmail.com>
>> https://lists.nongnu.org/archive/html/qemu-devel/2017-11/msg04453.html
>>
>>      qemu-next:
>>       * Problem 1: Contributors cannot get patches merged during freeze
>>         (bad experience)
>>       [...]
>>       * Markus Armbruster: Problem 1 is solved if maintainers keep their own
>>         -next trees
>>       * Paolo Bonzini: Maintaining -next could slow down or create work for
>>         -freeze (e.g. who does backports)
>>       * Action: Maintainers mustn't tell submitters to go away just because
>>         we're in a release freeze (it's up to them whether they prefer to
>>         maintain a "-next" tree for their subsystem with patches queued for
>>         the following release, or track which patches they've accepted
>>         some other way)
>>       * We're not going to have an official project-wide "-next" tree, though
>>
>> Michael, would queuing up patches in a -next branch really be too much
>> trouble for you?
> 
> Thanks for pointing this out!
> 
> I stopped asking for re-post since awhile ago.  I don't queue patches in
> a public tree but I do review and do keep track of pending patches.
> 
> I tend to ask contributors to also ping because sometimes there's a
> problem with rebase, I drop the patch but forget to tell the
> contributor, and it tends to happen more with big patchsets posted during
> freeze as there's a rush to merge changes right after that.
> I usually don't bother people with this for small patches though.
> 
> I'll try to be clearer in my communication so contributors don't feel
> stressed.
> 
> Would something like:
> 
> "I'll queue it for merge after the release. If possible please ping me
> after the release to help make sure it didn't get dropped."
> 
> be clearer?
> 
> Hopefully windows CI efforts will soon bear fruit to the point where
> they stress PCI enough to make maintaining next worth the effort.
> 
I see. Thanks for Markus and Michael's kindly response. I feel happy 
rather than stressed in QEMU community :)

