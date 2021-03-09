Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F73330A3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:09:58 +0100 (CET)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjc4-0002u7-Ti
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjHM-0000sH-E5; Tue, 09 Mar 2021 15:48:32 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJjH7-0000qK-2f; Tue, 09 Mar 2021 15:48:31 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAgMY-1lUkpn0Uye-00B3Dx; Tue, 09 Mar 2021 21:48:11 +0100
Subject: Re: [PATCH] net: Use id_generate() in the network subsystem, too
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
References: <20210215090225.1046239-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <14235a40-b3d2-98c4-2439-518199c2c2c3@vivier.eu>
Date: Tue, 9 Mar 2021 21:48:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210215090225.1046239-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kE/sbWIiQkQRCMGD5Qc2vZh7MyYEK1d+74ARlVFzL5jUJdNcv5g
 yMIO593reGM/hHsUal5F2P9P2Wre8Im3Lx+OT1wVywbf4YIeXRDbTqKGyGOJI9jchJOvZST
 qLOVqZQaBpImnQCVfB1ZP8rk1sLT3zHIhI0Uo1Mg7Cz67DfuZeqSPD54kJIAl0KwrMnnLfx
 RV92tK8aeHWnGzK5OLroA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ejyk1uNfNs=:lkNTAsUrz0Wv5B4SjWJEu1
 0m60+lsnP0+vIpL4/9vJXoQt8tqqyKYqhhqQOe12tcHrXgiPZUDVyief2ZRyb3z9HRgmxb3OV
 U15ffP76LHGLMfMjGQwWvXxtEIcRE2NIFui/pbE6AxCrwjrdXdxUs2RQQb8Lbyg/vQWg6G7vO
 hScf+7logLkp30AigdOCWPNOj0ZPuE51rC5gp3Tp6fyPUYy1B8U14N3BcjlQ/LQ7InKkD1Q3N
 dx9ESgP6YusVKCXQMd/WCyZQJDGGEmwqq5Ck73N5n45lJwUnwgk9Dxk/VYlRzU5VqX5z7pMUz
 Gw3kmrpLA4rGy9/UezhnA4U7oqEMGBwapHj8IZwItRmdSxAld2xDN5WprCT4FUXuK/XkXi4bt
 O34GxaFUvTHM6gdvEnZHpqL0YBLUkOTxwK4lYJi8jTz5OO5D7MH428OPgZ+CBBAafx3Y1vXPk
 IGauGk+xaA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/02/2021 à 10:02, Thomas Huth a écrit :
> We already got a global function called id_generate() to create unique
> IDs within QEMU. Let's use it in the network subsytem, too, instead of
> inventing our own ID scheme here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/qemu/id.h | 1 +
>  net/net.c         | 6 +++---
>  util/id.c         | 1 +
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/qemu/id.h b/include/qemu/id.h
> index b55c406e69..46b759b284 100644
> --- a/include/qemu/id.h
> +++ b/include/qemu/id.h
> @@ -5,6 +5,7 @@ typedef enum IdSubSystems {
>      ID_QDEV,
>      ID_BLOCK,
>      ID_CHR,
> +    ID_NET,
>      ID_MAX      /* last element, used as array size */
>  } IdSubSystems;
>  
> diff --git a/net/net.c b/net/net.c
> index fb7b7dcc25..ca30df963d 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -43,6 +43,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/config-file.h"
>  #include "qemu/ctype.h"
> +#include "qemu/id.h"
>  #include "qemu/iov.h"
>  #include "qemu/qemu-print.h"
>  #include "qemu/main-loop.h"
> @@ -1111,8 +1112,7 @@ static int net_client_init(QemuOpts *opts, bool is_netdev, Error **errp)
>  
>      /* Create an ID for -net if the user did not specify one */
>      if (!is_netdev && !qemu_opts_id(opts)) {
> -        static int idx;
> -        qemu_opts_set_id(opts, g_strdup_printf("__org.qemu.net%i", idx++));
> +        qemu_opts_set_id(opts, id_generate(ID_NET));
>      }
>  
>      if (visit_type_Netdev(v, NULL, &object, errp)) {
> @@ -1467,7 +1467,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>      /* Create an ID if the user did not specify one */
>      nd_id = g_strdup(qemu_opts_id(opts));
>      if (!nd_id) {
> -        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
> +        nd_id = id_generate(ID_NET);
>          qemu_opts_set_id(opts, nd_id);
>      }
>  
> diff --git a/util/id.c b/util/id.c
> index 5addb4460e..ded41c5025 100644
> --- a/util/id.c
> +++ b/util/id.c
> @@ -35,6 +35,7 @@ static const char *const id_subsys_str[ID_MAX] = {
>      [ID_QDEV]  = "qdev",
>      [ID_BLOCK] = "block",
>      [ID_CHR] = "chr",
> +    [ID_NET] = "net",
>  };
>  
>  /*
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


