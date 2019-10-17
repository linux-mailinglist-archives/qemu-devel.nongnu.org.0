Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C3DABB6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 14:08:10 +0200 (CEST)
Received: from localhost ([::1]:45538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL4Zd-0006zK-LG
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 08:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL4XA-0005Fs-Pd
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL4X9-0000wU-NI
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:05:36 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42450)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL4X9-0000vz-IJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 08:05:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id c10so1632298otd.9
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9k204Ws2guOBc29oNz5Q043YDliwBqzAzlL4Nvh/j4=;
 b=oMGMFtI9jThCpUlJdaL4s3wt28PHGfDj43OR+QirLP3rGLhN+/yd1zAqQp9Fqm54mV
 bNCDNXWA7Ws9JGv2ytQ5h15n2cS1zssWyfuIv82IvkzU3YKDvASeZZeCFBi9hgQmfBNZ
 6d1b/MXHDiE/TiuXRS9Wu7QQ6sE39QSezLGnfN8BJ5Fl+Kf3frHRSN15mq5U+c5SO4b9
 ZVqRvJL47WuzomwrlQXaAm0lX7FlcFj5i5UTjk8QOEOX0lk1//+0rLMTfjSeSBQAeuYB
 oB1AblO2Coq7jBOdc1v92d/tnfkwWomCKJXept+kJ1wpePk4jE47VF9p0peoa1Z4bwiR
 SErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9k204Ws2guOBc29oNz5Q043YDliwBqzAzlL4Nvh/j4=;
 b=akpIcYv7ihq7ybyizP8s0MpeiTVrKBPj5HgqANADjXo20LNx+iuuO6cR9N+GZeqdft
 W57KHW3bOWEEy7nPxwIouQt+WN7zYHj/v+RJ51sMqAigWFNTObs05if9vzT03r9iF82l
 T/sK+VRG5TL7wz6miDf1iXQJfkX4ejv9y8E4p5/vgGnUciiCfvT6wElv9h0gb9GmzxLK
 bhLGhNFZc9aSF8azk49K2kSlAQvPXoP8uDIAp4R7yb+ysml+isuGWx3lfz1MsgAIIU1H
 l7eebNysBDU/vxQxx5B+0QfHBqqYWaDnWauxWBXJQw4JSTS8P068/T13dQcVdW6L6ryg
 rkvg==
X-Gm-Message-State: APjAAAU57gSjHsSAHWGZtmh3ybpfNLukGnQ7csBWLHjt+Fv9rOLnbl7F
 6cplAgYJYNPdjMlzA1Pxmk5WoxmaRk0To1Sl1RCs7A==
X-Google-Smtp-Source: APXvYqyUOtFyWZxZcpxfaNmER3MudyruTdLZdz4GhqDA1Qk5a/Yk7yQ/nHwyeXRX0+umYS+0m7Hm8sPhbizjK+D5kPc=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr2733606otj.135.1571313934770; 
 Thu, 17 Oct 2019 05:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191010113356.5017-1-david@redhat.com>
 <20191010113356.5017-20-david@redhat.com>
 <CAFEAcA-Z94EAN_dt06nH97SbyMc3Jg6uj_xn-zTTMjUrvNrUDw@mail.gmail.com>
In-Reply-To: <CAFEAcA-Z94EAN_dt06nH97SbyMc3Jg6uj_xn-zTTMjUrvNrUDw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 13:05:22 +0100
Message-ID: <CAFEAcA-KkMgfEPiZeoaGZaNozRzQeOtVhBidOqSm+cu6zD6d0A@mail.gmail.com>
Subject: Re: [PULL 19/31] target/s390x: Return exception from
 mmu_translate_real
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Oct 2019 at 12:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 10 Oct 2019 at 12:35, David Hildenbrand <david@redhat.com> wrote:
> >
> > From: Richard Henderson <richard.henderson@linaro.org>
> >
> > Do not raise the exception directly within mmu_translate_real,
> > but pass it back so that caller may do so.
> >
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > Message-Id: <20191001171614.8405-8-richard.henderson@linaro.org>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
>
> Hi; Coverity complains about dead code in this patch

Forgot to mention the issue number, which is CID 1406404.

thanks
-- PMM

