Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415836B053
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:14:57 +0200 (CEST)
Received: from localhost ([::1]:52328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxKS-0005CU-4L
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxJH-0004ZF-GX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:13:43 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1laxJF-0005oi-Pp
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:13:43 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s15so64854547edd.4
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kLLsckiAgQFO+aCYHXWxeO+RuokAW9erxTUdJ4px4iA=;
 b=Vqw8NPFBa2p8JLl7vEYSY1eOMQpGF3M6N5nFtLfOmrRPVEgZAd9BqWRDTq477V+r7p
 NHECUB6OR/Z9TwgVHjqPVzj4Ay+nIwiqha2dv0fG5lDhoK0/ijvSbCy32eQIZcsEwehL
 sQs0X+A4udIL6kv3vsOI7euauyfSjJV1c6HZpSjMYgZw8mHn4479YQr3rEBvonbgbBw2
 lMc0u/xHm3L+fDpB/RLgMs61gcIb0/AwM4kCKWC+Iy+/9aEC7o42FnJiEdQzUXq8UGUf
 A20CyzXCmveYPQObL5ELlXRWYw7+wyhvF4XQWLLP8EedQw7HDX/kABKzrJHGbIWUiO8G
 1IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kLLsckiAgQFO+aCYHXWxeO+RuokAW9erxTUdJ4px4iA=;
 b=fGs0IahJxaOAcVimRcNAUIm0AUIa9ycki6f/ZgbbL+bsDNuhVjC5ztfwdbI9q04jtE
 cuXS/reNxYEdMjnBVSjeSdchoqvMUoP4rfCxorW9bBMRD3uakDalr3oLlFyA43eyulcW
 8HoBuOlRGgfqfpXj/AgtSBFTgaWU0OfYZAxenI9SIMk2QesWGLzFc/G45jWFo46EWt9c
 lHVKjNnzSmrA2h4E2KCBUK3o97jXEtawLwzz+HAynPwBOX38Wia5ZyXDzh9uoP2su5Wd
 BpErzkNRQ0Ss45Iym9WuvSXYDwy/VbBT9vy5YTVKy93wxW1iyZIDbh/RPE/SrJ9wwe81
 iOow==
X-Gm-Message-State: AOAM53348XpAmHoORs4GnVxTKPQXFUM8sD6+5O62E0OL0ZYDF2smOkt8
 mcMIP3zTztwx86MokdCxqTDetqhYRqiFQRb62DOjQ0EPOvhkpQ==
X-Google-Smtp-Source: ABdhPJyifRmuGVDqSZAJ15G6GKclCTRrkLxaN1ZRgjBLH1FSZ7P868DjKML7P/N5m59ciCxTLFaR9HgAJiydqMJN+FU=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr19865346edu.100.1619428420341; 
 Mon, 26 Apr 2021 02:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-6-imp@bsdimp.com>
 <YIaAVTahNvQ0+hKc@redhat.com>
In-Reply-To: <YIaAVTahNvQ0+hKc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Apr 2021 10:12:42 +0100
Message-ID: <CAFEAcA86i35cyoXkMp-PtWwOm+ELOR2zvS0Ze_duO6DkWu-q+Q@mail.gmail.com>
Subject: Re: [PULL 15/24] bsd-user: Fix commentary issues
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, arichardson@freebsd.org,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Apr 2021 at 10:01, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Apr 23, 2021 at 02:39:50PM -0600, imp@bsdimp.com wrote:
> > -#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimple=
mented MAP_INHERIT */
> > -#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplem=
ented MAP_NOEXTEND */
> > -#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, =
like a stack */
> > -#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not =
sync underlying file */
> > +#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
> > +                                 /* previously misimplemented MAP_INHE=
RIT */
> > +#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
> > +                                 /* previously unimplemented MAP_NOEXT=
END */
> > +#define TARGET_FREEBSD_MAP_STACK        0x0400
> > +                                 /* region grows down, like a stack */
> > +#define TARGET_FREEBSD_MAP_NOSYNC       0x0800
> > +                                 /* page to but do not sync underlying=
 file */
>
> I find this indented following comment style more ambiguous as to
> what constant the comment applies to. IMHO would be clearer as
>
>  /* previously misimplemented MAP_INHERIT */
>  #define TARGET_FREEBSD_MAP_RESERVED0080 0x0080
>
>  /* previously unimplemented MAP_NOEXTEND */
>  #define TARGET_FREEBSD_MAP_RESERVED0100 0x0100
>
>  /* region grows down, like a stack */
>  #define TARGET_FREEBSD_MAP_STACK        0x0400
>
>  /* page to but do not sync underlying file */
>  #define TARGET_FREEBSD_MAP_NOSYNC       0x0800

Or alternatively decide that this is one of those cases where the coding
style's "If wrapping the line at 80 columns is obviously less readable and
more awkward, prefer not to wrap it" advice applies. The lines as they stan=
d
are only 95 characters or so long.

thanks
-- PMM

