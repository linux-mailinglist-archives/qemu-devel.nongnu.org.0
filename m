Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFC1267B2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 18:09:14 +0100 (CET)
Received: from localhost ([::1]:44908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihzIX-0002X8-2a
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 12:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihzF4-00087f-1Z
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihzF2-0000U8-JT
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:05:37 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:33261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihzF2-0000Pm-BD
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 12:05:36 -0500
Received: by mail-oi1-x233.google.com with SMTP id v140so3272774oie.0
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VccpOXICLNeysBdDUXopWDKjpFkdSOIL0k64ZfORX7Y=;
 b=UdDhdFFgPFnMW4Vz3zGku1+FbnwMazuVxwRGj85EiEfwPBbwhaupRN78yEXeOwyqBH
 r25rEC3s18ko6+t++HY6WyjpLF9+EqhZHaqP2tFfswNiTKDnPwnOHNyad1Qv9IOmglDx
 CDyqSDgWRvjGX4hrnMwA6hgCyw62CkVWPcY8X3l4Mv3J+LFteQjAMtNjFOCCnLQLvKN9
 6N/Dw5k0Co4FbIldLRqXGfBdNwgVCG0aCfj0+nRssQmj3bPysKn1fKv2C97vrHhnkP44
 wz6pm4/vw8rU0E7R4tR9cP9ni1lp27rIj+n4ER+3PG4aRQPQRKm/cLxNqXJD3/KkSui+
 3STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VccpOXICLNeysBdDUXopWDKjpFkdSOIL0k64ZfORX7Y=;
 b=EdN4OINOoQKVa4KF9z0gQiedRYJfj1Ll4xMtDRupEABxCpli3pcAA2eDl2Za3guTj2
 Kz2vsZ3/OgOTwgCIrbowTyHbLlgXHQ2ui17BSuIEeQrh/5VZJ1sUqbnULdHr0+hxNAmJ
 sQtwBFqSuveCfRVIGLvSxxmj7OV2JxZBZfoUDvgbidRvnwPkIJkIosfaZfRmx9TnjHMJ
 7NqXE7cuLmv0QjDft+7PEKti+hqx4WiFz+zwGPOGDD/sGM+5qPD8/S1srhs6wL5F8Yae
 YDopm/nGM0oZd0lMINe9HPro2ysCJfWpaCWC4lg5AFSgrM8iDoR8EF6eq45HU1DQT/Pb
 hCVQ==
X-Gm-Message-State: APjAAAVnb1RD47MlMwxZ//ASF8SPHPa6oqyFALF0AFGnCQp8eSBxXhf1
 wt+pP+Qu2/jShblU1vQ/Ib3XRUUyx8ygP8yAwB5DNw==
X-Google-Smtp-Source: APXvYqwnDUS+ul4P1m1MOv05PAOn/W0YoDPMgxHBpZtwdaLItG/xXRjOQT3zb6ac24rUWjtqOLG4pD+ntAZTP/Wco4E=
X-Received: by 2002:aca:3c83:: with SMTP id j125mr2754995oia.163.1576775133963; 
 Thu, 19 Dec 2019 09:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20191217081454.8072-1-armbru@redhat.com>
 <CAFEAcA8r-wai+vMa8WiCjUFyRGwTQQs9fZo_ddRmAdr_6GAcTw@mail.gmail.com>
 <875zie81ov.fsf@dusky.pond.sub.org>
In-Reply-To: <875zie81ov.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Dec 2019 17:05:22 +0000
Message-ID: <CAFEAcA-TiK6y+VhYw5iaRWgxoWc+qk+gHwEusa74pDd4+Dtf9Q@mail.gmail.com>
Subject: Re: [PULL 0/6] QAPI patches for 2019-12-17
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::233
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 at 08:42, Markus Armbruster <armbru@redhat.com> wrote:
> Perplexing.  None of the files involved gets changed by this pull
> request.  My qapi-types-crypto.h has
>
>     typedef struct QCryptoBlockOptionsQCow QCryptoBlockOptionsQCow;
>     [...]
>     struct QCryptoBlockOptionsQCow {
>         bool has_key_secret;
>         char *key_secret;
>     };
>     [...]
>     struct QCryptoBlockOpenOptions {
>         /* Members inherited from QCryptoBlockOptionsBase: */
>         QCryptoBlockFormat format;
>         /* Own members: */
>         union { /* union tag is @format */
>             QCryptoBlockOptionsQCow qcow;
>             QCryptoBlockOptionsLUKS luks;
>         } u;
>     };
>
> before and after.  May I see yours?

Unfortunately not -- I've already discarded this build attempt
and continued with processing other merge requests.

thanks
-- PMM

