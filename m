Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2208A57D4E9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 22:41:12 +0200 (CEST)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEcys-0008U4-75
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 16:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEcwo-0006X5-7W
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:39:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEcwk-0004i5-Bv
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 16:39:01 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31bf3656517so29407397b3.12
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 13:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XylQsDyMHmyQCgWH7DZylQIVWpapuIEXTEdtD/GiUqQ=;
 b=JSstY9yJFrzhBc58oq8Bw/m2vln0itUYoecyTmGTlzzx6f2rMnJT6aeLeEhH7vUTD7
 VJ0gzQQQiaH/1XAS3oPe6nae93MI4Cblvgb7SERQUtzeXW9laTjM07k/91PxAStf0vYz
 xV9hxzgSBvKpGUDg6eh2k7l49VgVMCpgdn+H/0dvEOAezj25yUqAkKs5VtGcFUM3kORT
 ciHPm7sceJFHwjh9AeQ6tmu9hr8AVQPJzByDz3a7awk/l7hfLd51sR282i3v0KOxtbO0
 Pc962l2a0CL2PH/1pSvDJyDXMTzq0lXOQfMYBLuIjSWpJBPiD+vmFgylhWy59jpK0SM1
 NLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XylQsDyMHmyQCgWH7DZylQIVWpapuIEXTEdtD/GiUqQ=;
 b=3dMU1aTPxx1ukVsBHO/cHOtf+kASgZoFYTXtE9Wr0o64ZiXjQJPn6FiSqJaKWlOsSl
 5hjcV0Yy6dj+gWsHviZLfNKuX0m5rkfwrkvHScHPgr2pVJZmPC59/mFyDlWNYLYjV5Yj
 wDOjwbdw+NsYZ5NHPAehe71BcsSiHI7P3o+gaDbdQ1ja2lgoO6BBP2S7BkW2JrKgmbxo
 jIwaYavlDh+AieNnWocJ9NV8TintSJH3s8C6reLh+KEmnEFyJLUGXxL3RReC7aVm9EWs
 ++vL49Sxd6i/gjJKmlercNj3fyAwovCallHWh/bILA9BS9MhqkKCWnsMpVKos3uPiDO3
 YYxQ==
X-Gm-Message-State: AJIora+Ic6KkQph+7jKbR5ToWj+Z9mlLZfDtchS6qBLqRVhNRFqd0px2
 8y3WfqM/1LAiz+7ynKQiJhTiLM4Rnf4HGYCIMx1lIg==
X-Google-Smtp-Source: AGRyM1vtXl6e3Z6CBtcEGV5rGtXeheMwL9H/hiIpV+E5Yc7EYn7d3eOoRQ+0oRxnbSDnA08hbxzKGzYSX58fPa+OhQ8=
X-Received: by 2002:a81:a247:0:b0:31d:72da:e931 with SMTP id
 z7-20020a81a247000000b0031d72dae931mr307977ywg.469.1658435935999; Thu, 21 Jul
 2022 13:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220719093439.528810-1-pbonzini@redhat.com>
In-Reply-To: <20220719093439.528810-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 21:38:16 +0100
Message-ID: <CAFEAcA8LxSQ_ntFrihtO262Od1SWzCgM1p9M1YZGL0Lt=so2tA@mail.gmail.com>
Subject: Re: [PULL 0/3] Misc patches for QEMU 7.1 freeze
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jul 2022 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 0ebf76aae58324b8f7bf6af798696687f5f4c2a9:
>
>   Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-07-15 15:38:13 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 3746b8ca3e8bc216d03df5813080eeb06bdafabb:
>
>   util: Fix broken build on Haiku (2022-07-19 11:32:21 +0200)
>
> ----------------------------------------------------------------
> * Boolean statistics for KVM
> * Fix build on Haiku
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

