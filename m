Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AE16AE5B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZji-0003Wt-Cd; Tue, 07 Mar 2023 11:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZjf-0003WO-I8
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:00:20 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZZjc-0001Ls-T2
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:00:18 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5fUw-1pfb4y2fIg-007GHB; Tue, 07 Mar 2023 17:00:10 +0100
Message-ID: <e183b67e-58a4-6abc-48ca-cfd33291c546@vivier.eu>
Date: Tue, 7 Mar 2023 17:00:09 +0100
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
X-Provags-ID: V03:K1:CWVlZX5NvZ8y4JSDvmD+7QHOdJm6e1VutkxKhMwPhbzCeIQ+76t
 f2Cgk8pR039PDxk+40QDbxYdsoICimM2YTwQQ7xj+woWTFZQd2hf9VzeCDVAvGfwsMWJkMy
 4dZ8KHWOu1Sb3R5wVMGHrwYw6nbO9LIpGvsGr7Vt6N3e3188lTnXfbdUQZgUCNz9jEbYHS0
 9lNnPZHpMOYAcDajPtwKg==
UI-OutboundReport: notjunk:1;M01:P0:9PNQpw7wLcE=;pa6eHZdQZQi7y9P1O/w5HLPc32Y
 WAv1o/9/M46HTUEX1Ec+aawc+Ziz79T+XJx/5m8siCqF37KRMRjlLs0A0tHOo1bzoU1fg3a7t
 IcxCYazw2VS9ADQflLug78+/hwQcCSM3fb5F2VnL1nyWa3lPxjGg5HKq/wXaAWs1VUYqvmjHJ
 a5m7+BWPxSX/AHxIip8vJ45mQ/6XjpEbhSOWEve85EfI5LoILhqmq9cNNykoz2gI5A/J4OsZg
 CeH45pxcVaIkYb1IL+RjP3qVoWdMKKZaM0QlBZlG5LvIxEPJ3eszjKY+UkcGBx95tNjACRNfA
 SdKJG9naz5yXAycU4skYI9nUDqEO8EuwzYbuj5FcdEkGoYKTSsSmh8Avbhd0x5jsqXyCNjUPr
 Z7l5/bzyWIBhhgZCBGaB/UnVW3RLFUIyAoMS5FoMjejGJkP0V6qqkP40U61E/qof3DYaU8Yd2
 bNqRCjkjgVLdGerrjwHifVkvMCzL/ZJl9CE9NbGTOM/cYZ1v+TAdyf4+u9sbAQgStfu9RM/L2
 jKggDt4dhrw+sskqAU1eiSIkqcYEY/iXrtXP03ct3lrfVmBShJlwX6jrzIJytZy7YzuO775qL
 XQZK/+RCHmhg7gl1TgR6scLdfYJNj0gKks/piZ+abifDt9zh0GDOMcqoyq+pIaCE0LEK/rVnM
 Dj6gtzA2qEOMRf19ntTG2JVkjz2QW0Wuwu2TDC4dqg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

