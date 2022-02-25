Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EC4C43BB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:37:00 +0100 (CET)
Received: from localhost ([::1]:40262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNYuA-0008Qj-NM
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:36:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYlP-0003sY-EB
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:27:56 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=37808
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYlJ-0002WT-3g
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:27:50 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id y189so5233224ybe.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aNpdpGe/+RgHuo9YsNVbyMjrZeLmjVGQNQidJU5p0S8=;
 b=SWY1f+51MICbVFycVar0gxlp4T6mc3dX4Q+yWB4mdIhN1YhfmRGzAdp3kDHOic9g6z
 DK2+JFu6etcEGOCotX/0ztYVdQ2U2hGdgt74PP61PnFYvXNODt4Shh78H7cgrTP1XL1d
 oZhRl8BgjSjfifI6fiBRKN0YBme+pOMlLu+prTy2bvhXDh4uo/++SD0CdH2VoR6OorfG
 rloSu1PgogZvsgbhgii/SM8pXqVD/nO52TGKD2nCNKfz3i3xtzY3jtHBupenaSsrZ1Md
 g7xIU5cQWFKbBikgrDST3h/lv7U8oLZqmjoq7SVmdBqhjBj6/pX6VtBDPXENwGZLv/1q
 iEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aNpdpGe/+RgHuo9YsNVbyMjrZeLmjVGQNQidJU5p0S8=;
 b=cnwI8hteuR0Yc7ByoZ37crppjJKeU5Kl/ISDCkT+iTk3sv+wEoUbpOoRD8vEIXsLQT
 qNd31pOLEs5HNrMRpMCH+Ir7ygEtzsxzpsT/AOkqjzvEXpYeAjB0W2ccECpgjfKxKf6a
 k4Hfy+BHaCUTOgM4LKXo/E3dFD+Nuzi0nk0JD8Ll7BF9hIU4YP1g9oYCzKQC/2TzBskk
 3lyIM7M70TqxSup586kUGszsvVETzYt+pzZbW257nIDrwuXWU63W7nkJUGBH5FFxEUQh
 2XOB1LQSbnfR/bHfPMwkmtLzSoEqa61Q4qY3aI/I6aYAPHlp1hFpn8flJc8u4AS7VhgY
 UgyA==
X-Gm-Message-State: AOAM532rbzLAujx7xi4rxUIE40ZosBM+OOIZ3DRvivxfZEgxyVdAWuK2
 Mco22ZT6E4xOAfwtbhh7qHWp3Q4QmFnb31uqD37DvQ==
X-Google-Smtp-Source: ABdhPJx/wyRh5zblGtI+L7xiGs7+/2TWoB9ojfUo7In0btY+sSq0FEvPLWaC4v4halVQ5WRH2B+VZ+A7bdaNzSJgOUU=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr6734652ybe.67.1645788466858; Fri, 25
 Feb 2022 03:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20220223220900.2226630-1-jsnow@redhat.com>
In-Reply-To: <20220223220900.2226630-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 11:27:35 +0000
Message-ID: <CAFEAcA880OnkiU-t83hE3RqSpC8PzyZhV8PdVpzie0XrG-YjfA@mail.gmail.com>
Subject: Re: [PULL 0/6] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 22:09, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 31e3caf21b6cdf54d11f3744b8b341f07a30b5d7:
>
>   Merge remote-tracking branch 'remotes/lvivier-gitlab/tags/trivial-branch-for-7.0-pull-request' into staging (2022-02-22 20:17:09 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 89d38c74f4b69a93696392b55a9fee573055d78b:
>
>   MAINTAINERS: python - remove ehabkost and add bleal (2022-02-23 17:07:26 -0500)
>
> ----------------------------------------------------------------
> Python patches
>
> New functionality in qmp-shell from Dan, and some packaging fixes.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

