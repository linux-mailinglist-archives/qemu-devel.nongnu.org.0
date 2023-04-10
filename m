Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D007E6DC745
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 15:28:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plrZ4-0004Ji-N1; Mon, 10 Apr 2023 09:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plrZ3-0004JM-8a
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:28:09 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1plrZ1-0006wF-Ir
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 09:28:09 -0400
Received: by mail-ej1-x629.google.com with SMTP id qb20so12039837ejc.6
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681133285; x=1683725285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ncClKoZiXr0a9DRK37kCQ/gNllB6AHeZwn1tdTUt0N4=;
 b=kpNdzYCWKsMbTOt903eBOmn0kgq7cwxzvgBsdrYtNkKRNX2yBZKeICad1qqjOw4WvE
 dkMaCOf/UL9ItUrLKQCQRsPAam4GJ3x7G4Be06idsi+P69vsFbqGnZUHpcedzplLruo+
 GOYGjcvbGlClMounZyuIj+ZaWxU5Sr46D5lWATi6HFO5IQQUndPVHmGfMJDTIqUgOJ3W
 zUPeDORVDo9WC3VdEvkPF2mGxx0urGFfvaAxgEWJaX+2o7TkNllZ6Nv8JzqIra39oNkN
 pT7dHqXhWbbb8uQ4mE3Ig2k12mBbaSRYola1gC+wm6vzW6LF9Zqe3ItUAm/0ZLZquaKF
 +Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681133285; x=1683725285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ncClKoZiXr0a9DRK37kCQ/gNllB6AHeZwn1tdTUt0N4=;
 b=pxzXdZ1kfB9KvHeg2K/wpjenstdHc3eWrfWUbNGDWEo4xJwnxFLg6rH+QvIk1h2smV
 oSqh4crWIs0eDrfvYDEN2OW/FpqlKA+FeOXwpNe8T7VZAsyMaRI2Ii6h62Nw25jLqLm/
 YwXGRTJ2yG+zKZ9KSKnovC07/RTYXbAZ2tNDIxr7JzBUNeVgUrg8CS+CD9QmWtKFgjNt
 h759SR6aKQhCwb5XXTPG+IyMrNHAZx4izBul68oYxeZrpp3cQdfWAZ39LIuMKUtx7KTF
 dJECKUjA5wavfe+BSQyumehHDnCUt8qCUKD+BmkiEPiWOzCnq9EHZtKjZlkrgiGsSJq9
 7zew==
X-Gm-Message-State: AAQBX9cC7Lpn0T/36LfhQvz10m/OgllbZ7GdMbVu+K7DhJ/N6LK5ka6o
 CUgfYMDU7z6nGo6/CgweflwqBYwbrTiDaMJoZ5JIeoelZi9I/V7K
X-Google-Smtp-Source: AKy350ZhDf8acwSTsTM204AoUVvNNwACFcbQQHqFTzDJL9MVptknxmUBwSx8LLY0wBisltgBzCIPEbAGwEPD71AAUSY=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr3641628eje.6.1681133284797; Mon, 10 Apr
 2023 06:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230406165615.4102782-1-stefanb@linux.ibm.com>
In-Reply-To: <20230406165615.4102782-1-stefanb@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2023 14:27:53 +0100
Message-ID: <CAFEAcA_wG5z_2iou00pgdnkBndeCutA1zy37Ng8Y_OZhT3WKaA@mail.gmail.com>
Subject: Re: [PULL 0/1] Fix use-after-free errors in util/error.c
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 6 Apr 2023 at 17:56, Stefan Berger <stefanb@linux.ibm.com> wrote:
>
> Hello!
>
>    This PR fixes use-after-free errors in util/error.c as reported by Coverity.
>
> Regards,
>    Stefan
>
>
> The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:
>
>   Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stefanberger/qemu-tpm.git tags/pull_error_handle_fix_use_after_free.v1
>
> for you to fetch changes up to cc40b8b8448de351f0d15412f20d428712b2e207:
>
>   util/error: Fix use-after-free errors reported by Coverity (2023-04-06 12:38:42 -0400)
>
> ----------------------------------------------------------------
> Stefan Berger (1):
>       util/error: Fix use-after-free errors reported by Coverity


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

