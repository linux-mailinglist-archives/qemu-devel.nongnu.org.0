Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F3DA6A2A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:40:52 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i593C-0006Sj-Vz
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i58xr-0000wb-DY
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i58xp-0005e2-9X
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:35:19 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i58xo-0005ad-Il
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:35:17 -0400
Received: by mail-ot1-x342.google.com with SMTP id p23so16761668oto.0
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqfmXayuQsWhs6uycpxd6cWPg4ufTogKSqaH1/gA4QU=;
 b=P4pcCvaxyGRzIVXnjwcqMU/CmbMboJtD7bjfalV1HqZkZm6itzvHtHcO32dUTwt3+w
 tM+vlLXM92ca90bA1QOtAkmvRV2+DmKf3CjSXm1f5Eb4unTtwb5eKIph/mUN+eoPP4PT
 r9/VR2j2SU6/mFjXA9u6xGqIvqAdRBre5uTF2Ofz0Kr7p7N2VAHTzaZzfoAaMT0XmR2s
 WLIwGA1tjUh+NTjxc4QEPZg/YL9XK+oX9vrpWpQ6K9GDk838fq/KDT6u36wpqV6xIdgQ
 zU7fIzubxCvUf/wivYElCP7g2JASMAluvGmRmQ7OcF4jBwNIsnv9LTl3C8rYq1FFMybK
 mX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqfmXayuQsWhs6uycpxd6cWPg4ufTogKSqaH1/gA4QU=;
 b=KiNTeR+Lw0LRFS9gUaUtjvaJqHyddhjoL4co2nI6E7jeJGFl1aa6pTLnSlur2uAdLW
 s+keakImJoW4zj3jJ95OU6r44fQHeZ3H92SdhvVdolKrJDUYxXgrNrkaIpE5q3r1Fe8O
 7KfnHBYiu/5yPemaKtcmITSVHlipuulwXaIuX3PsPdgwIycbBEl4p4xEx6IgQ3wDzv7I
 n6lGES6WjVTBGzZeDD26rTJclhkU+AknCtVVWKaVToQq59l8nk/r/UYq8Yst8qBYUgp5
 4qO4cDDDcSBz261st1PhMsKVgHQAKTiAhoTao0/TAfEYOg7K5y+gYTEEc+PjVYHWJ0Nf
 Rn/A==
X-Gm-Message-State: APjAAAWF/M0idLVKQu/zJ9YKRXkByz6tfqxUPz3WUE59vqYVN6kHqLfm
 OkWM8KsVtbJlWXIV2lTA4Uf959MQQ7VTXibRxR/6/g==
X-Google-Smtp-Source: APXvYqz/DhGRIHJVudAENwVPrePFEragArR/HWXl7kVo9hr3WYUwac9Y5zP7/BR3SL87Covcp7EwnvFVBwT3PD46yak=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr29081626oti.135.1567517713841; 
 Tue, 03 Sep 2019 06:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190822185929.16891-1-richard.henderson@linaro.org>
In-Reply-To: <20190822185929.16891-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 14:35:03 +0100
Message-ID: <CAFEAcA9=kx70rzbM_o98s-LEMcq2CRH5zwDPq4LForzyCAvoMg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 0/2] linux-user/arm: Adjust MAX_RESERVED_VA
 for M-profile
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Aug 2019 at 19:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is inspired by the discussion in
>
>    https://bugs.launchpad.net/qemu/+bug/1840922
>
> Previously I suggested a new CPUClass hook, but when I went
> to implement that seemed like overkill.
>
>
> r~
>
>
> Richard Henderson (2):
>   linux-user: Pass CPUState to MAX_RESERVED_VA
>   linux-user/arm: Adjust MAX_RESERVED_VA for M-profile
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

