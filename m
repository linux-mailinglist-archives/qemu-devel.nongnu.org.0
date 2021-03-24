Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344D347FB9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:45:56 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7Zq-0008LY-Rd
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP7Vn-0006n9-Au
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:41:43 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP7Vk-0001Iq-DS
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 13:41:42 -0400
Received: by mail-ej1-x636.google.com with SMTP id hq27so34269552ejc.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 10:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5wh1MFZcaImv+OQcwJ4hMBP99VNppE3MNRnXvWvMvVg=;
 b=uYe2rNOQ4VgIgUPStxiLIcvCCSSA4oLvGgP+TcZNO5cCl8XjjvuyoW7cxwirHLR0qL
 C6gjaUCF5bkBqgLJegJSSujGbIEhSJbaeJByp3BLv/3FP6isGHbGQlfvYvMIb91nK80l
 BWGFUxHTQkx/rgI+30EOYqK6+wQx+wMwP+NEVJY8Evljd5k8eXT+0OOGeXnrD4aSTv8q
 9DooyIUUVYq3uixC13sTmCveu4Jc3PIO9N9CgAQFjLFnXwRuaGPIKIH1PPgBozYDOlJ1
 WH4qOH/7pDZ8UY+LrhXoc/AARb4s9hkj+09GM/Mtpaz0jE+AFjS3s1dpUr6oaRyY01tG
 Q3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5wh1MFZcaImv+OQcwJ4hMBP99VNppE3MNRnXvWvMvVg=;
 b=lmBLSrhpQd3ZOPwnO6rbt8rucrRs9Mmrdt2qoo7WoEhZ6Of77xHNnxI7aX9QfDY763
 xkvbnlqp3AuLqKKwArr3+lAl5ckNUeBIxUcqOcjMOU2fhIfm8y4Vp6ZyJdef7KFqdJh5
 RjWsPuPQ2EvdlbiMZKnv+bk71w+ZWijtOQAbpQOQw99De/zf4DzFT6YwjXJaQCmPQImo
 YqtlGDwj8TbIAaRe8Dbofnt1fJomnCkWV/fpLWxDRifqSFTfrvAqE5EahcqzerqY3jn/
 O8Q8R6SSDYf+PGSg0/VSdehSImffy9JLvPiHms/jqHa4lYk8McQzmQz1N8CVTf/3H67i
 pa1w==
X-Gm-Message-State: AOAM532CCzc5TNEmgavneqdpWqrsj9O7vuzP+s48cKMW8jk0eB2smjK4
 DvKiMKx5QAFx+KLj6ILuB5P6Ua1ygYZRkYxqtixH2g==
X-Google-Smtp-Source: ABdhPJwy0Sn3r7escMge2x6BxhZpEROwUv4QSBpoJJwN9bKT9r7Zt/xHCW0H9cSbEYjfRySyq8HgjGwGS3Kp94dJ4nk=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr5027734ejd.85.1616607697949; 
 Wed, 24 Mar 2021 10:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210324143021.8560-1-alex.bennee@linaro.org>
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 17:41:07 +0000
Message-ID: <CAFEAcA_2Q0-M7-NyoFNWFrt+HjSaWXwtre_HaTaA1A06UYGmOQ@mail.gmail.com>
Subject: Re: [PULL for 6.0 00/22] various fixes (kernel-doc, semihosting,
 testing)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 at 14:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 01874b15d36e3f9a3506c47941a92ccf8d8bed=
98:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210323' into =
staging (2021-03-24 11:22:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc0-fixed-240321-1
>
> for you to fetch changes up to a9eb2df27f117bbac9f370bf8cb79532005f19c2:
>
>   gitlab: default to not building the documentation (2021-03-24 14:25:48 =
+0000)
>
> ----------------------------------------------------------------
> Various fixes for 6.0:
>
>   - include kernel-doc API reference for plugins
>   - fix semihosting SYS_HEAPINFO
>   - various tweaks to improve CI runtime
>   - more stroz fixes
>   - fix iotest CI regressions
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

