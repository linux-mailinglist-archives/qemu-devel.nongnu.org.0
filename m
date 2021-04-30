Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5F36FFE2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:46:46 +0200 (CEST)
Received: from localhost ([::1]:34970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXDy-00076Y-00
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWrE-0002dn-88; Fri, 30 Apr 2021 13:23:16 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWrC-0001XY-9k; Fri, 30 Apr 2021 13:23:15 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbSTX-1l1XHD3BlJ-00bpKf; Fri, 30 Apr 2021 19:23:11 +0200
Subject: Re: [PATCH v1] scripts: fix generation update-binfmts templates
To: Silvano Cirujano Cuesta <silvano.cirujano-cuesta@siemens.com>,
 qemu-devel@nongnu.org
References: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <436af2d7-322b-914e-5dac-3d5ed2b2f770@vivier.eu>
Date: Fri, 30 Apr 2021 19:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323123457.23747-1-silvano.cirujano-cuesta@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NFyQ3HpTLj4i8SrKtE0h25GkusBUB8NDbKm1xid68as9iWp65Fm
 RNM/YvW+j2p2k4MgKr6hFniaDD1obdmOg7tW4dqj6JbhSNb8bTZjohuS+suBWHNWp0SDBH9
 t+59kbzGwShuuC2OXp95lCFFaU9Gi01kwhcgG4mzeGV1GYIGsvmPVI3rU6AiQFpKBsUIdJv
 bsBLE1wJIkknyd6nUQOzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HgD6AcgG9Ik=:0FOg48JMzSUXCVJvQnxcvE
 L9ohouHkkVpj4I9kPKGHjkkAdYF2Z0lP98NB2jK6dSxnpJ2ChXf8/oKZUtdeDOYgD5eLPoBqw
 iuM9oRiYwxL7dgDE2/Xh1W+3Jax8KnWkwxBEA9vtSbmwnZ/OmmYSMALXAloApriOH1Vx49qAK
 XyVe66S1TkdbEJZyKRRINuXXQ9eoUVC9Q5uIg156jI8gG/1yPqAb4VVJ5NY65fu6KhFAsHJ73
 BM7wSt7Nf3HSFsABBaDCEKvWAR/08U5eQ8fL6sPNWZ/wmOfvumMkGcFo4bcsBiAHCDmujochW
 SjYW23UKiaUqAwHBFFk/iELWFxJBv/oocEx22IyJBIU7B7IPG2VhdUBsZ/+eMe5tIfquPJ8CV
 CuQr1ixOIkjQWCExH82Q1iBaeIo+Y3cR334yIkMfii0XQDKriGRec2CjrxEO0aUGOVFSzk7iT
 kT9hS08iKsO0y7C5ohqI5XQBgz+CjrPLoP5Tw7iERmXSc4TwtxW4UC0IAu6+nra75hZ6YtfFs
 8Fe+LsmFZsu3b5hfb46N6E=
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

Applied to my trivial-patches branch.

Thanks,
Laurent

