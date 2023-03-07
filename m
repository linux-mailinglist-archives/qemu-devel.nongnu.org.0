Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7D6AE5F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:08:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZrd-00027M-FS; Tue, 07 Mar 2023 11:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZra-0001z6-Ub
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:08:30 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZrV-0002zq-Rp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:08:27 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4Qbu-1qXZ3t3MZi-011US1; Tue, 07 Mar 2023 17:08:20 +0100
Message-ID: <c36ce29b-eda5-1a0e-ca7d-f5f68bef7bf7@vivier.eu>
Date: Tue, 7 Mar 2023 17:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] linux-user: handle netlink flag NLA_F_NESTED
Content-Language: fr
To: Mathis Marion <Mathis.Marion@silabs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?=
 <jerome.pouiller@silabs.com>
References: <20230307154256.101528-1-Mathis.Marion@silabs.com>
 <20230307154256.101528-3-Mathis.Marion@silabs.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230307154256.101528-3-Mathis.Marion@silabs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lp2CLYqWMUMec22R+IdtdM/vwqB7qG2Zq6y9ESpn7pCzUUl9Yks
 gVkzeN6t6mgtzz12rdnCddEm2GXZdtO0IAwnx/2qvLjtI7tt78b45kwEZnyl2gyXIX13MDX
 Flf9fJGtPFJ/yGcUPSI9uJgxH+qUr+bdgBg4+qTE40PcSWBpg/hJkQbTeTpYEu/Du92cQyg
 7zy7mfEJPMi3T+2cFBNuw==
UI-OutboundReport: notjunk:1;M01:P0:DbzlAJg4vJE=;B+kfxIPefYDN9nt9Unhw8lwbOuQ
 wrRu+fzbZ9iacSq8fZGSQwyCCRxvM6k9qIG0d7O5+FMkvuIsZvWmp51ZZnG2wj5jtzlj8iwt7
 WjcENG2VgcNnuVVLqRKb4Vrmg4Dqie3L176VglKdQpUVXUCaDsqk3CzzM7P3HWtc34dlKq+1l
 vOKhxoo0ksQ2UBne/u09uzAbfoO40rJfBdiWxS2Rei4kePwKNKWvYMMXSnr1Np9AFADMJs/YV
 cn3GfCf8zX+xhMXGquv/PwGPwLzBOqsWnZyC3jQhbcodbGyW2mr+w2nktkRM6jfuKn1Z3hvfC
 rVftrmICHzNZVimT+gd8asDkjfuF8LgZLWvhRJ4o7kb2Zpa7NIXKfiYemDdGZzC/aXkfQd7GD
 Xf4Tir79DjJXCCvGjW4nvcCxRxtL8cZU2Twfj2F2aj/Y9H4b5LsQfxPSg0CsN8nOK9mEoz55v
 2al+kCPx3RZ0AJAuQ7sam/Xsf+zdpEtCRsBGe8QhGeDFmuQtWSvzzGOs0wxO9vq0OxH62o319
 jg5w2HGknpo8NmN7dSqVUzYoh2qV7MQhQWRIIL64GHMyR5y6Hjx/w3TB5NiMXzbqytag/aFlb
 /KEFDq1zj/s/0TRk2pOPkT2e7DOxCJxHNiXrbFhzzZrIu/W2gxkuDPwaX+FedQysqb6ATWqj0
 TwoiZ0geNcT6OT2h0UVLLMLyGSoNwDVi3pLHDk0v8w==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 07/03/2023 à 16:42, Mathis Marion a écrit :
> From: Mathis Marion <mathis.marion@silabs.com>
> 
> Newer kernel versions require this flag to be present contrary to older
> ones. Depending on the libnl version it is added or not.
> 
> Typically when using rtnl_link_inet6_set_addr_gen_mode, the netlink
> packet generated may contain the following attribute:
> 
> with libnl 3.4
> 
>    {nla_len=16, nla_type=IFLA_AF_SPEC},
>    [
>      {nla_len=12, nla_type=AF_INET6},
>      [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]
>    ]
> 
> with libnl 3.7
> 
>    {nla_len=16, nla_type=NLA_F_NESTED|IFLA_AF_SPEC},
>    [
>      {nla_len=12, nla_type=NLA_F_NESTED|AF_INET6},
>      [{nla_len=5, nla_type=IFLA_INET6_ADDR_GEN_MODE}, IN6_ADDR_GEN_MODE_NONE]]
>    ]
> 
> Masking the type is likely needed in other places. Only the above cases
> are implemented in this patch.
> 
> Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
> ---
>   linux-user/fd-trans.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 4852a75d9d..c04a97c73a 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1359,7 +1359,7 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>   
>   static abi_long target_to_host_data_spec_nlattr(struct nlattr *nlattr)
>   {
> -    switch (nlattr->nla_type) {
> +    switch (nlattr->nla_type & NLA_TYPE_MASK) {
>       case AF_INET6:
>           return target_to_host_for_each_nlattr(NLA_DATA(nlattr), nlattr->nla_len,
>                                                 target_to_host_data_inet6_nlattr);
> @@ -1375,7 +1375,7 @@ static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
>   {
>       uint32_t *u32;
>   
> -    switch (rtattr->rta_type) {
> +    switch (rtattr->rta_type & NLA_TYPE_MASK) {
>       /* uint32_t */
>       case QEMU_IFLA_MTU:
>       case QEMU_IFLA_TXQLEN:

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


