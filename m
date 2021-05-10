Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D034377FD3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:50:20 +0200 (CEST)
Received: from localhost ([::1]:59314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2YN-0006rT-M1
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg2Xd-0006D6-GO
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:49:33 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lg2Xb-0001iR-W2
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:49:33 -0400
Received: by mail-pg1-x52a.google.com with SMTP id m124so12867358pgm.13
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=q3G3aoYnbxCs7tQkpukZBzKgHqhNC7UWQnoTfI9zEfI=;
 b=qvFFtbv3RYM+fSHlQ5yEideQvEaOwVZsCVE43Yli1hESU55GbtvlSrg+iA0LQaI0CD
 DQu3wjByJ2BVSb9RAasOm4jS2STC3HghCZGJiYyIQzq4aifVpKWUlZJxEQrRZdFWIDEW
 rOgbNYmsRKMOrZltKotuZsrWJ59vAgu+OAZRfoO94xRsdK965qZb2GZmyu20FJfI9sWB
 D66nPmHaoNOqtAw3/ClZzM5MPPSZmcVBJPbSydDTa2D2b6BCX6TbnuaIayhWSiJC0Gxp
 oqVRFqL1UdP5KXhxpwVRafxCVLip5tAGH/tgRNM8acqEfyEUydYhtZXqx/zIKRUNLONr
 Z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=q3G3aoYnbxCs7tQkpukZBzKgHqhNC7UWQnoTfI9zEfI=;
 b=MONoZq2cAU4PqvzEyYYVTkTHkqMi/4uY2hknL+igfiGO4Fq+6wFiDzomEgWz/sgN38
 90y3Tlvdhxd9YIqgqwuVgWqZtMm4p6vZ45fcYmuU+n++pLuxXMrNXm7mOKqrgBlSB2DP
 8/ML4SfFD3dhiMqG4W5O6Lu/mOPJ5rFwHw+DwEbtmXH4QQB2CiJVzsMMeNn1QQi7uAU0
 /PN3f2fh2F5my2gdKG0VXk/2hY4EQe5JftNknYOCJcv/s19Z9bExq9aRNTiVQevLNCKW
 9wQftvm6Y6FYkXLV1/DLc72hE97GV9vWlJU6AaktbuS+sHV6aTIfJcn445XtgWIK3+BT
 DK7g==
X-Gm-Message-State: AOAM530f+70pXSy2W/1HreW4Lvf0kBjxhYCjrwpqzk3xnV89hUOP9jPs
 jA08PVeIF2u4hysXrjmezVWCm/8dgQ8h1vgeR61292+jMGs2Tg==
X-Google-Smtp-Source: ABdhPJzPE3IEiWTbOEcfGuQFhYuFzSlgrqIDAcBa8BtKXrBASmM7/xMVoFcK3Iu8Jngw6SsolaruDIJCiq0yyVkGJZ0=
X-Received: by 2002:aa7:8104:0:b029:2c5:3039:b62f with SMTP id
 b4-20020aa781040000b02902c53039b62fmr1216685pfi.27.1620640170060; Mon, 10 May
 2021 02:49:30 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 10 May 2021 10:49:19 +0100
Message-ID: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
Subject: qemu.org server bandwidth report (May 2021)
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 danpb@redhat.com, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
A few months ago qemu.org hit network bandwidth limits and incurred
costs for exceeding them. Since then we have implemented several
changes to make continuous integration systems more
bandwidth-efficient and reduce the biggest sources of traffic to
qemu.org.

During the Mar-Apr billing cycle qemu.org still exceeded its network
bandwidth limit but only by a small amount. Bandwidth consumption
needs to be under ~6-7 TB/month. Below are the details of how we're
doing.

Thank you to Paolo Bonzini, Thomas Huth, Philippe Mathieu-Daud=C3=A9,
Daniel Berrang=C3=A9, and everyone who helped with bandwidth reduction. The
main change was a move to GitLab.com, which now serves the main QEMU
git repository URLs. We also updated documentation and links to
encourage people to use these new URLs.

qemu.org bandwidth usage has been as follows:
- Jan: 12.56 TB
- Feb: 10.55 TB
- Mar: 10.28 TB
- Apr: 7.62 TB

In May qemu.org has averaged 232.25 GB/day so far putting it on track
for 7 TB total this month.

The top 3 web traffic users are Google Cloud and Amazon Web Services
IP addresses. This suggests that some continuous integration systems
are still accessing qemu.org git repositories. It is unlikely that
these are crawlers because User-Agent web stats show that crawlers
only consume a few GB whereas the top three hosts consume 10s or 100s
of GB each.

Roughly 75% of traffic is git (https), 25% is tarball downloads, and
the rest is wiki/web/miscellaneous traffic. Fun fact:
qemu-4.2.0.tar.xz is the most popular download!

I will send another update in 2 months so we can see where bandwidth
usage finally settled. At that point we can decide whether more steps
are necessary.

Thanks,
Stefan

