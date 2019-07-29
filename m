Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9178ADA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 13:49:11 +0200 (CEST)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs49O-0001uH-Cq
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 07:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53812)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hs48O-0001RC-HA
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 07:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hs48N-0005hG-El
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 07:48:08 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:37377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hs48N-0005gj-9i
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 07:48:07 -0400
Received: by mail-io1-xd43.google.com with SMTP id q22so9546073iog.4
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3YLMZAEb8EEl9wc+L8bP6Rqc+y/oJ9uiFco5IFaDE8=;
 b=g/gBDAf9CjvaNQkyWomISnx/fOQgLuEDRUSgruPABhIMERhhqvqKoP3EUXN6cN41xn
 6eUfBUePTBdSJ/X4l2yaPEr6xU1UmFYqkmJWzU2ORfFOmJR/IAMAmYX6Z+oFQVhbGVHa
 fEpS0eBbu1LZOItebxmxwVWEyPdnxxGQRB3CC+iqhRhfsVPwqZwAkozPsceN3gYjYu6u
 hJOvV3I5vMpv1cxchcrceite9z+Z4VoDIc56Ho56rs+JvXA2vXm60FQNYCY66r0O7OfG
 OPZaLmhZOSrvIq5+GRdelg1mPTZZG8LsiY9B6AEzMySamdDTiR+SYsrwtm6YAkdtdUXN
 ZnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3YLMZAEb8EEl9wc+L8bP6Rqc+y/oJ9uiFco5IFaDE8=;
 b=esetdkjIr99pUdoXmrHzhsHAamyJ3BOmeze2Q6KJ+D6HN3p0p4w4ZI8FP2tTrNzTxi
 r4wkq+fOECrJpExq0F/+CXL63A7uV1HQDkv+1qUvFjRj8560KCK9/Y1Uu04pzApQjOtf
 A/oJX3ij/AmoC2OEvRf+ThU17f4UEo/UKyDSNa6LbBRqki2B4TwzDhlmvF4+9IJFIQHc
 QbGBFAg4Fhx2WcnETD5C7mjB6KjCnlkqL/mrgL5R4i8h93MgLsqYmV6HuYIaQAGPdQ7s
 VdXDd2jlPMnhrzuj4SGCn41ukJ/GYIa5m1T8y+vs8kfrUPdqaJyS3tMA4iNa37tKkM/0
 +A5w==
X-Gm-Message-State: APjAAAWpfPz9FU9ie3nU0NLld9XTNJH7rboYt7blADZKsSEjUTkxpwqb
 0JbFGsT2zPy2jU8FYw3ckPHH0qoDthNuWQRuHlDjKQ==
X-Google-Smtp-Source: APXvYqybawiIjt1Mss56AYhFJFDq6nB7OaDC1ebCajy6Itdc0XBGuedfWA26PVusAvke0jV5z8fgs4qfQmjqghUC4Q0=
X-Received: by 2002:a6b:b593:: with SMTP id
 e141mr106230534iof.203.1564400886518; 
 Mon, 29 Jul 2019 04:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <1564389226-4489-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1564389226-4489-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 12:47:55 +0100
Message-ID: <CAFEAcA--t_Hjq5G+C_0ShxDcAWQYWfW8w6zDb2DCRR5LfkXX3A@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
Subject: Re: [Qemu-devel] [PULL 0/5] Net patches
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

On Mon, 29 Jul 2019 at 09:33, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit fff3159900d2b95613a9cb75fc3703e67a674729:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190726' into staging (2019-07-26 16:23:07 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to f77bed14f01557596727c4eea042e9818c242049:
>
>   net/colo-compare.c: Fix memory leak and code style issue. (2019-07-29 16:29:30 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
> Jason Wang (1):
>       e1000: don't raise interrupt in pre_save()
>
> Prasad J Pandit (3):
>       qemu-bridge-helper: restrict interface name to IFNAMSIZ
>       qemu-bridge-helper: move repeating code in parse_acl_file
>       net: tap: replace snprintf with g_strdup_printf calls
>
> Zhang Chen (1):
>       net/colo-compare.c: Fix memory leak and code style issue.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

