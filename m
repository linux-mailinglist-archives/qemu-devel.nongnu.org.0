Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B283FEF0B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:59:00 +0200 (CEST)
Received: from localhost ([::1]:39652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnF5-00019P-T6
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLnDt-0008EE-1F
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:57:45 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLnDr-0000VE-B0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:57:44 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1436689wml.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=niJbbBEVVjv1HYyiQgf55NZI6kxJF7vfycI9AkaRR0c=;
 b=ZXvIKJV2aKpEB6Hu5CWgoMy5xHHXYv9DqHuNu0UNsy7Str1DLUGMfAhS6yTWNx76ji
 43YdR9OAI89FL14TJb4/NRPjNJro3XLDUaYzxTXSA7iKvienDWLbemuli0aUQeREKF0n
 JIILSoNR1jnitRSoHfUptkRuJOtmuPc6JuhtyWY9WDyupEXhAKNx5AX5E8TQkqdBqHZn
 7953VLZl35DvrhEN9Grv6LPynRi7gs6VtUiA/NydtUh2eix3CIzwGk34l+SDpAhje89c
 kl0renA3SBMpOriSvsuS0sRcd5NMhBQxTLusLxkxk2/3B/imF0cCW04kfny+puzul8EO
 b/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=niJbbBEVVjv1HYyiQgf55NZI6kxJF7vfycI9AkaRR0c=;
 b=PL9YhOIy28/068miPJoVcOjz7eflb3pT9PR3zXER9LnwTUTu2iTTAS6Nv7T6jGZpYP
 VFEVs9yj7AgnZbYLisK82uZxRpub30jEx/aZKGQhMg9aYXYgqP2+PTWjAAoCaSCSuAhq
 OYflEywNF16VMoh6Fky2HyzVP+n42+q33KwCdIYuJp3H7FXzT36XPwTQ5MIs7g/3rmkG
 u3Fuzk73sQwLg0k4Lgv8tWnX7+AjLFu/zDpBZ06LWqeuxGSKpa0Bgaq+NBKEBj52HSvJ
 ZIsd3jyshfzxqxrPHm9nH76tFLDma6WPFDlK9dmFUGRcxxlXgMNxSFTGCjC3SKCqxkBB
 daCQ==
X-Gm-Message-State: AOAM532BMhwDbGH/f6LLyZNKGX/8KeiXC9O57rz4/rugq2f7b7NhW3/5
 r5hSfflIUfQLWyVgePWvDmeYiMGe2hA13JAb1l5P1Q==
X-Google-Smtp-Source: ABdhPJy9vS1rYV1QK8v5IoSHnEtJOuSTr7uwb7q9dtlkV70KXCIDPr+biKMy7vOT+VUkwEa4yvJ06J1FQZzjrxvDCAk=
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr3323716wmq.91.1630591061675; 
 Thu, 02 Sep 2021 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210901151619.689075-1-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 14:56:53 +0100
Message-ID: <CAFEAcA-rCN5pmp34LY_v-Xk277e1OHnNj3Lm7+ztU29epvrwHA@mail.gmail.com>
Subject: Re: [PULL 00/56] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 16:16, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit ec397e90d21269037280633b6058d1f280e276=
67:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20210901-2' into staging (2021-09-01 08:33:02 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-09-01
>
> for you to fetch changes up to ebd979c74e2b8a7275090475df36dde4ab858320:
>
>   block/file-win32: add reopen handlers (2021-09-01 14:38:08 +0200)
>
>
> **Note:** I=E2=80=99ve signed the pull request tag with my new GPG key, w=
hich I
> have uploaded here:
>
>   https://xanclic.moe/A1FA40D098019CDF
>
> Included in that key should be the signature I made with my old key
> (F407DB0061D5CF40), and I hope that=E2=80=99s sufficient to establish a
> reasonable level of trust.
>
> (I=E2=80=99ve also tried uploading this key to several keyservers, but it
> appears to me that keyservers are kind of a thing of the past now,
> especially when it comes to uploading keys with signatures on them...)
>
> ----------------------------------------------------------------
> Block patches:
> - Make the backup-top filter driver available for user-created block
>   nodes (i.e. via blockdev-add)
> - Allow running iotests with gdb or valgrind being attached to qemu
>   instances
> - Fix the raw format driver's permissions: There is no metadata, so we
>   only need WRITE or RESIZE when the parent needs it
> - Basic reopen implementation for win32 files (file-win32.c) so that
>   qemu-img commit can work
> - uclibc/musl build fix for the FUSE export code
> - Some iotests delinting
> - block-hmp-cmds.c refactoring
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

