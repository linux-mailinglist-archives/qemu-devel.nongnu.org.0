Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED5741C7D5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:06:59 +0200 (CEST)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbAg-0005P4-TK
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb7r-0003IK-Dn; Wed, 29 Sep 2021 11:04:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mVb7p-0007eh-5F; Wed, 29 Sep 2021 11:04:03 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhUDj-1n16WA1Rg3-00egiU; Wed, 29 Sep 2021 17:03:53 +0200
Subject: Re: [PATCH] target/sh4: Use lookup_symbol in sh4_tr_disas_log
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210929130316.121330-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c9c6c642-eb01-05b0-ed9d-4b8539b7f2ae@vivier.eu>
Date: Wed, 29 Sep 2021 17:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210929130316.121330-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/qKOENDJlD4kiFEeOxPQ8XfQK7dXPUSU0hYuXEZrVj9VZAiaE62
 /A7XTrm3yPM4vrHBNmx87aDQu/TX8dIWRKJxt9ghPNAyg5wrYrXn9RHNNvki5px6XPO0L2R
 8T6uLQpiA9UWyZjtcxFdnRlnrTb5WU39qemwKXhRgzYZTdgq+tr11H9osHSUmLB9K+8fpWl
 tUQfT2WQh9hy1Q+cPguhg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vN4T1WzSrH4=:TY1cn0XThqPr6bSekKfURP
 hXXs96igwV/xJMOq9HH7uwA8Y3U/Bj1/aNIl7Hcc08fQ/ZkKfRD5B2L0Am2Vxav6GjlMPhW7r
 2Mmwhe7qN2E/izUpP5VuEht8fGU/cvlYWtOFABLUsZkA05o+2JrwPBCRe/FhHNKA0BsH5KpKJ
 0eFFYPYxvYhcEtAe+faekOW38DYz1KaIHbNyt6X7+4U/lXHmisarazz5u7zAf36aL84TXnCoJ
 8d99v8xcOUZUepYi+IoL0cghL60i9rg5feRf6+J3f99CubiQ/nNc3D7MVZugC3AouYK/MWTP6
 26BdL9qp6KBJfM+mzgqNv2xH6puR0eY+amCPMlg+KgeuYQiwPTip8k3gdGmpze1rs1waWjYiH
 TxY9k0ULRk857l9IasF6Y+NPJu7LaePfp8Il+T4jRQZWNP7sOE6YiCVxmE4qAfVC5QaJllD/1
 3qf6M1i6FsIhFT2V4NMflUtycIqI/Ftsk8WV8aKNWvbKPBUhrOgciduB+xLsSzBs+IulYnpFR
 qtugc9AUbutmEUb4JPqOsha9xU/CoIWkFwnhUMK8kNq9eCRRnuwUzPu8tIfNJYtlBWtKUoAyT
 a6+O32wzifSpFHkL0iE2AnmHRktuo26PgocgYGu0OjPCpP04LFFfcZ+zNQ1gUz0O54cxTfSJD
 LuGZXJidjDQBHtnGV5Z6703vSAnvjRRHx5i5BSPTOGbma6HMXOjd8RInQCpoT724mMq4j3GZC
 gj9cY9v0d8b1aWw0heic/LkLTvjRRYjatgQaZA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, ysato@users.sourceforge.jp
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/09/2021 à 15:03, Richard Henderson a écrit :
> The correct thing to do has been present but commented
> out since the initial commit of the sh4 translator.
> 
> Fixes: fdf9b3e831e
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index cf5fe9243d..d363050272 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -2344,7 +2344,7 @@ static void sh4_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>  
>  static void sh4_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
>  {
> -    qemu_log("IN:\n");  /* , lookup_symbol(dcbase->pc_first)); */
> +    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
>      log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
>  }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


