Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A041C785
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:57:23 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVb1O-0003EB-1E
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:57:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVazr-0001ra-Hr; Wed, 29 Sep 2021 10:55:47 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVazp-0000eT-Kb; Wed, 29 Sep 2021 10:55:47 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mn2eN-1nDPqy196N-00k8gN; Wed, 29 Sep 2021 16:55:35 +0200
Subject: Re: [PATCH v2 2/2] qemu-options: Add missing "sockets=2, maxcpus=2"
 to CLI "-smp 2"
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-3-wangyanan55@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0214cefb-059d-d6a7-f681-7fdd26715c85@vivier.eu>
Date: Wed, 29 Sep 2021 16:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-3-wangyanan55@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:g1pFBIfZMG6vPjlZkWjx/WnXRxA+w/n088fjBoRiIyl9P7JRAzN
 yx+raWshnHC761OEuwXWEYjwxOq6Umy24Kk0yfgxHFtilBjXj8HrycnquPeWM8GXp38Kc/4
 eBdSK+MxxyeTIG75rZo4YNSHgtOLbVcV/TAtiap/D6ClNHE2w56jvKBvWx/uw2XpnRIEAHc
 ofMnmVyg1I59wpgVDM/Ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S874Pbk3c9M=:W0gwEiXjzrrZFzdRoghXtw
 2soDaWlk9xmjEhThZX9v7JZ6DqUSaF2CkK5YiVDZvOWYqRN2s2uFRBWSolxoTf8yKHFBzbSmG
 x1ThsYlMarCXXEL/BTTnZi/n4ODdGdIx5o9G+vBrlS1/XFoDfZ4b4TLxRFPxgPF6+9Z+6Cigm
 ebrtzfnRS7uKoSJEvD12VdLvjlsPfUsHjBmPkpzSCYg3H8Ff9Q4XyldJfhrzkYTG3dijpp2r4
 KnYqhMfXFfY/N1rLiMB3vf3a9ZgaRgh9WXrVC+K4i6OBu0yEv2t6qs1lFbGCQkhJmuDrUgRgO
 VBP7ptSFyqMhVi1a3WMMwEDTR/QTedvNg4/jqHPn6hbMxrPw/zriG8Kz/qx4BsJLdpD2KDRbz
 CjckO7xNDwTtpnqBOnJUFXCBqbWbdgyebYoWTWo5gMF2HN0RgJxQoLvvyzqEGkRw6HoQftq+w
 ZRgMNtS4Ms3Yrld8UQFBKzV15jM9ToKvCK0HV0K5I5WtgQty6IlbMw4tuPvuvGnBP3a3Jj/yl
 oa/X56Q/M8KG4Nmrorntkp1cY1QaNJ3yvIG9C+coMpL8OeCHtymprjzHq25pjb7hUrO4fbpQn
 WIuZAAQauhEWNvjzdyeS+tIzPKOeDA1GCVWqz2ZLBg7sgsHLYNXMN99xJt/h6t1lzm9NnkyxS
 bKu7oIblW9oNcvw/YjfykzbzuAMq/xP43VWb3sQy/whmYqgnR+QpHtpaznGwxYtdYSI4QKZZD
 5Q/Ahsm1lIUerGg2HX1m052AngbTLwp9OSqWsA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: wanghaibin.wang@huawei.com, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/09/2021 à 14:11, Yanan Wang a écrit :
> There is one numa config example in qemu-options.hx currently
> using "-smp 2" and assuming that there will be 2 sockets and
> 2 cpus totally. However now the actual calculation logic of
> missing sockets and cores is not immutable and is considered
> liable to change. Although we will get maxcpus=2 finally based
> on current parser, it's always stable to specify it explicitly.
> 
> So "-smp 2,sockets=2,maxcpus=2" will be optimal when we expect
> multiple sockets and 2 cpus totally.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Philippe Mathieu-Daude <philmd@redhat.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index dcd9595650..ff8917c5e1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -395,7 +395,7 @@ SRST
>          -m 2G \
>          -object memory-backend-ram,size=1G,id=m0 \
>          -object memory-backend-ram,size=1G,id=m1 \
> -        -smp 2 \
> +        -smp 2,sockets=2,maxcpus=2 \
>          -numa node,nodeid=0,memdev=m0 \
>          -numa node,nodeid=1,memdev=m1,initiator=0 \
>          -numa cpu,node-id=0,socket-id=0 \
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

