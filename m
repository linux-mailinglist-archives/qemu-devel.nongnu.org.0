Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B206F48515D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:47:48 +0100 (CET)
Received: from localhost ([::1]:60722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53pb-0001y8-S4
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:47:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53YE-0005kD-FT
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:50 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:58359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53YB-0008Kg-RE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:49 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAgMY-1nG1uk0YEy-00B8EF for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022
 11:29:46 +0100
Message-ID: <e519748c-781d-304a-8c69-edd164a5d1a6@vivier.eu>
Date: Wed, 5 Jan 2022 11:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] linux-user: netlink: update IFLA entries
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211219154514.2165728-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oT4Vnsxy2MDN7vSoScK8KObfEyFDRLtF34TFiKN3+tXMhVDaV7l
 kc7EMi7+AVX1r7OCg2/2hILVjMre/W/IJ0UFDcln8CaIZheErWyMWO4KDti+7F2zgIbpSI3
 DauX5L/2aDliX3HWFehCqFy+m7PSpK8nf2ytL25F14/CCQpAz2AXG3rSClxPhxVEOxzNnjK
 IX0uTfYBKe7QX6ftM/l1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rn9ScTvRdok=:Rc/tAngoJbmLrCPlorxaHu
 HUAbdcAK/+eO1lLlb9k2wfamA51zKlbtNknWMAEAWKeJR29RitUhFYY0t8zHR9q6/SwU2PimP
 vHHXI1qX7fjnicupzSr0ylblmsbq965lb4HG1En1ANevk7vYjk02I0SxRLYaET+RKcVnMDjYG
 DrExfv7n4zKRPdvmopCdK5LGPle7L+bqr0o/ifFoKGxtq4H0zqig4X9sUqfs1NFxWXuRlasX8
 kPtuSODpc3IkU/MAD0OupEWJU4+OIigzQiWswB8WzpGdAECtV49bHu94Vn6ZB/SHuZdFT7qJN
 aJ6pTZJDJT8M/YBMHdBy7LUk4U23ko/hJP7/bp3Q/dfT0GHZDHvPPcBx7/vRFajKZ8hF930u0
 ZUjB/uzU9tsGSWp/hxFaxgtDifq43yLvkye5PqdR+rarZ1pJxY91JGYXfScPwQPOeY4pK5RKR
 P0FwWi++mxYCLoy7IEWKoqjeDXod4drOdHYRqicknCAxTIsgrG1Obr7vdDu9v++c6uLHrlFqO
 J7+kM7v0TQxyksjjqhf/P5qMrPPfhw5zgqPegRMl+SRgZEy/bL9vfQebVbjeam5aOVUUGZ4fb
 VAy3h12PSxvh+cYuH43ZNXRmy97A8J3pbbZfrj8QCZBk3VwD5VOCAhvaowpmIy8ZW7KCbpMXu
 Le2hjH7dqqaTDhczPBsdNS8CIHA1PV3ZJRz/JOFkVm0RV0tNLBTFrB80jL4KllcOr+Ho=
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
> Add IFLA_PHYS_PORT_ID, IFLA_PARENT_DEV_NAME, IFLA_PARENT_DEV_BUS_NAME
> 
>    # QEMU_LOG=unimp ip a
>    Unknown host QEMU_IFLA type: 56
>    Unknown host QEMU_IFLA type: 57
>    Unknown host QEMU_IFLA type: 34
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 69410899590c..14c19a90b2b0 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -138,6 +138,9 @@ enum {
>       QEMU_IFLA_PROP_LIST,
>       QEMU_IFLA_ALT_IFNAME,
>       QEMU_IFLA_PERM_ADDRESS,
> +    QEMU_IFLA_PROTO_DOWN_REASON,
> +    QEMU_IFLA_PARENT_DEV_NAME,
> +    QEMU_IFLA_PARENT_DEV_BUS_NAME,
>       QEMU___IFLA_MAX
>   };
>   
> @@ -818,9 +821,12 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
>       case QEMU_IFLA_ADDRESS:
>       case QEMU_IFLA_BROADCAST:
>       case QEMU_IFLA_PERM_ADDRESS:
> +    case QEMU_IFLA_PHYS_PORT_ID:
>       /* string */
>       case QEMU_IFLA_IFNAME:
>       case QEMU_IFLA_QDISC:
> +    case QEMU_IFLA_PARENT_DEV_NAME:
> +    case QEMU_IFLA_PARENT_DEV_BUS_NAME:
>           break;
>       /* uin8_t */
>       case QEMU_IFLA_OPERSTATE:


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

