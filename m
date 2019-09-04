Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92827A809D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 12:50:10 +0200 (CEST)
Received: from localhost ([::1]:55914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5SrZ-00014B-7e
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 06:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Sqc-0000NJ-AP
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5Sqa-0000d6-U3
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:49:09 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41316)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5Sqa-0000bz-Oo
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 06:49:08 -0400
Received: by mail-ot1-x341.google.com with SMTP id o101so20088917ota.8
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 03:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1jw3hspecwMHjLO7Arwx9CldcMxSKAz9Ekmi/2ze/k=;
 b=bbV0yhodlBxQS+blf6PQLN3DmtNGMXBWGecGLtT41HRTQ0e/gFVuw22dQ5zaCfB5o7
 e3LMeJX7u4idnc+v5xng0u+1Db1rAPQE4C7W2Kp6dII6APoMKQ3nyvypSVVLVZBx9xbh
 bm0bInpRNrwHhW+yUA0IPzeFrHdFfoak/G9lej1RpRzjBbU8YRGOgBRobA5qNVyeSy6p
 N3KKMhSYuWsOZdyesUBb15dgH6YQwo5YsekCvpIb3CAHMy0bDzHIBEsj1BWv2/Ae4dnt
 lwjehCRX8dymOQrFpNaw164ZVXKxkG3JXKfHzby3tCwRtU1ucS8rnWSy2iA1z7HWIDap
 yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1jw3hspecwMHjLO7Arwx9CldcMxSKAz9Ekmi/2ze/k=;
 b=E9hdWDhEvWFff4IyEHL9vcxHrimLuTjj39xjiD/JlhXuV4qb/i5x2Z21QXjC8VhgLf
 0RGUcfGlTQbpDg2hE2AdK/jvmkhQO2/EtVTiYmEB8yY9efZ8imxX8vl0sHxy9FfBsuie
 Dy6yQsIf7yU8hSn6UVAOMEZNfK7RIaSB++CCNXwvpIti4HhCOqUVNQGVkA/IVN1vwW57
 8DJjS1fU/mhLUCNwRIZ6Jutp9dHkzjAiPpJai2g2X1nFWQC4SRi9OjPJaaVQIiKB8nQ2
 ul7ApnusKQJWSsr1wXILRepW1jmW2yJm5OhhCD1bvbFzByrzYkIi/eRkqbOOnbLtRp9f
 8WkQ==
X-Gm-Message-State: APjAAAWoGRzZkEGgh9LS0oUEfqgu0lYJfeKPTKEcnn9MzhPvMSOCjbYe
 wR3qWl0alXThl8g0ufc1fFvahAa2UZpArEMIArFlgg==
X-Google-Smtp-Source: APXvYqwy2TO9Uvlpbg4RroW9L9ZCpM+Hqns/+DFhrCP384qqZSIrfG4nBYUGqw93ydnpPoQJ8WxzIl/12ot808adSBU=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr32866520oti.91.1567594147703; 
 Wed, 04 Sep 2019 03:49:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <dacbea19-9692-0288-9b64-8500d0cf232a@linaro.org>
In-Reply-To: <dacbea19-9692-0288-9b64-8500d0cf232a@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Sep 2019 11:48:56 +0100
Message-ID: <CAFEAcA8MfTTPrsTQhXUPHWAy_KeC-3ZztFtKM0jyQHZoBYqRJw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v5 00/17] target/arm: Reduce overhead of
 cpu_get_tb_cpu_state
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Aug 2019 at 00:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
> However, while working on this patch set, I noticed that we have a lot of
> unnecessary overlap between A- and M- profile in the TBFLAGs.  Thus point 4
> above and the completely separate rebuild_hflags_m32().
>
> If we rearrange things like the appended, then we recover 4 bits.

You can't make the THUMB bit A-profile only: we need it in
M-profile too, so we can correctly generate code that takes
the InvalidState exception for attempts to execute with the
Thumb bit not set.

If you want to make VFPEN be A-profile only you need to
do something so we don't look at it for M-profile: currently
we set it always-1 for M-profile so we don't trip the code
that causes us to take an exception if it's 0.

Otherwise seems reasonable. My overall question is: how bad
is it if we just start using bits in the cs_base word?
If we try to get too tricky with using the same bits for
different purposes it opens the door for accidentally writing
code where we use a bit that isn't actually set correctly
for all the situations where we're using it.

thanks
-- PMM

