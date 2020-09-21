Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65A827322E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 20:48:09 +0200 (CEST)
Received: from localhost ([::1]:52154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKQrA-0006vp-8Y
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 14:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKQpI-00067L-3x
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 14:46:12 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kKQpG-0008PV-Ck
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 14:46:11 -0400
Received: by mail-wr1-x443.google.com with SMTP id z1so13908026wrt.3
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Ctj99KKGcAHUJ5tqFkT4LNry8D1lWZNm/cf+Xp7kG1o=;
 b=RGvgbP6gjyFWO5PfD8SDkVeM9sbEAF29tPn7SP7AEULYBixsAWS8zQaNY5ksUIdMdt
 7NCxwuT1gO5k2RS5zF8Eh+Jz2Gz6PvkdtESZcWRrn9lI5+G3wP8TDDxitczmGYY/eO00
 xCc+5ZTaUV7aw7e4wd+JQRStXbrwSK4hGJamqUoMJvz/YITwlGizDGBz7eBJ321scDrP
 suG3C/ZRMvZLuxEdlVbSmBM9zAzxnnzT5+Gl3dCIyY6/9aKa7D2D6N+mb1u95oBMnxv3
 W7JXe5MLJL92H+3BJOVZdCJ2l8KAnI+cf1sxTjhTyWn7Cd5l0U0qmXZBuvfqjcax8UwU
 ubpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Ctj99KKGcAHUJ5tqFkT4LNry8D1lWZNm/cf+Xp7kG1o=;
 b=LFshW+S29OSo72goHHjbQU6fg71+KiQ0D8mmmpbrwjC10Lq02EMYKquzFsVBcZIxNI
 cC2vatFLvhtqW62UPUI/hsxrfMlHtUibdGGGPebKk+gq3cWkWyyuw/EIr/p95hPutpXu
 eAGDXftj3aIK0Y7igi+kURvMTmQMkLtM0g4wP8mPc1UQHjG/hF4d/L4wApfvtmnJMSLy
 XskC644v2t4jKFHosGV3F2NAA+KOY9ErdTteClSGkqRA+R8qStQApiUNkCEn6QTCU0ye
 4CAt50BgiDmmMynkko7mR78Wbwg8KOwYDQKz+yDUITA8VFQM6C4w/a42PucsxAxQrOzy
 CDng==
X-Gm-Message-State: AOAM533ydLoW6c0/EXFb4e3MAilkj/Ngbpc2V2ePEThDQUEtY0pL9c61
 /exzCpGNr6tJ8tA2eQolF8R1H6NeQIYtJg==
X-Google-Smtp-Source: ABdhPJyKdt+/lQZxgGTpyi3GihJNwWCBFO0Qxfk1PI6HO+mha7K2s3ISvxZlaIikbj2uR1ISqAv15Q==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr1255546wrf.77.1600713967958; 
 Mon, 21 Sep 2020 11:46:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z14sm22555186wrs.76.2020.09.21.11.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:46:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 24F9A1FF7E;
 Mon, 21 Sep 2020 19:46:06 +0100 (BST)
References: <20200918103430.297167-1-thuth@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/6] Update Travis from Xenial to Bionic and Focal
In-reply-to: <20200918103430.297167-1-thuth@redhat.com>
Date: Mon, 21 Sep 2020 19:46:06 +0100
Message-ID: <87o8lznf2p.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> According to our support policy, we do not support Xenial anymore.
> Time to switch the Travis jobs to Focal or Bionic instead now.

Queued to testing/next, thanks.

>
> Paolo Bonzini (2):
>   meson: move libudev test
>   meson: move libmpathpersist test
>
> Thomas Huth (4):
>   migration: Silence compiler warning in global_state_store_running()
>   travis.yml: Drop the default softmmu builds
>   travis.yml: Update Travis to use Bionic and Focal instead of Xenial
>   travis.yml: Drop the superfluous Python 3.6 build
>
>  .travis.yml              | 46 ++++++--------------
>  configure                | 91 ++--------------------------------------
>  meson.build              | 85 +++++++++++++++++++++++++++++++++----
>  meson_options.txt        |  2 +
>  migration/global_state.c |  4 +-
>  5 files changed, 97 insertions(+), 131 deletions(-)


--=20
Alex Benn=C3=A9e

