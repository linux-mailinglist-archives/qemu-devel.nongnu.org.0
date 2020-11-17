Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BD2B6743
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:22:24 +0100 (CET)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1sF-0005dq-4z
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf1qY-0004co-8o
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:20:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:53259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf1qW-0004lU-GN
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:20:37 -0500
Received: from [192.168.100.1] ([82.252.130.226]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLyzP-1kwHkR2odN-00HzcE for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020
 15:20:34 +0100
Subject: Re: [PATCH] linux-user, netlink: add IFLA_BRPORT_MRP_RING_OPEN,
 IFLA_BRPORT_MRP_IN_OPEN
To: qemu-devel@nongnu.org
References: <20201117111905.843925-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49545d3b-2662-f8ac-fe6b-2792c1e47ac7@vivier.eu>
Date: Tue, 17 Nov 2020 15:20:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117111905.843925-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9r6ckGzaYCOYXC4tfcvK4dy+KT4GA8VQDJOgSDWVlPs/PvqZmgR
 xVYsUu8TVNZgGr7GntVYsD8FqdWXHlzMgRMkJ2BajgaMObS8b73Vdx2rTIYO1fO9n9/Bl2/
 Cm87s7laKUY/283pJ0WppE8NUPT+vhRauLdo5jafg0f67YLnJQKYNzvN1DU6kpph7Bd9qH3
 gT5pLh81U2xcumK99OTUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:we17LGe3K9U=:PyJBlD14tBJxSm4QL81aQN
 v/3Z9dcF8il2HqAUkfnKGA26+IJ4hq5hBvmPQ6E5ROXNoxqmuaN3gk6mGhkH9zcsSnAzA6ov+
 nrTBFR5rBjMLLmqXfNjKVuDkt7+HbcEh97LpTbbxcqck3KHLFlvfzcaw2eTI+W0R5JarRVqY5
 Bt8l2aV9UfPm239mG/XFZ+cW7MqR1EFAFc/JqK52gQiDbw21EAhTBVm3Two9AyrLp9WdXuM44
 krtjOKpHAJIX+YNKLX5lce+N9cUlfN4Zy1kc/GaafVVUgMTnjf4zEBAwFZMB0yb+ZHA5UDWJn
 IeiCxHKe5e+WGZRrci0JNz2kZlOSCpiETG9lfcPRT43mwHx/0sc1BSxRuUdr5Xlm6y8ETr7ou
 W99SlkMKCgkls6terUoTdmuJVZMLR6Xmr8GjZ5uce1MtYrWkr1B6GEN5z+xNFTgzPwN3B06VO
 3VEOlSsCBQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 09:20:35
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

Le 17/11/2020 à 12:19, Laurent Vivier a écrit :
> Fix "-d unimp" trace results:
> 
>   Unknown QEMU_IFLA_BRPORT type 35
>   Unknown QEMU_IFLA_BRPORT type 36
> 
> Also process IFLA_EXT_MASK to fix:
> 
>   Unknown target QEMU_IFLA type: 29
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/fd-trans.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 1486c81aaa27..913b3cd12a90 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -175,6 +175,8 @@ enum {
>      QEMU_IFLA_BRPORT_NEIGH_SUPPRESS,
>      QEMU_IFLA_BRPORT_ISOLATED,
>      QEMU_IFLA_BRPORT_BACKUP_PORT,
> +    QEMU_IFLA_BRPORT_MRP_RING_OPEN,
> +    QEMU_IFLA_BRPORT_MRP_IN_OPEN,
>      QEMU___IFLA_BRPORT_MAX
>  };
>  
> @@ -552,6 +554,8 @@ static abi_long host_to_target_slave_data_bridge_nlattr(struct nlattr *nlattr,
>      case QEMU_IFLA_BRPORT_BCAST_FLOOD:
>      case QEMU_IFLA_BRPORT_NEIGH_SUPPRESS:
>      case QEMU_IFLA_BRPORT_ISOLATED:
> +    case QEMU_IFLA_BRPORT_MRP_RING_OPEN:
> +    case QEMU_IFLA_BRPORT_MRP_IN_OPEN:
>          break;
>      /* uint16_t */
>      case QEMU_IFLA_BRPORT_PRIORITY:
> @@ -1125,7 +1129,14 @@ static abi_long target_to_host_for_each_rtattr(struct rtattr *rtattr,
>  
>  static abi_long target_to_host_data_link_rtattr(struct rtattr *rtattr)
>  {
> +    uint32_t *u32;
> +
>      switch (rtattr->rta_type) {
> +    /* uint32_t */
> +    case QEMU_IFLA_EXT_MASK:
> +        u32 = RTA_DATA(rtattr);
> +        *u32 = tswap32(*u32);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unknown target QEMU_IFLA type: %d\n",
>                        rtattr->rta_type);
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


