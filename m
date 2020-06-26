Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52B20B045
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 13:14:24 +0200 (CEST)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jomJL-0005Dy-Tm
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 07:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jomII-0004JO-SR
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:13:19 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jomIG-0006tv-8I
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:13:18 -0400
Received: by mail-oi1-x244.google.com with SMTP id t25so7730531oij.7
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wigtul9Ti29o0mjmGtdmBb9+pQRDl26caElLmPqhoXU=;
 b=nS34Gs/0cXpTs2/bCUTs9NEuPSAF/YTi3Q0fy5+nvFqRMQWvIbFlATv7DW6XgtcUcJ
 gsXPmvowya22lJj5nlJ/KXHgpXKHlwvk59tWhd/karl1qq3LFccqoAH8IWaq1Lpw/qfj
 2qRlNEBAFGvYJ0/a9CnigtqxiW3vQ+UKfNanVSHB2KaAqP1c0YyX4VkpdVyWqo4PK+ou
 gDyZ7ga/cRb5OWbZL7whw7VfXkpQMtyRisocJGnlnXcjztinvFceJD450Qemuoxt60lt
 wsSoMqtXT7h6MglMKkjSCfWfuYH8YzV1VOgz4zbW//R1uMLsl5ES3CUy2XW/C3OWrC84
 kbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wigtul9Ti29o0mjmGtdmBb9+pQRDl26caElLmPqhoXU=;
 b=KokcGmSuiA3E+S2b9wDwznrkHgsZBjDgUHkMaOMQkP0VKXi7Adosrohaae88kHGGnY
 Yg1NsLQbQBlny8frX2Y3DVkOIJHHpUgWrm3uMdLA0LdEGlkYpOxsSfedfw9mrXflz3DF
 TaofQjfEXbSvQRl+8ThbdBoifZikSrND1V/M8vqXsyJC9vTC5/N9SMnpWirYZ0tABUGm
 i4gkrTORjObOnIrNwDX60dQSIPcdksmAif2NhjrQ/rhPQuuzVM88d/0/K67l74ZZlLQC
 /lz51B1NbLnzLJh4BwRo/wbWp+XvLQ9NRNIJeoGE2kv56YRICsVddnABNnSDU1gXinH1
 aIBA==
X-Gm-Message-State: AOAM531I9gh7cdRyKCZIaojIaXml6k1fIacMSJ+7PdMoMlKkpX5YMjT0
 BO1u/xmB36k1ZN5xnHS0aG+5PxauQ8XJvC+oIlWLyw==
X-Google-Smtp-Source: ABdhPJwDSjPuPlqHY2LVVzArobqiLXxLoEsKtY5wKW6ZLmlIOJaaizMytKFOlJm+/w7KSZjQTjqp6Sq+4AHitVjH8Bc=
X-Received: by 2002:a54:4694:: with SMTP id k20mr1889644oic.146.1593169994418; 
 Fri, 26 Jun 2020 04:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqwft10MnY5nOc7L+q59kOY3BAejjrOS09R5QD2H7AH-Cg@mail.gmail.com>
In-Reply-To: <CA+XhMqwft10MnY5nOc7L+q59kOY3BAejjrOS09R5QD2H7AH-Cg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 12:13:03 +0100
Message-ID: <CAFEAcA-0PED-8PH8Sr+i9NiXx67KNuB+0bYryJ7yeZwQvxKjkQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] haiku build fix
To: David CARLIER <devnexen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Jun 2020 at 11:10, David CARLIER <devnexen@gmail.com> wrote:
>
> From 68d4d4312eccd212b4d2484e09425816ebd2346a Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Fri, 26 Jun 2020 11:01:54 +0000
> Subject: [PATCH 5/5] Last chunk of build fix
>
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  include/qemu/bswap.h | 2 ++
>  util/Makefile.objs   | 2 +-
>  util/compatfd.c      | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)

These changes are all good, but they're all fixing different
things, so they should be separate patches (with commit
messages describing what they're doing/why).

thanks
-- PMM

