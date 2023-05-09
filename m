Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6356FCDFA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSK3-0003V2-0S; Tue, 09 May 2023 14:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwSK1-0003UZ-M2
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:44:25 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwSK0-0000GW-3X
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:44:25 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50be17a1eceso12089768a12.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683657862; x=1686249862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IfxPT05nkegBG3pzTk7lMPXTwyE6CQVA/Vzslippieo=;
 b=nIAoj+mwCEiCDgs2eyVYaI9UAqciu3BZ1up8f07MWAwS+ON8YZ/yIGhrlsvxAG2aHa
 Htd6MJONTu1KFnZTUHHDkk+mP/8uszumn5MeBwUYilq9osLIzHemzkNf9s4NHeboB007
 mvVzTbE85FOkiy32n5pSGyhL53Whqy0gGWxLlibF+wjFumW1nZPzNkjY+WgW/DknP4FR
 TagQc+neAMwX9aCJzL6DpdZF56KPkauBdcbmtTxoTGTo+uxIm/YPGt5Yxm7ajgErKNur
 zi46/qayqeLuh5EFoNTYRr+SKSMjOPCWV4ZPynmJVbSLOX2ZPu9iQVwBZ1eQHxxE+FPy
 cDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683657862; x=1686249862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IfxPT05nkegBG3pzTk7lMPXTwyE6CQVA/Vzslippieo=;
 b=WnTLZ2j8kK/G2WdpPROufEHcU/oOwnOMYynW0vbZFjbPOeNXjrbaaqA53K87jKrcAR
 y3ACO2k0nBjD/ucnp1Ox6Lyn+9BlQelCB1woph/h7d6rdQL2DxcBaHDXqmjvxFcqBfg/
 8+9sNJXXcY8Ss4AqkOsq0CIT0u+bOuCTif/6oZMIclHEGBr/p/SWRXlgaC1PDoqxYBjb
 YNZVTFQH5/edJQyEWddS6usET+3w3gsGd9PWHu9PDC+nHlsPk9VM6PVNskXCbeoy5iOO
 WFDGu6M7tRZDhr/gDmqT2MYu6qmm8hAvvCpKzqo7z21X2i7I9OF/rcKvkbGq+oB/CduJ
 t2ew==
X-Gm-Message-State: AC+VfDwf3q3nEwm95zc9xfDM/cIrMNzmRGHay7ZS7ny5MOYeR+rOpB4h
 +tP+r1BzzHri05BgxWsjh1XflJKgo7lpsgmyh1trcsfG4ya6jDL8
X-Google-Smtp-Source: ACHHUZ5thYcaab4AcB+ZNEW6eiwawIrZ99njevxgn/uUnhEMb4SfjtHy3yJVtPAdLcNCQxiDnKitQxFOPaQc+bwf1ro=
X-Received: by 2002:a05:6402:49a:b0:50d:9e7c:2646 with SMTP id
 k26-20020a056402049a00b0050d9e7c2646mr6321539edv.7.1683657862324; Tue, 09 May
 2023 11:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230330152613.232082-1-thuth@redhat.com>
 <33e52dd7-32f7-0fa8-b6ee-813b87ead623@msgid.tls.msk.ru>
 <CAFEAcA8g5Uqcns0FPy74mZ+jh-8ZtCxOTR8qL+RGbn+XjNfk0w@mail.gmail.com>
In-Reply-To: <CAFEAcA8g5Uqcns0FPy74mZ+jh-8ZtCxOTR8qL+RGbn+XjNfk0w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 19:44:03 +0100
Message-ID: <CAFEAcA9JbQhKmKX7zUuSNE-Qvqnm6Ax7JpTQOjqWqS73GgVD5Q@mail.gmail.com>
Subject: Re: [PATCH] hw/mips/malta: Fix the malta machine on big endian hosts
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-stable@nongnu.org, 
 Aurelien Jarno <aurelien@aurel32.net>, Rob Landley <rob@landley.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 13 Apr 2023 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 13 Apr 2023 at 17:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> > 30.03.2023 18:26, Thomas Huth wrote:
> > > Booting a Linux kernel with the malta machine is currently broken
> > > on big endian hosts. The cpu_to_gt32 macro wants to byteswap a value
> > > for little endian targets only, but uses the wrong way to do this:
> > > cpu_to_[lb]e32 works the other way round on big endian hosts! Fix
> > > it by using the same ways on both, big and little endian hosts.
> > >
> > > Fixes: 0c8427baf0 ("hw/mips/malta: Use bootloader helper to set BAR registers")
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> >
> > Has this been forgotten?
>
> Looks like it. Too late for 8.0 now (and it wasn't a regression
> since it looks like it was broken in 7.2 as well); will have to
> be fixed in 8.1.

Philippe -- looks like this patch still hasn't been queued ?
(It could probably use a Cc: qemu-stable@nongnu.org at this point.)

It can have my
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

