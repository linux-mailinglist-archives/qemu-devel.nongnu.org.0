Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856AC60FB1D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 17:03:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo4Nl-0003gn-Lk; Thu, 27 Oct 2022 11:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo4Ni-0003Vg-OX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:01:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo4Ng-0000E8-7G
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 11:01:18 -0400
Received: by mail-pl1-x62a.google.com with SMTP id y4so1787336plb.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Jd4NEEcFiupb72q/XN5RJ//J35A6uKwCBhyfCPFXi0=;
 b=ArV3VViwpulnSVHYzhITvR8qN2APJMMDs+JHLtX1wfEQf3gxTFJUcwDk08fLQ6cxAG
 ooN2FAYwL0qaNYt1/bN3RUkpLnQzfn51Kj8XKWR+U6O0lXn4CIMpxrGI2dvNMwgS496c
 Ql2McLShnbwHCGcfZHSdBAtXXGmtEf9JuZ3akLGGQMHzUWCjNoHntaAt9AAOt2sI9hSJ
 gOLqq7NN09KZ12xzsOxy9OX/AAKx0QnREjF6T1Gkf38z1kkGKzgml1oPXDz5N4ggFVWr
 NbFR51APJZvKKg1GuSNTH2aBv8NTbHfDWoLOE7AxLcP05SWZZYGb8icjd0zQFBpryqOd
 yT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Jd4NEEcFiupb72q/XN5RJ//J35A6uKwCBhyfCPFXi0=;
 b=XLppkHjbP6mEL78BTjq7K9mo3A8gdRznkVXR/4s+ycPayGgtybUUAwoEfUoGtXUGcd
 ppq8pOG42igFLpJKqtN0Qwzz6QurVQPniPL7FkMmOTguC9dssVOS5aHqlrVD/p/p3678
 I8LVdMuLY2S5LRe4za6ETunesOl9DbgtOV398qJccK1X/e5BtaCMQrlRM/JRrxPoWtA5
 StH3qhbdWlfrPUKSJ1XSWNLsqhmLv/I+t+Wt2VlY+FEG/aa/4l3kCVu14S46PwuRtqSM
 UkB80ouWUMK8y7GB0pjVQy/i6dS0lsGpR+z6E5Xtt7Ic2A5m+8Fp31jLFNU14F4xZq9K
 QwjA==
X-Gm-Message-State: ACrzQf0WUy6YHuhZbJya91tqCllnhP2TQ5tDsIOUOtWmE5HIVhuw15dm
 SxR7igBRKQVyW/gVK/ep+Wt93WDWkda8gXNezBfV7g==
X-Google-Smtp-Source: AMsMyM5i5KKU2BF4Tv6Z4Azi+x6QFEvEuQae/skL5B4IkeZRtwH1IjEzl7glOJTy8mFeWv9PfCpD9x8u7dspNrPxUa4=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr50308533plr.168.1666882873337; Thu, 27
 Oct 2022 08:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221025235006.7215-1-philmd@linaro.org>
 <87bkpxl4a1.fsf@pond.sub.org>
In-Reply-To: <87bkpxl4a1.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 16:01:01 +0100
Message-ID: <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 at 15:40, Markus Armbruster <armbru@redhat.com> wrote:
> I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
> not .h and call it a day?  No need to configure each and every editor to
> tread these as C code.

It says "this isn't actually a header in the usual sense". That's
useful for automated scripted checks (eg we don't want
scripts/clean-header-guards.pl to add the standard #include header
guards to this sort of file) and for humans (if you see one of these
files included as part of the normal #include block at the top of
a .c file that's probably a mistake; if you see it being used then
you know there's likely multiple-inclusion shenanigans going on.)

thanks
-- PMM

