Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D72B68C9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:33:51 +0100 (CET)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2zN-0002tN-Kt
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kf2xE-0002Bn-D2
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:31:36 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:40116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kf2x8-0004PV-7W
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:31:36 -0500
Received: by mail-il1-f195.google.com with SMTP id n5so18937152ile.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hnm7eMlyrwjqz/UyRnIinFSufVvAdIL/bmQgUIpKCjA=;
 b=N8tWjbGYyTqWBgSK47b4BppIs04CjpeMdg41Dc1vrpd6R29wrfrPkcC/mRX/o8jOfx
 eSrh79Djq+XRWyfIaq++fnIQiMgrZvxu4WgpPlvxSz1lmu/+P4paCxc0KJenS7xCRdmT
 SPsXI0DVP8xjfPDKkCE/MTyXw9oEjnh1w0+B4jVq9ssuSvVacXnMgGCv7HF9ZnaLgE31
 mNJhNwZYjqVi4O3KjzbrOImlpJdLfBS/iKSfDSYQQn37DryE90cr97N7iagD0yx12Rjg
 M+6Z8E+DvM72wH9SApiTBIqD/dOUmTGMuxVlEVTMl1EOBy4w1QaPFXZKGBCEy8dCDfDG
 2ogQ==
X-Gm-Message-State: AOAM530VgHWca+Z5HRackZie6QTAyPnorojqiJmcYeBlU9ghwaaPsjjv
 +xrSwiAqZItgnpAhLnTglDAVYoPT+VI=
X-Google-Smtp-Source: ABdhPJz0eOQmJf8zXnMW9dlF9rvv2hjhApqNfwmI9HT5PydTXHWM/WEkuQQS2g59Lytjvzxy+SVv2A==
X-Received: by 2002:a92:d911:: with SMTP id s17mr12808259iln.260.1605627088962; 
 Tue, 17 Nov 2020 07:31:28 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id z1sm2131208iln.6.2020.11.17.07.31.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 07:31:28 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id s10so21585816ioe.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:31:28 -0800 (PST)
X-Received: by 2002:a02:cbde:: with SMTP id u30mr4242207jaq.69.1605627088536; 
 Tue, 17 Nov 2020 07:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20201106032921.600200-1-richard.henderson@linaro.org>
 <CA+E+eSAOL+Gx=8X54HTFup5Qash7erpuCSY3_t2gynr1X27tXg@mail.gmail.com>
 <8b0e2ecd-0a2d-de71-2fa6-6e47758d4db6@linaro.org>
In-Reply-To: <8b0e2ecd-0a2d-de71-2fa6-6e47758d4db6@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 17 Nov 2020 09:31:17 -0600
X-Gmail-Original-Message-ID: <CA+E+eSB6xuwWDvfzbwY1D6mxXg78ouhNyvHgzeaUDwgBhvyjQA@mail.gmail.com>
Message-ID: <CA+E+eSB6xuwWDvfzbwY1D6mxXg78ouhNyvHgzeaUDwgBhvyjQA@mail.gmail.com>
Subject: Re: [PATCH v3 00/41] Mirror map JIT memory for TCG
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.195; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f195.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 10:31:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, are you asking for a review from me? I don=E2=80=99t know if I=E2=80=
=99m
qualified to review the other patches but I did review the iOS patch.

-j

On Tue, Nov 17, 2020 at 9:20 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/16/20 7:47 PM, Joelle van Dyne wrote:
> > Hi, I'm wondering what the progress is for this patch set and the iOS
> > support one? I know 5.2 is frozen, so will this be considered for 6.0?
> > Apple Silicon Macs are out now and a few people are asking about QEMU
> > support :)
>
> Yes, this will be considered for 6.0.
>
> It does need to be reviewed more completely than a "LGTM", but there's ti=
me for
> that.
>
>
> r~

