Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3343BC2F9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 21:05:53 +0200 (CEST)
Received: from localhost ([::1]:57450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Tui-0001Uu-TV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 15:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0TtJ-0000lQ-Vo
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:04:26 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0TtI-000242-6X
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 15:04:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bg14so30268267ejb.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 12:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9IiUTJNSxRpIChlq5NGFOVEudSTrMcKYZZm67790j4g=;
 b=FkpfQGCcAvLLT5/IaN4G3OPP4ur/nqENKGzHjCHuADuURLqMzX6p/9LFxf+ZuWF/4V
 pndho/R9MkZdjnQe1/m3I/asFgTqfNcNTzcqHU2yuzoOg1Wk2k8fLBSguPAnfhDX6TfC
 DfKccioOzcFnwDEwGUKQQaWSpqLTzpzWPBZQt/C3gVIueQHvj8q/qmB8Nxq5iCQODMov
 9JhFCJ6hzSuKspoPq0JdOVbSW/z0TNFfJ5o8HmElOriieL30ETH8gvvq7hEpk2EcneyV
 4a+IP8R+/wwV9gCz0C7P038gwmEE06+sD1iV78zSv8j/pOUJn/POqRfYdX6sbr7pX/g+
 7FxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9IiUTJNSxRpIChlq5NGFOVEudSTrMcKYZZm67790j4g=;
 b=EJhss1xGoZboRXkTC/It5SK4+1Hglz3YT6HCvZUwJTRRMgVVvTHiFn1pq8aUK895MJ
 ATaDUMUA5a99et4kHRJn49c0QvyobgoTbOLGs4KO3BkabWJQvM+86Tq1VdiO9SPpAdRx
 +9IhV8VylTUMTp0IDHR45V0bOyF0Cc518MImk7/Wu/LYTMJM5Tn40miTkpyZE2zAtAy9
 5K12b50QuKNPYFsBjNsKUSAfDDqHMKEMpFT3xGrPVeWqfOtnXBQDgC/HnSM+ygR2N3fV
 l9e9/v8dWygKDLju6th+Hd+izLj79UdG3zJI1L8yK8H+M7qjW3CSo4LobaOIpgVz0I8q
 eBHg==
X-Gm-Message-State: AOAM533Ki7S749Km7/g+JXJTmnWUWGjoa88gvpVLOMe7qk6KOFLpwEsd
 WqeyUpa7dgLmXRjyM15A01eXX3pjPBtEZYkm2F8Djg==
X-Google-Smtp-Source: ABdhPJyBAOLATp6cvPiZg0rjEnhDfkDTXZOD6QaWioyPC95ZelOQPbaS2ka23otoGJWmCUPwfANlTOfDR6gSD5AsKmQ=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14488009ejy.407.1625511862425; 
 Mon, 05 Jul 2021 12:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625483630.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1625483630.git.qemu_oss@crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 20:03:43 +0100
Message-ID: <CAFEAcA-yqRVCg4aNHsf3_2eXex9_35He=_5xsO1Cvkgh6iuCEw@mail.gmail.com>
Subject: Re: [PULL 0/8] 9p queue 2021-07-05
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 12:24, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cschoenebeck/qemu.git tags/pull-9p-20210705
>
> for you to fetch changes up to 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4:
>
>   9pfs: reduce latency of Twalk (2021-07-05 13:03:16 +0200)
>
> ----------------------------------------------------------------
> 9pfs: misc patches
>
> * Add link to 9p developer docs.
>
> * Fix runtime check whether client supplied relative path is the export
>   root.
>
> * Performance optimization of Twalk requests.
>
> * Code cleanup.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

