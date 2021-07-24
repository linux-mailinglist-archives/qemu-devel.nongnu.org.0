Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3913D47DC
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:27:08 +0200 (CEST)
Received: from localhost ([::1]:41684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7HgJ-00074V-2O
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7HfG-0006KW-0E
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:26:02 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7HfD-0006YM-J5
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:26:00 -0400
Received: by mail-ed1-x52f.google.com with SMTP id h8so5248162ede.4
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TIf0dirl3CwEnYi8CSImG6g2f+18WsW3oevNTY94Ds=;
 b=vQJpI5P6FUdaLeaobXB+BMRBDzP8RsJEwFE+tmyzwTdaa3Nhh0AYDFw/ZLDoIDQXi3
 mnlpyr5dxz73oTK0OOXfh6nP8N9TtXfUUuX2TpCUUeu6Ic11Bb9Mfsh/ODX2GTkWydzU
 cnOWZO+0eF8ZDaNCGtBmCe7LkKe2MUIXZk9bIS/JB0OPXAx8Hlv5uX/Q4n1EdfAF6tzI
 6UlmYgsfOkuS+h2CXjpPfFEtu/VU1dsYFZHcOXWW3Z+bfVJwkz9zd5EojHpCEOXiCWPj
 hrFiZ5pnLftB9Zis3tYdI+XtrnMYtgeljjYClxe/EE6ETngGO82G+LlI/MP1jjoIM7z2
 ySrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TIf0dirl3CwEnYi8CSImG6g2f+18WsW3oevNTY94Ds=;
 b=QxL5IeuPcuMs5YEck52AGCU2B8gKQwWwG2V76blV84tsMpEVfmZVHgOef769f2SSEs
 4ExSA5jSmKMNQAMZ6zjZkVqyjh9N8QUPAy/+585UkDXnA1fNdzWleunfVIYHOvOy18lD
 6m26+zOIS1w1p/pixHauTt2aWYQ2O4vmC+U3VUa8pd1TIA4Efo3ilqSzdOk3f5VaQBoj
 3lgBcEr/aZeUYVFRe/PwvkDOvmKbK83qQAIVAe3RsSVUzL7Ij12dSOaH2FoobeoCTih9
 TDM4Sb8DTKuC535zHPLaWs5gJctCMxGxZv/zMFnhogUS0bSZSHhS2eiOk85GdSQ59Iku
 iGjA==
X-Gm-Message-State: AOAM531vPtFXdPbHnjs+l65lNOat3LpTQecrQ1Woj93wtssoDrtL7lj2
 mStjXxJ9pYxzC86YKFgaRhzsCqM4h9Tlwqj5iStrbQ==
X-Google-Smtp-Source: ABdhPJzoAC44Jtz2/WTo/xOPy0fNqAc2gf0HnIKd+4CyhAzl0OWb4OeF1LFt98QceZdRLijXcVgUbPpVxNBSIqWS014=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr10911578edt.100.1627133157840; 
 Sat, 24 Jul 2021 06:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210724085453.16791-1-pbonzini@redhat.com>
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Jul 2021 14:25:16 +0100
Message-ID: <CAFEAcA9HN9qbhNAjGZZZ=wjGBz04eATau9N7Xv9rWM1FDZwkCA@mail.gmail.com>
Subject: Re: [PULL 0/9] Misc QEMU patches for 6.0-rc
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 09:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 7b7ca8ebde4ee6fba171004b2726ae1ff5489c03:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-22 18:32:02 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to cbc94d9702882128c52b72b252b8eb775b0e73af:
>
>   qom: use correct field name when getting/setting alias properties (2021-07-23 18:17:17 +0200)
>
> ----------------------------------------------------------------
> Bugfixes.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

