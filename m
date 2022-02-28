Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89604C6EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:08:28 +0100 (CET)
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOghP-0007tA-2L
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:08:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgfN-0005Uj-SF
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:06:21 -0500
Received: from [2607:f8b0:4864:20::1132] (port=46070
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOgfL-0007Mz-E9
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:06:21 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2db569555d6so52845357b3.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 06:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0bM+dWR7tbe704qBIA2/hcp/8N9RqO24XV0/d0I2+M=;
 b=x2Yri2YLAXqzDUX+XPQkB443Nixt0q/9gTdoJTR3wwoxIk9XtVfEtpgU2zNGBYk97y
 XFWnxxtxu9qPMWuD4Uu+lU1LujYIPxJSyDQlpmGVmN+v80qp52Q0gB6ff7M9E5L/GGjL
 lRVL0YYpnIWkg7fRAr8Xvlwt2VzAAoG05xErfIiYiBqmDnsJcxAGhUyv3xioGrN3sujM
 brr+jRjztcbaXR+UVxhCLAe90EtFQAf3+mJBSc2MXY8BLKZIu13jhBNWC2RpL1WgJURc
 f7+RQnOyGpZh5CWq/RIkmYBvm06aOsfuXI7TjAZdN2+Gsuox03PxKlbYeay7mmg2CiNm
 zf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0bM+dWR7tbe704qBIA2/hcp/8N9RqO24XV0/d0I2+M=;
 b=wAv1XBs+hXWUWeQPB7lK+m8wbmvp7GTY3iHBXUcen2di0vQaNXaHiARPvbUxZEYNu/
 V58W6zDeqqTARkXWjVAdrStfAcQxBa0zoRw7yNILybTvGzIUn+Ls8OKI+hQZU58GM3RG
 DgLDoWqG/Z3eSTqnPXZajGdm63grlcrFRUZ8yLIdGapp32nrUiGZmsusuLxdFD7Lzx77
 bWy7JsUcA6lPrhQMNFBE+lnxicYkNOi8j1uH99unV/EEuSXbE+wVirrBpFpObU9g1jcJ
 cZofL9EfyKj3f246EHZYagPtxFyogYtwCex1u4rPRcNYXHG08i2Mb6ygxITIh/zllqr7
 i71Q==
X-Gm-Message-State: AOAM532wZUq3i9FxXYxW2nRTWX6FwddeHqK9oxj1FI/aqbNowbfuquan
 N35uD+3RIR9YnlCSJlg88tlxOpUHCdbOFRXBXX9Bog==
X-Google-Smtp-Source: ABdhPJzxAJYPhUGmC9LiU7ZS9/DAo30586XCmD6KPBA1aiZC6uPtCPwad52udhTmJ6BLn9Udfm5SOxL/eJkipZdf8QA=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr20867149ywf.469.1646057178178; Mon, 28
 Feb 2022 06:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <5277572.8N0aQqchxN@silver>
 <493ea7b6-4e62-5c6e-682b-d5a787ae9299@redhat.com> <1808194.U6vU4amhyU@silver>
In-Reply-To: <1808194.U6vU4amhyU@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 14:06:07 +0000
Message-ID: <CAFEAcA_1-xK9u3jsZ0MyCEsQOsr3Dp0bHRtyXYDj7CDWw4-D8Q@mail.gmail.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 13:58, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> On Montag, 28. Februar 2022 14:36:30 CET Thomas Huth wrote:
> > For lines less than 90 characters, it's just a warning, and I think it's ok
> > in such cases to keep it longer than 80 characters, if the result of
> > breaking it up would look more awkward otherwise.
> >
> >   Thomas
>
> This doesn't look awkward to me:
>
>         error_report_once(
>             "pthread_fchdir_np() is not available on this version of macOS"
>         );

I think that looks pretty strange, though "git grep -A3 -- '($'" does show
other examples of doing it that way. I'd favour leaving it as a single
line, which the style guide allows ("better to have an 85 character line
than one which is awkwardly wrapped").

Personally I would favour just not warning at all about the more-than-80
less-than-90 lines case: it mostly tends to produce discussions like this
one and people preferring to break lines that would be better unbroken.
I know not everybody agrees with that, though.

-- PMM

