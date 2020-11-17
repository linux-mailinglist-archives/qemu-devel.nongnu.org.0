Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA082B6B87
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:16:51 +0100 (CET)
Received: from localhost ([::1]:41640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4b4-0002ff-0p
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4KY-0005eb-Gd
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:59:47 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4KU-0000mx-CI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:59:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id m6so6713831wrg.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8zcLUjAnCSgQexp4c0AydwsSg1864iug7LLmfKYxLfc=;
 b=mJnp5kqCEwaQCIQg1On+DfC9CRSBpGjuqifXk+/+Bq3N9KHlZmRzXoO+HED2ZzTCLQ
 vxEQiQxDtXcdVz5xDyzYkWh9mqdmW3L9TAX94JzxiQnNrdoTfBxJ4Gt0duAlPTzlCPri
 pdHYKa5ZLfF6S8qMllpbNmnA0Djof+SvJyNmdv6DaJuOl97PKZJVgsuyLLYUHsAjmqUf
 bc7cmaHWg3i5YnSxTxwzg8YLEXNknoBn/0JBBsCrkdje5yKSGwpuIl6JQJeDzoNU062J
 DrXSRUXq21OsQpIDGsHtzxa+jSrErdL2k7d7QfMNlopwU7m9OID/hympzBy7hznK6pOR
 TUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=8zcLUjAnCSgQexp4c0AydwsSg1864iug7LLmfKYxLfc=;
 b=pP5NxoGovAYx6F+odlFyvcOSW+BLDq40QZ/G05R5/+ZpHKKFSaxXr4Y+nr9qlDNpEp
 rfglbCeeUPf8+ZLknGx2YjXdOchkLpiUgOXfUbsxvwjbBKv0oo43Is/Hmw1zkCFFSYBC
 X85CRaqYEdWwlWiyQ3qx5J47eFT6jhT+4jbb6xmTeB+YJEPcyzN2PwnACA8BFKis9zSR
 WP/UjWz8pFAyzupgSXxVV1Bklg7jHDhIvggyARmbk9VJ+A/ZL5kYZxA2UWDuMfUtZqtg
 cYkOH/7sm+xNK04h84SN1csKnhkcdZLxYPXQ9E5HFPshtMTgcy8HtyUq+lTWxsGA7dyS
 BuLA==
X-Gm-Message-State: AOAM530rdeHwP2Kkfh3W5NXcMeYl5u6wc8JFSlQXQXdRtFpfpy2Re17y
 nTN5zb2ElcX6XIKvIHwvCngA6Q==
X-Google-Smtp-Source: ABdhPJyWFlPSrUDrAFx/f+RiZ7dr+J5Q8hWUtbMXex7Hr4RjS/VwuRXaZmiqby2x6lTHHOgfxlLntQ==
X-Received: by 2002:a5d:4001:: with SMTP id n1mr477761wrp.176.1605632379227;
 Tue, 17 Nov 2020 08:59:39 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t74sm4579385wmt.8.2020.11.17.08.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:59:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E2081FF7E;
 Tue, 17 Nov 2020 16:59:36 +0000 (GMT)
References: <20201111121234.3246812-1-philmd@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2? v5 0/2] ci: Move trace backend tests across to
 gitlab
In-reply-to: <20201111121234.3246812-1-philmd@redhat.com>
Date: Tue, 17 Nov 2020 16:59:36 +0000
Message-ID: <87eekrx6kn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Extracted from "ci: Move various jobs from Travis to GitLab CI":
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758314.html

Queued to for-5.2/fixes-for-rc3, thanks.

>
> v5:
> - addressed Wainer's review comment
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   tests/docker: Install liblttng-ust-dev package in Ubuntu 20.04 image
>   gitlab-ci: Move trace backend tests across to gitlab
>
>  .gitlab-ci.yml                             | 18 ++++++++++++++++++
>  .travis.yml                                | 19 -------------------
>  tests/docker/dockerfiles/ubuntu2004.docker |  1 +
>  3 files changed, 19 insertions(+), 19 deletions(-)


--=20
Alex Benn=C3=A9e

