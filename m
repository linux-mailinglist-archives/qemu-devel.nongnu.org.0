Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE94332E69
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:41:44 +0100 (CET)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhId-00039y-Db
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJfBC-00036B-C8
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:25:54 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJfBA-0003Hu-Al
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:25:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n22so2641150wmc.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cEXjZ/2EEav4lWf3p4nBwvn7lftTs8ugoeYwlGV5DoM=;
 b=B3Wwh6Plg3JYr204AIX0s5RM2W6QcqufJVe4DkChpnyevJ0nHvVIvejtfbkmZN07Wf
 UPhSdIS3yJovTYEfG14nUqasINw3c0fxNJBarIjGHCT0TIJcoUDWPtrX3OSsEBySltHB
 JY66MBB9kmU0//D2rc61BLjQtSbNMecfU2j5z03NdTlTUUmeb4ifHZCwXHtOT0AIZFfI
 YYmGODblUSRkGOd4uDkJ+E4CrPa/mWQWKB2559rAaoiWbmaU0Wz8/2dbrkGAE55psvQC
 sfrrxpwin5Bmh4r5PUxY6PPr+zuPkk7kRPXqKADiEMYu4ZNx6cPucj7SihDK7xuLWd8M
 KLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cEXjZ/2EEav4lWf3p4nBwvn7lftTs8ugoeYwlGV5DoM=;
 b=XF5CiiQGdv0usJzbSorlOTMXigLREcpNR4dSjYyoW0Lsr5Ug5r+w5CvRWVi5+jXv3T
 nryjIbeCMpuQhhEAucp8jimyFy9sW5qamHmColc5lxtyTYevCO/pH2bNX3AaCRMPW/sb
 JDwPYrrSzT265oheh1cfnpHI8GhNQcJlgql0GySYvlO0nAvkcimaog+8eNaFFlj5zVhL
 fyvusjsPkGST/dn7HeyIzDei2fdL/FUAHsPtLcdUtvC8ISh/1y0nmWhMnmdqIBf3gs7y
 YdbMHgQIRaEhZO8W7ExlJKRv/sgN4BzdMOsmwgn1G6dP7sqhoHW7oSgktfh7xBHwa9Qp
 n5Ng==
X-Gm-Message-State: AOAM5315/TIeU31OhIRfjY/UvROtHNa7acBIalzYu0x668ziEiGCE7O4
 c45cq5N7ih0ASQfmhipv0rsxIg==
X-Google-Smtp-Source: ABdhPJySr9nPQMG1pJfJ0lUin6RXgcV0KwjezxfzgZ9OYrrtDZ0Ls20lIWdb2X/8zBnzmGoWP0z38Q==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr4949328wmb.14.1615307150237; 
 Tue, 09 Mar 2021 08:25:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm23502148wrt.68.2021.03.09.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:25:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 74DA21FF7E;
 Tue,  9 Mar 2021 16:25:48 +0000 (GMT)
References: <20210309112356.737266-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
Date: Tue, 09 Mar 2021 16:25:41 +0000
In-reply-to: <20210309112356.737266-1-thuth@redhat.com>
Message-ID: <87tupk8far.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Willian Rampazzo <wrampazz@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> The status of the gitlab-CI files is currently somewhat confusing, and
> it is often not quite clear whether a patch should go via my tree or
> via the testing tree of Alex. That situation has grown historically...
> Initially, I was the only one using the gitlab-CI, just for my private
> repository there. But in the course of time, the gitlab-CI switched to
> use the containers from tests/docker/ (which is not part of the gitlab-CI
> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
> completely for the repository and will soon use it as its gating CI, too,
> so it makes way more sense if the gitlab-ci.yml files belong to the people
> who are owning the qemu-project on gitlab.com and take care of the gitlab
> CI there. Thus let's merge the gitlab-ci section into the common "test and
> build automation" section.
>
> And while we're at it, I'm also removing the line with Fam there for now,
> since he was hardly active during the last years in this area anymore.
> If he ever gets more time for this part again in the future, we surely
> can add the line back again. I'm also removing the Patchew URL from this
> section now since Patchew's files are not tracked in the main QEMU repo
> and it is also not maintained by Alex, Philippe and myself.
> The maintainers of Patchew are still listed more accurately in the wiki on
> https://wiki.qemu.org/AdminContacts & https://wiki.qemu.org/Testing/CI/Pa=
tchew
> instead.
>
> Now to avoid that Alex is listed here in this section alone, Philippe and
> I agreed to help as backup maintainers here, too. And Willian volunteered
> to be an additional reviewer.
>
> Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Acked-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

