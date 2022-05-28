Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9721A536C74
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 13:07:07 +0200 (CEST)
Received: from localhost ([::1]:51028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuuHi-0005l6-8h
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 07:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nuuDI-0004fD-1f; Sat, 28 May 2022 07:02:32 -0400
Received: from mail-yb1-f178.google.com ([209.85.219.178]:39816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nuuDC-0002G8-Q9; Sat, 28 May 2022 07:02:31 -0400
Received: by mail-yb1-f178.google.com with SMTP id i187so11757711ybg.6;
 Sat, 28 May 2022 04:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Vr2HY6hgoKC/Xyl6OC+isrG036fWqtUgbDskzPHZ5Q=;
 b=VpCd0gVCWkghxe3TibOk0G+DNdPLAm72ei+oHBQfvrot0B0lQ3Dye/3knZpcvxlndz
 LxCKPRtABZkXCNZS6S5JO26zL7Q8hAlCDPg14Vz6hIlJBz/OKpcAfrdtvFTp8HoYuDEA
 MkErGy3RwpyGXW7uSZvFRexvjUsvRqRASqjMLYI0H9m104SAYus/XYU8D0qI+MZUiTjj
 +3OS7BaQ4JoA0pi5W4wqc/mHdqe/0P20rIEnCt273Y+gccMXBX2lsFWOMQEDpfxtjyQ1
 ezadPXpJaioQfqscWfxGipssUgXmzm9yZ6HX/LBF6Aa6Xxq9xKTJOYwRVm/vlMS40D/7
 tEaw==
X-Gm-Message-State: AOAM531MmIBrgWmRJPHJUIJshg/mFqu/5AUxZEKZLOfXM0y412xKCz+2
 z3Po9lIGBerryMjy2gh/A3FKdrLp1YeEdUOdQq0=
X-Google-Smtp-Source: ABdhPJzI+OsaHJKaqTzA/5PZmZWRpUCFVBph1pN9WaPP+MjREC2WLxw+7hc+YXfuh704Vj5bTfctQUt9HceYOEnD7+U=
X-Received: by 2002:a25:6947:0:b0:65b:86c3:d263 with SMTP id
 e68-20020a256947000000b0065b86c3d263mr5567156ybc.335.1653735745094; Sat, 28
 May 2022 04:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220509125315.3746865-1-stefanha@redhat.com>
 <CAAdtpL5_tY1hPYGt-=yBbqgCkSCaUGvKORZ_Eaw9p9_i=UFNsg@mail.gmail.com>
In-Reply-To: <CAAdtpL5_tY1hPYGt-=yBbqgCkSCaUGvKORZ_Eaw9p9_i=UFNsg@mail.gmail.com>
Date: Sat, 28 May 2022 13:02:14 +0200
Message-ID: <CAAdtpL5JJVo2b6S3epkjkzws8Urx4hnW9cAtMn9-4XhAV_bCAA@mail.gmail.com>
Subject: Re: [PULL 0/9] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.178;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, May 12, 2022 at 12:29 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Hi Stefan, Nicolas,
>
> > Nicolas Saenz Julienne (3):
> >   Introduce event-loop-base abstract class
> >   util/main-loop: Introduce the main loop into QOM
> >   util/event-loop-base: Introduce options to set the thread pool size
>
> I'm getting this warning on Darwin:
>
> ...
> [379/1097] Linking static target libevent-loop-base.a
> warning: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefau=
lt.xctoolchain/usr/bin/ranlib:
> archive library: libevent-loop-base.a the table of contents is empty
> (no object file members in the library define global symbols)
> ...

Opened https://gitlab.com/qemu-project/qemu/-/issues/1044 to track this.

