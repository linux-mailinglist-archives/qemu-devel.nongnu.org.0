Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685B06079C4
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 16:39:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltB2-0002f5-Ez
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:39:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltAw-0003H9-Sh
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 10:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oltAl-0001k7-ON
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:38:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oltAk-0000P7-5u
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 10:38:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id y4so2551067plb.2
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoDjLm6qRUsktNVzqh6x3Ld/wH9OIsEUcmpAVw3xNbw=;
 b=D6n/uxHPbShQr/uIOLyMHk1c7BpQXjCTeC5wNU1hN707Fm/B52GVy03aoaP76aNOC7
 f63ojj2q+nFsRwwOs7iBop5YWYpk9SKEyJ6imtuvoHJNmHG3XeNO5BEXrkIWQuQmrRd4
 pQtJqfSW4hui7j3KX8g+x/k6q9Dg5U9CLA2vvFO7CtCVKJuL8tOSgE5L+2HByApCW4w8
 xQME6AMuIQP+biF0f2CCQr7XakQijHY/jxDJ37nJYWyuiO6xDCexR5+9m9KwMGy/i/w6
 zu4fnNHBRxi4OsvwHnpbe8OVG8U7gQpvSoLXerzAcBOlVmTRT8PVmB8Zj1R5WFjimTlK
 04Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoDjLm6qRUsktNVzqh6x3Ld/wH9OIsEUcmpAVw3xNbw=;
 b=gSB2EF2ohLzRrGXqSxoEMU97Jp4TQDPTnY+FnTPOQLUkbhwLZ6HlMgkAQSesAL0QXb
 2b9EuRWePbvqei+bTABuLQRXp3MfVOXTgcCSkIp/unw50eV+czYeQf5w4mEFxok2PlQN
 3uzYmSbL9mIDyE6O7l0Cl4l3MeVK0r3hzbByif2lySWdTwXqoRh04l77+7RguEEc2sau
 Z7k+aUJP9d9+tZoi9QSyap0nIP1OGlbdqPblcroL7UIdFkfu9lyAem0NnECoUhyd90Dw
 EWoKIo5S2yAJaxLBnEWWrM/ZRUnNdqmapCOb/fVVI+U1KX2odIX5Dfa3l7VBzdC9MBd+
 FSjQ==
X-Gm-Message-State: ACrzQf1EgHI2nUNNVLQbKLs8U70K+mSX8RpLqIHJrvKw0y9+K3VXh3Hg
 Vq/qErwqdPe9gvNpHu4o6We1QKXkEpCoRN6d5KX/3A==
X-Google-Smtp-Source: AMsMyM58sm1aaydh1ObJ73OUXimQaY8A9jBgOW1mAMXSy4rhxxdyT6t3RAxTbqZ2kUkqC1O+AoEou5eW6vC4B3g1nAs=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr19563343plb.60.1666363130465; Fri, 21
 Oct 2022 07:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
 <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
In-Reply-To: <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 15:38:38 +0100
Message-ID: <CAFEAcA-GSKzEwPnjzBw0tn4G6+uRHRL1dDmvAiiYUb1YVo8T4Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers version
 >= 4.18
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 Oct 2022 at 15:30, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 04/10/2022 =C3=A0 11:32, Daniel P. Berrang=C3=A9 a =C3=A9crit :
> > Various areas of QEMU have a dependency on Linux kernel header
> > definitions. This falls under the scope of our supported platforms
> > matrix, but historically we've not checked for a minimum kernel
> > headers version. This has made it unclear when we can drop support
> > for older kernel headers.
> >
> >    * Alpine 3.14: 5.10
> >    * CentOS 8: 4.18
> >    * CentOS 9: 5.14
> >    * Debian 10: 4.19
> >    * Debian 11: 5.10
> >    * Fedora 35: 5.19
> >    * Fedora 36: 5.19
> >    * OpenSUSE 15.3: 5.3.0
> >    * Ubuntu 20.04: 5.4
> >    * Ubuntu 22.04: 5.15
> >
> > The above ignores the 3rd version digit since distros update their
> > packages periodically and such updates don't generally affect public
> > APIs to the extent that it matters for our build time check.
> >
> > Overall, we can set the baseline to 4.18 currently.
>
> As this change affects entire QEMU build, I'd prefer to have some "Acked-=
by" before merging it via
> linux-user branch.

I still think we should be more conservative about kernel header
requirements than we are for other dependencies.

thanks
-- PMM

