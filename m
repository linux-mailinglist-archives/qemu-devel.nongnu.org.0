Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 067773FD740
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:54:27 +0200 (CEST)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMws-0003bO-3Q
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMvh-0002FX-7r
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:53:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMvf-0001oC-Lh
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:53:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id u15so1435716wmj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 02:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W86uoonsbj4+EsKSxlkMxU/beyV/ssRukRR1lvSi05E=;
 b=kM7n05IdhdGAKK4fYBbbXFxK3oT17kjvSpSBo5U5aiMEXE6r73vpc8iR6SGbrPlr93
 H2tnFJcuIkRpOjovdwzDwPhJpcRpwClMY9mIhnG6yskKijE3ZIZ7UGH4lXGUYI0PhKnU
 ld1CdgO+UKz9342Mb5p6J5KZEMv8AfNE2CSPz3PcdW9WarVXay31KrTYYmLbU2wCmgIw
 cq77eW2YvqgXtKXb2pPmah9J0CKVlajgJU+WiLdp9GsU4WAzS4NOo4n02LS7t1RZZsLD
 LOFyu/sFhSPHAp+4mJEot4quhbbuGVNtzwpc5B4ix9FYY8pVvIyT9uKFEQfOfx0FzQC0
 bc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W86uoonsbj4+EsKSxlkMxU/beyV/ssRukRR1lvSi05E=;
 b=A0bLBoY0W0OyVuQYkv5RKoCKV2vDKz0kLdz6i+OfrbpkFpwXo6IwH5rV1QusBzf1r0
 xY1As/5l118sgJ0Kc1D88D8/GIiYQFkQ5tttoE7bMqoVKUuE188lCK1vLGi03xaqdU6l
 0qW+iRSU9iiQz2tDRs2zc4KsXcr7eiW2uJ9cUkdCmUGXdxK6XsmBdhsTZZPsWBvo74xL
 1tS7HMv5ttIcXV5W5vM4JKY4Jf3dkPd8SmIGGuEwvrqvpoOzPBHJjx+y3wBMdNqT+hZM
 LoelZWF7sQuplZ9SD0RFthdhZV9RIlpGvOHtNUEkjBbQD7vxqZINLQ0MIdM4YyJuVoHd
 g+1A==
X-Gm-Message-State: AOAM530cq40wIkfBMXGrYldU8MlXPrCnGcnVHD8MeZXq/W5Qw2Z/rFHh
 w7Afa6o/KkENq5ymqVwcylW7ahBVWSRxNObqBVpcbA==
X-Google-Smtp-Source: ABdhPJwLAT0Ek0wRL/I6M2lK6QF5ei15nIfTP/pfd6yo6GIOdDmoa8V6tq8zqmLFSq+oDtpmHcsmUng9Ti4Es5NvFtE=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr8519798wmc.95.1630489990028;
 Wed, 01 Sep 2021 02:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA9xc_q1fDT1F8uEW=dEQXmRWX8nusPmtmFLASg1EwU8gw@mail.gmail.com>
 <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
In-Reply-To: <9785281e-85cb-a993-d35a-94ef11df9b67@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 10:52:21 +0100
Message-ID: <CAFEAcA_kdx5a6_UP+FYONrk_LQC75YhwaO82GVj-pC6581LGwA@mail.gmail.com>
Subject: Re: [PATCH] qemu-sockets: fix unix socket path copy (again)
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 09:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 31.08.2021 22:47, Peter Maydell wrote:
> > On Tue, 31 Aug 2021 at 19:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
> ..
> >> -    assert(salen >= sizeof(su->sun_family) + 1 &&
> >> -           salen <= sizeof(struct sockaddr_un));
> >> +    /* there's a corner case when trailing \0 does not fit into
> >> +     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
> >> +     * not with sizeof(sockaddr_un), since this is what we actually
> >> +     * provide, to ensure we had no truncation and a room for
> >> +     * the trailing \0 which we add below.
> >> +     * When salen == sizeof(sun_family) it is unnamed socket,
> >> +     * and when first byte of sun_path is \0, it is abstract. */
> >> +    assert(salen >= sizeof(su->sun_family) &&
> >> +           salen <= sizeof(struct sockaddr_storage));
> >
> > Again, why are we asserting an upper bound? We don't care here:
> > the representation in the SocketAddress structure has no length
> > limit on the path. (Conversely, we do care about the max length
> > when we convert from a SocketAddress to a sockaddr_un: we do this
> > in eg unix_connect_saddr().)
>
> We have sizeof(sockaddr_storage) space there. If the kernel returned
> salen greather than that, this means we received only partial address
> and can't rely on it. It is like snprintf() returning more bytes than
> available in the buffer - it says how much bytes NEEDED.

I think that if we need to check that we should be checking that
at the point where we make the accept() or whatever other call
filled in the sockaddr. That is the point at which the code
either (a) knows that the buffer is guaranteed big enough and
can assert that if it likes or (b) may have some reasonable way
to deal with the failure, eg allocate a bigger buffer and retry,
and (c) it is also the point where the code knows how big the actual
buffer it passed to the kernel is and so can validly determine if
it was truncated.

We don't check that the address is not truncated in any of the
other sockaddr-type-to-SocketAddress conversion functions...

-- PMM

