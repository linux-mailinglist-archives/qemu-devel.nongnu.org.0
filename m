Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5039331C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:02:12 +0200 (CEST)
Received: from localhost ([::1]:46976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmISZ-00084f-Fa
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmIOO-0004ay-MX
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:57:53 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:43804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmION-0006BP-90
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:57:52 -0400
Received: by mail-ot1-f49.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso637592otu.10
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mk5Rg1vE+E3XE1nFcVXD/yT3SnwhNNr3LUd2hVynvms=;
 b=dvT2VAlP8k2XGKGJmKoZHOWikr2WjM+bp++xMkzCXs7ntwQQsgbhYHSVmJuRGrEXJB
 0vEYwms+05o5CNpEhFVr+F16KpjI8IPWXurCuTTHlI2jfFnNzel0XdDX53y+ZLgiznd7
 O67101Acu8Pw/S+HGX6CYjuEbGGBOxgN0Bee0lI+LWNiMeQBycwI80Hp1APVLZ8HnrJS
 4gcsrktIWz/yD8GVJYruqhVH+CIjdy1wVcie3RU1zlHQQu0bF29HrLIb4V73tKcTox5Q
 LBBShYmol8T7tAtAISFQQc/dRpRl1bm/kJAF2Z5kV5IJ3qaghmM9y04D/tLPT5zqWK8x
 fc0Q==
X-Gm-Message-State: AOAM531eGXviQYAbyuLFC7rL2o2ojwNtp24NhSz2uXYYMHtID4GAySqD
 2wGogBilH3dC9uWdM4y3LAMS94kY/Rv/TiG4u9c=
X-Google-Smtp-Source: ABdhPJxgYh0U66TZVIMEv8B4sYPJV1p5CWVKn0/ko5bh0C+qZL5AJ85etO1jj4GPn5uhMYPnlqRXtxRPvESUzBATsvg=
X-Received: by 2002:a9d:7e99:: with SMTP id m25mr3336399otp.37.1622131070059; 
 Thu, 27 May 2021 08:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-58-richard.henderson@linaro.org>
In-Reply-To: <20210311143958.562625-58-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 27 May 2021 17:57:39 +0200
Message-ID: <CAAdtpL4ZRjRmg9oL2BpC13Ss1x2HMVJDd_Gtf4CXKD7EKS-MGQ@mail.gmail.com>
Subject: Re: [PATCH v5 57/57] gitlab: Enable cross-i386 builds of TCI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.49;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
> We're currently only testing TCI with a 64-bit host -- also test
> with a 32-bit host.  Enable a selection of softmmu and user-only
> targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.
>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml                      | 11 ++++++++++-
>  tests/docker/dockerfiles/fedora-i386-cross.docker |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)

Thanks, patch applied to gitlab-ci-next.

