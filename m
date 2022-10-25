Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C319360CE05
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:55:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onKNo-0002LO-8p; Tue, 25 Oct 2022 09:54:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onKNl-0001Xe-HD
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:54:17 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onKNi-0007Li-DS
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:54:17 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso10701132pjz.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a0liIqVeLm2UHdvR3sigBAlhYbZP5bALjdMJaPARGUc=;
 b=mNNqEnaG6dwuSAMB87t1Tgy75BioW+5bycAwahjBZGHMfaDPtTZEbW29vYT44coCkr
 tQgKgeoti1X9t7Bqw7GGfZcEcJaNcfWm02IZAbNOWvqVZsANO7siraKDvn7gVgUgnAMX
 QgfYFCUsKpCTBuXijARl7VKIBdTa4yXI4xoWcvshOYNc246gpSytn5KUNJe/3CCU+P3q
 Xb8L9ONI0dfnNq8XnWIm/Dan3NazI0oSOUBvvwrAqINr5+aHRiGyOqMZbVMS34+YuBCH
 6/0kmsIQFWL/S34Gl44yYPOjOCUE9+fTKu9pJ9qt/KJ7HckUhxw79nhE6hf1WMD7PpbU
 YZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a0liIqVeLm2UHdvR3sigBAlhYbZP5bALjdMJaPARGUc=;
 b=eJgf+EBumL2k4XLUmIFKoUqEdWKuSaUjwgIh3d68t8gtdIZroyZDs7eUbJ3XZhGCOV
 7wDstKwlaz5UScngBzOHAWYAMB4boOqk/5DiOdkQSxu6s6EVLKNpHDmcB7RgcaOXYgCD
 UPRtU9fjZ8YlhHpKwX/GcwKnE7Htl5uDTgG7bh+eoKSId53urB/v02+yFYEMLk47U62K
 gBtlC8yC6MFc4K51L34tNIAvlkLEOzLzjeLx6kGaEGfTw8LJiMiKZWH6/+Aalnp1wO1K
 6B7pItS7/fXz8WtYoPnLKpbGxgrYMuyvbkqQM4/xgeoARMejdI29mOVJN+bnOPbEb78Q
 9Oew==
X-Gm-Message-State: ACrzQf2UHt1d42fXZBDBoKpOD3LACPzlwyKTdtBlUBOa+JPOsW3wnU9q
 72J1THvy4yDon88SfSVtSB6PJAA95AS0xvYWHjQoyw==
X-Google-Smtp-Source: AMsMyM5cszO9ebYdY4MUgtIXZgmtqeuSrNORgb2nKW8IUGJhAmDz1qj0jaAKbRgvQHN3lkQMVxxq9SX454iprlqECMQ=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr38907333plb.60.1666706052625; Tue, 25
 Oct 2022 06:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
 <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
 <CAHmME9owB8eay2DJrYiEaZKRoJA6RA_EmCPSV0_XgU2aHYx_wg@mail.gmail.com>
 <CAFEAcA_vLqKQnXuYs6nQqbqw5KYUq4ye5O1s2CRPrdEkxOAVcw@mail.gmail.com>
 <CAHmME9rhXu6MuDPAYK0te8NBEHeJE17oNV6e-v6O+4U1-0s_Ew@mail.gmail.com>
 <CAHmME9qyURRp-U_HsFxOmQNEqLY7t2qHOvuQCNgt1kOou3RvNA@mail.gmail.com>
In-Reply-To: <CAHmME9qyURRp-U_HsFxOmQNEqLY7t2qHOvuQCNgt1kOou3RvNA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 14:54:01 +0100
Message-ID: <CAFEAcA-32AunhmukH1PK5F0uBsOtVUVF0vx+__LxCv-MBp+uhg@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 25 Oct 2022 at 13:50, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Oct 25, 2022 at 2:42 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > On Tue, Oct 25, 2022 at 2:34 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > No, I was just running "make check-avocado" locally.
> >
> > Oh, okay. I'll try out a full `make check` locally then just to be sure.

"make check" doesn't run the "make check-avocado" tests (because
they take a lot longer than most developers want for a simple
smoke test, and do things like downloading guest images for tests.)

thanks
-- PMM

