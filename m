Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6E48B8E3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 21:52:14 +0100 (CET)
Received: from localhost ([::1]:59102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7O7p-0000wr-A2
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 15:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7O61-0007vk-39
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:50:21 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7O5x-000853-M1
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 15:50:20 -0500
Received: from [192.168.100.1] ([82.142.23.158]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MEmIl-1n9q133L8F-00GHLk; Tue, 11 Jan 2022 21:50:10 +0100
Message-ID: <718486b4-0ad1-5d48-9f24-4d8b58ee072b@vivier.eu>
Date: Tue, 11 Jan 2022 21:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: rt_sigprocmask, check read perms first
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220106220038.3658586-1-venture@google.com>
 <3d44e8ff-6adc-8c52-5449-1c3ef4355786@vivier.eu>
 <CAO=notz06X6SP+U_FSkMsJtUO751+2EkqffCRQqyNUkTPb6oqA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAO=notz06X6SP+U_FSkMsJtUO751+2EkqffCRQqyNUkTPb6oqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q7U1h7naFaU4v/qWMxPvFw5oxhIGhWSNb2T2hQONdEp45/r70wl
 LB74Qm6Nt76uPAkC83QVBPLksXMOQ/lb5Aq/yYQsYHZj2PF/sapD/Sm3MZbWSEEqa+OiDeV
 8vDzkyj6EHbc1lgm0XsQKVDdEmJ0bnKZVPQmmFfQxse9cGWPMcUk666fUOXrv9CCN/1DLf0
 eCPIZkVJbUw4OX7SLgcFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p7q7D/8NeoQ=:CZz6He47+IDGh8wtPw/r/7
 V7LNvt/SYMBzMzWCCjlXgUPJ+4LeF8Hor5lp44IauvndKxpbvCh9TZNMGYYwjzZrCMwN1OmPA
 IUlNWV/5QdDUutiuRIjZnTGwvYx0nouiL+sGsqqIwtMV8Abttka2gJtUiBdzXGs3aLddKYhx7
 ERG+xQoJ0QWaZmCpdIiJtPLnbcBrATjhI+P7+cTYiUqyFuuGzvVSX2wRWbjnxFWlkteiXkT3s
 A2qhjOzjIZOcmxec9GIbjxn+ljpltlzhigM5ua0vNEsupL6XIwcCOJN7Qpx3FAp8BZNmbUTfI
 CTfmUAvF6nQWi4rIk7GMVIKJNJ5tjpMLDDgWoUv7hsSKYHXTRp6HlwVlQgKSSiaCQyGpxzyHZ
 zJNUm7zoo9KCKzIr09uRS0cfMIP9nHPjHe2f3sHvdYnke1saDHLEk92zhGhni8HlbkJXv+TM7
 0GdBDr4E9uCytofVFlsMbdMqcnsiffF+Xon3EaRNqYNHLUUxRYnodcKSHH41Lc96YfNBQlq7s
 ASfoVPf29y7ATxQ8yZvYU51Z5EDGfcbCIjjE0WQ/+K+g8GIeeeiFoJDGd/P+4xBRjYyqlusNJ
 2l8gERGKv0DG66kTx5CJBdzXDqtuJzpq9xHmVnB5NS7HLMZa0XLPZmt+R/5Vz4WJ3TXF8+610
 K+fv+qzmUi44UchLfIPSTYYF90VVW7JsoHXs4rzVqLUbPTUdH0zp/SsfG+ckPNH5XbRE=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Patrick,

Le 11/01/2022 à 21:14, Patrick Venture a écrit :
> 
> 
> On Sat, Jan 8, 2022 at 10:16 AM Laurent Vivier <laurent@vivier.eu <mailto:laurent@vivier.eu>> wrote:
> 
>     Le 06/01/2022 à 23:00, Patrick Venture a écrit :
>      > From: Shu-Chun Weng <scw@google.com <mailto:scw@google.com>>
>      >
>      > Linux kernel does it this way (checks read permission before validating `how`)
>      > and the latest version of ABSL's `AddressIsReadable()` depends on this
>      > behavior.
>      >
>      > c.f.
>     https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
>     <https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147>
>      > Reviewed-by: Patrick Venture <venture@google.com <mailto:venture@google.com>>
>      > Signed-off-by: Shu-Chun Weng <scw@google.com <mailto:scw@google.com>>
>      > ---
>      >   linux-user/syscall.c | 10 +++++-----
>      >   1 file changed, 5 insertions(+), 5 deletions(-)
>      >
>      > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>      > index ce9d64896c..3070d31f34 100644
>      > --- a/linux-user/syscall.c
>      > +++ b/linux-user/syscall.c
>      > @@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>      >               }
>      >
>      >               if (arg2) {
>      > +                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
>      > +                    return -TARGET_EFAULT;
>      > +                target_to_host_sigset(&set, p);
>      > +                unlock_user(p, arg2, 0);
>      > +                set_ptr = &set;
>      >                   switch(how) {
>      >                   case TARGET_SIG_BLOCK:
>      >                       how = SIG_BLOCK;
>      > @@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>      >                   default:
>      >                       return -TARGET_EINVAL;
>      >                   }
>      > -                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
>      > -                    return -TARGET_EFAULT;
>      > -                target_to_host_sigset(&set, p);
>      > -                unlock_user(p, arg2, 0);
>      > -                set_ptr = &set;
>      >               } else {
>      >                   how = 0;
>      >                   set_ptr = NULL;
> 
>     I know it's only code move but generally we also update the style to pass scripts/checkpatch.pl
>     <http://checkpatch.pl>
>     successfully.
> 
> 
> That is a reasonable request, however, can I just send a follow-on patch?  I didn't write this one 
> and I honestly don't know much about it, but I don't mind doing the cleanup
> 
> 
>     Could you also update TARGET_NR_sigprocmask in the same way as it seems the kernel behaves like
>     this
>     too in this case?
> 
> 
> I can take a look.  I would prefer then to also prefetch the style fixup in a preceding patch. I 
> don't recall seeing whether qemu supports clang-format.
> 

There is no problem. You can keep this patch unmodified, and add patches to fix the problems.

I only ask to have all the patches in one series.

Thanks,
Laurent


