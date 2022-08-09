Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F25258D6DC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:54:24 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLwN-0007Bk-3F
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLLu5-0005H5-8F
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:52:01 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLLu3-0004HP-EJ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:52:00 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z5so17553874yba.3
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 02:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=G2Dd8inVIQEkMvtVdKhxVY1wCyXdDIAzgI5Xux3ALVA=;
 b=opsHlUryNIlyh6hUau61/8PrJCKr6skbp9qCehNVQCpTGR/9rakp9Qr1y4rbQhamIj
 rnA+EL8PtiTHHcvcR43otgbg0p4hrja2NBA5dU75gQL7/iBp3W7dtmGbCB0wV9/wYl0P
 VyvSJmIthYxWEGh3UCiLG186r/uD8zJigwSD+FBZ/Q+HX+98Qsa2nru5Jjx7DdYw4mUQ
 cKYe6gj/65SZGXeQWdBspaP6dB+mcX52jMyKa3wh1tMrbhIlqGnOde4/CX3wsvvgbPKL
 RjUUw+zsDIv0dlvZ0RY3gG8zXcAS3qZBzMB2CyGyHwNFn1lQBUq234IId6O0hEUx8G/Q
 nr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=G2Dd8inVIQEkMvtVdKhxVY1wCyXdDIAzgI5Xux3ALVA=;
 b=HOQH3iwb9KzrJKwka61SA5B9f6sfpFQpGat50GJPcHjfWc1bTaFPEqkXTqlObnrbfr
 aE0BPTqKMDp7DiVDl4YGgc/t8JQiIp1rNKWyxSA7alPyuxA/9F4YWBrX8JmF2So2iJSx
 1R2XKCYZY/b66ZQCa/bY36vjbyGsqwMg6iiMgBR2vCWSXIojenkZLoqKs/HI0tqQCXZK
 kAq92dG9uk5Ar2Ue3HNy4vt/p7+AzK1luwPvcoQW6Hvy6UwFh75a5rcxwBYLO2aPA/U3
 Ng7iFarCX7eDUfJYvYG0iIXciZLCKCReXwvzlfpASxcmmYBadK0fyHKCsRhpR6WEHHlr
 6N1A==
X-Gm-Message-State: ACgBeo2O55IKJ71g446qeT1QQ6hh7UMmICOeGoYJd56y+1bLxpySz0zd
 7Q0yGtehnM/8u8ROJp+vtEDyDym5iP4512AT/tsnMQ==
X-Google-Smtp-Source: AA6agR4kcMztOe0/8DSA35OtRaNhKnocYKCKA3i/B3XwZnoTVjaSvCy+DNT5HF3j4VIhpoDQUsKj2VQYeAtHdwORzGc=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr20909197ybn.193.1660038718016; Tue, 09
 Aug 2022 02:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
 <CAFEAcA86gdio-3_XcNJGum8qiC93iVR0RK-g_sV1QRAhb8VGUw@mail.gmail.com>
In-Reply-To: <CAFEAcA86gdio-3_XcNJGum8qiC93iVR0RK-g_sV1QRAhb8VGUw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Aug 2022 10:51:47 +0100
Message-ID: <CAFEAcA9k_d6hFjz=udMuRgewxYhmnm8=ARB+s_33jNhtXknobg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Jon Alduan <jon.alduan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent, ping ?

thanks
-- PMM

On Mon, 1 Aug 2022 at 12:43, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Mon, 25 Jul 2022 at 12:13, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> >
> > On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
> > > For handling guest POSIX timers, we currently use an array
> > > g_posix_timers[], whose entries are a host timer_t value, or 0 for
> > > "this slot is unused".  When the guest calls the timer_create syscall
> > > we look through the array for a slot containing 0, and use that for
> > > the new timer.
> > >
> > > This scheme assumes that host timer_t values can never be zero.  This
> > > is unfortunately not a valid assumption -- for some host libc
> > > versions, timer_t values are simply indexes starting at 0.  When
> > > using this kind of host libc, the effect is that the first and second
> > > timers end up sharing a slot, and so when the guest tries to operate
> > > on the first timer it changes the second timer instead.
> >
> > For sake of historical record, could you mention here which specific
> > libc impl / version highlights the problem.
>
> How about:
>
> "This can happen if you are using glibc's backwards-compatible
> 'timer_t is an integer' compat code for some reason. This happens
> when a glibc newer than 2.3.3 is used for a program that was
> linked to work with glibc 2.2 to 2.3.3."
>
> Laurent, I'm going to assume you don't need a v2 sending just
> for a commit message tweak, unless you'd like me to do that.
>
> thanks
> -- PMM

