Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F281640AE02
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:41:01 +0200 (CEST)
Received: from localhost ([::1]:42552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7kD-0006yh-2x
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:41:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7Wo-0003qe-6b
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:27:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7WY-0006wc-Hb
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:27:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so1888744wme.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOq6/fLOy2/rJ6jV6gp3cbWwu8hJHxUIYvqTONQ2Dkc=;
 b=qXdR6VJ2ydSiu/GMpszhtPThGs+e9dtCEtBFQM+0bseO8SDx/rCBsyZeQXK1maMwGN
 //ROJzapghkKeZoQkQJCZmnIZ7gUkhTtrWeSx9h1GOWa4Q/5I48kiR1HMQZjKp+jPFaT
 sFWIv2bW5xkVR5iqLiLwsVAF8HXcDDL9u21rwWlRlp6IwgGk+A23PC3fR46Pn6RSUq4H
 GZ36KcG4TujFtqWlAL1Vm3Yld8dfsyVXeCRFERDliXPJT1K/jJ9x+2ACxrpNKmJXigjS
 Y49kYW4PRuxE2sVeVRJ67PmXjRJ4iV2BMaOwh4vV2QDdQ6n44WcqTkuTcYcXiRKYIvW9
 FcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOq6/fLOy2/rJ6jV6gp3cbWwu8hJHxUIYvqTONQ2Dkc=;
 b=kKMRGBb5lXiXMOsclB3RP1kLa5d0e3iSr+yl4pnE9tr7seIuzVuBYoM+6XkvgY8y+F
 GcTd6kAhEUmMIuWrGV4qjIj/9I6FwCaHLV0fr+2jA4pWJ+SHzxiAzFI316cy1Lpeo2VK
 9/t8TnBMz2tVJr3tyBVp4abdoQVPb2IzNkRAE/U3nFMwVL1RKaDA7Uw91lJubY7khKVC
 hPC5ZrXNtGBcx+LYpxPYGZaeCd9hH7u6b+t2dXzBgt1fG1XChJuovFGGTQxvLQVhKBo3
 5mGGrWWumt/3T7hevDk/B3u2MX45t6LBCQWDKy9j50L7eh/hooRJKdANGkYFLfVqVKuK
 exJQ==
X-Gm-Message-State: AOAM533sXw2HQMEECqf7Os8jgd+5i6wwLK0oQ1P6n6K9KFRWlhon+alv
 0zGDtk0chftAWWYQQRRZHmUiyIdeLTrzCZZKKetxog==
X-Google-Smtp-Source: ABdhPJwuVmzFlcsAQQqEli0x97hetBMARUwBmmWbChYKptCJtC294NwGVb172tG7/g62CCoxAhP1X+0CdSsINMMKj8o=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr1965958wmh.126.1631622412870; 
 Tue, 14 Sep 2021 05:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
In-Reply-To: <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 13:26:01 +0100
Message-ID: <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
Subject: Re: [PULL 14/14] hw/arm/aspeed: Add Fuji machine type
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 13:14, Joel Stanley <joel@jms.id.au> wrote:
> The upstream device tree uses 2G:
>
> https://elixir.bootlin.com/linux/v5.15-rc1/source/arch/arm/boot/dts/ast2600-facebook-netbmc-common.dtsi#L20
>
> It's unfortunate we limit the defaults given very few (no one?) is
> using this model on a machine that is 32 bit.

This runs into a set of desires which are all reasonable
but unfortunately sometimes in conflict:

(1) boards should behave the same on all hosts (whether those
    hosts are 64 bit or 32 bit)
(2) RAM blocks should have a length that fits inside a
    signed 32-bit type on 32-bit hosts (at least I assume this
    is where the 2047MB limit is coming from; in theory this ought
    to be improveable but auditing the code for mishandling of
    RAMblock sizes to ensure we weren't accidentally stuffing
    their size into a signed 'long' somewhere would be kind
    of painful)
(3) default behaviour of a board should match the real
    hardware
(4) every board should start cleanly with no non-default
    arguments, so we can have a machine-model agnostic test
    of "does every machine we support at least init cleanly"

So far when we have run into this problem with other machine
types, the one that we have ended up discarding is (3).

There's a good argument to be made that what we should deal
with is (2) -- this probably involves making ram_addr_t
be 64-bits always, rather than "64 bits unless we're on
a 32-bit host and Xen is not compiled in", and a certain
amount of testing or audit that we don't have any places
where we stuff ram sizes into 'long' variables. But it's a lot
more work than compromising on (3) :-)

Even if we did fix (2) we'd need to compromise on (3)
sometimes still -- if a board has 4GB of RAM that's
not going to fit in 32 bits regardless. But we would be
able to let boards with 2GB have 2GB.

thanks
-- PMM

