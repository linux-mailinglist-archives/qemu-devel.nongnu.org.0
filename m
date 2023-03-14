Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E966B9F82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 20:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcADD-0000Wt-De; Tue, 14 Mar 2023 15:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcADA-0000WZ-JQ
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcAD8-0003Wf-O9
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 15:21:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 fy10-20020a17090b020a00b0023b4bcf0727so8757273pjb.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678821684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGTWkWgya236mexBQ6aWQASE1rii/2eGfUvSA23B678=;
 b=iJw5i0WvvbpdjXkCOR219bI1G3P1aC2BJ4ggwC96jM/13VFcUtWs3RpbHSdqSbNiJk
 Tdo3lBMS1rN9fwX6C5FAeskCxzsc0xXtgd92OGHrBZqCeKygnJXnktDhu5ponh6XGx1+
 LUfkC89PlOdTPICIFGom2ECsXQXXuCTJ3jBXskOleUvJ6EXVbSY472DpZVIXGiwQ1vpF
 SgQhnTE4y6jU0Ip+OSiFgRyEbBoVSRDv63n986wPu02PWoW9UFlGFXbM3X8kL1IcyBjH
 inXUk95EeAfcQ4i10gH/Tnq6vDYaKJmDe/9Y8wGCf1L4e+pya6AVRBowVzfOuKR1TW61
 fiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678821684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGTWkWgya236mexBQ6aWQASE1rii/2eGfUvSA23B678=;
 b=PkZ0uiNzwtGIX/tx7kcN748kfMBTJkW01dqowIOmTl0kS5RoNDu29/xd5JyTjN9IXz
 hU8v0D8bxhZ4p2wVGYG1R+/lQDuIh3ppOBbhNXRS2BCEN4gp/fmEWMLNH0TMX6hBaZvj
 up5gUSyGWjbZRT0SPIKlTWFAwcpZahsQzmMj7d7XuK3UmYJWRlmEBx0kPSjspfsTNUTe
 S1e/EIGFd7AFhFUcwHjnsb75CvbYwJl0rULIK3N9RxZ8AkoHsQRFXinzxii6UaH4kzs2
 GgFhObcN2M6ifmwVKV5pP2uLWfs9sYrml3MUgisrizViKldApRW4u6MgCRtSJjXMJ2Cj
 g8gw==
X-Gm-Message-State: AO0yUKVKQdIXZ1X1kt5y4j2EtbpNeMzvlDzuCh8tF+8CNS9qFqg0icm6
 LVorI/7JictPEim/TsI5YfejMJ+APdsbumrNe3UuLw==
X-Google-Smtp-Source: AK7set88tDw8A/gd0rEtCRCfgdck/Fpe4cIdRBIODKWtB70JpVr7FEBe1ycGkKDQmhwA1KJJH0fvY5TsZu5Gtih9lJ8=
X-Received: by 2002:a17:902:db07:b0:19f:87b5:186d with SMTP id
 m7-20020a170902db0700b0019f87b5186dmr70138plx.9.1678821684610; Tue, 14 Mar
 2023 12:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230313200134.503083-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230313200134.503083-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 19:21:13 +0000
Message-ID: <CAFEAcA-SRZRRd4M-MzxJhAzpHXWmxgv+icE8O7xbii5Qnyf=jA@mail.gmail.com>
Subject: Re: [PULL v2 00/18] Display patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 20:02, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 284c52eec2d0a1b9c47f06c3eee46762c5fc09=
15:
>
>   Merge tag 'win-socket-pull-request' of https://gitlab.com/marcandre.lur=
eau/qemu into staging (2023-03-13 13:44:17 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/display-pull-request
>
> for you to fetch changes up to 4814d3cbf9f921b6f60a384b4aa3fc3151fdd3a7:
>
>   ui/dbus: restrict opengl to gbm-enabled config (2023-03-13 23:48:45 +04=
00)
>
> ----------------------------------------------------------------
> ui: dbus & misc fixes
>
> v2:
> - fix crash spotted by avocado VNC test
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

