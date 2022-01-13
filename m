Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B80548D64A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 12:05:27 +0100 (CET)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xv4-0004mJ-2R
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 06:05:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7xqX-0002Yd-2i
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:00:50 -0500
Received: from [2a00:1450:4864:20::42a] (port=41795
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7xqQ-0004sN-UB
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 06:00:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v6so9334569wra.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HTwBx0u8DClY/dihfaA3Dh48B4DW1rGeHcySJkjj4bw=;
 b=XLL2t6uBooqKPHWm4JLulwY4i3/NR3Tl9j6kw9IP8FeqHa34argEhiDSYg1WbQyo8l
 kl2C0brSwzVlRCgUWWebPywttwVGPBJTXzJ+Jzq26VM1pj+8VUiST7mQ+x85us+FQaKm
 b0Il+09DWBQz/dwguzgype9aAle5AuCCuCTyE5rYwKEkXwPYccGJG2iKolz7oFTWpu/G
 fQAcMq2f2r7/6ZTVJy/411pDQy1uYmXCorb/NW75gULq1uqiOE11YHglOqEN4de3z3E3
 fki+yG+LgrguVo795go9/5ABJvWsMaty5Khv7z1hn7JnfEt3GmAmRsC1X0GjBhlaxAVL
 zF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HTwBx0u8DClY/dihfaA3Dh48B4DW1rGeHcySJkjj4bw=;
 b=OcwBoplrqPbieHkBbOJS9FVKa49Ipuxon7S7TsXPu6Gul7cwEMeFoijDbKzoHL45Oy
 NMimstTM+v9M8uo6BC2tB8Aqq8zz8fZpnP5nhCqw9sRV0CaU8ZGASOwcgT9VoTGg5Btw
 /CygoSXwUZeDzW+ZIG7TnOfzBhrLkokJJ7fv9rA7lGphhZcm/4M6DoxRz/f57poas30h
 i1ycw0TI1NJoVtmnIF0x9jlY9CJagIIZrDHv47htnV0XZ+q7e1L5dIrZiesnFg0lSn/0
 r9lrySy/SaDyY0Fe958NsFYyPZEYwxyXJ+7cazUJ6E74NpYrtNSpAKZLPz411zN4mI+Z
 0jwA==
X-Gm-Message-State: AOAM531K+JFAzVApGkgQ6rhqLkA+RIpEGmRtF7AlupxL8f6ykldVViHJ
 I2JcZDijGXCpDzu2LiAduzqirME0wgQNVD7dV+40wg==
X-Google-Smtp-Source: ABdhPJygc23qBU+P6Zdpab/oHOrqLF48xAz6+0oufu3VCjzUcCjixRRj0Euqo35STI5M9fBU7zXK/v/ERnH7dAx+H8k=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr3687852wrw.2.1642071631688;
 Thu, 13 Jan 2022 03:00:31 -0800 (PST)
MIME-Version: 1.0
References: <20220112102345.79395-1-dgilbert@redhat.com>
 <CAFEAcA9b9NtkyWY2aCUpOvm2J5uRVt9qUPj6gPk3MFtkTh6ceQ@mail.gmail.com>
 <Yd6wrYdzzT/XsSSK@work-vm>
 <CAFEAcA_W9KoMiuBApJaPs9inOrWtjzr2F4L4qnnTxegvFwd_NA@mail.gmail.com>
 <Yd9+mPj6tldj3uwo@xz-m1.local>
In-Reply-To: <Yd9+mPj6tldj3uwo@xz-m1.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 11:00:20 +0000
Message-ID: <CAFEAcA_weTMMNsFXc5HOQLG39y-F3XBrpcez7Ln9-ckChfO-qA@mail.gmail.com>
Subject: Re: [PATCH] migration: Add canary to VMSTATE_END_OF_LIST
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, marcandre.lureau@gmail.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, lsoaresp@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 01:21, Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jan 12, 2022 at 10:56:07AM +0000, Peter Maydell wrote:
> > We could have vmstate_register_with_alias_id() iterate through
> > and assert presence of the right terminator (probably only if
> > qtest enabled, or some other suitable condition). Then the
> > existing tests that do the basic "check we can instantiate every
> > device and initialize every board model" would run that code
> > and catch most missing terminator cases, I think.
>
> Agreed.  How about assert it even without qtest?  We do tons of assertion for
> programming errors anyway in QEMU.

I don't inherently object, but in this case to do the assertion
we'd need to do a scan over the fields arrays which we wouldn't
otherwise need to, so the cost of the assert is not simply
the compare-and-branch but also the loop over the array. If
that's not significant in terms of start-up time costs we can
just go ahead and do it (which would be nicer for debugging
and making it really obvious to people writing new devices)
but my remark above was a gesture towards "maybe we need to
not do it for normal startup"..

-- PMM

