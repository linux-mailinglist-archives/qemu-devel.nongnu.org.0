Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D61136FF58
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:17:52 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWlz-0005El-4S
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWI7-0001UZ-0q; Fri, 30 Apr 2021 12:47:02 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWI0-0000dp-7S; Fri, 30 Apr 2021 12:46:58 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MUooJ-1m3ECm0iyf-00Qmhu; Fri, 30 Apr 2021 18:46:49 +0200
Subject: Re: [PATCH v1] scripts: fix generation update-binfmts templates
To: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>,
 qemu-devel@nongnu.org
References: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3fe1825b-e5e4-dfd8-b4ce-038bb7aed800@vivier.eu>
Date: Fri, 30 Apr 2021 18:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nWbW0Cqhp2CqZdSj5dEgb6zj8SVoUK0yUgNUhtYOXekdKfbuXjW
 TP0E8UMlcVCqJ6knOpu0Pvmc+19OIQ5asMkkO34ikiela6E23Dcponjgz0rs+USuGwoQFNT
 3CKEe58pvyj8FMKzp8LIxzAoDuEj+b52vnMd/Xnv4a3DeWgAbUGYPmjuAOawB4ZATLhrzxd
 RNFulPUObbVLG3RPVMI+g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C5yx/s1BWBo=:fraLRFjBrD3fAEHKRwPgzq
 IN0PLhzH4vPMADgrQThwCLBXPaSGWyVVl1y83ZdvY9592a0ZXln4jz8+xAs3JndwPh98eXdkI
 nrIqc6mp8KA9WXIMc1trLg5ccE/uNB0BanhLqwNC+HnIpebUFN04d8VgrOXaZwr+FN9OaGYLb
 oN6BA3ld3sXKPDmG6lpe6+hkX6QKNGpCyKsI5b8RlEYenvlCAXxm/uZQHL/avks1J+I0JJhoR
 XwkvUMgCy8acBHOBA3hcs/3jnLeTR45zeC41zqY4N9lEStNfkGS9hBr/Emz48fT1keByFOyVN
 esw/16bBWOuTHVI57TZYZRiShJnSz5lPJGSgRMAdVL6+AGAypRFSZo32Ba6bONsYz/UfO6Lt/
 czr90VNCYsOPzeSbfV9RhWb60PD2tBTic5tcvmu2+Txl9jpSsdYOFRweXe+KTWAhJajXx6p8L
 4Wp7SZ0wtVyXrNFzzy15PjdYJa0W/xACNQPsDnML//wd+LkNZhFl+/DdFjorGGsoX5LLR8ek2
 6NbOHI49rJdhj59fCZ+FFw=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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

Le 23/03/2021 à 13:34, Silvano Cirujano Cuesta a écrit :
> This patch fixes the update-binfmts templates being used in the script
> scripts/qemu-binfmt-conf.sh when the option --debian is used.
> 
> Fixed issues are:
> - Typo in flag 'credentials' (previously 'credential').
> - Missing flags 'preserve' and 'fix_binary'.
> 
> Reference: https://manpages.debian.org/buster/binfmt-support/update-binfmts.8.en.html#FORMAT_FILES
> 
> Signed-off-by: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>
> ---
>  scripts/qemu-binfmt-conf.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 573b5dc6ac..7de996d536 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -294,7 +294,9 @@ package qemu-$cpu
>  interpreter $qemu
>  magic $magic
>  mask $mask
> -credential $CREDENTIAL
> +credentials $CREDENTIAL
> +preserve $PRESERVE_ARG0
> +fix_binary $PERSISTENT
>  EOF
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

