Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8072C6BC0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:53:25 +0100 (CET)
Received: from localhost ([::1]:49850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiis0-00020U-Il
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiirA-0001an-EJ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:52:32 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiir8-0006KI-MF
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:52:32 -0500
Received: by mail-ed1-x534.google.com with SMTP id k4so6723233edl.0
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G3ytf50jM+xkoeSvot43WIac9va9mch8bp4KkHKwEKY=;
 b=Dl2j3/7LrHXo7Jl9wZ+qxkiIet71NQyt9dBEQjJ/dRVZbQZ6QyniE5+Z1cNYGMyr9t
 UXJMnAD4QcdwHHtF21QVyWBC+NLW5bWf8ThEMcqeqt1VLtG+YKD6SQZaoWFkcUFvDrJL
 0/pqCLfB2/xnID00/yyj9RhjNP76CKEJ2EwXSty2V6/c88DczMrR1UMFYgAh2jUJy3Sk
 3lOyb8PzUDvLUA5wDBIbksaiFQFnJapwGei7VABAHjGY6wwpVd9MU9LgpcoMliy4gMhS
 9WILIGDJjEGvJp5Q497lG5un3fjTPZzH7K881VWtlxvnCs/HNMVuA7Ui+LFIvn4abX/u
 S1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G3ytf50jM+xkoeSvot43WIac9va9mch8bp4KkHKwEKY=;
 b=g8vRkk8ZdgK1r5asULEnFqyE7W8UoewOmN9wd6objYapQ6pbpuyVYNVWei6dH3j4Jm
 zbh6Rv67og95Atp3UYaqLh4jDzAaQvMtYg1Gxx+sNaqyOH2GdThVhZ+YsiG6mFX/9YQZ
 RGTpMuHNHTTDnf6pp6n/umCR5AyML+kLyt+2adbYgAwC9HeiMCkYzSc/LvvMrPivXgg9
 8LW9FEUj2Z7T4dz2vrY5WxqmpFHxpZ84LRBUQI0F+a3excqdHgXer7dndrXuyf5Qzg3z
 6DF3B3SjLH6F1JG4tJd3smXMv7v0QJNvH3/6csTGdS6Mj/ovcsjXoCDJGyabaixAZ2b6
 Y9QQ==
X-Gm-Message-State: AOAM531GXW18RNZMCU/ifMQ/32JSVhT+miDSo4OQwIJGgnatk2dJOepQ
 ro5PSR6731txl67vyTf3oyXR8+76nXA0KuF8kCiGqA==
X-Google-Smtp-Source: ABdhPJxjpOA2+JMIjq8h8LHgWUJaiZRmhYt4d7CKVZJGhCTBfQWBZkWzW0jAFyxpjskMwZpJd/4TxP7l0W25x6qnEFk=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr9473100edt.204.1606503148690; 
 Fri, 27 Nov 2020 10:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20201127170836.687073-1-marcandre.lureau@redhat.com>
In-Reply-To: <20201127170836.687073-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2020 18:52:17 +0000
Message-ID: <CAFEAcA-56cx=F4VrHov8mDgi-=ARziVr6yiuKw8Z+rbBSvw4gA@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp CVE-2020-29129 CVE-2020-29130
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Fri, 27 Nov 2020 at 17:08, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit ea8208249d1082eae0444934efb3b59cd3183f=
05:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20201127-pull-r=
equest' into staging (2020-11-27 11:11:43 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
>
> for you to fetch changes up to 37c0c885d19a4c2d69faed891b5c02aaffbdccfb:
>
>   slirp: update to fix CVE-2020-29129 CVE-2020-29130 (2020-11-27 20:57:11=
 +0400)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------
>
> Marc-Andr=C3=A9 Lureau (1):
>   slirp: update to fix CVE-2020-29129 CVE-2020-29130


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

