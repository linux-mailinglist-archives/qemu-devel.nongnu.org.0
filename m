Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9A5ECBB3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:54:27 +0200 (CEST)
Received: from localhost ([::1]:50374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEmn-0000bt-W5
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1odEkb-0006gL-0m
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:52:09 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walters@verbum.org>)
 id 1odEkZ-0004vV-AS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:52:08 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EE49C320090C;
 Tue, 27 Sep 2022 13:52:03 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute5.internal (MEProxy); Tue, 27 Sep 2022 13:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verbum.org; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1664301123; x=1664387523; bh=fotpJBo8Vu
 Gxhlza7+sKnJD9vRGz9MqSig111e2TlUA=; b=RxItZakgRM/FQS7vD2Hf2FXG4i
 6zyfXgq+sVGg1lU31k/lsJ51RgHpTqXnOex0Ibrf4IgtTEAFXxE7t84zyDQvea4D
 YCF55W+JZ86QCQf1UXO9u/Y/AETCdoe6Ukhs8Kn1BOhxipN27i34uxXKnHuMdsFM
 nzC1/GlbkmMbozyPPOClqqPGYWJYmuPYnfnCvg6CEuJ88yK5Idp0/ROJSc9dF9bo
 c3yfk2ynchOoa8YPcyW9Dj0wJ2w7doALjklbaQUBuyt6GREfv2EMdgIJDUoTA/dI
 lvZizVZwZhsVk+njWg9zhKIbAAfs28qYX69HovXKRIcwWuhbMf/oo/e5XNFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1664301123; x=1664387523; bh=fotpJBo8VuGxhlza7+sKnJD9vRGz
 9MqSig111e2TlUA=; b=yYVJMafqL9YUXica6doKLkX6M8ja97RhWt8MvYXnLE0I
 qjtd6HxzTO9GG5e8UVgHG5Xi/Sc/pdx+YYWd9UNGt15dh+G3nejyzkVPsW2bscwE
 Zg8j7Os3Jlx6UQqq14HN1yos2RORxv81r5Z/ftiOdH0TA83NOzqV4NljFn5+rkKJ
 hAw4tHDC8tqGeUSB2tA9z5IiVX8bT9ErWpKNcxr0U0oE2RcCRp9IILKJ4ZW8Uwst
 YrdozvKQEMHIulBuNRoT/rlWC/h7ms9anIrw2spi+3gDKfeC3pNeXOXYwk3P7C1s
 mERl7puogPEJ2zipaOBZS64voKoHA5VelBKvrpOdog==
X-ME-Sender: <xms:QzgzY6Yiua7QwBj01yAx-4QsIxvJyTIlSr7TtoZ7WbAwx8PE-pJcig>
 <xme:QzgzY9YA8-a8RUsuONs26yYe_uWf1FJGxF-A3Xk9pvTsm9bJcfCy1vZLCEb_DGXHU
 JXXkombQYO1hRFK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegiedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfveho
 lhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghrshesvhgvrhgsuhhmrdhorhhgqeenuc
 ggtffrrghtthgvrhhnpefhjedutdehtdfgueeuledtkeefkedvgfevieefudetkeehffej
 gfeiheehkeegteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpeifrghlthgvrhhssehvvghrsghumhdrohhrgh
X-ME-Proxy: <xmx:QzgzY0_33_jlgxULXsfXEGslulPwMVadjKJZt26i-gPFwXhnigm2Kg>
 <xmx:QzgzY8qyRPOhrBjSC0Dc62PT4qvJTjmPLV_8PJheGQSLyRTwtcX3kQ>
 <xmx:QzgzY1pgXYdgH4eSQDJEMG02n1n1b9j-yA2aQp0FUq-uMwXtrrQcnw>
 <xmx:QzgzY81ergHm5qJSJbl2Iyj1UZGIxzqSGoo0tj3BLw7jDbK-rn3sig>
Feedback-ID: ibe7c40e9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 27DC52A20079; Tue, 27 Sep 2022 13:52:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <798fe353-9537-44fe-a76a-819e8c93abb5@www.fastmail.com>
In-Reply-To: <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
References: <4362261a-c762-4666-84e2-03c9daa6c4d9@www.fastmail.com>
 <YzMmu3xfOtQwuFUx@redhat.com> <YzMrYAJQeSP2hDSs@redhat.com>
 <CAJh=p+5rQDBJJC8VNGL10KYgDeq-Hg5WK7avONCti03eJGH+ow@mail.gmail.com>
Date: Tue, 27 Sep 2022 13:51:41 -0400
From: "Colin Walters" <walters@verbum.org>
To: "German Maglione" <gmaglione@redhat.com>, "Vivek Goyal" <vgoyal@redhat.com>
Cc: qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 "Sergio Lopez" <slp@redhat.com>
Subject: Re: virtiofsd: Any reason why there's not an "openat2" sandbox mode?
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.20; envelope-from=walters@verbum.org;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, Sep 27, 2022, at 1:27 PM, German Maglione wrote:
>
>> > Now all the development has moved to rust virtiofsd.

Oh, awesome!!  The code there looks great.

> I could work on this for the next major version and see if anything breaks.
> But I prefer to add this as a compilation feature, instead of a command line
> option that we will then have to maintain for a while.

Hmm, what would be the issue with having the code there by default?  I think rather than any new command line option, we automatically use `openat2+RESOLVE_IN_ROOT` if the process is run as a nonzero uid.

> Also, I don't see it as a sandbox feature, as Stefan mentioned, a compromised
> process can call openat2() without RESOLVE_IN_ROOT. 

I'm a bit skeptical honestly about how secure the existing namespace code is against a compromised virtiofsd process.  The primary worry is guest filesystem traversals, right?  openat2+RESOLVE_IN_ROOT addresses that.  Plus being in Rust makes this dramatically safer.

> I did some test with
> Landlock to lock virtiofsd inside the shared directory, but IIRC it requires a
> kernel 5.13

But yes, landlock and other things make sense, I just don't see these things as strongly linked.  IOW we shouldn't in my opinion block unprivileged virtiofsd on more sandboxing than openat2 already gives us.

