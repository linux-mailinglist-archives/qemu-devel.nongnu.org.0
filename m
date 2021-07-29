Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1DE3DA6B6
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:45:18 +0200 (CEST)
Received: from localhost ([::1]:60980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97Hh-0005Qz-0Q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bhelgaas@google.com>)
 id 1m97GW-0004kA-5E
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:44:04 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:42950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bhelgaas@google.com>)
 id 1m97GU-0003YK-Bq
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:44:03 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id m193so10620398ybf.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wRyEQzFLFMDotHTjeLvL3LK00uXlzRkBCzRp52SlfTQ=;
 b=FbT6rNdHw3+9RSgvAJmrmiYJIiuwPsz0t+tLwRdKOmBrXoCLKTcVTI20tn9iAHdE1W
 v0/9svetAsePebioZ9VXlzBTx6Mf/xWtS9druJJ7/JNQO1aI1EyYgNW/8Kd5QDoxHr2y
 su6VSSyOCDOpBVzttXolJipSMmRiRs6N7SDs9XdvMzg9UckH6yMf9rZZtTcvJEcDA+Y/
 iBfWck0R+6Wppt3xuZjBp66LpCuwD0ieR7RPkKFNeEbuYK+RnVLPXj2wqyDQNlNjwsck
 4/C2xyOdaRpw3b3B+Uc4igZUdeAlCtn6jrjYx/hcRAZvjWvD81f+4P9l8jJLSroJrL9O
 mlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wRyEQzFLFMDotHTjeLvL3LK00uXlzRkBCzRp52SlfTQ=;
 b=oyW4joX5+jkohSZiPkBy76muduhZKMpSObP+PYQmPV/6shG2QsaVSxZMmV77uS9+vp
 Mf4NXQ4xCTtWgUD6KCxisOJTjpuRBV8aR7RJ9JfsDRCARQEWue/eMMhlnRfUwjQfiQeG
 CEJa0+rGv5teOHEwgn2fwD9Y+oSxHf5Z4CVmxqHtbd896wqSpE7PSwAE4O/kl9yxaG4z
 CwwiSv1hma61V09zS0w1FRGvHb5U0KXQUzirCMA4dQtem0/PPQltP+qgg3bhTnkRuWZM
 k448/7I/3AilWMxEEBfkcsn965n7Jib6OfB7S8Gs3OHVg2+chCSiY2Mjcr+XrWvwor2W
 OxPQ==
X-Gm-Message-State: AOAM533/lSrdhOc44a32YQvAKRAi1qyXX1D/dulHor2U0aR5felShCAy
 eHjkuavap5NCsVNvAVcsl0vtK31beOlch1n6xJm5
X-Google-Smtp-Source: ABdhPJw5DCx5C4Ro9Ae7EfNwardry9SxanfgyK7TGZZnIUfAzHeLIMk0Jt4hGB3ymuiTcO+DRkFNfrt3Ab0olVuKPvI=
X-Received: by 2002:a25:244f:: with SMTP id k76mr7641712ybk.523.1627569833781; 
 Thu, 29 Jul 2021 07:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
 <20210728090555-mutt-send-email-mst@kernel.org>
 <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
 <80674caa-817a-8be0-2122-fe543ec08a50@roeck-us.net>
 <5de773d1-48c8-1e56-493d-7c94cca78ee7@redhat.com>
In-Reply-To: <5de773d1-48c8-1e56-493d-7c94cca78ee7@redhat.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Thu, 29 Jul 2021 09:42:52 -0500
Message-ID: <CAErSpo44E0tnbkjbnvVyUY=6+VUHV51aeXAumYrdmeLOPbPGyg@mail.gmail.com>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Ard Biesheuvel <ardb@kernel.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org, 
 Jiahui Cen <cenjiahui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bhelgaas@google.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 3:08 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:

> Michael, if describing the issue in the revert is too complex, could you
> include a link to this thread in the revert description?
> (Message-Id: <20210724185234.GA2265457@roeck-us.net> or
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg826392.html)

Or https://lore.kernel.org/r/20210724185234.GA2265457@roeck-us.net/,
which is a convenient, ad-free, long-term, text-only, tools-friendly
archive maintained by the Linux Foundation.

