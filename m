Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0C9624C38
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:54:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEZ6-0002Dm-AR; Thu, 10 Nov 2022 15:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEZ3-0002DU-Dn
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:54:21 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1otEZ1-0006sz-Uc
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:54:21 -0500
Received: by mail-yb1-xb34.google.com with SMTP id j2so3767387ybb.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLd1+/iNLUGtpb7x0bmT/EScs9NchMuEGGB+fB4oR6M=;
 b=jXALCjpI86rt0F6uor8+FPykW0pOpHI//uYmUXuummLZ1uqcaR9KhVOoNxOg5NPqbn
 ud33/bkENvfv7ZBrnB1XIiGCZx10wJ/RjPxd6H3b64yJ9bOS0nH3QksTgvIKuxidFv/+
 eQvdAW4yTiCBa6V1Ve0uSrlQSiEcWbWPZNy8LpiDxwi7lODpjLHSZcjelfs8JdiGsq9b
 PteAbCMYdNIoJX5IUwQsrE7jpAKPTmgL5GcOBKHjKCNxpxULDmwYwRtwAmoVcmxpXNf7
 DkPa4E3spdVikViehdBQeBn1L4+OQI5hYqrb/ujUREy+KkBj/8CwWCcuNZP1uZHL3XWe
 jz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLd1+/iNLUGtpb7x0bmT/EScs9NchMuEGGB+fB4oR6M=;
 b=fa0YYA4bIcZ9Lv5fD0PVRpmflDJUwUa7XwFpFO5Ex8/sRZ1QwDKiy28LOM/jd0ZQb3
 zR6gLEzB+PUbszyJgCn5OTEG4Cl+mbraPIFRoPmxYsyTYXstGoyyUUvZb2viLXaC3eYP
 LvffEiFNwOnHgZBDcvDd1eO1dYLRTgbHZscLictFoYe/1LcXrcfN5cLKecMdCXmtvKP4
 bFgJ2P/mWL7x1wPjtpciP92Tdub3dTbzmT2oau11OMBPPq2nfd6/YHpbeDU+kpl8/DO8
 dHbTxckCntouNPeUMsVxNu2USBVCvrQxI+vVo++YVlsy7i6dfCRkRJOneSiwsdQ3OD+o
 rEKw==
X-Gm-Message-State: ACrzQf1Rv7krQ9LPPlIDPwKPE0XxRzKBjY5i/S7NrdDiV8f8m1bqzSuw
 1kKkw6/fab7Dr05m0NUugDr5CDJCX4M8/KsKdRY=
X-Google-Smtp-Source: AMsMyM7Psr2U7M9azFnv1UQ9OtUG8sDEK9FJMwlkJYzKfT9LOtQRSC+65iTK+u2NefTCw+V9Ctky6N+HPbT046wL95A=
X-Received: by 2002:a05:6902:191:b0:6cd:3a43:cda3 with SMTP id
 t17-20020a056902019100b006cd3a43cda3mr52998401ybh.207.1668113658900; Thu, 10
 Nov 2022 12:54:18 -0800 (PST)
MIME-Version: 1.0
References: <20221110200356.3425353-1-alex.bennee@linaro.org>
In-Reply-To: <20221110200356.3425353-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 10 Nov 2022 15:54:07 -0500
Message-ID: <CAJSP0QXQ8RQF+b5u1EkzQWUfsyPW-ToN5vEdVO2=yTOGLG1rAw@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: integrate coverage report
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 10 Nov 2022 at 15:04, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This should hopefully give is nice coverage information about what our
> tests (or at least the subset we are running) have hit. Ideally we
> would want a way to trigger coverage on tests likely to be affected by
> the current commit.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/buildtest.yml | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

