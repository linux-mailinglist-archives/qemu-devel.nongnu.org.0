Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1348514E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:43:19 +0100 (CET)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53lG-00050l-U3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:43:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Y3-0005fz-Tp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:41 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:49241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Y2-0008Jq-3h
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:39 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N5W0q-1mLQx02Qdm-016zg2 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022
 11:29:36 +0100
Message-ID: <aa01b3cf-fd38-ec58-e12d-17712bca8bb6@vivier.eu>
Date: Wed, 5 Jan 2022 11:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] linux-user: netlink: update IFLA_BRPORT entries
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
 <20211219154514.2165728-3-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211219154514.2165728-3-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Fe9i2x4Hmpw1CYPzegto3Uk9qGzd01BeHyz7dACTVztAho8hIp2
 rGF88q621iMZUtw8S5jCJlE3Eihj4KEki/I4zp0BusimG2BT3GjqGgizFdEgEKYe6Zumejs
 rNK5ghVg3sB11FhNk61JNeao3V6svifskRS0wpNTyuEbVwRsvwBv5X6B0HaRvhVVaseCLlD
 g8MPhFhrdVZdK1T9NePqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2C+R4Ell8+o=:YYFEniSjrE3RntMoZ3loi1
 rF/hWpTTklv7YFrYNOsjunDmyHH8RZMK3dvFVAhMu558mn0m6O5paxoAesRhm7d4p5CPbRxbg
 obOzQsU7eh6eQPl03aI6fv/HM0mJm2JIZQ/1j60VjBnoC7shRa9tIdrVelVK8GbMErDuvkph/
 kln4KV3nWsfXQ5rHAau4axSWjbJi1KnXo8s7u13f0xX4Y7diCXBT2TYnjIN7rgqZbizJT0dqE
 lrtByOmU+WmQHBAGUyhPM84SSSQv20Z+2obZXwjYcDcnIG+JyPATkXoLhSbaymEtbOOf7iGv4
 I99FWazB7K0FLRHRJTbD3V494x1AN2id5KGGoWCLteNrt4mUoGfQ/Nobix7G6PtV2U4Q7p7mC
 X6ekPsV14/MJkjEUAifUvNprhI7bo3gUsuAwKhvPRySIcYc6BbE3D/FAOlDNa3ziAM1xlC9Kf
 6ayfYuYE+vAPUwAqCvxHF7w7qHb/5k8YVY5M2zD+QaQXwn9nfh+AInDQOYeBQKyGONpXtj6ao
 cP34xRQ3EDJ2hMvBnEcMegWribQjsTWVUFlqKw3OJo30+6eT7MFb/TZPgz3N44cMcHcV9R3mY
 5JgheJppsJGCJ+kj/Bhwho2y/MqdyydirWGPSmSjhbxGVDpQMckKOpYJLbt6YY98MaMTFrMYo
 g9CqJAVPWO84My05Szg4Ltvn7vjNgMerbcFG5CGMkCEV0so091kI7Emu5Bd1MHpOAcsg=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/12/2021 à 16:45, Laurent Vivier a écrit :
> add IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT and IFLA_BRPORT_MCAST_EHT_HOSTS_CNT
> 
>    # QEMU_LOG=unimp ip a
>    Unknown QEMU_IFLA_BRPORT type 37
>    Unknown QEMU_IFLA_BRPORT type 38
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 36e4a4c2aae8..a17d05c07923 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -182,6 +182,8 @@ enum {
>       QEMU_IFLA_BRPORT_BACKUP_PORT,
>       QEMU_IFLA_BRPORT_MRP_RING_OPEN,
>       QEMU_IFLA_BRPORT_MRP_IN_OPEN,
> +    QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT,
> +    QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_CNT,
>       QEMU___IFLA_BRPORT_MAX
>   };
>   
> @@ -607,6 +609,8 @@ static abi_long host_to_target_slave_data_bridge_nlattr(struct nlattr *nlattr,
>       /* uin32_t */
>       case QEMU_IFLA_BRPORT_COST:
>       case QEMU_IFLA_BRPORT_BACKUP_PORT:
> +    case QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_LIMIT:
> +    case QEMU_IFLA_BRPORT_MCAST_EHT_HOSTS_CNT:
>           u32 = NLA_DATA(nlattr);
>           *u32 = tswap32(*u32);
>           break;


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

