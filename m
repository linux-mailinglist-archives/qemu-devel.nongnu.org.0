Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE06B6523
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 11:57:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbJMq-0000Ce-6q; Sun, 12 Mar 2023 06:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJMo-0000CV-Ah
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:55:54 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbJMm-00028D-ML
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 06:55:54 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h31so5408855pgl.6
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678618551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpzW07j3pBJMeLA0Bkz0FRiUOyi6ydKX1aOcustdKdw=;
 b=OQXI7mwnjvE2GljJVdkE9azuOvK7KfR7sD6V/vMG6eML1c46Mj+WpE4h1+YlbvYUlW
 WdlHWblAajRcidJ6/ZzOq3kYpqqUvy+gPALGSpsirTsfkQX2y1/fS5YKZBeiGoqycs09
 LbKhCuRXbKnrAe8UvwH6PZyIXk4tWtS8e12Ez5s5+qTpopxaPL6szIg6nUJ27+YmiuzV
 88pxAqWk+EvGGfAWHCks0wwU7Jfshlkg+usn3GpedAb8nxm9mC+vJEjK00qIJHLVYx5T
 0UNyAwW63Tw59V++12aGQFC5mMM/h7D8Sf6fhYbzU0/U/8oU6nrjlQpC1Ha37+e4Nk4R
 +IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678618551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpzW07j3pBJMeLA0Bkz0FRiUOyi6ydKX1aOcustdKdw=;
 b=MUAbHPJIYDBfPsU3RR7iGX39BC1sQ8EQL4WgmzzcffNL8BtFByzCskrfuYKmkeeMKB
 i2btsszP67x1Oo23Umo4nIjHqsVC5FfF8CTFytdLxmk2ZojsbRuDjIn5rUxV73FfmK82
 rXAajUk7QSmPx4sDLMF2CmZmlsZ4/+WPIW9kAfCWeGfdW+/pVeI0QzL6HEYN0mBkIBMu
 3hxUBGa+cFqXydaahv1h7g3igKgfUsrT/JqUJSkUgUOeX31PN311reZ5fg3JKIknnkkQ
 P6wrp+Ng03/4dz9cSGKV+Xg0XfVOdzPcMAyyAAyXdP/OPKItS4/CvUWzyyZlm1p3iaPH
 PSlg==
X-Gm-Message-State: AO0yUKWMJpgD4KxMi/ee5i5itHtly/Qqdd+i6eL2FTig7/yd3arpRpHc
 wQlJ23AelOxHiIKORlYmkp4YDQFx+NG5jioLyxCmiA==
X-Google-Smtp-Source: AK7set8AbdurttD8j0DLehI/uAuFIfZDp534Y3GiMLo6mfp5iGIC/8AbLVcqQiQQgqnU2SP8oYkPDGOZcVvWg1FVPpk=
X-Received: by 2002:a62:1a57:0:b0:624:5886:4b4b with SMTP id
 a84-20020a621a57000000b0062458864b4bmr86488pfa.5.1678618550929; Sun, 12 Mar
 2023 03:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 10:55:39 +0000
Message-ID: <CAFEAcA-9Y=eYSJX28ABdJ+ULCaFtBSNhwO6bT2VYwHqwv=h-NA@mail.gmail.com>
Subject: Re: [PULL 0/5] gitdm updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Fri, 10 Mar 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c99=
32:
>
>   Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu =
into staging (2023-03-09 16:55:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-gitdm-100323-1
>
> for you to fetch changes up to 0194e846c43f0ee18e0384c0c1f35757760e04ec:
>
>   contrib/gitdm: add Idan to IBM's group map (2023-03-10 15:54:43 +0000)
>
> ----------------------------------------------------------------
> gitdm updates for:
>
>   - IBM
>   - Facebook
>   - Individual contributors
>   - Ventana
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

