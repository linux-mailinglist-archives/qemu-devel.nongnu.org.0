Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85448FEC4
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 21:13:28 +0100 (CET)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Bu2-0006d8-L3
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 15:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9BsT-0005xA-Co
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:11:49 -0500
Received: from [2a00:1450:4864:20::329] (port=36692
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9BsR-0005vx-Kp
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 15:11:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so19589410wmk.1
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 12:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+H9EBh3/6fq4BMSWby97OzMBiXE0VkQ2mFGgenXMpXg=;
 b=oFZowQlqzPoBg9Nky7aMUBSuPY2VOI3Og/kK/KcpF6yAoWEEbpq4xG3P4R0R8Hcah5
 4tu9iZpGbN5h0GjEL0ERDvmT2It13nu9D8H18RZqwGyqWc/Yt3ZaqFn388NH48vWFPm/
 LfRv8GSnZc9lodZ++AO0+IGHHyp0rPAlP4a8c/upukiI5t2w6uGRjjMQeqsWeFezzPwT
 CbGMUnMdnntgljxQ4wriX3G82R970jHKyg5e/zTVg3na4ckoa+w8tCKCTIp6Z/uBlsyX
 yc17lb622b6ffyxj7e9ha6euSa7nh7swkMBPg65XugufoaDmMMy3bWbKny87qSlobW87
 X3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+H9EBh3/6fq4BMSWby97OzMBiXE0VkQ2mFGgenXMpXg=;
 b=pO8GniI0zRY8OpQn2X+nnzN7qbeUMCcWEJID9q4cXT43Elzi9f6yA7VfKqivL7e9rQ
 2oKf7kYcmMxO0rs5NWTo/CFO16Umxm3SATaQFpOEpOjxUe6h1xs83V4xg2s7D/mjdh2S
 BCrc8xCmRsU7YCKx2Tb44zwyl0gpU4d951HVvOGprB4w3/jEr/j+iSRnThHS0ipfy5t/
 0b4GaZqoU8o8vh27K3LcMcYATpyZIiStAdHA0t/E0gSF1cLUPJIgu5uA9eZt34qJggsP
 bsA8UT6z25wa4h7Klkhf/I4EfuqQwupniIWzessHxPtqmcRnItrD7ws2zxsu6akxwpC5
 SF/A==
X-Gm-Message-State: AOAM533adbBJ18VUnWmIVq1bDyjWNOw6XvUzV9VaCnKgMCFYfUxV00Mq
 +spn6oGnM5LKnRdF11o6RjRa/NC1XoRpL2t8ovVjtA==
X-Google-Smtp-Source: ABdhPJwQUr1lVdbL19bfbH0zJQPKgUgBT6OjKK5ZqEpSB+jpI3kH2AtB5j4wn5jAS+c0SAel7Vz4Egjsan11aCzsWsc=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr5736713wrp.295.1642363905974; 
 Sun, 16 Jan 2022 12:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20220110134644.107375-1-kkostiuk@redhat.com>
 <CAFEAcA_fgs1JAjMDXjd76xFWfmTMba1BfhYHFPrXCQyUk6o-eg@mail.gmail.com>
 <CAPMcbCrCSct7AEPgmPJ2qC+VQQGJcAqsJGJh4G0aS8mj4dRzSw@mail.gmail.com>
In-Reply-To: <CAPMcbCrCSct7AEPgmPJ2qC+VQQGJcAqsJGJh4G0aS8mj4dRzSw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Jan 2022 20:11:35 +0000
Message-ID: <CAFEAcA_Bthxb4uvaQ3CFK-ny=aGzxBfcg=WpCED_Ys7h7F09MQ@mail.gmail.com>
Subject: Re: [PULL 0/9] qemu-ga-win patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sat, 15 Jan 2022 at 22:13, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
> Hi. I uploaded my GPG key to keys.openpgp.org. You can find it by my RedHat email.
> Unfortunately, for now, this key can not be signed by other RedHat developers.
> I signed my tag and pushed it to GitHub. Should I resend this set of patches?

No, there's no need to resend.

If you get an opportunity at some point to get some signatures
on your gpg key that would be great, but I know it's tricky
especially at the moment and for the last couple of years.

> For tag signing, I use the 'git tag -s' command.
> I am sorry for the mistakes, this is my first PR.

No worries.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

