Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE65332B7B3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 13:06:44 +0100 (CET)
Received: from localhost ([::1]:42014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHQH5-00045Z-LU
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 07:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQFS-0002ea-SF
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:05:02 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHQFR-0002KI-2B
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 07:05:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id d15so8153282wrv.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 04:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=swxL2EPie1Ap9ziO1bok8bNLSuTgkrRgC95RykMzyW0=;
 b=rth1d23RKwgtL0wX01+7n17OhQkgFyWp3LSXZM23eyW6J3rtm3Qtv6ZPdstwTYWp38
 DERaqucKl6c/M+K+Dn0REDv5kmX1pxOB0ulm7NbVuvgoYI5tQuQEC3J2vg2fOiQqNfvg
 ds1BXzJqVMOZju+tq9vFvxT6pCNyMr2iRzhISsJ7U/ye6oYAEmtiMLHj9AtNkl+ye3l4
 WS52yTRqo+5Y01PUTcKdIdOanvU4rL7ylVJtZ9r/1xHpYG0jsNN8Lhj2Zc/Wz3c4C2uC
 +82tskRmc9lEDqPzwt+m49YO2rJ4jJjRtAVxnuYpE5sjr60g685dwlBQzo42RuhTsB/t
 9SQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=swxL2EPie1Ap9ziO1bok8bNLSuTgkrRgC95RykMzyW0=;
 b=f8TJFd6vtwLwnTHTUt6wlPum/qVnlr4WoQtZ9ZCHF07RhtAAuTUmufB1BmDgJqHGtY
 ghPBDDuh9Yqf6UIK2Si8vZAuY76IcyRddsnRMnfZgit0S2dvwpKL0ZKZbKx9zm4K8nen
 /kwK0IWwdYnlwEYaKcmEkXALgA3VLmtoiyobW2s/Jjy8M6BL6fd3gU5AZ3p/BKxe0ENB
 nOsvS4uFULH0/MNXs/w+Mg+JAVrt5daaDIrpxpYZ9DjfdRe821U92+CdvvJAUPV1Kl+v
 GW25hpfCqnsRr4tZXfIJ3vDoFG+AusNAeF7MdR75C7wmtU8ZXE3lb3u5l7749ZtC7gMa
 W5sQ==
X-Gm-Message-State: AOAM532KCjwaEbxoyOtcS3KC2odzQ6D1ZKtxaE2ARQxEJaF+aE/f0KGK
 S9x1itxUZz9FTjdVBqWgnoW59A==
X-Google-Smtp-Source: ABdhPJyDj55X8YHzPErWpirdox74ZsDqTrRG0m1ZYEuUZyMHVVXo1YYcBzRRv/oXo6q4BqbfSz/hAg==
X-Received: by 2002:a5d:4686:: with SMTP id u6mr6742102wrq.60.1614773099188;
 Wed, 03 Mar 2021 04:04:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w6sm10725587wrl.49.2021.03.03.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 04:04:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 068051FF7E;
 Wed,  3 Mar 2021 12:04:57 +0000 (GMT)
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-2-philmd@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/8] ui: Replace the word 'whitelist'
Date: Wed, 03 Mar 2021 12:04:43 +0000
In-reply-to: <20210205171817.2108907-2-philmd@redhat.com>
Message-ID: <875z28igt2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
>
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

