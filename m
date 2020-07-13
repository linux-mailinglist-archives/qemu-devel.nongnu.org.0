Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91A21E0AE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 21:27:16 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jv46d-00010i-79
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 15:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv45X-0000Pn-Cu
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:26:07 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jv45V-00070M-KV
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 15:26:07 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MpDeD-1kenuV0xSB-00qfz6 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020
 21:26:04 +0200
Subject: Re: [PATCH 1/2] linux-user: add new netlink types
To: qemu-devel@nongnu.org
References: <20200709072332.890440-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4e5413cc-6c9e-cf96-e515-6bd2b4af1d01@vivier.eu>
Date: Mon, 13 Jul 2020 21:26:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200709072332.890440-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HImkxFguiOkZYVKF4C1th4OrFy4+FSRWdVCtHvM7/RzEgOAXWIy
 i9koCFIsrxrm6toZjj2JPJ+01lZH+9oIJplsXv2ApFDMh0FbQGe1ERxgASMjVxiIMNf1LNI
 MXDHQN87qm7ZV39XY8jMIahn2hKaxw51de63Vm/DgOiuSbrli0neC6DnlhcfX3zQ20yU3ia
 SrgLE3lid9i4mtwE5YbDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g2Dpek8OYVU=:+n+17CVNNOC8vv+meu4iS3
 unogzena8jOexcVyz2uaUNNbpG40JQCtk9DTDPSKErh3MCI3fOefJf7zMv706/tOduqYfoiPm
 iDMkg84pxEEaga3SJj8QouoUOiOD5iVbj/hMVpnJHESYOLi9V3GvXKIPhRp5RgLryIiaLgTCf
 f7yJadbDtU4FdKY4rVk+ZOymumhFczGRU4ysyeGnkrdGAuQaAvO/OqsNXCZFCXbSBbyJBAuV6
 EJz8dqH05lp+3rdikB8osSAIUvLlJdgsceaI0LPaKIHC4RrA0i4zOiY2bQ++FkP1QsN5xsGzW
 EPzfDpRsy+fD4uRRgrTF0fk2mGkVoqe9DN41lKyWQ9YFpLwauVmumsEBJLD96pnUSSXdlzWw+
 e5UJ9daCGuUdNDvUzcSgAQAt2wkXmOFvmNXve0sciUw0zxFiZfZ0xtK2xVHkPBBZI9nP16xVu
 digKH9PBzq0xX/hhoRuLaoA91daSdFAr2YSPxowxKcwEz/0e6fObJwCcf0fQanIZ9DktCbdav
 K4M7jLxx+tYY45nF0ETlb2148hjhtIgLcdm+wOQQDCentvvzLjbUucf1Upj7JFLmy1gd4HMS/
 kzVeH2I6Jpj41TZEstqNpaEuFc656CNXCczdQHetoaZ9T+j8qJAqn0b3URIvBL0RKVt270sCy
 I7VeXNnTOwbi53U50Eb7UMSuIbCVwLHOk0bEeA14KN7x+KFQloF7l3ud4AlH4lFnTqEwkqNmp
 qqq2zudYSru4zoUGAJzlcPigfTanzj+FvHPCb6NDbyzMTd56d1lfZrWR1vXkqpNqPossKgoeE
 hBUAsZVE3FbNyOF2r1B0WfBjg57v7U2AuM5inZ2BXhgbYdPTnZGa9DQvhwJ7F14s56DCoyC
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 15:23:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

Le 09/07/2020 à 09:23, Laurent Vivier a écrit :
> Only implement IFLA_PERM_ADDRESS to fix the following error:
> 
>   Unknown host QEMU_IFLA type: 54
> 
> The couple of other ones, IFLA_PROP_LIST and IFLA_ALT_IFNAME, have
> been introduced to be used with RTM_NEWLINKPROP, RTM_DELLINKPROP and
> RTM_GETLINKPROP that are not implemented by QEMU.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/fd-trans.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index c0687c52e62b..5d49a53552b2 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -133,6 +133,9 @@ enum {
>      QEMU_IFLA_NEW_IFINDEX,
>      QEMU_IFLA_MIN_MTU,
>      QEMU_IFLA_MAX_MTU,
> +    QEMU_IFLA_PROP_LIST,
> +    QEMU_IFLA_ALT_IFNAME,
> +    QEMU_IFLA_PERM_ADDRESS,
>      QEMU___IFLA_MAX
>  };
>  
> @@ -807,6 +810,7 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
>      /* binary stream */
>      case QEMU_IFLA_ADDRESS:
>      case QEMU_IFLA_BROADCAST:
> +    case QEMU_IFLA_PERM_ADDRESS:
>      /* string */
>      case QEMU_IFLA_IFNAME:
>      case QEMU_IFLA_QDISC:
> 

Applied to my linux-user-for5.1 branch.

Thanks,
Laurent

