Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A02DB091
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:59:17 +0200 (CEST)
Received: from localhost ([::1]:50039 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL7FE-00070n-BL
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL6Cy-0001DY-EJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL6Cx-0003bv-9v
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:52:52 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL6Cx-0003bf-4v
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:52:51 -0400
Received: by mail-io1-xd43.google.com with SMTP id v2so3041653iob.10
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uzmzeT75q6GrysHpt6IsCt+3SSYXxdWeTTt0ulqtTCE=;
 b=d33dv7uMRoF/x4JheT6Bz/WTfgonMOK8G7DrOlSIcZQBFoxP30rwCxaYA/0rioIaIB
 SwQ0s5advmV/rwVejJR4zinIahpwXzOeYobUwgAJsqxT7UxYB0FQ/aug57pxPjiW2B9R
 gTMD1yrHfyU662FkA60zhrY3fdGPFb3mMMYXdUpsAq/j7/HuZep0K1ItSgz9+G9BxTX/
 E9zexmPmOTUdUZwvoV4+3o3Z+pEYbMWBJwgAlJq7jOWj6dipPJE4ld8/YlSazHbuEjIH
 0m8+2JgbSHFAKVWtrwhhIe15feqmgTlMWngUy7a2xkOxqEnPJ3PJbSbQZBOJD3D5whLj
 se1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uzmzeT75q6GrysHpt6IsCt+3SSYXxdWeTTt0ulqtTCE=;
 b=bEfpptkQpmew429S6eE6xxKzg54AbrkoBE+uZjN9UAOe98OP76AbyUdTeOeNNaALyF
 c7ZVDHSItWI1lS8vsA67rFLLYS+gBRyji9N49JVYArOVGybHQiB25xG9wjqpFyMdCK4C
 53KC7Bzk/Avr7qPx2F33e9QoyhFvLlmfsMJ5uwfSdhxJbJICTGwnKyHOLiwb9tNiyZuP
 sIycVgLD4d8RpvwG6t0LFGHJoC2hFrhJB1FQ1vc2/xl0CkX9jehEYT1N4iRi/k0yJSC1
 Ha4JNogJ+vV2XHWO9byQxtyISqyTSWMvzliAKvAigBp5L17DplGkPmS6cDkvlCO1qLeR
 aZ7g==
X-Gm-Message-State: APjAAAU9LpqJuASRQqmxgrQAu5Ua+PiL7FzwGyjCQsNrzKfx8MFQxdXA
 TA8CJssIW6SU4uAwZ0wBgdE3kfodSA6BxCQFIo9p9LjJpDA=
X-Google-Smtp-Source: APXvYqxoYhisjt74CC4cV2ntL/mFbk3+bq6WkFLcoePpsLmgWPPB4bXe6W0hgLgg3mRJq6tblCBSppd7njWEGuBERzY=
X-Received: by 2002:a6b:f209:: with SMTP id q9mr2949268ioh.246.1571320370148; 
 Thu, 17 Oct 2019 06:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190912183058.17947-1-richard.henderson@linaro.org>
 <eec68864-79ae-3f05-0903-0d0b1c0cbdaa@linaro.org>
In-Reply-To: <eec68864-79ae-3f05-0903-0d0b1c0cbdaa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 14:52:39 +0100
Message-ID: <CAFEAcA_3MxUaKihUeEsjBXhctaofw5o3m5T6YdqXddBF71bABw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix sign-extension for SMLAL*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Oct 2019 at 00:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Ping.
>
> On 9/12/19 11:30 AM, Richard Henderson wrote:
> > The 32-bit product should be sign-extended, not zero-extended.
> >
> > Fixes: ea96b374641b
> > Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM

