Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8251B3FC5A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 12:32:58 +0200 (CEST)
Received: from localhost ([::1]:48162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL14b-0005Vw-B2
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 06:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL12q-0004e8-Nx
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:31:08 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL12o-00043m-H8
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 06:31:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id u19so9346580edb.3
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 03:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRyz44IJDv/81zRSeYynYPoDaDUd6kI011azu0eG57w=;
 b=nVOczl3N7XnCiWqTh/aAGgekg3oVYC6OYYElJBe2J5yWFIoKyjaj04GZdfaBkJKsNZ
 fVs18WpExQ1jjdp5o4sVkpYTY7fUK7U5lXKZPdhxGwAxSHu0Kt4RQF8ggjzZ/w0E/YuB
 VD/4kb2QbIxVJSmAgiRzeNXQ+jUX/8ssrX/dtq6D2xQYjtOUQ9hrk/wb4Fs7LnXi2SR4
 yLF6WdYMUY9gTNSdnWIMb9/papOZdSUX0k9pqkqVUCYGJl3wuja7Ssj+EgHOS3B7x/nA
 Lkev5KFZGvXLCH3RSXF0EFyYXNzz404F8PvVi44l8F3TWEGjVGUA+XWs2xjNOW46rBGa
 fMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRyz44IJDv/81zRSeYynYPoDaDUd6kI011azu0eG57w=;
 b=P9ClzIOLeaBpQnRujjMsSpMaAYfyM4p9veLcjDKia+XHFlPoRaJmgXzBo4kemTm99J
 MQRJwo0gH7zErTCu2Bcp5Gn4CWmIo36iehbf+tkG0kx6xMXUthNm9ONHVoCA2Gppk6K1
 ugWG+Ea2I9rAy2aedXgJLkY3CCIpc5w4ILGBDE+ZtxgIvT0gKSI/1TScOv6zRXNuaHym
 BwLjUSSHZGHjs1t3p5nBzN1nWiFdwgTlorr+5W8n9b9opgLK/i8GX0Ybgbz5uHQn6Ng6
 LGMtyMOKueSVq/fwXNxbuB6EtEQ4O48x10iwgChzLASey2m2Iv1d+U7hlZ7Bc5RWV0iR
 dgJg==
X-Gm-Message-State: AOAM530WPbWt2dTdoHcZ24noyiS6S9/eU0G2ngGED2IK/ZvUsCFL6U4l
 ogoUoPFgejUsZhNIsnYCZfcRP2Vo2WBqRvGvYX50jw==
X-Google-Smtp-Source: ABdhPJxglCih5AX1KPT1fkJW7qOU1Vgg6nkNgZuwW4VUXvRyFR792EQc1D/FWC4OV7En8KrBlSJ0lrTdqxawgRPoX3o=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr29102796eda.52.1630405864637; 
 Tue, 31 Aug 2021 03:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
 <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
 <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
 <CAFEAcA-XyxFpVD--uO9QzVWirYb7RE=OoAewueFy1AN0zyz++Q@mail.gmail.com>
 <314d03f8-1270-e146-3806-74752fe970f5@msgid.tls.msk.ru>
In-Reply-To: <314d03f8-1270-e146-3806-74752fe970f5@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 11:30:16 +0100
Message-ID: <CAFEAcA-sZ_BMeydW6-iqdGQnETC5Gb0FLaCFgCgnZWZecMaD8g@mail.gmail.com>
Subject: Re: [PATCH] util: fix abstract socket path copy
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 11:17, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 31.08.2021 12:53, Peter Maydell wrote:
> > On Mon, 30 Aug 2021 at 23:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
> >>
> >> 31.08.2021 01:06, Michael Tokarev wrote:
> >> ...
> >>> And this is the value used to be returned in the getsockname/getpeername
> >>> calls.
> >>>
> >>> So this has nothing to do with socket being abstract or not. We asked for
> >>> larger storage for the sockaddr structure, and the kernel was able to build
> >>> one for us, including the trailing \0 byte.
> >
> >> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> >> index f2f3676d1f..83926dc2bc 100644
> >> --- a/util/qemu-sockets.c
> >> +++ b/util/qemu-sockets.c
> >> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
> >>        SocketAddress *addr;
> >>        struct sockaddr_un *su = (struct sockaddr_un *)sa;
> >>
> >> +    /* kernel might have added \0 terminator to non-abstract socket */
> >>        assert(salen >= sizeof(su->sun_family) + 1 &&
> >> -           salen <= sizeof(struct sockaddr_un));
> >> +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);
> >
> > Q: Why are we imposing an upper limit on salen anyway?
> > We need the lower limit because salen is supposed to include
> > the whole of the 'struct sockaddr_un' and we assume that.
> > But what's the upper limit here protecting?
>
> It is not about protection really, it is about correctness.
> This is actually a grey area. This single trailing \0 byte
> depends on the implementation. Please read man 7 unix -
> especially the "Pathname sockets" and BUGS sections.

Yes, I know about that. Why are we assert()ing ? Our
implementation here doesn't care whether the struct
we're passed is exactly the size of a sockaddr_un,
a bit bigger than it, or 5 bytes bigger. We're not going
to crash or misbehave if the caller passes us in an oversized
buffer.

> > Q2: why does our required upper limit change depending on whether
> > there happens to be a string in the sun_path array or not ?
>
> Because for abstract sockets (the ones whos name starts with \0
> byte) the sun_path is treated as a blob of given length, without
> the additional trailing \0, and neither the kernel nor userspace
> is trying to add the terminator, while for pathname sockets this
> is not the case and someone has to add the trailing \0 somewhere.

Ah, I hadn't realized about the abstract-sockets case. Thanks.

-- PMM

