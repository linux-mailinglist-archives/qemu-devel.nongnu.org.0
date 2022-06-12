Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D41547B13
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 18:32:27 +0200 (CEST)
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0QVl-00030l-NL
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 12:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o0QTL-00029V-2u
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 12:29:55 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:56025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o0QTJ-0000XG-CM
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 12:29:54 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1gWU-1ncTcg173Q-0121N8; Sun, 12 Jun 2022 18:29:46 +0200
Message-ID: <c8d69e95-ce3a-059e-af66-211b99fdb5b7@vivier.eu>
Date: Sun, 12 Jun 2022 18:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, thuth@redhat.com
References: <20220610143855.1211000-1-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [RFC PATCH] linux-user: un-parent OBJECT(cpu) when closing thread
In-Reply-To: <20220610143855.1211000-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KlAU2wfPg6oAXBWaeEsm5J48yXtpHYqYw+ApuJkXEj2ZRYM24Au
 SLC+P8QMp5CRWtFVNtJPlyxUI2EaKjbeEFB7movb07gerx+YN5hnFocNxwT6RAMEe019tTt
 OAvgIa7117vy25CK2P/TxLCQ2mhJ6esmjYpsIa8rDTT1v2hx5WN4vv+WZtqIwfMem2O82rM
 ouKLnLzB6zl98ABYphmvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HQybRUMTqYE=:GKtPwrqknXcBRkeNACyTut
 jd5BFCbtgD+xAiJiPP0kLiBvr/AN3lIgZhf71HdrpZvxQtXZFxsCzJ6m333Y4VrJ1qsy9DQ2b
 9gGkG7YmLfZ9xTQnOy14hgOf/PpH0qmBLE4ClrmHmw4vQINJh+3ABdfJfOqC+ylGStqtMW9VB
 kc+QFUFrRYJg9yEXgP2jy/QKqSed17t7m9h/yNl04kJGhDRq4iBtyDRXHRUN03YguacV0l0qM
 3A8Isbd+cQCyd69C18S4NfAKuz53MfhB0S0cRocgWQlrGg8i8g2zhIQzxNAEJS+621nt44d76
 MdFkrf7VXoGCBEFEGy1wmt1bVtVSJ3784mJrdH85Kt5C+OXKRWxh9UWYEOxrAeLv5Mk6lzTnA
 BEwytfW1+YOFvzjsiL0YHDvKX2OZJt6ypkCfSjwFVQzGUbQ+zpWRx1atDHvEmpaF23TAEFBi1
 ZUCXvJFQS7C1eIPMPRdDaR1d2Ci3dOhKukwIlZzOFvoFXgKki+Cf9PlZg1z8uX56nSvMYVKrj
 g7d5M/fBXGRKXEF9PfGzudFVhEpB9eRO7C3FkxqvGyrEB/ZV89a9bmuoY++2VrvGmBm8ImaBB
 QzYbDYELmAdpptJnzdvdxYsynTOvmkog1OX1QU99Lc9vXrRQcLRcfAF8wmN/BmuragWwzK1NL
 +8jfBcTpyOkaXG58OVVVWPSY0+d3m9lFELnjLF+Wq70++sRuqJpvsA40KO5Fwqjvri+3Qr2UB
 mQr+ylJbqKKYgFlXJkfjobeF91Rh/+OFqoAaWA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 10/06/2022 à 16:38, Alex Bennée a écrit :
> While forcing the CPU to unrealize by hand does trigger the clean-up
> code we never fully free resources because refcount never reaches
> zero. This is because QOM automatically added objects without an
> explicit parent to /unattached/, incrementing the refcount.
> 
> Instead of manually triggering unrealization just unparent the object
> and let the device machinery deal with that for us.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   linux-user/syscall.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f55cdebee5..c413d32311 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8566,7 +8566,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           if (CPU_NEXT(first_cpu)) {
>               TaskState *ts = cpu->opaque;
>   
> -            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
> +            object_unparent(OBJECT(cpu));
>               object_unref(OBJECT(cpu));
>               /*
>                * At this point the CPU should be unrealized and removed

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

