Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE62B805F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:26:08 +0100 (CET)
Received: from localhost ([::1]:52702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPLT-00073q-O9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfPKQ-00067J-0z
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:25:02 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfPKO-0002VM-77
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:25:01 -0500
Received: by mail-ed1-x535.google.com with SMTP id ay21so2426863edb.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 07:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IhFF5ADtZrOayWSvyzxTJgRPJ4JgZ+828Vt5/bTdqRU=;
 b=Giy6VA3bFSoqXklsNVFcWluLkdBDVdHrAE68AS82fBmdS46Ug3ihZxoDFRwwV/Yi/O
 g/EMGME/GtVZf3x+pDV/tTVl5yOP3wXvfDMdwkEVXdXiGGGmIlmeHOKZ4VqPNu3cFb0v
 zE88lXUF3Df+ybcGcr2UjesiszxoyQcTzTyrQTblTACy2ZNnCJ7g8MtuoOt8m9soU33L
 yn6Jo0WSSDJ9MLJ5y7wLmP/b1O+01b3mTOAw6fQ2Ky2b3fvI/zqNZcsryCsVC56h6ODg
 o9g6116AfsHi2z2zT6opQc8xb5SCMPDl4mX4WQ0Hk3jRGI8MjqHwcDcDOY4QI11k+iWx
 wmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IhFF5ADtZrOayWSvyzxTJgRPJ4JgZ+828Vt5/bTdqRU=;
 b=E4xJEF3XONPqocOUOw8HZUODh6VEIqQGddVuL3xtXvpH2vk3aGtkCNOBXhlLGYcUvi
 HTW3nHOVd9KBYel83zdDmdbAjU4SdqVHniEG88igN/5yQ7cdER9607cqSaUaNkEJ+y4T
 H449FLQi1/6yKNAt5xXhrFCH6lFp8Yhn8yJ/9+gysyhtk2lK8eqPSpmXPDJ8BVcOGLIO
 ErXc82uVM1N9tLo5RWSsIUHkh7jjVVb4Bt1XTdNCZrM2MHU4rtW6moCdynwz99Fscy8n
 6WKBGnUcBCzHgWTdxB/mrz7I39wrn67M3aQUDkI/w8fyx5eNNINiuOGlPtpCYEhW+EoT
 p+ZQ==
X-Gm-Message-State: AOAM530/hFIbz3En7iZiX4pfG+yRXJwLV5XH6ehvv6bpm9IjaX8N59+c
 +5zLVwe30EglLx77X01Sfyk8yWgoaKGmTHUEdAkcJ6LJnaU=
X-Google-Smtp-Source: ABdhPJxU+eVk7guA01VxLAnvvcvPEBo7XcjqvH4EfxZCN7z/gYEY5oZOmB9+sPbSsB9a6FYj6Dk7Yi2Ck1NIWNZoan8=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr26742569edr.36.1605713098306; 
 Wed, 18 Nov 2020 07:24:58 -0800 (PST)
MIME-Version: 1.0
References: <20201118124911.282735-1-berrange@redhat.com>
In-Reply-To: <20201118124911.282735-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Nov 2020 15:24:46 +0000
Message-ID: <CAFEAcA90VxyAu9bG8zqPY6dXuYX23uypcT7ykDibQC1apZ1=ww@mail.gmail.com>
Subject: Re: [PULL 0/4] Misc fixes patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Nov 2020 at 12:51, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 66a300a107ec286725bdc943601cbd4247b821=
58:
>
>   Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request
>
> for you to fetch changes up to c2aa8a3d7e5ce57fa3df310c9b7ca48fcbf9d4ad:
>
>   authz-simple: Check that 'identity' property is set (2020-11-18 10:51:3=
5 +0=3D
> 000)
>
> ----------------------------------------------------------------
> Misc error reporting and checking fixes to authorization objects
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

