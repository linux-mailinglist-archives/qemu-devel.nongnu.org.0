Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667613BAE09
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:25:04 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05rb-0005qN-2d
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05qn-000522-M5
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:24:13 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05ql-0000g5-LW
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:24:13 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bu12so25397782ejb.0
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fjNXS0GybELs2bQP7j5/ZN2Ap/ciE7qn13HmWkNI3iE=;
 b=Y8GCcTp++bvLHocqNQG1qANfxspxqm9LDmeampfkCjoUNpEABRY+zWcyzdSx78Nm4H
 rRE5Cneu+pfq/1N0zjtbzZWwi66qcP4KpOgflUlwSWOo7h7HTudn0SJi1O4oU5OuXa6T
 8hiZy7Mda2ccOZ0yqiQ1rfr3gof++z9tXLlUEUFjve0Vp3+6aG0b0mnDA41Kh0N0gOhv
 L7VnmxjQcZx3UfGmCJbMtQZUqq7aUXC7uN7R1mSFP2wZjhbSjkl3Ri+jQ+VhCHqSUSRb
 Wpcmw86t7rBWGKMzWa17jkTicH778SgA4XRXNvfnCkx1WoKbjiLvQjR+mgTtD5DTWLK/
 ZPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fjNXS0GybELs2bQP7j5/ZN2Ap/ciE7qn13HmWkNI3iE=;
 b=EU94uts02IVGbGz9U7kfAQbMlzqSG/+DwsWmR4y8ObeNmX6mTTAKM9abOFcYj8kzpR
 6ngcFgeEIQ4U4dEnq3O/3GozwuRLo7EYXpBEowjMQFNBCdO6w9rOLWuCbPDJseLVavM7
 GlyJ751DBSBhoOeXLxp7gkXd407H+12xd+p2qe40EV7b39I07TR/pqoTRabWZYQCb5Sc
 3FFAdlTHxRyLKvnvsf+oUn+ZVTAZg/BH7lFHUeQa0J6VhrJN+fIMqAE4G8kCJ4hLNqHv
 Oc8QvqTWb3dzGb13X9HoIQ3mkuGek6TmpYZfNuAoeszN6wKuvAZlumK/c96GsmmiB2X2
 GUjw==
X-Gm-Message-State: AOAM532WEnwNtDclQqWQF2O0TasVDTmxjKytV4pBeaFq7UJQyCi81Job
 FNu31oR0WCohD2E/4rizASbRa5RPYGoEoIoiOeoOkg==
X-Google-Smtp-Source: ABdhPJx2M1qXb79TxRt8bXzaPplBXZ9Gcgt2i+PTfY41uA0nJJ8FOAXDkol3fijhSthTi/fX/AXr6y2RfctWus5XzWk=
X-Received: by 2002:a17:907:1691:: with SMTP id
 hc17mr9350643ejc.382.1625419449786; 
 Sun, 04 Jul 2021 10:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-5-f4bug@amsat.org>
In-Reply-To: <20210704170736.617895-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 18:23:31 +0100
Message-ID: <CAFEAcA_fCsO8WJDjsrdhADeT6H9A+jTDAnuWHJY=HKkPeW6-sQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/mips: Complete UHI errno list and log
 unexpected errors
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021 at 18:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The spec only defines a set of host errno to translate to guest.
> Complete the current errno set, and log unexpected errno (they
> are currently replaced by EINVAL, which is dubious, but we don't
> modify this).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---

This commit adds the definition of the guest EINVAL:

> +    uhi_errno_insert(EINVAL,        22);
> @@ -126,6 +162,8 @@ static int errno_mips(int host_errno)
>                                       NULL, &uhi_errno)) {
>          return GPOINTER_TO_INT(uhi_errno);
>      }
> +    qemu_log("semihosting: Illegal UHI errno: %d\n", host_errno);
> +
>      return EINVAL; /* Not reachable per the specification */
>  }

...but it leaves the default case returning the host EINVAL.

thanks
-- PMM

