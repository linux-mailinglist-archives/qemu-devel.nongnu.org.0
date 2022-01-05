Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43824485012
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:35:05 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52hD-0001l6-UT
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52gC-00013G-AG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:34:00 -0500
Received: from [2a00:1450:4864:20::531] (port=34347
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52gA-0002Uj-Pv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:33:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id u25so38114767edf.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=V6PZ5Trmm6tP2n97lHcxww/2c6LVW5JuUehrjUUlVRc=;
 b=jqCJKLHZi1Nd6hoWLUnSCFVj8NtzcoUSp6LB9/vn84aigP6yVaOk08Jxed19Evccn8
 0tw0S5Jy3GGMSIdB5o8b7zsGZjs5OlWKG9Z1206gmJKJheGIGNfhL3i38UU6cvDi/e08
 fyAkHXsl9u1TxpWIXwfVFD7BCLVsrMGT577rzpoFjDk2j3ER7pz8emzttUcT8owOJ+DB
 xVQUPDQE9pcP41FlziA3Yezm/e0wIxQnp1G5e3J+yMSPWaw40H/wbbw+dsL/U/lCDqrt
 MAH35U04szCc9+cWcRRwGZO8zt7MmjNqbL1bPmtPUB762Jrp2uYYEkSR+jgAjiy/UI8q
 wjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=V6PZ5Trmm6tP2n97lHcxww/2c6LVW5JuUehrjUUlVRc=;
 b=BJUZtFsUOIvNbnXAaNsLbk9OqbO0klh1f14OCgDEMmzcTKCtRiNTNtc0ppUWp7Kym+
 fg3YWby9CkFTwyavZASwPRbm0ciPZD/KTzLi4VF3XFh63+r5Z+jj3sJqYVrlWX7slAt1
 ABVb0q9P5zZ9GNLKWLz+X1vIEmyAOgRtw99F6xsPdnu93XysgbRa07blWJ8ZFb9KN96g
 ibGzCy8k15gksBC7i+q2SvKQ8O756Trq5cDlxVD55m4sgY6m9njbXIxF6B8aypr5YRfI
 26LoiwUZsE1HSY9Thc/AoBukUH9HbWdTT6/P9mvfSSPZSlD7ua3FdRqWYEoC4KieHw+Q
 L/oQ==
X-Gm-Message-State: AOAM531C/lLsZaXApv7nXu1CgXcjK84gz/tQJ62TvNeebuqnmUXgl0cj
 NINdrmUKMs2nm+dxLgI+CWfbCQ==
X-Google-Smtp-Source: ABdhPJyOyWCaTmmLR9LPwgJyatVgf4u6yTRszZRhR5xmCv/HVC0P9QvwpwdS56hwue0TrR+f6zVy+w==
X-Received: by 2002:a17:907:7f9e:: with SMTP id
 qk30mr39984957ejc.313.1641375237058; 
 Wed, 05 Jan 2022 01:33:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gt7sm11975267ejc.180.2022.01.05.01.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:33:56 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94E501FFB7;
 Wed,  5 Jan 2022 09:33:55 +0000 (GMT)
References: <20211215141949.3512719-1-berrange@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 00/18] tests/docker: start using libvirt-ci's
 "lcitool" for dockerfiles
Date: Wed, 05 Jan 2022 09:33:46 +0000
In-reply-to: <20211215141949.3512719-1-berrange@redhat.com>
Message-ID: <8735m2le64.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Currently the tests/docker/dockerfiles/*Dockerfile recipes are all hand
> written by contributors. There is a common design pattern, but the set
> of packages listed for installation leaves alot to be desired

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

