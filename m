Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE664DC5D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:39:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5oRm-00026C-Hz; Thu, 15 Dec 2022 08:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5oRk-00023q-KJ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:38:48 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5oRi-0006gG-Sf
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:38:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id s7so6888157plk.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WJ6+zyvTzvPMG3Jrh6tPjakKTNrjJPMo2/AWiqQtMx8=;
 b=paKyUoGNDzV4rcaUZOcCrhKTqrt4eD+uEJmUVvqNKnTwuLZeQKm5d85E+8JWtt3qon
 axpu792cifLefTkJKzvM9a/qAbiXZ3/MtlZ1lsapSYk234G2fn/ief8j3y0NV/9HANz2
 0oYLf6YokP7fckHGRWBo+0xdszekZBPOSwsUUnYhj5CyeuzfEl3n75quaqmcdBLmaZI7
 QtaKejKd1CdbOHk779KtzNSzTMK/z42TR9ZR+yllvRttPWfzMTcxU9va10X5/Ma0mzSv
 LirTUXDf7NQk/rBztc8DydVwZHOs5z9RdbH6fAOJmNB/+FS6X8jOfHTmK+kewTXqstni
 cK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WJ6+zyvTzvPMG3Jrh6tPjakKTNrjJPMo2/AWiqQtMx8=;
 b=4RC/R0rTkQ2gTHLjPtCu8AUmikyl6+Cm4YQfj7OLjsZTAxOm+nxwqKl3loaSYhXw/B
 TgXG/TS2oKh+AReZBhRQIrtKHULHIlcrcjBJD+5RXfTPsovTEsPW4NFmrCiLKYNmcdkH
 fqGyoWujfVp3mQDO8FQ+LsM7JijVdBEmfCwqgiVDkD751PqJkCPXGu4Z/i3JKK9tKC4H
 7pYBfgX2y0257934gMbWNt723sZnjUWwPB1zt/95636OHKO9Zv1dQ/dfmHnCBBCuJe6a
 VP2u1vhA7NnDqGNcMCZyyxEbEfKnOsL+67NKrk4ccbfx05nAhZ/nDsQNp4LLamYLs66u
 KX+g==
X-Gm-Message-State: ANoB5pmHiHaCdWsHMYgSnkUBMLh6VfntNKBqtYKbhnUqeF7CKOuUEd92
 ZU3BxBsiVBh+6wQUCDwNdyDPLZy0C8BOrQSJcEoQZQ==
X-Google-Smtp-Source: AA0mqf4VEr+9521NsKCQdEJf0DnrR+5k4vrX8gQ3JTvw94Rj25/a/BOfYyHAaEcp/M3OBBO5E/sJRBfp242ijNRPNPE=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr49638678plc.19.1671111524753; Thu, 15
 Dec 2022 05:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20221214100911.165291-1-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 13:38:33 +0000
Message-ID: <CAFEAcA8fCmsQO6vRbmOysq2rKEt60iaxN_pVBdyus7Mf3Q9=fA@mail.gmail.com>
Subject: Re: [PULL 00/23] First batch of s390x, qtest,
 CI and misc patches for 8.0
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

On Wed, 14 Dec 2022 at 10:16, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>
>   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2022-12-14
>
> for you to fetch changes up to 8eeb98e2ea03639e743fdae82ae69d571d8ef0a3:
>
>   tests/qtest/vhost-user-blk-test: don't abort all qtests on missing envar (2022-12-14 08:55:37 +0100)
>
> ----------------------------------------------------------------
> * s390x PCI fixes and improvements (for the ISM device)
> * Fix emulated MVCP and MVCS s390x instructions
> * Clean-ups for the e1000e qtest
> * Enable qtests on Windows
> * Update FreeBSD CI to version 12.4
> * Check --disable-tcg for ppc64 in the CI
> * Improve scripts/make-releases a little bit
> * Many other misc small clean-ups and fixes here and there

Hi; this fails to compile:

../../util/qemu-config.c: In function 'objprop_to_cmdline_prop':
../../util/qemu-config.c:165:13: error: 'CommandLineParameterInfo' has
no member named 'has_help'
  165 |         info->has_help = true;
      |             ^~
../../util/qemu-config.c: In function 'query_all_machine_properties':
../../util/qemu-config.c:217:9: error: 'CommandLineParameterInfo' has
no member named 'has_help'
  217 |     info->has_help = true;
      |         ^~

I'm afraid your pullreq has crossed in the mail with Markus'
QAPI one, which refactored things so these QAPI structs
no longer have has_* fields.

thanks
-- PMM

