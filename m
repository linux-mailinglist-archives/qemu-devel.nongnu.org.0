Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86A4E3257
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:28:07 +0100 (CET)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPZO-00050J-GS
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:28:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWPYM-0004GQ-IX
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:27:03 -0400
Received: from [2607:f8b0:4864:20::1133] (port=35539
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWPYK-0003cM-JK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:27:02 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so170670317b3.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pxKc5L8kUnb1896+4XEhyP2VAySPAKk4fOljaaYqwGA=;
 b=orcqCGk4yAOXZ1aHt8J4MqcFD6ohYsiJcOUPE7FdTHHc3fw46IuqSliL0kY8hxPSv+
 bVsOFHzSmQxCFU7RrZW3JG9XYuFVOXd57jYkYTDGQY84ttResUb+9kaAuQq6jFs7oPyR
 p0ks0QDoFbyggETBk8lyaALHP6AAqnSlL/w54okY6dS4cgIwTmOXAxi4UbmSLXnpxzoi
 PVDGycKYuetK6cD431CfROJN3w1E0+HFUwMrQjjzpjF4y+q0T40O+iGyMDR5L4Ej6h0Z
 zG3sxJA305e96Q059/Q0mB+0QYeB/iXHgEBDyNIthwvEBS4x/vzAvmKmcangEUzHRYb8
 te+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pxKc5L8kUnb1896+4XEhyP2VAySPAKk4fOljaaYqwGA=;
 b=TUFcy3M42VN3rtRxzu9IRAb0gzxKzWN0k/7So7Slfl16JcTUVrNguVJRRhM3JC/tNb
 QEOdPmApOewwCL5dSvdehKofAmxrEa8ihrIc84qJPYF3lwZiTdnR250kQhE6/CtW89up
 VyVQ4h6+Hj44JvZot2AuYBPgKAg6ktce7Gp0jb/fKAFx9/PzRvNTXYd+gRVSZiJ4+N9S
 asCiTESbeoVSq7XyFZfuS2ZRRbwcfWQp2qgbALhCp3Dsy01MUzy856VEa8YAb1kZyeQh
 ypqfllNmxAkfFMdEgqZ2MMuHyxDLFdw0fGZt1S2jhD/sins2SWpC0U5zJ6e2NCUYX2cK
 6DTw==
X-Gm-Message-State: AOAM530TmfeTjVPkulebBsNY10BavFxl9fgY/62gia0EqRMCELvbw5OQ
 XepUV3/xJXXy49CbLUsfYvbM8S+MeAK3A+Qu24dAx4axzB9Qsw==
X-Google-Smtp-Source: ABdhPJwiuofefrTy+tTbalVb7U88tEHAxdem5+UwSWTOvVroTTvIIID2ZBWdrqVSmOQNcgjUxvykgCOPN48tXr9fAPs=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr26747455ywb.257.1647898019424; Mon, 21
 Mar 2022 14:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220321145853.2523825-1-armbru@redhat.com>
In-Reply-To: <20220321145853.2523825-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 21:26:46 +0000
Message-ID: <CAFEAcA-GtQCBS9QHys1Q5L6No65183Sq9eLOdeixXnhGzeQNPQ@mail.gmail.com>
Subject: Re: [PULL 0/4] Miscellaneous patches patches for 2022-03-21
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 14:59, Markus Armbruster <armbru@redhat.com> wrote:
>
> If it's too late for trivial cleanup, I'll respin this with the last
> patch dropped.
>
> The following changes since commit 2058fdbe81e2985c226a026851dd26b146d3395c:
>
>   Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu into staging (2022-03-19 11:28:54 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-03-21
>
> for you to fetch changes up to b21e2380376c470900fcadf47507f4d5ade75e85:
>
>   Use g_new() & friends where that makes obvious sense (2022-03-21 15:44:44 +0100)
>
> ----------------------------------------------------------------
> Miscellaneous patches patches for 2022-03-21
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

