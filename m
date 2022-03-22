Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B314E44B1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:06:56 +0100 (CET)
Received: from localhost ([::1]:37666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhyB-00075u-IY
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:06:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWhwg-00050b-HJ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:05:22 -0400
Received: from [2607:f8b0:4864:20::b34] (port=45851
 helo=mail-yb1-xb34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWhwa-0003bh-4u
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:05:17 -0400
Received: by mail-yb1-xb34.google.com with SMTP id t33so27214649ybt.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bIQ8GJ7peeIDqkZCgcEAu+w5AhPI+FwAbJjwHoDh9p4=;
 b=e4/vI0H3EIU1qi/8QN6+hP3NlpGxsDbGR/xayh8zVjTKp/p7DdIlFDfHcU1rh0Zt6T
 fLYPWV7+wlT0jOvF/Lig4G8tg57/hoWAJwqG0kPB2Y5oto0KJ4nD7GEI9K9bJ5T0xRWh
 R8aGGbHF0qc5iD4WjsS0ZLPaRP2xq4E48kw2JZuAbYUELNWru62ayBXl12vg/JE3YV0o
 uI6cP/win6v/MyCrFrTnHqiih9hH+NGFxAy4zSKg4BpTi8HxXoqkoHjQEW3eRVbuspd8
 i9XOftA5pIQNCEf30kK4u1drpEzlUzeijaCSGghoBIvhZAVR7WLJFfHX6Rj3iH68lRuZ
 Lcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIQ8GJ7peeIDqkZCgcEAu+w5AhPI+FwAbJjwHoDh9p4=;
 b=1YbxTTWoxsUhzMWSYxDUORZkgCf7ZLTcjKlL9lzZuBVat5D05Sx/2nNBaiKtoYGTfK
 4bu5kcZNmmkIsox8oGy5ZFM+tsS1xSAXpXUwcPCmG84woEz6SeXvE5gqsDsJU/NmkEhV
 DO0912u9r6izl6+kGjRWB52XutpXeG5Q4P3ee6MZqKa8JLgqL4mrXadHAof6mhsZ5rLp
 BNbUBTUQz0u8IOELw9XPRFGYCCMCeTO5P/2CoBawugU7dZIhj9+ulzAMt4+AwARPuSIN
 bG79SKSt2xyZKm5rfFwBmudednK9v3ZRa1AJ2fWKwov6lhYtoKgBrS8BTgD+HT30Om48
 7sVw==
X-Gm-Message-State: AOAM530NKEUXbxlacbvWMs9QHD2MoVhGE1BAUpGdb9ZBY/ECYj47i/qa
 +Js8ynXb9MpkjPy9rlctqwG33Ltho2I/1RRfV0aUiuG3if+vog==
X-Google-Smtp-Source: ABdhPJzthVkf03m+2/mJBqsJ1ic/54XYLCeZUQyXydPWXfJnUBtZSb20w+zXv+06soJQZ1yCtGUCCiFP44riK37mFWQ=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr27484028ybp.39.1647968714713; Tue, 22
 Mar 2022 10:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220322115647.726044-1-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Mar 2022 17:05:02 +0000
Message-ID: <CAFEAcA-oBbtFiLNvOL=_25t0wYMgRYS98ojQfHbSPgo-DmVf=A@mail.gmail.com>
Subject: Re: [PULL 00/25] Block patches for 7.0-rc1
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Mar 2022 at 11:56, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 330724977b10f5b92610817e8b7d1dfed122df87:
>
>   Merge tag 'pull-misc-2022-03-21' of git://repo.or.cz/qemu/armbru into staging (2022-03-21 17:46:40 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-03-22
>
> for you to fetch changes up to 48f1fcd5c87cadef331a2cd08e67e37a789e8347:
>
>   iotests/207: Filter host fingerprint (2022-03-22 10:50:10 +0100)
>
> ----------------------------------------------------------------
> Block patches for 7.0-rc1:
> - iotest fixes:
>   - Fix some iotests for riscv targets
>   - Use GNU sed in more places where required
>   - Meson-related fixes (i.e. to print errors when they occur)
>   - Have qemu-img calls (from Python tests) generally raise nicely
>     formattable exceptions on errors
>   - Fix iotest 207
> - Allow RBD images to be growable by writing zeroes past the end of
>   file, fixing qcow2 on rbd
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

