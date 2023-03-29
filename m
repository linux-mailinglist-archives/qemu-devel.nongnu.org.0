Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8988B6CD791
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 12:22:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phSwn-0003eW-0m; Wed, 29 Mar 2023 06:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phSwl-0003eN-Ek
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:22:27 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phSwj-0002jQ-PN
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 06:22:27 -0400
Received: by mail-ed1-x529.google.com with SMTP id y4so61181380edo.2
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 03:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680085343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nQyf1Wv+zQHEl6QATdZ8BU3ZOuR/SnIBoqc73/PGIvo=;
 b=HTB6UBxw17UTmkMKpC6GbdJkP6Tr8f8T/my0wSrV1tefHc0tT0UT/yLxh/pWSX0itW
 L/1jG0D76tQp1QLyoEYLG6gythb7CZ7f2ykQ7AtHrvWngd71o1Qgxtiy81CYuMjhn7/s
 bJv80Dkv12/HESnrlUhWMdERwWKsk27dnViYMV9CFoMWTUJAUUNTbs+r86JHWmvIvbgi
 AVJrFMHGdfbEBzsAeKRppYfBM5+ljd8JUGe7CcIgF/KMoQ6kbA/aqc35/okT5KOYzPvW
 nroA7bhRh2aGRlCdhFlhxQ6ToGaJXiSDkvi3x6t7/InS+akq4cMTROOahb/vQ+ObFdX1
 V2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680085343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQyf1Wv+zQHEl6QATdZ8BU3ZOuR/SnIBoqc73/PGIvo=;
 b=tTQPaiEUnk2LkPJ8upnP5oRjQwQWe3TZGZibizNV85hU/wmbgfjrl+7IvpNc9Nz84o
 u7uv5CvJ2bKtX8DGbs2GjYFbnv74iqaj5lWSHyzvSjpygN2ESrhYde62SQWNFueaToCc
 nkGGfAHFwtkog92WksJk0AizxMhFb3JCqdPibeVQ9mcBfy5pSg8XtOjmrqj+Rs1gFgBJ
 +Xc7xrAvfTb59rvKxN6UseAszCFxCNglD1EUcV/ialE9rIsaVsFJbz9Neug69Kg7FlEx
 6ZrOvcL1l1f6RLmr7kMmkm6GlnB0FwMeVbLko7E+WBeqrmB3d2nw4YNVywkYYDuqiuJG
 6How==
X-Gm-Message-State: AAQBX9dlaYwmuJptGySMyk5iYSRPUgRqwI+2hWoc8bCpU+Ez3Xzh67so
 Ewg+OO/lQvjT3Ah7MYX8FNAptTDflxiHAAtYJhFhxw==
X-Google-Smtp-Source: AKy350Y08ADi+iQJTzrhAHqRS9V/tgcG9/CrSMxnaId08Q2A1QQU57GybgAqT+bFhoUu5b3ZITp+wkP9jD8NygGyPIg=
X-Received: by 2002:a17:907:6b8e:b0:8d7:edbc:a7b6 with SMTP id
 rg14-20020a1709076b8e00b008d7edbca7b6mr1201440ejc.2.1680085343711; Wed, 29
 Mar 2023 03:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
 <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
 <ZCPxrZT+JlBNL/b6@redhat.com>
 <93c25ac1-7af7-1d3f-1d91-498f341a57d5@redhat.com>
In-Reply-To: <93c25ac1-7af7-1d3f-1d91-498f341a57d5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 29 Mar 2023 11:22:13 +0100
Message-ID: <CAFEAcA_uR4LVtMDwvK4qDeH01mKfbXr7zyH7ghrTZfVf_1ZykQ@mail.gmail.com>
Subject: Re: egl compile error on msys CI runners
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 29 Mar 2023 at 09:20, Thomas Huth <thuth@redhat.com> wrote:
> I'm not a fan of 'allow-failure: true' - that basically means nobody will
> look at the failing jobs, so we could rather disable the jobs by default
> instead (and just run them manually when you want to have a look at them).

Mmm; in fact I think we could probably look at upgrading some of
our current 'allow_failure: true' jobs to normal ones -- the
cirrus bsd and macos ones seem to pass pretty reliably these days.

thanks
-- PMM

