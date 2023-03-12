Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689126B6529
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 11:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbJPm-0002L8-5J; Sun, 12 Mar 2023 06:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJPj-0002Jc-MG
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:58:55 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJPh-0002eW-9C
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:58:54 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h8so10018129plf.10
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678618732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W24kykDwHMkG76NJ0GrtkqNWzSi57BsduCerUEk5SqM=;
 b=lGZba2a6J+QZUFeKwUKaenJPFmt7pohoR/m4L+3TbW9pKCol0iHmlm3+uFVPPa2osZ
 X4hNc/Z4LFDwaQZZ9kCrFRF1lEBODgZfDP8u+uoNTBqxzch/lwCy2a4HK1IvgDRLvU9h
 VMr4gNXXTUlmtwcZvrvcF2b+jOr5ar3wUxs/ULUTyFa2waF2thqVpIBz4E2s++4hu+2H
 qzY1iIiXPGcccZT7WtddEFK/EFJlo0wgBbvz1rSY5lkn+bo91AMW6IgNZJ4nZa/ujRR0
 CiR/CBwMR4WlC/2yF+Ob7QO+EoxezyJ4G/0YXK6VY5mDIZp+LgpGB1klMJ76jWg6cMng
 ZSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678618732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W24kykDwHMkG76NJ0GrtkqNWzSi57BsduCerUEk5SqM=;
 b=bmnbIotbNQs4qIqtRvFQ9zfUFQBd855L+hSuQoKgfdyXW2RdPnjC1h1f2QnlIJ9qvN
 98KQkxtvX6FrqwKuzaiktrRDJ21py9gA6EipUvcV/8rwNJwBX62kmFKSQ209To0FUtxc
 oChLwsT2HF9s36Sz37DAI2gCSWBI7D7l6VXw2UsMMYjucdnKqdhPnu8VhOlqaJNnBg0h
 27AiaIZ6TlWvBbLBaLvA4Pb4f6mxIm8kEX+6Ou+1Vimgm3fRcG7RBLAjPsufV21gs2Y5
 W4gBvUDCnDuGjVXM4tea0Z5RN3k4YFO0D7yiAwWdPFmPHxV4I6OAai928yqqmZktZKPd
 wkNQ==
X-Gm-Message-State: AO0yUKX8XR+5g/IcKurh0j8kNmRZ+x/WgjnlThDGDFUg+fScVCRIfCub
 Arni5Frqc4RJGxHev4I58OZ2VGeLTlvPuBwizRa3F3cuUYviCH6j
X-Google-Smtp-Source: AK7set/cnNiTjnlVgznasC2MlWgBHa4TR44O7+peKzN4J+08jcgk9seXoshtV8vrFYOf6TDhzYt4puLhDr8+lStVnlU=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr11174546pjv.0.1678618732072; Sun, 12 Mar
 2023 03:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
 <87lek2z73a.fsf@linaro.org>
In-Reply-To: <87lek2z73a.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 10:58:40 +0000
Message-ID: <CAFEAcA-75q=-Wxh+3s9mcqXQs6WskVn-BbVvboPAEzf8vqHXHA@mail.gmail.com>
Subject: Re: [PULL 0/5] gitdm updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 12 Mar 2023 at 08:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c=
9932:
> >
> >   Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qem=
u into staging (2023-03-09 16:55:03 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stsquad/qemu.git tags/pull-gitdm-100323-1
> >
> > for you to fetch changes up to 0194e846c43f0ee18e0384c0c1f35757760e04ec=
:
> >
> >   contrib/gitdm: add Idan to IBM's group map (2023-03-10 15:54:43 +0000=
)
> >
> > ----------------------------------------------------------------
> > gitdm updates for:
> >
> >   - IBM
> >   - Facebook
> >   - Individual contributors
> >   - Ventana
>
> I realise I should have scrubbed some of the questioning commments give
> the r-b/a-b tags. I'll re-spin a v2 of this.

Oops, I merged this before I saw this email...

-- PMM

