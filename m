Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C983144C510
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:33:43 +0100 (CET)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqXe-0000n9-Ve
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkqW9-0006zB-HG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:09 -0500
Received: from [2607:f8b0:4864:20::835] (port=41935
 helo=mail-qt1-x835.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1mkqW5-0005VU-Tw
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:08 -0500
Received: by mail-qt1-x835.google.com with SMTP id v4so2628451qtw.8
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpfT0GH0k5ATynxHHRk64yIaBW5xTDGrBfeu3hpZC6E=;
 b=SJwKEizD0GKRWv1XL92cXTOwexxoXUzo8ogU/ayZrcI1/flLY3rg+tsSAsqkC68Xaj
 VrxUL47NVNoRShXBlFZgQWMYpAsntU5ssuueKRfdO2QVOJhYfMSW8mnKj2H1Hv9T3yAf
 T0rwd6TXVbeOOjqcnKrw+Gh+3WQbxafF33ddD57ksxWOk+drg2I3AEeLEpGB1HZdq2L3
 TeTfbvesY9GojTOGYUjToVsnpseuRO74MjO7KY7wZFCPrZKVjyTf3WXLE4m4tahdkq7L
 qmgMPo+6cbWHhp3KhDlI/JElh0Y6cbUObhCNDEiOGP7qliY+EBs2G4Ek+C6CVpFqi9jK
 BcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpfT0GH0k5ATynxHHRk64yIaBW5xTDGrBfeu3hpZC6E=;
 b=CBvig2zJtg94t+Wp2aCK1xjV+P4oMKElkJnj6hpON5bqO3B1i7GwjWmfRJRSNuIu8n
 x1UNmyVip65iMrQcRoN40/4OmXAddUrN6hhF2DkmdjGWShdwKJuFJomXIJAN1W0gMnSL
 FF8wuBloiQJkr0qJM45STT00kv9SvZgNiFUSbakOP+TMPHbefA5ONcAmvYfqnlNc5B9y
 8al03NyVv3dHJj2+L/+TkO27BdxSf5KRmiGbGbWGQ7TCKnmrAR793jxs0j1B+8a1oNZg
 ASDM+n3IMGu+/r/njc2OhUkEiTkXYbwxnWFz89ERvjR492ah+SHtC2NwtP5iq4Tc8+WJ
 vIZA==
X-Gm-Message-State: AOAM532u6Ib1gvVpgAEqjl/GRrV3iSMR6vP8Q9BIvMNfLvdd1zkYv7ME
 cl3ZKHm4qX6qxnZ+XyhCOJo96Cl9KFFrXsA+Fgo=
X-Google-Smtp-Source: ABdhPJyB/QD9y3PhqwaE5PaD09K4TNme9QB6BjwBgdPiJCFOC9C+kJju1h5VQj36XUYQnN9LykUGeT+vo3pbv9jSW0c=
X-Received: by 2002:a05:622a:114:: with SMTP id
 u20mr308732qtw.116.1636561924362; 
 Wed, 10 Nov 2021 08:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20211108194230.1836262-1-raj.khem@gmail.com>
 <0242a761-cd00-1a22-e64c-952befad9988@linaro.org>
 <01900319-d1fc-b677-1f35-5ee2da5bc8a4@linaro.org>
 <cda72b6b-e34c-2c99-834a-5897f128a5ae@linaro.org>
 <CANCZdfp0tkdsoEp7_AYZ=0MsiN9hg=pY5hf_AhqYpCiiKYqoAg@mail.gmail.com>
In-Reply-To: <CANCZdfp0tkdsoEp7_AYZ=0MsiN9hg=pY5hf_AhqYpCiiKYqoAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Nov 2021 08:31:37 -0800
Message-ID: <CAMKF1soUgyByoOCoHUvmZnp=8r7QQ9=jYfxndusu6HZKXV3W+A@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Replace __u64 with uint64_t
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::835
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=raj.khem@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 10, 2021 at 8:03 AM Warner Losh <imp@bsdimp.com> wrote:
>
>
>
> On Wed, Nov 10, 2021 at 8:19 AM Richard Henderson <richard.henderson@linaro.org> wrote:
>>
>> On 11/10/21 4:12 PM, Richard Henderson wrote:
>> > On 11/10/21 10:25 AM, Richard Henderson wrote:
>> >> On 11/8/21 8:42 PM, Khem Raj wrote:
>> >>> uint64_t is available in all userspaces via compiler include stdint.h
>> >>> therefore use it instead of __u64 which is linux internal type, it fixes
>> >>> build on some platforms eg. aarch64 systems using musl C library
>> >>>
>> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >>> ---
>> >>>   linux-user/host/aarch64/hostdep.h | 2 +-
>> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>>
>> >>> diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
>> >>> index a8d41a21ad..34d934f665 100644
>> >>> --- a/linux-user/host/aarch64/hostdep.h
>> >>> +++ b/linux-user/host/aarch64/hostdep.h
>> >>> @@ -25,7 +25,7 @@ extern char safe_syscall_end[];
>> >>>   static inline void rewind_if_in_safe_syscall(void *puc)
>> >>>   {
>> >>>       ucontext_t *uc = puc;
>> >>> -    __u64 *pcreg = &uc->uc_mcontext.pc;
>> >>> +    uint64_t *pcreg = &uc->uc_mcontext.pc;
>> >>>       if (*pcreg > (uintptr_t)safe_syscall_start
>> >>>           && *pcreg < (uintptr_t)safe_syscall_end) {
>> >>
>> >> Queued to tcg-next, since that's where the original patch came from.
>> >
>> > Dequeued.  We need something more, because on debian we now get:
>> >
>> > ../linux-user/host/aarch64/hostdep.h:28:23: error: initialization of 'uint64_t *' {aka
>> > 'long unsigned int *'} from incompatible pointer type 'long long unsigned int *'
>> > [-Werror=incompatible-pointer-types]
>> >       uint64_t *pcreg = &uc->uc_mcontext.pc;
>> >                         ^
>> > cc1: all warnings being treated as errors
>> >
>> > Perhaps we need to use __typeof() to get the correct pointer type?  Oh for c++11 auto
>> > declarations... :-)
>>
>> No, we need to not use a pointer at all and grab Warner's
>>
>>    https://patchew.org/QEMU/20211108023738.42125-1-imp@bsdimp.com/
>>
>> Even grabbing the first two patches of that series for 6.2 would fix this.
>
>
> I tried to do a pointer for this stuff, only to find several places where there
> were mismatches like's reported there.
>
> I also have an improvement to that series I was going to send later today
> that fixes the check-patch warning by moving some externs around.  I was
> going to do that after looking through my inbox to see if there'd been more
> comments or not. I'll make sure the relevant fixes are first for this issue.

Thanks Warner, if you are fixing it in your series, then we should
drop this.  Should we
use uintptr_t or something

>
> Warner

