Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D741F3060FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:28:16 +0100 (CET)
Received: from localhost ([::1]:49064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nfy-0002an-3g
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nd6-0001Sz-5O; Wed, 27 Jan 2021 11:25:16 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:50945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nd4-0007pH-Ft; Wed, 27 Jan 2021 11:25:15 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPoTl-1lIK0W1qAV-00Mu37; Wed, 27 Jan 2021 17:25:07 +0100
Subject: Re: [PATCH] net/slirp.c: Fix spelling error in error message
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210122004251.843837-1-dje@google.com>
 <f2162586-0970-14e1-81e2-367fb94dc66e@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <08636ec2-2346-f66e-1e6f-6ca570708993@vivier.eu>
Date: Wed, 27 Jan 2021 17:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f2162586-0970-14e1-81e2-367fb94dc66e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/EtgNT+E8rleu15rPsA3TL2bZQNHvq1LCn0fMr9nfgUiOvuNAgb
 PCHMgNqxpQZyI4d1V7pat8DdEQf2ZvOJnzWeOwQaZG3VWrxzP5djkXEe69Ia4OXpC2UlXzF
 ylHz4xp5E2PME2OAtYewRAaDOpcXBoMkXmV6qPd7qa6OK/gnvmEKlc208NoxDLR2IoCxUeO
 QBJQVSEEqtHkA5o5plepA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DjSy+umSNOE=:EQ1+3iGNEepsj2C+ykWRTc
 F0vcnZgt6o6IpqhLsj86o+Pqvoz8QOyzU5g3szk227Jse2ZSXE5E8RifavrJuZX+mmHDE836w
 MyTkr4/8eZTbczFK2/F7TMc8cuRlGxQWkSfbN+SZ5PSU0xv6uQS5nSGqN2Kx6C96LFQ6PD+a9
 /aOKrJ93JPl/UXbXxrpzxhMcGIvdEDtBdqWO8yAXATpc+erl3kltjJ9SrnhqRCPAPaC1VB3N4
 Gz+LklCITERWuejK4VZgg4Tj63+VGdJXL41Rp0esYuFGshVKcKMniXMZu4d318HmGqmYYcPfn
 ycXKi/amUgrmaZDjbxiljsDPih0ut/cuzuvt5Bi+BInLkYxSRaAzKkOw6p7N0qa/YlaVbWpyn
 ksCJNA73ZMjO52RZgGXdVmCJZWs9dSIFyZ8rnv0EI3n134lKNrbdGkfFmyrLe941Q9IUcj7Di
 RVfhMxP0pA==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 25/01/2021 à 17:08, Philippe Mathieu-Daudé a écrit :
> On 1/22/21 1:42 AM, dje--- via wrote:
>> DNS should be DHCP
>>
>> Signed-off-by: Doug Evans <dje@google.com>
>> ---
>>  net/slirp.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


