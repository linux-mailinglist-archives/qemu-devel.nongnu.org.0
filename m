Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5D2DD072
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:34:52 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprYZ-0003et-JL
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprWQ-00028a-TT
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:32:38 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:47653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kprWP-0005Zn-7B
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:32:38 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3DFj-1koV0p43wL-003fPq; Thu, 17 Dec 2020 12:32:35 +0100
Subject: Re: [PATCH v2 2/4] linux-user/sparc: Remove unneeded checks of 'err'
 from sparc64_get_context()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201106152738.26026-1-peter.maydell@linaro.org>
 <20201106152738.26026-3-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <b6cc0836-3245-3907-9bb0-83591d658320@vivier.eu>
Date: Thu, 17 Dec 2020 12:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201106152738.26026-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zKQwESq4Bq+p/0/H+gOdbNq3t14qneXRoXQbJcP7Dl8zAEZG5Ld
 sFqHrnMDPe7HtkdWVfuMDIcQVmZsxIDGC+oEX9PdScDugsRawLk2IKmDZSb6MXnY3+w/a4Z
 uhUg3QasnqbTwyNSQYFfS+cI+8ZkDrHYVdsPNoNGtFN0awIU+hmhzcr22GQWsePzJIDy9wG
 GljlyENXl/GO85fG/gl8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:75QTX5dsMiA=:lqP/clS+2oY/r1IOBmE4ME
 vkghU0tfzR7woQHrzoPWCU7CWAll76YkO5X1VjOev7yHsEUn+h0YaeCHYnTudLb82NqFbb2+I
 VtG0hZ5UWMJ3Js7rM8FOLAkYGu9jO9Y6Kx0CWbTpDYUcUQma+fgH9j7vKXEDDxM9+to0Oucl5
 0ThN7Ak4gw8AA4c+BoOJHY/N8uDjprOgNUks6bt5USCW77ggtJy7ECNs9pdVKK2Kq4kgnOR+9
 okTv9ywF1ufFZ1VsbLXZZ1PvmzS1xTBmty43VzAnqPZNHAWdXzTQzumOLgu9VbsKaz7Aj/8jy
 4phs0p/S5VjvKHsedTGQryFGwjiPp2k8JeYPbdF52ERehzsaBBkxiaTQrXz93Q9cCfX2PiRe/
 Op9qw4/RRMeSjROQrAQJfT0PhaKIBDGnDcSAMjvmF8Upp6oexiHerpnh2J3uK+loK+UVDCUBt
 lnuEto3LIw==
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
Cc: Giuseppe Musacchio <thatlemon@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2020 à 16:27, Peter Maydell a écrit :
> Unlike the kernel macros, our __get_user() and __put_user() do not
> return a failure code.  Kernel code typically has a style of
>   err |= __get_user(...); err |= __get_user(...);
> and then checking err at the end.  In sparc64_get_context() our
> version of the code dropped the accumulating into err but left the
> "if (err) goto do_sigsegv" checks, which will never be taken. Delete
> unnecessary if()s.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/sparc/signal.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
> index e661a769cb1..43dcd137f51 100644
> --- a/linux-user/sparc/signal.c
> +++ b/linux-user/sparc/signal.c
> @@ -555,8 +555,6 @@ void sparc64_get_context(CPUSPARCState *env)
>          for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
>              __put_user(*src, dst);
>          }
> -        if (err)
> -            goto do_sigsegv;
>      }
>  
>      /* XXX: tstate must be saved properly */
> @@ -598,8 +596,6 @@ void sparc64_get_context(CPUSPARCState *env)
>       * hidden behind an "if (fenab)" where fenab is always 0).
>       */
>  
> -    if (err)
> -        goto do_sigsegv;
>      unlock_user_struct(ucp, ucp_addr, 1);
>      return;
>  do_sigsegv:
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent


