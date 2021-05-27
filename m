Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263F3932FB
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:58:49 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIPI-0005Lo-Hv
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmINT-0003za-OF
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:56:55 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmINS-0005la-BQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:56:55 -0400
Received: by mail-oi1-f171.google.com with SMTP id u11so1241966oiv.1
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xiB6Mk4osmIJ7XcIlpz8TmehbJo+nnHudRcLc9v1RZQ=;
 b=BrTbZly7UxXPHb7sT6f7xdYSWOW0oUILx98A+WqeGuNHYWXYNkVUXT+C1LAH+PLEQS
 Ob1CiWjKMlnFBq0zDyPIU5VRJtKcKan62GorBy/mENUq3zPElkB1DQB1qX/zEA2TEzJX
 eYfIXBfA5BSBxqS34rB0pZ3Og8P3NvRsD8a3KmidZjEc2W3T8DiuaxBDaLgj4Ato8gXo
 g7/kQQpSWEpGIJuWE8v+xxEHb/3ZovSRpvZNeD+Pb7/O7fpUOY1/0aL8fjIgodyNj4IH
 930sCGaKdyzsbEiIob/E5uD6mE+omgDNe22tlAgld9hkacsRTCIUjFsvat4sReCXmNvJ
 4zUA==
X-Gm-Message-State: AOAM532zNx/cgM+iixTFNMhrvTVdxglKYSfVjTjIGC92FYKOYew5WqI6
 38kwyoxpv+KLtDVX47kbtAxiaOGqSWbMfNks0hs=
X-Google-Smtp-Source: ABdhPJw6g6EEDfT3c+K6Dadge2TaJTyoEF2FFSTvY2hY31MxWI9rsjmRr1roEI0ivdcSiWQAwm/p9Wt2+YwPoyRtkt0=
X-Received: by 2002:aca:c454:: with SMTP id u81mr6014487oif.46.1622131013134; 
 Thu, 27 May 2021 08:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-57-richard.henderson@linaro.org>
In-Reply-To: <20210311143958.562625-57-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 27 May 2021 17:56:41 +0200
Message-ID: <CAAdtpL5FC3S=Op=UCtJcLDiG8x0K4M4Hd+-u7Z6d7K2dJa7GWg@mail.gmail.com>
Subject: Re: [PATCH v5 56/57] gitlab: Rename ACCEL_CONFIGURE_OPTS to
 EXTRA_CONFIGURE_OPTS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.167.171;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 3:43 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Thanks, patch applied to gitlab-ci-next.

