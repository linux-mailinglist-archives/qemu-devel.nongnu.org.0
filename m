Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378A3FC539
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 11:56:20 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL0V9-00079C-1H
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 05:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL0Td-0006Sg-1m
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 05:54:45 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL0Tb-0005yT-Fo
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 05:54:44 -0400
Received: by mail-ed1-x52c.google.com with SMTP id eb14so16671629edb.8
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 02:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kUUxySYfdURA7NMk+qrPLOzqkIe2oNndEqQ0h0w9vX4=;
 b=Vf7srSSZtOKTO/JkIPzAtJVne3GOs8ZzYNhVb7TbUv1u+RP4u5jIuwhfk3plNg0nAj
 RUBNJkHgKeRu82hVXs9VNUrxmLvUccsu4nZpYSDUA0Zew+ZoJxo2T+JRbtASkh3h4aax
 dhtWM3iP1uTtSYL6OvZYjtga77TdCWmy4dX9yZ4pIwnRyFLgZWigAoX5WRrFJ5w3Qwgt
 mZA8ilsnqDCnMiuVChLXiejvxq//HcqOs9wiJlIiW6zo19nxKIkU22U4+VGyoBLXdMOn
 VdFOjZOhGgG6isYJmIG5kbk5snxDYIqRc9XaU9eGjqiiGtHZFK1fJinojI/5D+1QiDWW
 BDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kUUxySYfdURA7NMk+qrPLOzqkIe2oNndEqQ0h0w9vX4=;
 b=Xr/FsBwaocXmc6BJioL/usP9byToxRXRNvl1JUetHpWTkbPHQyGKUy5g8hBUxajL9j
 FGFqvPBjsiZ6ZJs3LQxIf4fJoZmNRplh9otgAWoOUfVnD+dY0L85eLqtPjtXyWDURrsr
 MB4GlV84km/A9mMBOtMVUGCyE9Amii5veUfP2mlMXf9PiKnxJ/aPYU1avkszaa4173Zf
 HFuM48pDd6sQWBtD9ghiKIwRYaeVkCFaFCHHk4GsTp2bGeqjfc9X3ToTl3Xif/oYrbJr
 8+Qb11KpllRsfGlJ1PTzaRVLuJdWhqGIwLJXJhAIN6o9ILakLxxsmdLyAuMqC9zq0o+g
 BXOg==
X-Gm-Message-State: AOAM530WNEeV5df29riaebBLTPR4xfOnL3i9JSmmpo1XIsW94OceGTUw
 oZIfR1/3kLbs7vLkJi7xziwFFZlullumTfaHoVXjag==
X-Google-Smtp-Source: ABdhPJyDHl1lf894VB5EdgalniOpMwuskrck9tgcsUqYw1+KTQtMv0Ld4fS/2Y4Zhs7UHgaOGS9drlshFLutE96PPPQ=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr28965621eda.52.1630403681758; 
 Tue, 31 Aug 2021 02:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210719130112.932069-1-marcandre.lureau@redhat.com>
 <12894fce-38cd-8d29-9c2b-fc2d8f73a42f@msgid.tls.msk.ru>
 <1706f18b-d6e3-e88c-ac12-decdfbd7d9b2@msgid.tls.msk.ru>
 <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
In-Reply-To: <6dd4a9d9-c264-a747-0fb5-2d470f19ad16@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 10:53:53 +0100
Message-ID: <CAFEAcA-XyxFpVD--uO9QzVWirYb7RE=OoAewueFy1AN0zyz++Q@mail.gmail.com>
Subject: Re: [PATCH] util: fix abstract socket path copy
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Mon, 30 Aug 2021 at 23:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 31.08.2021 01:06, Michael Tokarev wrote:
> ...
> > And this is the value used to be returned in the getsockname/getpeername
> > calls.
> >
> > So this has nothing to do with socket being abstract or not. We asked for
> > larger storage for the sockaddr structure, and the kernel was able to build
> > one for us, including the trailing \0 byte.

> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index f2f3676d1f..83926dc2bc 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1345,8 +1345,9 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>       SocketAddress *addr;
>       struct sockaddr_un *su = (struct sockaddr_un *)sa;
>
> +    /* kernel might have added \0 terminator to non-abstract socket */
>       assert(salen >= sizeof(su->sun_family) + 1 &&
> -           salen <= sizeof(struct sockaddr_un));
> +           salen <= sizeof(struct sockaddr_un) + su->sun_path[0] ? 1 : 0);

Q: Why are we imposing an upper limit on salen anyway?
We need the lower limit because salen is supposed to include
the whole of the 'struct sockaddr_un' and we assume that.
But what's the upper limit here protecting?

Q2: why does our required upper limit change depending on whether
there happens to be a string in the sun_path array or not ?

Q3: when we copy the sun_path, why do we skip the first character?

        addr->u.q_unix.path = g_strndup(su->sun_path + 1,
                                        salen - sizeof(su->sun_family) - 1);

-- PMM

