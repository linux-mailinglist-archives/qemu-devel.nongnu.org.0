Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C8652404
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ezl-0002zm-NI; Tue, 20 Dec 2022 10:57:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1p7ezj-0002xx-Jx
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:57:31 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1p7ezh-0007Z9-IJ
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:57:31 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4258A32008C3;
 Tue, 20 Dec 2022 10:57:26 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Tue, 20 Dec 2022 10:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1671551845; x=1671638245; bh=X/KKCzlhXp
 y/EzAMZnfitNyrcyxRXZPTaAiDRqXLNGQ=; b=WF3/qyA6mribr0nTrnt2zfVKTh
 tfOePDfNm0KQkNRpX7Ep5745b97/KgKta0SUUKAgckrQqZBPwwdLqBRhIlHjOxQZ
 X+YkKFbDzBtOKgNnPAMYWe0hnryz+kh9TA27yabmH36s4CUvMvUphTz0dgTiwJTv
 xACTsJBXX+izWAA7WiO87BarcyfkQcLcp09mPjBNBQ6hVsnLjT3IjzgnumcktXUC
 DEJQORcPiBb64Rqgk1UwIJLSe6vm1w135F2OQ/f4jYpfCQATgT1BCv77Mdge47tK
 ieWJhUUUda/205PpUKHwVKSW0BCDCR2mcUJniz1t3nyTeZipbrJqYvODbZIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1671551845; x=1671638245; bh=X/KKCzlhXpy/EzAMZnfitNyrcyxR
 XZPTaAiDRqXLNGQ=; b=kGoiTzesK/0U0zu0VjwdBzjr/hxcBHFxe1NgHKx45hYh
 /zVO6cbG8jT0/AiopLh3I5CGisEyXDyWE9+pKDkoImn9tKflncVCaei/z7TelS1t
 +DaQC6P9hCDR3IIUrxJ1KiG8W52ha7f+5KeT/ynrlXY1oG7Rze5kPfzm1zTUDYCM
 iaeXxAVYCLKBLoaR/Rx7F/2gIud2jOwbPMJcwKWPJDvmA2I067JbcfKhFFHmP7b2
 IEn9cTGvVHLxJ11fOa3O7Z99TmWvASfpYAgwBnVGNTQcFqRUoqLLp6AhE4i4wzXA
 oUciWPF0ILO9uEFefgzFXik8DJ+OqlT2uZ7dUxoWrQ==
X-ME-Sender: <xms:ZNuhY7nmoBYb-CcNpNM3dC6hFhMReEjD38OTvl1WddmpbSJSEIk9-A>
 <xme:ZNuhY-2OTpoLR0OFIEXv_KOlUk7tY9gte3un_XEmE03p8MaSEWSpq9NJal02kaZm1
 Qu_5zHgxIWWN3cXy8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeigdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:ZNuhYxohuIfX0JFWzmO_k8T6g58wO_0wfJ57iuntQthmZUlmA4GJdg>
 <xmx:ZNuhYzng_osPTPaSaac9t9fUEhqPBReczmGLOhwDFKzSftiS6kTenQ>
 <xmx:ZNuhY51yyPc7k91mOhozwPlBTKQZbkal7gWpr2ktK46JWBvvdqEPbg>
 <xmx:ZduhY69ZskNdUL1FLOOUS-YPfGFDEYZ3pADtCXXNws5XxdoxMqaQbA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E008FB60086; Tue, 20 Dec 2022 10:57:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <cd182b3e-9ce1-46db-af5e-916021ca2a82@app.fastmail.com>
In-Reply-To: <20221216180807.2843032-1-mjt@msgid.tls.msk.ru>
References: <20221216180807.2843032-1-mjt@msgid.tls.msk.ru>
Date: Tue, 20 Dec 2022 16:57:03 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Tokarev" <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 "Laurent Vivier" <laurent@vivier.eu>
Cc: "Arnd Bergmann" <arnd@linaro.org>
Subject: Re: [RFC PATCH] linux-user: time64: consolidate
 rt_sigtimedwait_time64 and rt_sigtimedwait
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.25; envelope-from=arnd@arndb.de;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 16, 2022, at 19:08, Michael Tokarev wrote:
> Both system calls are exactly the same, the only difference is the
> (optional) timespec conversion. Consolidate the two, and check which
> syscall being emulated in the timespec conversion place.
>
> This is just a PoC. But this brings at least 2 questions.
>
> Let's take pselect6 as an example. There are 2 possible pselects
> in there (actually more, but let's focus on just the two):
> TARGET_NR_pselect6 and TARGET_NR_pselect6_time64.  Both are implemented
> in a single do_pselect6() function, which, depending on its "time64"
> argument, will call either target_to_host_timespec64() or
> target_to_host_timespec().
>
> But these functions, in turn, are guarded by a lot of #if
> defined(foo). In particular, in context of pselect6,
> target_to_host_timespec() is guarded by
>  if defined(TARGET_NR_pselect6),
> while target_to_host_timespec64() is guarded by
>  if defined(TARGET_NR_pselect6_time64).
>
> So basically, if just one of the two TARGET_NR_pselect6*
> is defined, one of target_to_host_timespec*() will not
> be defined, but do_pselect6() calls *both* anyway.  In
> other words, both functions must be provided if any of
> the select6 are to be implemented.
>
> But the good news is that these functions
> (target_to_host_timespec*()) are always defined because
> they're needed for some syscalls anyway, like, eg,
> TARGET_NR_semop or TARGET_NR_utimensat or CONFIG_TIMERFD.
>
> It looks like whole gigantic ifdeffery around these two
> functions should be dropped, and a common function provided,
> with an extra argument like time64, to be used in many
> places where this construct is already used. Like in
> this PoC too, which again calls one of the two depending
> on the actual syscall being used.  Or maybe we can even
> combine the two into one with an extra arg like "time64".

The cleanup you suggest here looks correct to me, but as I
mentioned on IRC, I think this should only be done if the
time64 host side bug is also fixed. At the moment, both
the time32 and time64 target syscalls are always translated
into the time32 variant on 32-bit hosts, which is a mistake
for multiple reasons:

- the libc-defined 'timespec' argument that is passed into
  the kernel-defined syscall has the wrong layout, resulting
  in incorrect data. This could be avoided by using
  the kernel-defined __kernel_old_timespec instead, but then

- time64 target arguments needlessly get truncated to
  the time32 range. This happens e.g. when running 64-bit
  target on 32-bit host, but could be easily avoided
  by converting into the time64 types (__kernel_timespec)
  and calling the time64 syscalls whenever those are
  available.

- On modern hosts, only the time64 syscalls are available, so
  e.g. on riscv32 hosts, the current implementation does not
  even build.

The best solution for all of the above I think would be to
have a wrapper for each of the affected syscalls that calls
the time64 interface first and falls back to the time32
version only if that fails, using __kernel_timespec
on the interface instead of libc timespec.

A simpler but less flexible method would be to detect
sizeof(time_t) at compile time and then use either the
time32 or time64 host syscall numbers, whichever goes
with the libc time_t/timespec.


      Arnd

