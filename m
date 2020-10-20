Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFAA28BB0B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:47:09 +0200 (CEST)
Received: from localhost ([::1]:33882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRz6S-0004hm-Qz
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyyC-00041o-7z; Mon, 12 Oct 2020 10:38:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:48011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyy9-0007is-3n; Mon, 12 Oct 2020 10:38:35 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MD9CZ-1kb1Va33Td-009605; Mon, 12 Oct 2020 16:38:27 +0200
Subject: Re: [PATCH] block/blkdebug: fix memory leak
To: Elena Afanasova <eafanasova@gmail.com>, kwolf@redhat.com,
 mreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <1e903f928eb3da332cc95e2a6f87243bd9fe66e4.camel@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d1eb7b56-cbfe-9a96-f7f5-95bea795b96a@vivier.eu>
Date: Mon, 12 Oct 2020 16:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1e903f928eb3da332cc95e2a6f87243bd9fe66e4.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y8nG3MOecPuxNQwCxsxrb2zPgEUYunT60gMIPv0RdeMf+2JShko
 uYIH6WXZnA0H0Q6woSg2JYjaaOgaD4QijFULxkOAJGtn4O3MIbWQ5/PruhVGC2KSY3eGNpn
 vNeWjoTPi31Xi0rWFRGXX2mcdhHL4N4pIq+d1hOiC2X/wegazF2Gob8Ez6W44lERatZY7PZ
 KnRtrk+5EACJqUskzVcIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZBiOEF2/QCs=:qyqxMIxupldjGaL7uAMJO+
 Nm3WwTsAH3ngXC8MDAdsSyhHTMkzWmyFSHya7I8sC3vG+mmMuSZ0wJLANTjq3xM5SvuJKWh8K
 PZvRlPgxp6KSUgHIJSwERD52ljc21SNFezU2HZtNtUuqLQC2WpSor2WrReH9ayaNpO/75/L31
 ZafGFoB+b8AWSnYthHeyWS9FxQMjR++hIr7IQcpj92EhBRw0wANpJyBhyuFFcSmrFQx1TPVDA
 lmO/9LFL4DPsqG8d9wzV6nMqzk3iJmegrJQdYYk5rYOXZLW0r8wYN4N9dvNzJflZABW3SPRRs
 lylork31qukWdDAPsmeQ8HlEIwq7piHI1/dQK0TO2+E5Bx+ETQymyhzHT6zvRwj5DM2SQ/WZ2
 88yHP4W8JzmGDCDtaDZBhH+AGH0hbZhV6vTJnoIwwWC/3Pqd0mzsRbCCo3tYc/UjQmlgV8JkT
 kjG//KsAO23H/CKBIK+CnORsosLOD1AgbQV9n+L6i7vQTHLuBcnt7ZgmV9gsJxcG1gWFUZOiy
 uaUFywVZUt+D3RqmesHpNrgBvRhdKFh/SxwCVv3ZO/UHWRY+UKrbMeWkc1zb9DTEbQfmZR/x8
 uxnwWPekEKS8OgE/3Yu3quf3twXQsLR1JVVb/ifffYPp8EYxgMibY/ElXJf00vsuS1cAJV5oi
 WwLgSEX3xvE97TwqT+QhKk5D5yxij5DZwEx1zkj/XOVosijzDoJ3Se2QGnbrDiK8HMhJ1Awrt
 OmKk43patda0Own8Oy2ZBj8A8Ll0FE7Cr4q7SClwr3Dl78kZq2sMfHni73hjJr5QEPLjhEik3
 8EUHyNqQ9HdjhpZEaDMbvwpwNd/ZCdwTTDIG8+mFYWeReoZewPRxxzNMbQ08cVCNs+hijwk
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:20:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/10/2020 à 21:09, Elena Afanasova a écrit :
> Spotted by PVS-Studio
> 
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  block/blkdebug.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index eecbf3e5c4..54da719dd1 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -215,6 +215,7 @@ static int add_rule(void *opaque, QemuOpts *opts, Error **errp)
>                                   BLKDEBUG_IO_TYPE__MAX, &local_error);
>          if (local_error) {
>              error_propagate(errp, local_error);
> +            g_free(rule);
>              return -1;
>          }
>          if (iotype != BLKDEBUG_IO_TYPE__MAX) {
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


