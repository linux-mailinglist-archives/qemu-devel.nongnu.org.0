Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9203625AB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:31:56 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRNr-0005na-Nu
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXRIv-0000c4-9i
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:50 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXRIp-0000X4-Aw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:26:48 -0400
Received: by mail-ed1-x536.google.com with SMTP id m3so32958862edv.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ty2SD7IjeSr9QDR/9c87oQs5nY+pWIjgkAHFkzmgIQ0=;
 b=J1kjXd9Zjaq7MN6JYMshfW6ipAubvQBwwbxEBGgGd3+6L7fHUrBMZtWwMaxj9MSUg2
 PKcpoXLUn0dtEls7Np0v8g8Dzz2/2PuqXAj/yQ9zBUTXFgV8bBjtB96HAiN8hns9rDJN
 Z7ZtZTCDyEehX3uxZZn1k3TZmD1uxvYPZ4Q207AEoaUDybckIszsTf9iYmGuwsNWiIg6
 JGwLcQ6T+icRJILkkftHZMXY4rW1wAlWlND5FvszrwcmdakGRNhy/gCSII0wn2PIOH0b
 r7gmoizHfNJRjcdgjOFGKgtj364aJBSeuf2Y+y5PRAl9LgD09on38aSWj+rTLytv+3Tu
 Q4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ty2SD7IjeSr9QDR/9c87oQs5nY+pWIjgkAHFkzmgIQ0=;
 b=BA9IaHceoY3HONelH2vPkpmquzjvWPOPyTBFn2f3GxYSOf54qvArN2PGUpYGTMvNZ/
 LZDbdxlSVDE5pTHJNiqVcd2VfAw666c7f/cgzpkWf6AzAuhcRI2wtitJKWeenvXAyg82
 0FKf4nMKOZDt8Zdq7PsQCMMEAHRKWPIeK2w4pxS7VLIq4bkWX33yxQB6VZyr5Fbq8V2K
 roVxeDWoSbmvLm8FuxIe6RlPuSOQY7VzJ0B7aBPP5MpFckD5oTp7vomQ6WhRkOMRZxfk
 +xfR30oGP0vAlFflTTTIoBPFrY0dLDhCHs0BTQlG9eEdO/8mqaaI9vI7zZhCBdisTJa+
 LJ9A==
X-Gm-Message-State: AOAM5325fcHhgySbTTKrc/A/2B5HH7IQluLAZMbNZmdBUkiDxg1dIM+V
 YN1rDKCb+QvQICUGyimOq/eM/DGqiKeyYEkHVrIAII2A7So=
X-Google-Smtp-Source: ABdhPJxUsTLVs+UOPvlLpdr8t6fLBgvh7AnZH6miHnvpHy3xu9F/GMCYcmBQ6brwb36aukXymBgoBgnSYYg8Z2yjg5Q=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr10790124edu.100.1618590400147; 
 Fri, 16 Apr 2021 09:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-5-peter.maydell@linaro.org>
 <afc0e5bf-3d4f-e4c6-cd1e-f90f3686d2f1@redhat.com>
In-Reply-To: <afc0e5bf-3d4f-e4c6-cd1e-f90f3686d2f1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 17:25:51 +0100
Message-ID: <CAFEAcA_evQmf+k_-ub+phiatw1=FJdnYonrDV48bZhNEPw-a1g@mail.gmail.com>
Subject: Re: [PATCH for-6.0? 4/6] osdep: Make os-win32.h and os-posix.h handle
 'extern "C"' themselves
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 17:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 16/04/21 15:55, Peter Maydell wrote:
> >   #ifdef _WIN32
> >   #include "sysemu/os-win32.h"
> >   #endif
> > @@ -143,6 +139,10 @@ extern "C" {
> >   #include "sysemu/os-posix.h"
> >   #endif
> >
> > +#ifdef __cplusplus
> > +extern "C" {
> > +#endif
> > +
> >   #include "qemu/typedefs.h"
> >
> >   /*
> > diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
> > index 629c8c648b7..2edf33658a4 100644
> > --- a/include/sysemu/os-posix.h
> > +++ b/include/sysemu/os-posix.h
> > @@ -38,6 +38,10 @@
> >   #include <sys/sysmacros.h>
> >   #endif
> >
> > +#ifdef __cplusplus
> > +extern "C" {
> > +#endif
> > +
>
> include/sysemu/ is also the wrong directory to have these headers, which
> probably should be split into a qemu/osdep-{win32,posix}.h part and an
> actual sysemu/os-{win32,posix}.h part.  But this is good enough for now.

Yeah, I thought as I was writing this that it was odd that these are
in sysemu/ but osdep itself is in qemu/...

thanks
-- PMM

