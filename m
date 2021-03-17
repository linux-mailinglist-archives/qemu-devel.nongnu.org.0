Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702B33EE95
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:46:52 +0100 (CET)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMThT-0000TB-D2
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lMTec-00073q-Eg
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:43:54 -0400
Received: from forward2-smtp.messagingengine.com ([66.111.4.226]:58477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lMTeZ-0003Mk-IJ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:43:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 13FAE1940E70;
 Wed, 17 Mar 2021 06:43:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 06:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=VljwEYhs5pd1k03HzEN1oKfCAWJ+iMPIps8bsuyIR
 ts=; b=YbERqIVbkgdNcMWATc8PKVP2beNYxG5pUdBcK6SAcIha03vV/ZNkJjZBY
 29fbLrbMHpq01DS57otUHPDER4AosD1RhU7WzewpBGZ6FDo1nRlD/aApTO7YkJVJ
 ry064xa1L5Tj/3BRk5BBPKsnn8SJPdQv8zNuTG6K7LaTyHWOOHCsXv4zPlRsUKly
 kaZuHBNMzSL8H2I+9sj3o/KYBtaSzxRF50M8WzBh6JbuJv2r7MWOM2juMDpuZo8e
 FR+SkgPftcP94qIHRba/j7pORza4l9rEIPoCsEMAK9tVL3DRqc/sJA6bzVuJbVLi
 /YCfbzEGzaXH6BRp+6mJ3+lCTn4vg==
X-ME-Sender: <xms:Zd1RYMKIvOyYI7gXZoR93vVINkQ_TYUZWRUuEOkkotxd4E0p-h_BKA>
 <xme:Zd1RYMKi8sWIbS6LczroNnPGFJEfPH8Vas-EJ4tcUeWIG-UoysK04RQWq2r_toYJ2
 JD6D-q4UAsafNYUvj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 epteevgeeuvedvjefhkefffeffveekvdekffehueeludfgteefheeljeetuddvkefhnecu
 kfhppeekuddrudekjedrvdeirddvfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepughmvgesughmvgdrohhrgh
X-ME-Proxy: <xmx:Zd1RYMvwwYSJCWwjesnHi0ZwH3eGIFEKX-yEWVKgKipQxMj_kiRBhA>
 <xmx:Zd1RYJZU8Q7w5KTQnlMMbWDJ6Z9eu7ZzEpqFQqXRctMMktTCmsgYTg>
 <xmx:Zd1RYDaMS3nrDbfSmb5zPeYQ8_k2iAn2qMBgs_NbCAQb6ygR-VMUFQ>
 <xmx:Z91RYASYJbxTC-yWluymxh7OTnuQpuOL8O3omCJZn8MzssWYskZHXeYIMQo>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E446240057;
 Wed, 17 Mar 2021 06:43:48 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id f0a68bc7;
 Wed, 17 Mar 2021 10:43:47 +0000 (UTC)
To: Kunkun Jiang <jiangkunkun@huawei.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 1/2] migration/ram: Reduce unnecessary rate limiting
In-Reply-To: <cbbe92e2-4ebf-476a-3733-8e1c7893702e@huawei.com>
References: <20210316125716.1243-1-jiangkunkun@huawei.com>
 <20210316125716.1243-2-jiangkunkun@huawei.com>
 <20210316213906.GF395976@xz-x1>
 <cbbe92e2-4ebf-476a-3733-8e1c7893702e@huawei.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 17 Mar 2021 10:43:47 +0000
Message-ID: <m2lfamdpr0.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=66.111.4.226; envelope-from=dme@dme.org;
 helo=forward2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-17 at 09:37:11 +08, Kunkun Jiang wrote:

> Hi=C2=A0 Peter,
>
> On 2021/3/17 5:39, Peter Xu wrote:
>> On Tue, Mar 16, 2021 at 08:57:15PM +0800, Kunkun Jiang wrote:
>>> When the host page is a huge page and something is sent in the
>>> current iteration, migration_rate_limit() should be executed.
>>> If not, it can be omitted.
>>>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>>> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
>>> ---
>>>   migration/ram.c | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/migration/ram.c b/migration/ram.c
>>> index 72143da0ac..3eb5b0d7a7 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -2015,8 +2015,13 @@ static int ram_save_host_page(RAMState *rs, Page=
SearchStatus *pss,
>>>=20=20=20
>>>           pages +=3D tmppages;
>>>           pss->page++;
>>> -        /* Allow rate limiting to happen in the middle of huge pages */
>>> -        migration_rate_limit();
>>> +        /*
>>> +         * Allow rate limiting to happen in the middle of huge pages if
>>> +         * something is sent in the current iteration.
>>> +         */
>>> +        if (pagesize_bits > 1 && tmppages > 0) {
>>> +            migration_rate_limit();
>>> +        }
>> Sorry I'm still not a fan of this - I'd even prefer calling that once mo=
re just
>> to make sure it won't be forgotten to be called..  Not to say it's merel=
y a noop.
>>
>> I'll leave this to Dave..  Maybe I'm too harsh! :)
>>
> You are very serious and meticulous. I like your character very much.=F0=
=9F=98=89
> This patch was used to reviewed by David. So, I want to know what
> his opinion is.
>
> @David
> Hi David, what is your opinion on this patch?

I suspect that this referred to David Gilbert rather than me :-)

> Thanks,
> Kunkun Jiang

dme.
--=20
Time is waiting to explain, why refuse?

