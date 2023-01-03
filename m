Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAC65C794
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 20:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCn1j-0006W8-Rd; Tue, 03 Jan 2023 14:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCn1B-0006Up-10
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:32:14 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCn19-0001aF-6k
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 14:32:12 -0500
Received: by mail-yb1-xb29.google.com with SMTP id 186so34224427ybe.8
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 11:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kQStHX7rcdx4lx6+NVisd3Gz9CSqUYm8YctEW8h1GS8=;
 b=e9XgEJX4UMbO13yXaezNjhcup1rhkbZrctTgH1N2vpf+ad/afnkpb+0ezyS3OQc+Fi
 xK97xtgwjtV/7ZT8O+ekCf9J6Jf8I0PNu/Jy3EzT0tMmBK8uG54i2711X0/Uv+8yvg1v
 cQDSNwzsH4679XPC34BL9HdoH8SGk7gFPXt9WxcDp2lsWBvbtyQ6c7B4NKrahVMEfrbx
 KNIcPQc+1EnnaOGji6TYxlXR7AxY4t4KmaEuSlfoimWS43T38JUyrUqvnLIu+fz/6WGA
 oaILwbIztl/HfZ7hU3Kw2qwx+2pHIAFz55YMBbfaUOdGlUhtnjCryiE5TPipjXBAZ4lc
 ZEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kQStHX7rcdx4lx6+NVisd3Gz9CSqUYm8YctEW8h1GS8=;
 b=L8ClNEDIxegbHR6AmbP70Bl2bXd9H7B2lvb37xVLfOJd/Y2Z1STQaEHTSlL1pS4Zaz
 HRLKggxSHc6cTQjj/Y02wnIQMksB6JLOONWWXBqxDIa18226nlRLEvP44GtoYI6HOV8U
 4waYT4tV21abiVTuUOj6qLM8EAr4AG7hDwK8BGTYcnNBNpqPb8Z5/hIkw9zqCGchOIge
 tf45qMTbO7gsXJVNuClmss+JQT2lHSGoY8jG/M5eNwuKYwoSwIh3AsapwEhChVwbShxM
 6EAnyWM2/jH8QgDFaiJ730KyRtY66cigQ3aIi6SqLubPixcgB9JaRU6+wjWZTdSi0JZ4
 EuEA==
X-Gm-Message-State: AFqh2koSqyOsV2+zmdNRJr79nQkF5z1WaoYp0AGd5dMCsaLgDx0FHMLd
 qYthQwiXWG8rgGmK34tp7egT0RefvKDAFPcC5gY=
X-Google-Smtp-Source: AMrXdXs8izBMqcCUriHjZPN8jPkGeUZlthM/c2nM6yz65q7FXMyN33o5l+O7Tv63U/IQP0rH6yVRvBsXhJRje2sWXzk=
X-Received: by 2002:a25:bec3:0:b0:6ee:f3dc:b8d0 with SMTP id
 k3-20020a25bec3000000b006eef3dcb8d0mr5132049ybm.642.1672774329985; Tue, 03
 Jan 2023 11:32:09 -0800 (PST)
MIME-Version: 1.0
References: <20230102104113.3438895-1-ale@rev.ng>
 <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
 <20230103162603.74f631aa@orange>
 <CAJSP0QUd9Q25pT3OXst4V-1FKLo65jJnn-6-7d_O5hkPeJfPyw@mail.gmail.com>
 <20230103171149.3bcf0526@orange>
 <CAFEAcA8XY0Ks1mxMasZ9U4m-CNPsuLFU+9ercmb10kscP3iYSw@mail.gmail.com>
In-Reply-To: <CAFEAcA8XY0Ks1mxMasZ9U4m-CNPsuLFU+9ercmb10kscP3iYSw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 3 Jan 2023 14:31:57 -0500
Message-ID: <CAJSP0QUWxTbpyfuQhKQ33BKHKOWTTMrCo5QASSqjag9wz9a=gA@mail.gmail.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alessandro Di Federico <ale@rev.ng>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>,
 philmd@linaro.org, bcain@quicinc.com, 
 quic_mathbern@quicinc.com, stefanha@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, 3 Jan 2023 at 12:31, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 3 Jan 2023 at 16:12, Alessandro Di Federico <ale@rev.ng> wrote:
> >
> > On Tue, 3 Jan 2023 10:51:36 -0500
> > Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> > > QEMU's Makefile used to a use a technique where it generated
> > > "timestamp" files and used cmp(1) to check if rebuilding was
> > > necessary:
> > > 1. Always generate meson-buildoptions.sh-timestamp.
> >
> > `meson-buildoptions.sh-timestamp` would be the full expected output,
> > right? It's not just a date or something.
> > AFAIU that would make sure that if nothing changed in the output you
> > don't trigger other targets depending on `meson-buildoptions.sh`. It's
> > a solution for a different problem.
> >
> > The problem with always rebuilding `meson-buildoptions.sh` is that we
> > spend 1 extra second on every build, even those that doesn't need to
> > rebuild anything else.
> > Not unacceptable, but I think we should strive not to commit generated
> > files and move the file to the build directory, unless there's a reason
> > why this is not viable that I'm not seeing.
>
> The other problem with this file is that it appears to
> be generated differently depending on the host distro
> (specifically the default value for the --libdir option).
> That also would seem to nudge towards "don't commit a
> generated file".

Paolo: Is the meson-buildoptions.sh approach a temporary solution or
something long-term? Maybe everything can be migrated to meson
eventually so that ./configure and meson-buildoptions.sh are no longer
necessary?

Stefan

