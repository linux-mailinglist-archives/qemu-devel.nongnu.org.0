Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD9331282
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 16:48:45 +0100 (CET)
Received: from localhost ([::1]:47420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJI7f-0002yZ-Tj
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 10:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJI4i-0001I4-3G
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:45:40 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJI4d-0001Mu-Lq
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 10:45:39 -0500
Received: by mail-ej1-x62d.google.com with SMTP id hs11so21305052ejc.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 07:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gmbQgoaiPRHr7AhogZyGoUwvto4ItNQ0A9Pe/rHmovI=;
 b=XG7TimspOTNMKQVLmN89RODNInFmFbVNfHZzsj1NAmdFyKBvVvYtGFvnlYVMyQv7gQ
 TwEpL1APmIGLuWH6DHxlYWV0xvcvXHOrCNvzXNnaxrxQUL6xJmg7IXMGnhVgD+CCjb4p
 8TqZISWKeOOVd9dCIwA7sGD9smEY8Q7LH/RPm2A/utdclae5WlJVOdcseupwpJKE4Q7a
 MWJrXTbgFc7FEG3I7sLL/DPLmQPDpEPg/9LIO/h6AXNwXQg3GXISJOvyopqvCqOuJagU
 kJNLJfUefJdviwedfxZWHuDEup0wcdsKip/35JYJcN5c3XUYXj/7DCGRw+3OjI4gfTGE
 j0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gmbQgoaiPRHr7AhogZyGoUwvto4ItNQ0A9Pe/rHmovI=;
 b=eGK9vC85/4wDxuVlCrXZ6eyeLrtVCY6TA+Xdl8pJEF02jHGLiuEEac2oW/JpGGP8z5
 qCqiqpp02zXRPFzv8hKlfxDGob+5l/7NdobXbSdiQW+4rRRCnyhT7ZFX7oaDZho2sc91
 JFKHd0VGXWRe75rBLZ0d/dJEWbEek2STeX839G1n9Ezm6i4S3DqQ297xhtolRd+EjLjG
 xyLifQndGtmBA62UHNoHtApsPYIPhnmIqaMAcCx+B2N8iSS7p9VJVt8pP8td6mCbhC5w
 mh2wz5zQNpwQTZzeHA9UFx7H+hZv4FTl3FcEAz+Rb9RHOCcg74IIJx69weJMJS0iWFGG
 u54Q==
X-Gm-Message-State: AOAM531r8rRCQ41p0LsMS34nBXrsij/6V/oR0GGeqow0O/o2v4MMieOa
 jZNS6LHRx8dK4+UTH/qQ3x9LZ6GiBImbu/dbfEwTxg==
X-Google-Smtp-Source: ABdhPJz9hAZJuIC3xjwtOE22yfTSrjSeJ0uBMCaPsO2MOpVA6evScyvUVyT0WmmF343RBOQOaGb+BU/yd9Jl2PdVoqw=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr15221432ejp.382.1615218333295; 
 Mon, 08 Mar 2021 07:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20210306105419.110503-1-pbonzini@redhat.com>
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 15:45:16 +0000
Message-ID: <CAFEAcA_1g=njLX75sCM1kGqnEAaK47R-+m_mLztVzxUrNYTQOw@mail.gmail.com>
Subject: Re: [PULL 00/23] Misc patches for 2021-03-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Mar 2021 at 10:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit e586edcb410543768ef009eaa22a2d9dd4a53846:
>
>   virtiofs: drop remapped security.capability xattr as needed (2021-03-04 10:26:16 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c715343fd96bcf93263fda38d81af815fdb5a7fa:
>
>   meson: Stop if cfi is enabled with system slirp (2021-03-06 11:42:57 +0100)
>
> ----------------------------------------------------------------
> * fix tracing vs -daemonize (Daniel)
> * detect invalid CFI configuration (Daniele)
> * 32-bit PVH fix (David)
> * forward SCSI passthrough host-status to the SCSI HBA (Hannes)
> * detect ill-formed id in QMP object-add (Kevin)
> * miscellaneous bugfixes and cleanups (Keqian, Kostiantyn, myself, Peng Liang)
> * add nodelay option for chardev (myself)
> * deprecate -M kernel-irqchip=off on x86 (myself)
> * keep .d files (myself)
> * Fix -trace file (myself)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

