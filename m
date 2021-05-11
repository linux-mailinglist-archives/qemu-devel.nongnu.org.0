Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880D37AA3F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:08:12 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTzX-0004bn-C7
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgTyU-0003jI-8q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:07:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgTyS-00038n-2t
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:07:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id gx5so30240850ejb.11
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Itbc+MfmGLBMUTcUcELl/tiyn5Dn5aegR1Exr/slsDw=;
 b=HsMMf9QEX0Ks1yzt8tnphrs/smWSRfiHUlrRrd/Tam1RHIvUgFvrDqDzCVb42vEI6l
 008hy5+F97U07P9vCHU9cH5UKUkalNYFP3qOM7IHR1MhRVOLC/E/2ADw9AATSxwBvg8E
 necGgBAFCCRmSd21o8SgxQ5HjWOXlGtwpKxPLmE1bADAuxShc/jwHArxaqfwXaS4zoRs
 ES8FQppouT5NtSzZtbTjdX6a23sENgsonNsbPjO25bs3Vw82g5IrThX8Zz8BI0daflZF
 hK/I35G6yeL1VEA5aQRsfZEbclJ9HW5Y1ALhmbHa2glGCCzFJFUSpUhL3KBFrZpKMECk
 RRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Itbc+MfmGLBMUTcUcELl/tiyn5Dn5aegR1Exr/slsDw=;
 b=Nirui0uBtJL4M5kSvyMP5Ari1DHGoLzCNjH3oigQ0Ryfauv7W9T9me9SH9bGddpEVx
 GR+x/tU16LVE6eE0lbLngw3NHBTFwiqJK/jNC+iXrs31hAGSbf7m29+VR1+r7sBej6IC
 WHb9ptcVA3cyCRdAsa8tlCZXeRD170Y62ilf/+oe3tjtwepi4+Def0RA6KWJYeBzn6w8
 Hetb9NuqUsNK2W3t397AacGCLPLB3SJMgzECRrNr6CyOTo6b2lQmRfr400dgZUAyCHSA
 26EdX4Xmi64QM2J3uZbI0J/aHL+zQr+po5ga3TcsyQD6Ca9M8Z2ZC23C2wWKO5GsnqwB
 /+9w==
X-Gm-Message-State: AOAM530R7uOyY3WbciZfEF5/S6RVM2wz28K3dDqLp4xOmoQM6HIb+hJc
 sFWpqNtggKOZec5+B1EPqsKbvEFgtACJhKlXwufPAA==
X-Google-Smtp-Source: ABdhPJwHZXeR0PUKNAHBMznD6k7ogc7ESIT5Qu7FSHX3YvMbrrb0RvZ9C11EB+B5Dgs2Bq+sQZHgQ899C2kiQe9Nifs=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr10187256ejb.56.1620745622169; 
 Tue, 11 May 2021 08:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210506185641.284821-1-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:05:49 +0100
Message-ID: <CAFEAcA9h47gUWtUHOmtgWskaXEVgXs9T6FiD2EO-wJgZCKmK6g@mail.gmail.com>
Subject: Re: [PULL 00/12] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: jose.carlos.venegas.munoz@intel.com,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 20:05, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit d90f154867ec0ec22fd719164b88716e8fd48672:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging (2021-05-05 20:29:14 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20210506
>
> for you to fetch changes up to 67a010f64cc9e33ba19ab389dedaa52013a9de8a:
>
>   virtiofsd/fuse_virtio.c: Changed allocations of locals to GLib (2021-05-06 19:47:44 +0100)
>
> ----------------------------------------------------------------
> virtiofsd pull 2021-05-06
>
> A pile of cleanups:
>
>   Use of glib allocators from Mahmoud
>   Virtio spec compliance and printf cleanup from me.
>   Sugar to turn on xattr when defining xattr mapping from Carlos
>   an assert cleanup from Greg
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

