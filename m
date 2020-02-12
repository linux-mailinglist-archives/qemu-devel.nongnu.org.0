Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951D815A8E2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 13:14:30 +0100 (CET)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1quT-0006aE-Do
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 07:14:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1j1qtd-0005zV-BS
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1j1qtc-00040O-9j
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 07:13:37 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:35819)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1j1qtc-0003uk-0j; Wed, 12 Feb 2020 07:13:36 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MiaLn-1jfbYH3rFv-00fg7W; Wed, 12 Feb 2020 13:13:19 +0100
Subject: Re: [PATCH] nbd: Fix regression with multiple meta contexts
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200206173832.130004-1-eblake@redhat.com>
 <f498beb4-dfd0-a7dc-33f8-5c62d3738c1b@vivier.eu>
 <3a92e3c5-0506-6970-098b-019f9752dcc1@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2fe5c5ad-3c89-2e0e-245b-def647267e0e@vivier.eu>
Date: Wed, 12 Feb 2020 13:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <3a92e3c5-0506-6970-098b-019f9752dcc1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wJyTEXgGdKPEjooCvAJoEcN0JEiZZoGKM/9SbWgEten366CHMfh
 efj1xeXEnsCSNCkVqL71qlukutwq4Z9tIOumNjvCBN84++8ofezAVRgBZnfDAg+/5JkjAAq
 Vf4n9bTlvrxoN1lsgVNdgXyWDPGLOoQwGL2bqCtU1PM9M2ZV5Hu9RaG2khtZSL4IziD99W7
 W4ip8JU3VGkNRQEA4SPBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e3PL/uNXhz0=:/sly93ElXzKKyvrGSgO2CQ
 ipxKrOeWl1RUXhwaRrctWvPoCDgWe1lDH357wM8GuiYlrRogrQtwJCzoWmXrYZXyVS5Qc/NbS
 l8bottW7B99upm3OgPvYTPpVPDibLxK6Sqd0Aieb2Ci+eWr/ORfTm7AQuI7A49CIheb/aw6fu
 GvMZ0E/8/OPmaUit/WH/qgI2K8PolXEPZVzx9uK6X+sL0uIxVwk7PFWocwF0a9lL7JJbTJruY
 +99Re/syhjIYvigtBaOW23Ufz64RBfSmnZtRAIi6ykwfR/BPXWHDo4SIC2tLqHGue20GJbc7x
 mf0eETLJhmI7i56uANldDcxm4uq3kArKbJDNX/ec7FyV4chH6mxWmrZROFRz82mOkgBmWarA9
 5Nq+vVQEXR5CEAUdGhMGN7/oUZsrmCLY9gx8D84eaML2tGwRWwA4oNbPYIS9RijtaXVF7uaxl
 4G2MIE/+8qLicK/HJiFnn6sE9l+jD8uDimGum6MMG9JexbVlTNyEpcPgYDICij/gOSy0zUf1t
 4C8z4D17wuPB6Juy0QLKnp0ElKFcIgdROXDgFzoIFlrLygt0a3dsbS45TxNQmii/27P5iPR3U
 94sL9qawZicuNWh+19rHkKApQfP9slrh+lAm9xAlAsn/QbAJ0Dq+k4ueokFZgoEAhYfNTel17
 nXmsTKkduLsu8+gKppqIykiN6ZjUwiQq6kq37S56eGWmzwMIt9o77eg/RbyaLw5uKhhcY80bs
 GD6JUUzJOfW0kv1BqcmIEIZkQ5GsygHUCuvA9IC9uypx7sPiYba4M6u1h2p8YrNrceGAMow31
 1yK1UURIi2KeRZLcrQmFMZTL33T8xgmZ510hizruEM2lAVXuHdh6Hi5IrREChRK9mqqmlOt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
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
Cc: qemu-trivial@nongnu.org, pannengyuan@huawei.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/02/2020 à 13:10, Eric Blake a écrit :
> On 2/12/20 3:24 AM, Laurent Vivier wrote:
>> Le 06/02/2020 à 18:38, Eric Blake a écrit :
>>> Detected by a hang in the libnbd testsuite.  If a client requests
>>> multiple meta contexts (both base:allocation and qemu:dirty-bitmap:x)
>>> at the same time, our attempt to silence a false-positive warning
>>> about a potential uninitialized variable introduced botched logic: we
>>> were short-circuiting the second context, and never sending the
>>> NBD_REPLY_FLAG_DONE.  Combining two 'if' into one 'if/else' in
>>> bdf200a55 was wrong (I'm a bit embarrassed that such a change was my
>>> initial suggestion after the v1 patch, then I did not review the v2
>>> patch that actually got committed). Revert that, and instead silence
>>> the false positive warning by replacing 'return ret' with 'return 0'
>>> (the value it always has at that point in the code, even though it
>>> eluded the deduction abilities of the robot that reported the false
>>> positive).
>>>
>>> Fixes: bdf200a5535
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>
>>> It's never fun when a regression is caused by a patch taken through
>>> qemu-trivial, proving that the patch was not trivial after all.
>>
>> Do you want this one be merged using the trivial branch?
> 
> Up to you; I'm also fine taking it through my NBD tree as I have a few
> other NBD patches landing soon.
> 

For the moment, I have only one patch in my queue so I think you can
take it.

Thanks,
Laurent

