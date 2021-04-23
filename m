Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485DA369447
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:58:07 +0200 (CEST)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZwJq-0001Ft-Cb
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZwIu-0000nY-7x
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:57:08 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZwIq-0008WD-LR
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:57:07 -0400
Received: by mail-ej1-x632.google.com with SMTP id mh2so52472354ejb.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dCWn+zmbtsRKwaaAxzTAcHGGd+C1lIZ1bTVLBHY6DgM=;
 b=UO/2ISAp+MVBOUK5mTTQyTAW9OUAcoFaZ7adYiwf+TbcK+cGSVszUsBZ3W53X6SjZ0
 BmOAD5fKNEfcTGHmBAbGmJ3n8MUujg1TmdaN/OrAION7mNwjJsM1nt/xCPuYpLd2SrWI
 pW8hZ7uzC7DS485c7Pg7HC558/za0xCzxSrGbOUu8vP8m7act1GgntaHALtYwXp5kWL0
 iMhYOJikkPWKF+Hq23704mDgjj/qHK3/Oswz2GedJ/oh2uDi6lDR9jSHvRTAYg7qbZIc
 +MfvKIPe1UC1P5MeoW73+lfgXQY6LU7lf7cjimHDv25mlZCQSaoAqd/f4xgv0x387dN0
 l/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCWn+zmbtsRKwaaAxzTAcHGGd+C1lIZ1bTVLBHY6DgM=;
 b=pWrBlZvSrc6izd1ttbRTNJ1G3oLljt693lhbunZyz2h3rsRlP115ERmrVC3xrEJ7wa
 t3Eo9TU2F9FZUKlydwsaB6DVu107QH41lmq2NawAbToXCT8o2X6C5NeBwKMD0+syaWk+
 fuNLwbl1iYu4RhLajUgFtHlfOJ1zlwD9lOuo3dhjA7iEEYc6G+FSrFezy3vLdtKBXT/z
 gbtjqM4fYloEX/S1sAmDamoeBRIbBraenCrqipWNfo5NBFM+Nca/3+SMhEXx+FBj4G5M
 ONdRHRU1dxuUqoMGam9FKLzUzr/z0WRpgTtZCnRnTD8as1UwM+TXS6T7y4VesmvhCz3v
 uZog==
X-Gm-Message-State: AOAM531nbpZ7Fg2zK5xPKJG7CqHWOp6S3U1MyHI8/I1gsitZxXmpsQha
 uMSDFNoZj/SGu6cK1JTwyryV4keopqY+2c4sXU5lJw==
X-Google-Smtp-Source: ABdhPJwys/yTo5UT5DlFuZqu200N2bG0Ftj/GI8aPm7oeAYm+vP/Bg22EiclPXa65sDM4+/usMBt/kytUnrSKOfxd6Q=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr4500212eje.250.1619186222882; 
 Fri, 23 Apr 2021 06:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210422154427.13038-1-alex.bennee@linaro.org>
 <20210423142209.03032dc5.cohuck@redhat.com>
 <CAFEAcA80L=xum=9m+2TLiP09OrjuRG4VghfxK8A42Y+0+EUB2g@mail.gmail.com>
 <dae28ff3-5c32-2345-a336-30f59eb59b13@redhat.com>
 <20210423155231.1f8e2a30.cohuck@redhat.com>
In-Reply-To: <20210423155231.1f8e2a30.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:56:07 +0100
Message-ID: <CAFEAcA92CVNBpqHS9tFGZuAwDFyp=p8hn6duDRoASzErXBgGWw@mail.gmail.com>
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 14:52, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Fri, 23 Apr 2021 15:28:19 +0200
> Thomas Huth <thuth@redhat.com> wrote:
>
> > On 23/04/2021 15.06, Peter Maydell wrote:
> > > On Fri, 23 Apr 2021 at 13:22, Cornelia Huck <cohuck@redhat.com> wrote:
> > >> What's the verdict on this one? I plan to queue this to s390-next; but
> > >> if we end up doing an -rc5, it might qualify as a regression fix.
> > >
> > > What's your opinion? I think we do need an rc5 for the network backend
> > > hotplug crash. I don't want to open the doors for lots of new fixes
> > > just because we've got another rc, but on the other hand this one
> > > does look like it's a pretty small and safe fix, and letting intermittent
> > > crash bugs out into the wild seems like it could lead to a lot of
> > > annoying re-investigation of the same bug if it's reported by users
> > > later... So I kind of lean towards putting it in rc5.
> >
> > IMHO: It's in a s390x-only file, within a #ifdef CONFIG_USER_ONLY ... so the
> > damage this could do is very, very limited, indeed. Thus I'd also suggest to
> > include it in a rc5.
>
> Exactly, the benefits outweigh the risk IMHO.
>
> Peter, do you want to pick this one directly, or should I send you a pull req?

I'll pick it directly, thanks.

-- PMM

