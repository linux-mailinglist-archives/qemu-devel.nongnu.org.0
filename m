Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB1B582377
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:49:25 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdfQ-00030I-6a
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdV6-0003GM-5h
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:38:44 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:38747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGdV1-0004rR-TP
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:38:43 -0400
Received: by mail-qk1-x72f.google.com with SMTP id e16so12856903qka.5
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T8bAZkkb7vcu8n3e2PkGsr9dRebttErXjsKmIIsr/Jg=;
 b=GuEX1JKgGko+PDy+6rtpPpDg8yZZaGdBVR8/Kmg3l8t2JDYOD+BvmlC1r2nFTRkEgR
 rPSbOeovhs1oYyc7ndtSKIOP4ULp1nGty04NKRahGWAlsOePR92yY4xr3CoOsVV5GXmn
 tBBMzvUMqYtfDjadFkysVlKenUxnxnUl2uFR6xB1n5DSDb8/ezF5E7eG4JtEsBxaITA0
 cqnlZ5hWSFFsyFZo82hTXJ6m/3CxKuUaAAZJ29932hn3yZ2ZDK4XDOj6X0W1KQDwg50W
 qW/w1PL+5wpmkYSzsIYjpHPofsTuAYases3FkTbnExrFYa1GjDVtItXf/fTyJayccNro
 ZYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T8bAZkkb7vcu8n3e2PkGsr9dRebttErXjsKmIIsr/Jg=;
 b=glSZmtXaMun6Z05gjP2YRUcQNQ4aTiOop1DAh+lSjxeRZlu8gYs91XWadiLnvYPrZg
 /UBJ+yXH31b2jN+xANTbJu3pz78vVU9XLRMkH1y1pQBAJBMvEq7HjGQseLh6OFcHB/rY
 Y60xFlvXFUtC7YtDawEr1EG6Q/RjpYPpIYQuJSP0WY+6xgM6WItyU15UPQeMCqeyYOrE
 L/V2WBDHlG3zH6uTf/ahFnwLcSVEz4ic5CWNHfl04CFHYAXcp72VHANjCrr8AlTPOQHp
 N6fVWhvzHzAK/Wd2/eqy4R9oCOXb1plYZsjCHxEOV1U76Aad18WtIvQyTouExfyGeiNv
 S3oA==
X-Gm-Message-State: AJIora/2gLEILZht0v7r4Pb6fPXfo72FQivxugcBcH5JxPRYDP4tmHJI
 KZ3HLxvFJ+6HGRXBH9O78Z5ISx2havMLm9EzHPc=
X-Google-Smtp-Source: AGRyM1vbofxfOQNGhwlX5LOqcivvm+M5V1+niMFPoWH9K3sazVq5mCnp9sj/nk2SV0NIKE/F2HrirYN7POzPGVJgeT8=
X-Received: by 2002:a05:620a:430f:b0:6a7:9f9d:20cd with SMTP id
 u15-20020a05620a430f00b006a79f9d20cdmr15816179qko.389.1658914718738; Wed, 27
 Jul 2022 02:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-3-bmeng.cn@gmail.com>
 <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
In-Reply-To: <CAGoVJZzZN5CNoURh4-uMqkPwUd-Z03PmZZ04v8M+BYi2tX37_g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 17:38:27 +0800
Message-ID: <CAEUhbmWv1zdYFJ-ojWxH_KnJygS2ceQyPPBvDwQ4rEqzR534EQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] util/oslib-win32: Add a helper to get the Windows
 version
To: Yan Vugenfirer <yvugenfi@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Jul 27, 2022 at 4:50 PM Yan Vugenfirer <yvugenfi@redhat.com> wrote:
>
> On Wed, Jul 27, 2022 at 10:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds a helper to get the Windows version via the RtlGetVersion
> > call, for QEMU codes to determine the Windows version at run-time.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  include/sysemu/os-win32.h |  2 ++
> >  util/oslib-win32.c        | 15 +++++++++++++++
> >  2 files changed, 17 insertions(+)
> >
> > diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
> > index edc3b38a57..1e324026a4 100644
> > --- a/include/sysemu/os-win32.h
> > +++ b/include/sysemu/os-win32.h
> > @@ -204,6 +204,8 @@ ssize_t qemu_recv_wrap(int sockfd, void *buf, size_t len, int flags);
> >  ssize_t qemu_recvfrom_wrap(int sockfd, void *buf, size_t len, int flags,
> >                             struct sockaddr *addr, socklen_t *addrlen);
> >
> > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info);
> > +
> >  #ifdef __cplusplus
> >  }
> >  #endif
> > diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> > index 5723d3eb4c..6d2387b9ff 100644
> > --- a/util/oslib-win32.c
> > +++ b/util/oslib-win32.c
> > @@ -547,3 +547,18 @@ int qemu_msync(void *addr, size_t length, int fd)
> >       */
> >      return qemu_fdatasync(fd);
> >  }
> > +
> > +void os_get_win_version(RTL_OSVERSIONINFOEXW *info)
> > +{
> > +    typedef LONG (WINAPI *rtl_get_version_t)(PRTL_OSVERSIONINFOEXW);
> > +
> > +    /* RtlGetVersion is available starting with Windows 2000 */
> > +    HMODULE module = GetModuleHandle("ntdll");
> > +    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> > +    rtl_get_version_t rtl_get_version = (rtl_get_version_t)fun;
> > +
> > +    info->dwOSVersionInfoSize = sizeof(RTL_OSVERSIONINFOEXW);
> > +    rtl_get_version(info);
> The original function, when it was present in qemu-ga, tested that
> getting the function address succeeded.
> I think this test should be kept.
> See below:
> -    PVOID fun = GetProcAddress(module, "RtlGetVersion");
> -    if (fun == NULL) {
> -        error_setg(errp, QERR_QGA_COMMAND_FAILED,
> -            "Failed to get address of RtlGetVersion");
> -        return;
> -    }
>

Please see the comment:

/* RtlGetVersion is available starting with Windows 2000 */

I don't think we need that check.

Regards,
Bin

