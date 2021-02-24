Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24043323D2E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:08:43 +0100 (CET)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtuE-0007lF-6G
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEttO-0007Jt-HJ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:07:50 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEttL-0002VX-06
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:07:50 -0500
Received: by mail-ed1-x530.google.com with SMTP id h25so2411495eds.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=upNjZ+fTjN0FD8RnJnbeYQ+KE++M8mkCF8hUV5Ha1T8=;
 b=VsNwMeU/R3nG5FRsVB6/nsn/rizxE/9IDhbhYyYTb5CyUxvG3azK7fBui/9GTgybe3
 MKIeYwr56ML3P89Gh3qRXev7XQXwGBsqmgzDWW5i/5B86x71XAfCmB7NzGmWNvJ2MNLo
 ala/2qml98C4wlu5DxoRShTVQ280v6xV9Kh6WHpCM/s8GjTP24IIbsbrFDPz+E3kPy1H
 Orzo4pTqVmhaMn26UsEhi1YQ5EKF9zQLlpbLR9vSQUz0ASi5SWvTYHHmQcz2UQvv+nRh
 m/E61IQB5q2e6UMLWA9ZAMggk5rKjqlEs2z636Ftus78HVVvtFvP880Lreazw0hC7YiC
 ZvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=upNjZ+fTjN0FD8RnJnbeYQ+KE++M8mkCF8hUV5Ha1T8=;
 b=qHpgdnUM/QZHdiHEuhAbp+dzeXCl+8sReTcHaXpgQNmV84fWsrf7ZT+36iViPMAFV9
 CW8zOxTmzatT98z2TY0ZEu/Hok3jq9iPTWZ1hnUVAkUk3kMQeTNFnRrtwTv9gtAJucF4
 aK4HBL6VQT5DAEnQOI1bip/SgIvchbA5MZ1Bl3mD34BIKuu+l67l4EvDugjKLooivGW1
 ijj4WBTNLkyfiedTibtCQ0vECXQV4aT1gl1dNHDLjJcqkdwGbJ6S7PHpzI9Yai1zORJD
 kHI13l4/3orhv1Va1INiTZl0RIvHVu5yxsFbIVhMxc+36o28LmYc46gZVTr2rycMopd2
 PyxA==
X-Gm-Message-State: AOAM532wCO6ORECkfRAti532LAsbPJ0lEgbiVNB0H46MH6HO64cZIq2s
 NCs0GK+rpvbPluZhTQFq8H/yDzVIBTxWRnp8e01KMg==
X-Google-Smtp-Source: ABdhPJy58dX1KMjiXYCbfO8D+Hr/rdublfDmkmllAbnSScfZEWWRR3rBOZCsTM9fpdk5Oc6e94u1AcNxqtnFJiuFkqA=
X-Received: by 2002:a50:d307:: with SMTP id g7mr33157050edh.204.1614172064597; 
 Wed, 24 Feb 2021 05:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
 <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
 <YDYyoeFU4jQBN/8v@redhat.com>
In-Reply-To: <YDYyoeFU4jQBN/8v@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 13:07:33 +0000
Message-ID: <CAFEAcA8DvXVxRvB0ZtQh3j5Y=34DOC1CzUY1LkuMB5WCJKthmg@mail.gmail.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 at 11:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> So from osdep.h I think something like this is likely sufficient:
>
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index ba15be9c56..7a1d83a8b6 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -126,6 +126,7 @@ extern int daemon(int, int);
>  #include "glib-compat.h"
>  #include "qemu/typedefs.h"
>
> +extern "C" {

Needs to be protected by #ifdef so it's only relevant for the
C++ compiler, right?

>  /*
>   * For mingw, as of v6.0.0, the function implementing the assert macro i=
s
>   * not marked as noreturn, so the compiler cannot delete code following =
an
> @@ -722,4 +723,6 @@ static inline int platform_does_not_support_system(co=
nst char *command)
>  }
>  #endif /* !HAVE_SYSTEM_FUNCTION */
>
> +}
> +
>  #endif
>
>
> We'll also need to them protect any local headers we use before this poin=
t.
>
> $ grep #include ../../../include/qemu/osdep.h  | grep -v '<'
> #include "config-host.h"
> #include CONFIG_TARGET
> #include "exec/poison.h"
> #include "qemu/compiler.h"
> #include "sysemu/os-win32.h"
> #include "sysemu/os-posix.h"
> #include "glib-compat.h"
> #include "qemu/typedefs.h"
>
> and transitively through that list, but I think there's no too many
> more there.

Is there anything we can do to make the compiler complain if we
get this wrong? Otherwise it seems likely that we'll end up
accidentally putting things inside or outside 'extern "C"'
declarations when they shouldn't be, as we make future changes
to our headers.

(The other approach would be to try to get rid of the
C++ in the codebase. We could probably say 'drop vixl
and always use capstone', for instance.)

thanks
-- PMM

