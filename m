Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFDB2B6742
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:22:17 +0100 (CET)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1s8-0005V5-MF
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf1qR-0004VS-JG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:20:31 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf1qO-0004ie-7R
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:20:31 -0500
Received: from [192.168.100.1] ([82.252.130.226]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1xZX-1kGNPM2LRR-012Fah for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020
 15:20:25 +0100
Subject: Re: [PATCH] linux-user,netlink: fix message translation with ip
 command
To: qemu-devel@nongnu.org
References: <20201116163622.791442-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d3c42072-4a9a-87e1-5d60-031686838fb7@vivier.eu>
Date: Tue, 17 Nov 2020 15:20:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116163622.791442-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FZ1ciOOqYIctY7sQJSgDszbiPJcNZ7h/Itex/6pQBoY+/bkLs9R
 SIg0+WNGcRNiVQ9kzy09OxrvqEjoZQkdPjlAFKw1eLt+6ADOiomWxwkhj4axJ6nsw++ZyV1
 EFCgm9hblNC8aRtFn8y4m7+haOsQZldyi6Z0eyu51lWNOmX9ftZTShAaKxd1ujLKtN/kTsy
 0lqh3tWMcUtRydXTEo7Uw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:i4FTjz7Nvxo=:DPXpfGz55w2QC6O8x4Zjdt
 k8/fJPiNYOV474T8kiU3kZJIRpZo+Wmr0pbyDkiZMOW6Pf6b4kSH2U3+9qSIykfCLgsuS6Ccu
 lsQDwDc3SN8NxZ9RPsYqLpp/2ci8marEcvcsz71BBDUxzhpqeCUf9JwKgU+22LHP3Y88NKmOw
 4+PHKQVUiLd3kb6zsAhbvZI3aaJNHt2sTiMZRSpK5mG2WzhOWEY6Ob3bKIsRKQ+mBF4cVSwpp
 9PZ9mLrJKeCLMzXqSlIeHSDDJcagJtuPF+7ifKKVW+pmMhPP1+k1VJ5eCkavUHSSRy5had6mu
 d+du1QJHKMMuvxqbknqoo6hISMjjcny1un+FtM+y5h4adzGF/UTgWhkCE4LYvFDYqQp9TBlX6
 oa5dY8mBA/15hef9b1yQqeWU1oOW/J1WU487W1gO6jwgOXwFXFtEDWEf/VBPz
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:20:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/11/2020 à 17:36, Laurent Vivier a écrit :
> With iproute2-5.8.0, the route, link and addr show commands fail:
> 
>   root@sid:~# ip addr show
>   RTNETLINK answers: Unknown error 352321537
>   Dump terminated
>   root@sid:~# ip link show
>   RTNETLINK answers: Unknown error 352321537
>   Dump terminated
>   root@sid:~# ip route show
>   RTNETLINK answers: Unknown error 352321537
>   Dump terminated
> 
> This patch correctly decodes the GETROUTE and GETLINK commands and adds
> the RTA_TABLE message.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/fd-trans.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 1486c81aaa27..7551c883304a 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -1160,6 +1160,7 @@ static abi_long target_to_host_data_route_rtattr(struct rtattr *rtattr)
>          break;
>      /* u32 */
>      case QEMU_RTA_PRIORITY:
> +    case QEMU_RTA_TABLE:
>      case QEMU_RTA_OIF:
>          u32 = RTA_DATA(rtattr);
>          *u32 = tswap32(*u32);
> @@ -1200,11 +1201,10 @@ static abi_long target_to_host_data_route(struct nlmsghdr *nlh)
>      struct rtmsg *rtm;
>  
>      switch (nlh->nlmsg_type) {
> -    case RTM_GETLINK:
> -        break;
>      case RTM_NEWLINK:
>      case RTM_DELLINK:
>      case RTM_SETLINK:
> +    case RTM_GETLINK:
>          if (nlh->nlmsg_len >= NLMSG_LENGTH(sizeof(*ifi))) {
>              ifi = NLMSG_DATA(nlh);
>              ifi->ifi_type = tswap16(ifi->ifi_type);
> @@ -1225,10 +1225,9 @@ static abi_long target_to_host_data_route(struct nlmsghdr *nlh)
>                                         NLMSG_LENGTH(sizeof(*ifa)));
>          }
>          break;
> -    case RTM_GETROUTE:
> -        break;
>      case RTM_NEWROUTE:
>      case RTM_DELROUTE:
> +    case RTM_GETROUTE:
>          if (nlh->nlmsg_len >= NLMSG_LENGTH(sizeof(*rtm))) {
>              rtm = NLMSG_DATA(nlh);
>              rtm->rtm_flags = tswap32(rtm->rtm_flags);
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent



