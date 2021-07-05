Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92DF3BBB51
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:35:19 +0200 (CEST)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Lwc-0006YY-Ka
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ltz-0002nL-Lb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:32:35 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ltw-0005oR-Mk
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:32:35 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v5so21478998wrt.3
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 03:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bWpRGGlsqGsSDwojZiUYLgWhWvneU9Vot6C3FOoTl2s=;
 b=AWxxfJX7AOZiH3DHfWWiYoGBKPinM0wYQ5D9Zu/cgB/7TNbjOBbhRI90EVz0bkCX9f
 qfi/utpI+dyWiUnYQJ0TwR5XEcCyYQlzAGA85LSaManQAgNn+x8L3PXyJQViQEh04fXj
 TueYx0Db82bAamlyWi9krQH4CZtgrtu4OIBwyvamxI3fQyQBLBMAfs2y40XPmnHspLoG
 915i4vGLmXYaxCi/3PHGuCOeLafQh7DeaxudjwhvEUHuvlaTFFynHrSlT/mlpf8J5RCQ
 hHIZ+FhHFPluNsiDUSbLKqYYaolh4b9oVgmDkaqgGF+h3BJ9TRVhLXQ4QF4ffrxabSzv
 3YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bWpRGGlsqGsSDwojZiUYLgWhWvneU9Vot6C3FOoTl2s=;
 b=omQ/77AqBTftMVZuU7zT5VUcFAXQnWHtdVn2wf6VsA/govUFvxuIa3GmIw2gxvBkmO
 wwCpS23HZEOfpMChkeWHwxJYRMBtnhVdzox2mlAGW7amwehJVDdn6abIN+SFvVkOrHTk
 jwiaOR6mTLgwoGEGZXN0LpKtpS2v70uz6oujjFAbo5u+GGyzh1V9bI0vG+GZRi4PKyF9
 0mzjX30kq8W/HxGULv2o+bMTOaDnVwCnPQmsdeS2QyGffWsklqfrwlPZYYaew3ug+VhS
 yOq+NIX1d/Q0o8892lYVnEkpcqG6h6znq6fxy+RvnKyz93ljlowDh1QdBEWCQM5HGDi0
 Tltw==
X-Gm-Message-State: AOAM5332HlHTUUHEZxKl7pmmJWI9S5fb3c0U3xzTlKW9FeiZnF3TH74D
 68z4Jwkgi++L1yq6qdjeHNB+qQ==
X-Google-Smtp-Source: ABdhPJy0zieQlpp865PDD3Pg2wBx2typAyFdTvYZM1KCdHYYVJiyphZsVcJF0TvoEERtR3HfPORIFg==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr12336975wrt.128.1625481150337; 
 Mon, 05 Jul 2021 03:32:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm7160518wrx.40.2021.07.05.03.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 03:32:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E17D01FF7E;
 Mon,  5 Jul 2021 11:32:28 +0100 (BST)
References: <20210625172211.451010-1-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/3] ci: use cirrus-run to utilize Cirrus CI from GitLab CI
Date: Mon, 05 Jul 2021 11:32:19 +0100
In-reply-to: <20210625172211.451010-1-berrange@redhat.com>
Message-ID: <87fswt59vn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently the Cirrus CI pipelines are completely separate from the
> GitLab CI pipelines. This means contributors/maintainers have to
> monitor two distinct places.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

