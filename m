Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F057838B6D5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:13:22 +0200 (CEST)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljo6j-00018u-Gs
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljo5Y-0000Kj-B9
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:12:08 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljo5V-00020w-0p
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:12:08 -0400
Received: by mail-ej1-x636.google.com with SMTP id n2so26970375ejy.7
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 12:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8FM4fUxCk0DNAp5JB7vj9ypPgzBrTf4dHj6xEztMZI=;
 b=bI23ajEVP95gqDImKjnlI551Ja0LrtA5QF8fcnPy3yByN0lyKsGNkffJ6bC6IMi1iB
 D6yTeqnivDapzAdxMm3mwH4ljAQqLFBe7E3KmoOvbmhuxCmWZ51MbyTocG3/zedRcPBE
 QZRg2tCtfpGXm30BnGPHSsMWGnkpBgL7IT3IPF9Gh6rSYYQ86X13f9Z5H2+54dggjLj9
 EdygGt7+A54sWTXcT0JQN4Uv0ZrUUUJGYyyVWie/8hMu2L+A25q2GhQzM3Zfv+VBup8L
 GO0uSRT5DUyOZphPHYpyikYV3zNHhjXd31svaNVPUyX3x2F222QfKkZcOW36D7ueFmwj
 x3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8FM4fUxCk0DNAp5JB7vj9ypPgzBrTf4dHj6xEztMZI=;
 b=rnKGAm0I7+YI6oecok4g+CvFjgKdYK27Tl19Ou3qk40uuWJ2+UmI5yuyojrcedfhkL
 9ykoy9n4wwYCmZxD7OoO0GNtV+IQQBS73W66pf89YhRu2kCDEfAKMPMJRHBpqCzp8ZRx
 ekKuw38yLEbDFzYsp7+SGyCTDUiC9UiIIS6ip6BXw0kjDQFpRuzqlHzXuKdo3sDg7FCj
 B6qUIzt8iqxrAaDSJN+8sl2tFu+h9CTkLIpvgkxN1DSdZAyXQUG5w8xY0tgGxJfE/+Hv
 WR5SukmjJrWYvrkLonZ7dF0znh2kzDRuD8SRoFClN4nDEnAzDbFio3klSM+EAj3HPlkQ
 aynQ==
X-Gm-Message-State: AOAM5302XYl2sdeNaip9sP6U5HvsjzX8lQXgoEkzvepETdVW3HC+YVsy
 SZDgwWX7LcEwnE2eGXB+lFws8vBJvnNY/HCKCMAo5Q==
X-Google-Smtp-Source: ABdhPJyBlAfQ0s/K5IRTJlLdlOgSm2IFXTnDAPi6bzZek+0Tis2oQN2XyNxXS4gG9zA8gS11x7t00uplA92pKynNuZg=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr6227920ejb.482.1621537923026; 
 Thu, 20 May 2021 12:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520170519.300951-1-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 20:11:44 +0100
Message-ID: <CAFEAcA9JS_C1RA1BfUK5BdfpYJUAcn-RdyEXnYvm_zKQib6O_w@mail.gmail.com>
Subject: Re: [PULL v2 0/9] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 at 18:05, Cornelia Huck <cohuck@redhat.com> wrote:
>
> [Note: there's an unrelated hexagon failure in the CI for this tag;
>  fixed by <20210520153831.11873-1-alex.bennee@linaro.org>]
>
> The following changes since commit fea2ad71c3e23f743701741346b51fdfbbff5ebf:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-and-plugin-updates-180521-2' into staging (2021-05-20 10:00:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210520-v2
>
> for you to fetch changes up to f66487756b0553b156d8e3e81bc6411cfc38176e:
>
>   tests/tcg/x86_64: add vsyscall smoke test (2021-05-20 14:19:30 +0200)
>
> ----------------------------------------------------------------
> s390x fixes and cleanups; also related fixes in xtensa,
> arm, and x86 code
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

