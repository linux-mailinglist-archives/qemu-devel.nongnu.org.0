Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027574C20D8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 01:56:09 +0100 (CET)
Received: from localhost ([::1]:36486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN2QR-0006tu-It
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 19:56:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nN2PS-0006Cm-UW
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 19:55:06 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nN2PQ-0005gD-I2
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 19:55:06 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC6BB60FBE
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 00:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047F6C340F4
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 00:55:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FSpfXdb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645664096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8d3NsRpLI4kLFf8ojDpxr98Y5eh/F8jlee00Sd/p97I=;
 b=FSpfXdb0mio/K+YeKHAc5ruauL0zhqUyymqZV52V7rS6k6d2klkxEq3QVUwbe8Zwe4V1Jc
 BnqGH7gywjeMVWeaEtIrNElbmMf5kaoU83NO7UIIN2aapJV6ffmsNklODO/uc1B34KmJlq
 gDKati3IRaSt/BoK2ZDfG7gBmg9dKh8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61ec339d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 24 Feb 2022 00:54:56 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id y6so747868ybc.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 16:54:55 -0800 (PST)
X-Gm-Message-State: AOAM530cVtVf6pnHvKjjcu7c2N33Bmq9GIfV+BAIdvXGXww3+xEi+gQs
 0m8Fm9W5UGz8AS1AGbvo+ES7Si/631ZvZsIleto=
X-Google-Smtp-Source: ABdhPJwfDEOGrwvFQMit980tZnx7EEjBFOfs3eOMVbdbLdqcKU9trvqOuAKoUTWJYW+779nIWzk+clEPXGo/K05LQLA=
X-Received: by 2002:a25:b905:0:b0:61e:23e4:949f with SMTP id
 x5-20020a25b905000000b0061e23e4949fmr299097ybj.373.1645664094735; Wed, 23 Feb
 2022 16:54:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:71a8:b0:167:24f9:2d40 with HTTP; Wed, 23 Feb 2022
 16:54:54 -0800 (PST)
In-Reply-To: <YhbAOW/KbFW1CFkQ@sol.localdomain>
References: <20220223131231.403386-1-Jason@zx2c4.com>
 <20220223131231.403386-2-Jason@zx2c4.com>
 <YhbAOW/KbFW1CFkQ@sol.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 Feb 2022 01:54:54 +0100
X-Gmail-Original-Message-ID: <CAHmME9oa_wE8_n8e5b=iM5v-s5dgyibm4vXMhwzc8zGd6VWZMQ@mail.gmail.com>
Message-ID: <CAHmME9oa_wE8_n8e5b=iM5v-s5dgyibm4vXMhwzc8zGd6VWZMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1 1/2] random: add mechanism for VM forks to
 reinitialize crng
To: Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-s390@vger.kernel.org, tytso@mit.edu, kvm@vger.kernel.org,
 adrian@parity.io, jannh@google.com, gregkh@linuxfoundation.org,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org,
 acatan@amazon.com, graf@amazon.com, linux-crypto@vger.kernel.org,
 colmmacc@amazon.com, sblbir@amazon.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22, Eric Biggers <ebiggers@kernel.org> wrote:
> I think we should be removing cases where the base_crng key is changed
> directly
> besides extraction from the input_pool, not adding new ones.  Why not
> implement
> this as add_device_randomness() followed by crng_reseed(force=true), where
> the
> 'force' argument forces a reseed to occur even if the entropy_count is too
> low?

Because that induces a "premature next" condition which can let that
entropy, potentially newly acquired by a storm of IRQs at power-on, be
bruteforced by unprivileged userspace. I actually had it exactly the
way you describe at first, but decided that this here is the lesser of
evils and doesn't really complicate things the way an intentional
premature next would. The only thing we care about here is branching
the crng stream, and so this does explicitly that, without having to
interfere with how we collect entropy. Of course we *also* add it as
non-credited "device randomness" so that it's part of the next
reseeding, whenever that might occur.

