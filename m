Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5105C39355C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 20:19:25 +0200 (CEST)
Received: from localhost ([::1]:59764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKbM-0003o5-CY
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 14:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmKZk-0002n7-V1
 for qemu-devel@nongnu.org; Thu, 27 May 2021 14:17:44 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmKZg-0007tW-OI
 for qemu-devel@nongnu.org; Thu, 27 May 2021 14:17:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id df21so1926577edb.3
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 11:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C6qvDFax//zxNjRs9KED2GzHvHyZhKPtyVzLWapsNwQ=;
 b=oKm6Wrh9vDtuC41r0x+c1i5U+/7dEPOMk4W+1Y8MBe+pXzmkYICx4wk5Uo4Dp2RJlf
 SVOcvXZtageBVYErkB5DWoulnRRU2yQ3+ig6sY0kjFFfgOsyQL+9BmK2PkkISKXmODFr
 eVw69JpJMauQVT2EUMQlZ+X4GM/AdXjnOv3jcVxRfpI5T0Jv9ZaztpUdOPiIxnYkDUsy
 HU8yuG9uOjevDgA1igPImxdOHh+TjSnZiMRlEL6n2pbXIOL+D2KZQPp8hTbH+9oOPvfX
 hW2VmpLLJgYF7WEJuZ7fuhvIx2O6WkvrcM/kt3CnwLBLd37XroakLBv7DMrSEPgbr3s8
 A6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C6qvDFax//zxNjRs9KED2GzHvHyZhKPtyVzLWapsNwQ=;
 b=UwOjRZBLoy92yn0TGq9dPw/jNt1lVKfPJcDltxxi8E5y7Mz8igRmZq3g+T9VCydvVx
 ln4mMxvrdEdon6Ygt264NdWiKRKAxsUceYV2bhK4x/j63yW+eXuoul4TPtbDLv4OMHft
 kZwV5oAa0+SgJbOzgIb6yiNAwLyxj/xR43EgGi0c8Z/6U7TflmU0GAQKSCSM04KgXgS1
 mxnscwGJv15ZdTjh8GqaULEeIcOqpKPAOwfhgWI0bksb2NIG+e5z4Gnej82vEZU79p9H
 jUXajNVP7DCoqNKkb9BIUPg187StYutOnc6dpToblAG2Nj+IMpVRQa2Y+/1eGxqdTTe4
 RQ8Q==
X-Gm-Message-State: AOAM532bAZC47ROXpv1yWLal+Bi5fj/mX0RS1Bi7eImAwatNOPGIzlpZ
 v6jenM/MoNVabY33NgAACe+t4GfqMTWXQKnODOqLAg==
X-Google-Smtp-Source: ABdhPJydZHZzlWeRNh+s65N2KMGqthbktIKnJx9YwNErGFXCFJCiFQTS1JqtSxDPUW+CMMuI5V/p1vnPMD4JdZwor4A=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr5626802edv.44.1622139458398; 
 Thu, 27 May 2021 11:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210527144533.688225-1-f4bug@amsat.org>
In-Reply-To: <20210527144533.688225-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 19:17:12 +0100
Message-ID: <CAFEAcA-=exas627sGuFNQZZTsrUsFzOtJUzSmvF4TjJiqOt-CQ@mail.gmail.com>
Subject: Re: [PULL v2 00/18] gitlab-ci patches for 2021-05-26
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 May 2021 at 15:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> v2: Rebased on top of 7cf333a3726 ("gitlab-ci: use --meson=3Dgit for CFI =
jobs")
>
> The following changes since commit 8385235ba99c53d1187658f2fc289b953a8090=
b1:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2021-05-26 21:05:36 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/gitlab-ci-20210527
>
> for you to fetch changes up to 2d9e45b9cb0baa7316901238f3795a74206af457:
>
>   gitlab: Convert check-dco/check-patch jobs to the 'rules' syntax (2021-=
05-27 16:39:23 +0200)
>
> ----------------------------------------------------------------
> GitLab CI patches queue
>
> - Explode .gitlab-ci.yml in reusable templates
> - Add job to cross build/test TCI on i386 host
> - Remove CentOS 7 linux-user build job
> - Temporarily set Avocado-based jobs in manual mode
> - Increase time to hold Avocado reports to 1 week
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

