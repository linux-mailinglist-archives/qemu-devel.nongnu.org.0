Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D163DF508
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:54:10 +0200 (CEST)
Received: from localhost ([::1]:47884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzYH-00086M-UT
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAzUo-0002Ld-JT
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:50:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAzUl-0003DJ-US
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:50:34 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g21so374306edb.4
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mo4hSpHWZXle/Z86gAFOepuvngqq+FgoOLLXzcXewkA=;
 b=u1ekSjcbBVeO+YvT6ONkx3Siqu12zQqigNVoeSVqX1Z5NZ/2KXi/p+z4qgeXrLzgZW
 G/WnNRUBtxTfyiiNH+D0DJhDjynDmmngxxE2++oNuAPMAeVW4cVktOqvwflhOWj1Vddn
 GaIRPOYNSQdQf5WBQ8Fy1eFkNrF48kZbaXBX8mnKBilkxBT7g2Wj3s8ZuD2orOpZW6qB
 dgEWMoMlMx4OZ2WAvxRRn1d1QYoxRRnZ9+k84cQxl7M7XougFrxb5oJqpKHc9d0tYJPN
 Zkds1jwMrHHOU8JleX0ZM+61UN4qBBOtFrcjCAxn1aEvCKpkd3IGeIt5n4NFovEj49MD
 NP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mo4hSpHWZXle/Z86gAFOepuvngqq+FgoOLLXzcXewkA=;
 b=E7x0VcTZGfu0ZEDCS8gnz2R6Tokj53e5RRsFkCBKzbp9v4SAT4vNYx2ZYczTUfWw1H
 qdccMmBpNdVl73u16C5kZ23ZT/i7baMBiDCbm5C0Kud+51RhxQMjVKqKcyi3WjvABUYX
 QudCgCjpT4Mq5ObUSeOm6pJAGij0o8U87EWAvRy02qjMNIBxK2zrDR50GeDj9ibyf4vI
 PH+q+yi1teU8ljSu8YQUWA0zzWwPpqdWwNjcex7JlRmKQsbI50dDR9Gp+XHTPsEQhKzV
 4KnoeM+NmzQE75rc6zERwwDNN9vIPDCVJfjrcOvGiZhlg9XgWKzz87re2VUSRcPDqGcC
 TSqQ==
X-Gm-Message-State: AOAM530C0MDmhYlF+od6WV1R8RH7k8SKKvCVpA/NpMW4d5U4DCLWKy4n
 GPIBI729dnP8F0DOoX+A759Hfy2N/yb/ChqV7D3WVw==
X-Google-Smtp-Source: ABdhPJy2oUz2ewvRNxxGjiwu/Az7tljEBpmwBrXgIhxPnG15ylUOhbyiCDfXs2qqgS9W5CmLL+zLIcvvrWoz4xNTMFk=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr26648114eds.251.1628016629903; 
 Tue, 03 Aug 2021 11:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141833.3468770-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210803141833.3468770-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 19:49:46 +0100
Message-ID: <CAFEAcA89D8GspmKJN=egVwAqK_EQJsiS_Ro=TJZWUFpEA+iEfA@mail.gmail.com>
Subject: Re: [PULL v4 0/1] Libslirp patches
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 15:18, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e=
00:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-08-02 17:21:50 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
>
> for you to fetch changes up to 43f547b73dfaf108c9aaacb0b36200e2e7a200f1:
>
>   Update libslirp to v4.6.1 (2021-08-03 16:07:22 +0400)
>
> ----------------------------------------------------------------
> Update libslirp
>
> Hi,
>
> v4:
>  - drop subproject patch
>  - fix OSX linking issue
>
> v3:
>  - rebased
>  - (checked compilation with P. Maydell extra-cflags reported failure & g=
itlab CI)
>
> v2:
>  - fix unused variables on macos
>  - fork_exec_child_setup: improve signal handling
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

