Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F486A1E05
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:08:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVZfw-0006N3-4h; Fri, 24 Feb 2023 10:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZfu-0006MY-8I
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:07:54 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZfr-0006Lh-FX
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:07:54 -0500
Received: by mail-pj1-x102f.google.com with SMTP id y2so12468634pjg.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ft4O1tjm/YLs91exe7wTPyxaBpXjIY0Y6phZgKuTiWQ=;
 b=Yz472OgUj0l8v9zCkCVqGGxqdHoiefZDaZpR/6CUs4mc9UTN1xAtW4n3o+xZSB13G+
 PIgrC9zL6B14p57m+jRH9Gy4s7IN8ClP1bwyBLPpfKbpwADrsG2itDbAYPojRySdRC0y
 m6izO23ivYkyfeF4+o+RZ0GMQNfxPej6KU8j0525i6/DdkYDHvOkpzSQGV9J83Y2TmLd
 hxMPRjZ45px1niLus/JVMNvPQ1WvBD4TQswBG+hrTXFyOpvdciE2JkzABNkVy1A3ibNW
 WoWGqC/HAWL9KsEHj8hi7AnzLbDeRdqDerM7Gh8CjO0y7OnPHOT3dwCNmjD++blQHY7d
 ZJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ft4O1tjm/YLs91exe7wTPyxaBpXjIY0Y6phZgKuTiWQ=;
 b=jPEkpy8UxQM6MI4sfd9kYTfzJ+2UDDIZnxsT0zNlxKgaoe5sb/h4Wj/tmYzBfPck/L
 p0UMWhmBs5527tBFoZnvBcYEMMGQ2Pf6mt5R7DwmMPQb07LTA6rOJistLKXvlLDP3ucq
 KG42dibMc+RMnvyOJ5D1okmx4R2cil1zyVBgc2MnIFnhvvaqg1RBylpjc3WXrVPGntqi
 l/A7ZD4K+f0bqkJc+4zNPV4RGg5bsTXx0/fIyGVUEbZXKoFnGETQqwO0t8ZMLqRGDdOm
 bjHtrb3GAxDZ9PsBWUIWmuGX/DTg0uFCcM4kw53e882lwiHXHkfYq9oOqxLHI+s0JOny
 vPBw==
X-Gm-Message-State: AO0yUKUblrBnc8bzBP7Vbnk29gHOUkdQ/beCc2T+KvcOWRbsYCKDJoJU
 h7y4LIsvGOg0PNGYHzReHQMdyO/6ZG/k0lkS8+wG1Q==
X-Google-Smtp-Source: AK7set/n/1MD7DMnzO4uVSMSTeMDhz81eCYiYVjbLI40sfLH84lDHjPZAskX19E/78VgUpXjAaNWZ+04hLMQpBLJ/SQ=
X-Received: by 2002:a17:903:2684:b0:19a:9580:7130 with SMTP id
 jf4-20020a170903268400b0019a95807130mr3036313plb.13.1677251270078; Fri, 24
 Feb 2023 07:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20230223043647.3161732-1-jsnow@redhat.com>
In-Reply-To: <20230223043647.3161732-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 15:07:39 +0000
Message-ID: <CAFEAcA9RCkE+w452teVU-a94TvPbPdfX5N12ue4cUb2k4O7fbQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Python patches
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-block@nongnu.org, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 23 Feb 2023 at 04:36, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 6832189fd791622c30e7bbe3a12b76be14dc1158:
>
>   python: drop pipenv (2023-02-22 23:35:03 -0500)
>
> ----------------------------------------------------------------
> Python
>
> Only minor testing updates.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

