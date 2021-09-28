Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88141B241
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:41:04 +0200 (CEST)
Received: from localhost ([::1]:35846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVEI3-0008Lw-B1
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVEFx-00070n-8k
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:38:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVEFu-0000c8-9E
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 10:38:52 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so2928767wmb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 07:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XEnzGFhOlEPRWCjlkX0pFbbSebM3xdqpG/mrscJ4kzU=;
 b=VLttGJLbO9D8vtSid+E/H/IOMaT9J+6DSy53JC+3yCirxU6vRGNohRoSIIdcpEE316
 XQU1UxNYbYNITKroB3TSFX1/y6TC9NbKpTJLP/ygu127k5Dky1MDNdJ9qJ9JEXG0dwdm
 Zzz5qD709wk/YSx2N5HmQItW/0e3Ab37YBnkWeGKXcUSh83xRZPKJp3s1qnK+aPO9d/W
 WqQr+1yTeYzDFCx6mJwGB5Q80X8pVDGTWgq7PSuqH4oU5Us65Rahc/D/yytFYoFkUJNr
 BJsEoQss3F6rADMJBQyoVtVtZzioBop03sJmxNcja0hiHu0VFbNrG8EekoxgvCLW0Ugo
 PfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XEnzGFhOlEPRWCjlkX0pFbbSebM3xdqpG/mrscJ4kzU=;
 b=nU8SDSGOGHzXz0vS+xzrdYQcO/qd7DFu8ZIFlybYcbeO9dZdqEjxG2MOYKDGapUqSX
 8z3GhNyBmu4jaE5pH0OMHTqRNjrXMTSI7pWO6Pn+ZH7G0jDt73C9JRX0TEe9BiLN2gwY
 fGJ0m9BzyQ2TnwYiAhV39aqWZxgT0KK9jEZH24r+UWoLp/mKKI0sRDIwmTCgYN74hGnS
 73gwjmo5HD+NKlKoRg/kFfNs4IleSQRS02LrKHS06vsK0njYmSSUxS3/SKJR2ShJ7aKZ
 vuMK/e43lj7H+yJNP3Fr9QcbZx5hPe6wtmx24PVSLKy6egW12KGBdqRmZWpahOuEAVBP
 yLNQ==
X-Gm-Message-State: AOAM532zl5TZ82XcE442/ZAT+ZTUNkSN908RdYmzB0m3hJ4vfAZe92VV
 SXqd3SNEl5NPBRXE/FYZ6zCNSBO7rBL0AbRf+T49Tw==
X-Google-Smtp-Source: ABdhPJzrOPG+li4+e0pF96GA59+oGNfdSBspLE/rZe1aWuvyAk6+bS0tUKW8LwRJV75PVgPYyR5n00ogGXJrFN90TT8=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr5101075wme.32.1632839928701; 
 Tue, 28 Sep 2021 07:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210927192513.744199-1-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 15:37:55 +0100
Message-ID: <CAFEAcA-wTnU0e9Op6GqEo8YmGNa5FET0z0xaAOzegpq+XGOUSQ@mail.gmail.com>
Subject: Re: [PULL 00/32] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 20:26, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit de8ed1055c2ce18c95f597eb10df360dcb534f99:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-09-25-v2' into staging (2021-09-27 15:03:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 99e45a6131a7fef19ffe0190f9c479fae4850d53:
>
>   python/aqmp-tui: Add syntax highlighting (2021-09-27 12:10:29 -0400)
>
> ----------------------------------------------------------------
> Python Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

