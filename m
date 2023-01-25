Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B442867B34A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfnv-0002X2-G8; Wed, 25 Jan 2023 08:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfns-0002WY-Ex
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:27:04 -0500
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfnq-0004Nb-SD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:27:04 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mmhs6-1ow1Q21dKw-00jouH; Wed, 25 Jan 2023 14:27:00 +0100
Message-ID: <ca4abde3-dc59-77a7-6987-ce7b22424af1@vivier.eu>
Date: Wed, 25 Jan 2023 14:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: add more netlink protocol constants
Content-Language: fr
To: Letu Ren <fantasquex@gmail.com>, qemu-devel@nongnu.org
References: <20230101141105.12024-1-fantasquex@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230101141105.12024-1-fantasquex@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Zw3qVIwnEVYqWF7quYJNpqsseP7ixmR1lqpzhbgIeQenwZhHPOm
 p0DTGzntKdu+72u+jp7xgbT6A3mKDIYYg8u40LawGN21gWwIE2XD0bWtaQDphZIQ5UXPBnc
 Bd30plZJfYsjbhxSbJ1Xotflc17NJdkJ875+HIRL12EyGeiJu8DPVkEKQNUW2xgXuAcr5Tx
 wALb9uh72XCJp8/27NNnQ==
UI-OutboundReport: notjunk:1;M01:P0:fgigKCl2dMw=;IB8zxxhnRm5bFSR/9+Q2T+ZwQwh
 6V+NAfwvRnX7DWoB4y853fNrC9e9DBwusMGFQtZ1cCCAM6HQKH5d+Baf66cSkRKPmHEXIjW1V
 CXGtuT9jPIMv4WLWWQ5bZ0bumSWAuVXwiBobcSpKdpKb7eoyjSPaExw/5+M2CdpExrUKcZmgM
 r82b5tX2PSZXZHr8ooZKY4mAXD6xrn4L4aTweb7sSRdQEn+MgFZyHhqlt/c5ULrgTAxnASYnW
 9dodf054f1vkVAkqJ6NVxfe6pBYyyoEnMDY63Swt2naWAjKJ+cdMeL4ciU709C7m+wqjWeJcu
 AAUIGvEhUZ6llpVcDtmB2RQjbLj7rcGg1yCzHkh3dJCO3iDmuV74vdekOj1V12MdnYXMgEr50
 2mYxsrM4KKTPds/s/h5v3u+nsAATT+Ouym6ptGq2WXFwE+EpLHPPYAmGtWHYOddh4/n2MukQf
 1k330zvqOlYjnqM2IZvgJ51qTpLfYUaV1aSrpaW0hXpM1m675NVU/7FUCfs1TyS7x8F2SXjXX
 EGZsFdtbJLPgpMbeu0D8ltfwydSzGAoKXEWcznbrvDDctOv32bbyEr4wgWyZhknJdAtjPKf8p
 hcnc23/qpO8qTy44BCtLuB3KWumQT/H9F1hWRycOG48TejrIOXK/Ca7ELT3lAmkqHicvndQtu
 8ztNrWJ1SyEOtSNhDWrqcs/Kx6CqvUcbYLy3FYU5cQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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

Le 01/01/2023 à 15:11, Letu Ren a écrit :
> Currently, qemu strace only prints four protocol contants. This patch
> adds others listed in "linux/netlink.h".
> 
> Signed-off-by: Letu Ren <fantasquex@gmail.com>
> ---
> I found this issue when running networkmanager using qemu-user.
> `socket(PF_NETLINK,SOCK_RAW,16) = -1 errno=93 (Protocol not supported)`
> I don't know whether this protocol can be implemented. However, a better
> log is much easier.
> 
>   linux-user/strace.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 9ae5a812cd..a2b2aa7248 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -506,21 +506,69 @@ print_socket_protocol(int domain, int type, int protocol)
>           case NETLINK_ROUTE:
>               qemu_log("NETLINK_ROUTE");
>               break;
> +        case NETLINK_UNUSED:
> +            qemu_log("NETLINK_UNUSED");
> +            break;
> +        case NETLINK_USERSOCK:
> +            qemu_log("NETLINK_USERSOCK");
> +            break;
> +        case NETLINK_FIREWALL:
> +            qemu_log("NETLINK_FIREWALL");
> +            break;
> +        case NETLINK_SOCK_DIAG:
> +            qemu_log("NETLINK_SOCK_DIAG");
> +            break;
> +        case NETLINK_NFLOG:
> +            qemu_log("NETLINK_NFLOG");
> +            break;
> +        case NETLINK_XFRM:
> +            qemu_log("NETLINK_XFRM");
> +            break;
> +        case NETLINK_SELINUX:
> +            qemu_log("NETLINK_SELINUX");
> +            break;
> +        case NETLINK_ISCSI:
> +            qemu_log("NETLINK_ISCSI");
> +            break;
>           case NETLINK_AUDIT:
>               qemu_log("NETLINK_AUDIT");
>               break;
> +        case NETLINK_FIB_LOOKUP:
> +            qemu_log("NETLINK_FIB_LOOKUP");
> +            break;
> +        case NETLINK_CONNECTOR:
> +            qemu_log("NETLINK_CONNECTOR");
> +            break;
>           case NETLINK_NETFILTER:
>               qemu_log("NETLINK_NETFILTER");
>               break;
> +        case NETLINK_IP6_FW:
> +            qemu_log("NETLINK_IP6_FW");
> +            break;
> +        case NETLINK_DNRTMSG:
> +            qemu_log("NETLINK_DNRTMSG");
> +            break;
>           case NETLINK_KOBJECT_UEVENT:
>               qemu_log("NETLINK_KOBJECT_UEVENT");
>               break;
> +        case NETLINK_GENERIC:
> +            qemu_log("NETLINK_GENERIC");
> +            break;
> +        case NETLINK_SCSITRANSPORT:
> +            qemu_log("NETLINK_SCSITRANSPORT");
> +            break;
> +        case NETLINK_ECRYPTFS:
> +            qemu_log("NETLINK_ECRYPTFS");
> +            break;
>           case NETLINK_RDMA:
>               qemu_log("NETLINK_RDMA");
>               break;
>           case NETLINK_CRYPTO:
>               qemu_log("NETLINK_CRYPTO");
>               break;
> +        case NETLINK_SMC:
> +            qemu_log("NETLINK_SMC");
> +            break;
>           default:
>               qemu_log("%d", protocol);
>               break;

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent



