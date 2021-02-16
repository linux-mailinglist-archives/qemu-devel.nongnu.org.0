Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE031CB9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:15:03 +0100 (CET)
Received: from localhost ([::1]:34996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC182-0004jU-OG
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC16f-00048n-KW
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:13:38 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC16d-0000Vf-CU
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:13:37 -0500
Received: by mail-ed1-x530.google.com with SMTP id s11so12316040edd.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qiC6A74MDksxthLHhL+204tWTthEb9CqXLuSQuZiyqU=;
 b=f4wOi4EgFjc5BzAUlTL8eqyllO5VS4+JufxPBWG2fxGen+A/4JTKPFhdOHTBd17+va
 5vC7ogyfNcaRTF3SxKqbP/DIYHnuYs2DbvIeO1VSzCCE5Wh+DAIQjaX3cduukKFFMurF
 F5ZtLQmyP+1vIFXWbJ/Dn9nrtoizdKEyFLovfUgNwt3pwn+y+NXtymoMcKUYR4hbteuV
 UI9wqb+jAQn3lRUOumWNivnorOUStX8jWYTsLG/NcldHUcp7K8ThvjQYUc4YvW1M9zDP
 cC/NcJ51kjPuCwatv3PYbpI1Ln59+dsf7eVXz36SMlBnT/gjOjdPUAH9DOALzJFVK26X
 g8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qiC6A74MDksxthLHhL+204tWTthEb9CqXLuSQuZiyqU=;
 b=cnlIl/WawO/K+xqrItLN16+hCj7bVAGtrwIz8dRs8fkTnHDRuJSUpWcyWq7Lo0hhWS
 om2S0ZaANe1lD2phq+P/wIN9IUhQGm+7Cnv+aorBja3n8DQUYu8HHTutPatDHBlBiCU5
 qWj+4Yx0sXH4IHxzpF5GVLNVyVP8oV2w0wviNIzOo+CX5hHRIFcIe9tAi5jZuJG3YpOp
 9XQKEG5OtuKz6SVNzcn3gCO0fh6KQcg/BhukHoSjBpPQ8S4ZCrbuHlDLwwZTb4DzYZaG
 jCha8d/3xR9X0GcNGvg3VeNGgf2ikpGDLhNzp643XVknpionqegli7S3xcO/5FtGR/s6
 zbCg==
X-Gm-Message-State: AOAM530W7Qc8TaP8fN+W/Rm8+Tb7SArTjyursjgYPg/zVIL4rWF5IW6b
 EaA/5Wg/fXTHVrdPCy+KsrMb+jx5mLRdNiHZkQZgYw==
X-Google-Smtp-Source: ABdhPJzH5Lp+Ub29zq4M7Ccx+PHxNpLvzI10a0+AFtmHiKYOteYG4tBXlSWD6qyAPaey4YJOwpOgfl+afH8tJxA9bvw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr21019695edd.52.1613484813121; 
 Tue, 16 Feb 2021 06:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20210215131626.65640-1-pbonzini@redhat.com>
 <d6098e0b-9000-d549-a3cd-4c3efb26ddc1@redhat.com>
In-Reply-To: <d6098e0b-9000-d549-a3cd-4c3efb26ddc1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:13:21 +0000
Message-ID: <CAFEAcA_AFXomepGDV9C0nBuo3u0LLBimr-JhoY-ocsffihaFuw@mail.gmail.com>
Subject: Re: [PULL 00/19] i386, qgraph patches for 2020-02-15
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Feb 2021 at 21:37, Eric Blake <eblake@redhat.com> wrote:
>
> On 2/15/21 7:16 AM, Paolo Bonzini wrote:
> > The following changes since commit 41d306ec7d9885752fec434904df08b9c1aa3add:
> >
> >   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-02-09 10:04:51 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to bf98b5857a101f9032377044c250ab728464bcb0:
> >
> >   hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 18:47:45 +0100)
> >
>
> > qemu_oss--- via (5):
> >       libqos/qgraph: add qos_node_create_driver_named()
> >       libqos/qgraph_internal: add qos_printf() and qos_printf_literal()
> >       tests/qtest/qos-test: dump qos graph if verbose
> >       tests/qtest/qos-test: dump environment variables if verbose
> >       tests/qtest/qos-test: dump QEMU command if verbose
>
> If we take this pull request as-is, we'll need a followup patch to
> .mailmap to clean up the mess made by the list software.  If there's
> still time, it may be easier for Paolo to spin a v2 pull request with
> updated authorship information.

I have indeed dropped this from my to-handle queue.

-- PMM

