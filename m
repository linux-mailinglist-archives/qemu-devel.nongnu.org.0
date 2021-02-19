Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A570E31FDCC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:24:37 +0100 (CET)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9W8-00039j-P2
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD9UG-0000vH-8v
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:22:40 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD9UE-0000hC-Hm
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:22:39 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so11193626edd.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxhdRwM5zhpKE+OzA+0Qyf80Q9I0gcmFXMxJmiN1j2w=;
 b=PzX90BC6EcZQzztPM6ixQEvao5X9i93JVvOoBliJzK7AkwjtTxvK+S+rWoR83o9RPq
 LVg0qGFISsSOUHnYcy1KOiz0Xc+4+zznuvWqbb734FPych7m8pmk6CPg55P8HBfQcwYJ
 b9Ze2ctM7F+gKg70EeY1kESEXdY3y208MHru58WeB4aQpExaip/U5qUL1cdYQhKj1e6X
 8mm0yqHGeBgSyAW5GA8xH37fHZrDTQUqVxUoPKnk25L42KCbOtBjYwk1cKhF0YLLSwad
 d/t68PaVgvo0wgr5PMDU59qFSC7+jxAdQ/r7epfXJMlqOjMSBOnK8cXE7WwGDkeEtujC
 nvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxhdRwM5zhpKE+OzA+0Qyf80Q9I0gcmFXMxJmiN1j2w=;
 b=nNMS39duntj9Y3/R4beya3RlF4+hsa3QTwWQZKFa3bYGMgfoBwM/jK80RrWIduLQjN
 H74AbBSTtvlBima+FgFHIggP9J3X6wUm92malnLoliavLHSzygB6VxEAfAbWk/x5ssf5
 7bag9s6ER2QZH6NnY/u9qoL1evdAcSOH9oTyFWBna0bGbEP8yfQo7en6DlUOk8ejmUlm
 Cfz5OybI+MHIACo+eQ4eAmmhomvr/vjEn2w+pEIouyjxYBq+sfKPyqXAx2YTX88RI2Aa
 DJdZDE9yMfTM7g6FQNEGWW+w0OMqCGWp3XX+zPg2qbCpq0GqzsOzTcJKm9lNhuT4dGxT
 MJGQ==
X-Gm-Message-State: AOAM533Bu8933lYsgDJXAUKOhtyY8xkAOj72v4+OlTmFCj7S5DkKp9J/
 Kn2cbjnZz/dHs1n6D+fPHBI4ArZhyfpQ9QTeKD3J3ApAXbk=
X-Google-Smtp-Source: ABdhPJxsVxDB5c65ckSgNVFF9uLBIO+cIrXX5odt8BJSQ9GK3FR60IEAnKe31+dTFXGwJOSVY3vKQ0L0FUw9xddFWqQ=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr10236620edx.36.1613755356914; 
 Fri, 19 Feb 2021 09:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20210219075738.2261103-1-thuth@redhat.com>
In-Reply-To: <20210219075738.2261103-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 17:22:25 +0000
Message-ID: <CAFEAcA8CDVU-0_b3fUHPrMmUNa+7Vz9J-oazPgQA+OU5kSH1iA@mail.gmail.com>
Subject: Re: [PULL 00/10] gitlab and qtest patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 07:57, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit c79f01c9450bcf90c08a77f13fbf67bdba59a316:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210218' into staging (2021-02-18 16:33:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-02-19
>
> for you to fetch changes up to fc4241827fffc761f0ca41536c1c7d88b1b1d0c4:
>
>   travis.yml: Limit simultaneous jobs to 3 (2021-02-19 06:31:40 +0100)
>
> ----------------------------------------------------------------
> * Always build the container images in the gitlab-CI
> * Some other small gitlab-CI improvements
> * Some qtest fixes
> * One patch to (hopefully) silence the failing Travis jobs
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

