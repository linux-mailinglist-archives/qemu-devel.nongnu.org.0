Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04032222437
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 15:47:30 +0200 (CEST)
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw4ES-0008Um-Qz
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 09:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw4De-00083f-CI
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:46:38 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:45497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw4Dc-00075v-A9
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 09:46:38 -0400
Received: by mail-ot1-x334.google.com with SMTP id h1so4208495otq.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jul 2020 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YRmjzRgsY5nHWRvfGWos/yrD8/aWPFlBmoJVJanVGHQ=;
 b=MhcKW7ljYJACnna8U3op6YNKfjtYu4SNumN/7zgVFFDhjepPqeeo3xymJHxCm+BnBL
 dmFDZQFyUBJVWobpGSdSlEK5ZaBcS94GbCNoh6ukaolCGxWs/Tx5FgRY+i9Lz39ei2vY
 VOh6U6pzZWhFFiBL67V8gQJa+KCzzs79csu80ySNRenXxFTTRgaN8+rIJ+XmaaEK9UyW
 bA+jKVqQ+6TSgg+vatPxCHn8WM0Jx70O9WzQtPA37r4J0zdqWR5jcayOD3EhywBli8eM
 mUzRUmXox2/Mn7jTPED7SwZ0r7RczMdx/TEJlLoZ5PJELnKw98KhBNWOygqtTj60ALa2
 bw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YRmjzRgsY5nHWRvfGWos/yrD8/aWPFlBmoJVJanVGHQ=;
 b=VzR6otbcHSQDG8+/8ZKRdXavvUU2zbbBObL9BIezNTNjA6Hmxt/epfo6Qy8Wsrc4C1
 baBF9nApkfBEjsag+J+uSs7yKOpT8EiAey0dJwg1lluUJ9wdedV9HjwhxwjemsWvIkcU
 2kdq/xTNolkCzqvvvWDqa+0GjoujzYCmetW5Rndd36gYcWK/1Ozqx3nJScDVdw7Tyhpz
 5XQS/TonLf5pTPFj/dOwOyTeDTLtLVT13q2yX++xDANlhr1Hdcbh0sx5FXdN06NeXhLE
 37CjTpxZ5OEwVOz77lp3msmeNvjeJoLSxMSSeOIkLWh6wWEFQRfUZj8z4yD8TOW/OOMd
 9ESg==
X-Gm-Message-State: AOAM530mq2DN3DLC3L5qfOxYTRg8XKSqfrxUWKrobX6AOJOjTQ1vjQ5G
 LKhwV8ssAVuRTMn14WgkjnfzO4BW7uYomwAxWM6idA==
X-Google-Smtp-Source: ABdhPJw64Pvj5OhrJQd6s1WzB8d/6cM4CF6MXjSlK1dlngNKHY7JziEpfESzyhXsIzp9a6szt1vmdR7Gy9d4GrB17vU=
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr4626989oto.135.1594907194940; 
 Thu, 16 Jul 2020 06:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <1594821201-3708-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1594821201-3708-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jul 2020 14:46:23 +0100
Message-ID: <CAFEAcA8exoP8ouarcytKha36HSm7kLBy36pD2+sMcaAuR0RjLw@mail.gmail.com>
Subject: Re: [PULL 0/7] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 15 Jul 2020 at 14:53, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 673205379fb499d2b72f2985b47ec7114282f5fe:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/python-next-20200714' into staging (2020-07-15 13:04:27 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to a134321ef676723768973537bb9b49365ae2062e:
>
>   ftgmac100: fix dblac write test (2020-07-15 21:00:13 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

