Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1462484FBF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:05:42 +0100 (CET)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Eo-0004mb-2d
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52Bc-000336-78
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:02:24 -0500
Received: from [2a00:1450:4864:20::52b] (port=34477
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n52Ba-0005uM-Gj
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:02:23 -0500
Received: by mail-ed1-x52b.google.com with SMTP id u25so37805241edf.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 01:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cic571afCdenoYIujAwgJbnniDoPB8tOxI+wfTikR5k=;
 b=l0Qlti2lhtyKC6lgw1uHuSBdFN4fMnoe7Lj7Hi/Xn8CXvtxOyHL4ajOShRJsGbwCar
 HH0i8PaNVPPWPJ88VbKigQqIinZ47Lg1VnsR5b9KQAkO5JoTNJAFspSvhkbEFIJTZzov
 vrlRKHpJw0PPUCNe03vGATW3KmpJDsSjEyscsvNjg2GA0xcOu3yYRUg0Q3NKrF46Y6Mp
 ZjUzyT7OpBuZmFLSoZBL4ZABlUY2lBtiDb9NA96KirBojOQBkZ4ZjXj4QkAg27lj/UCZ
 f+Fo334VyK2wNq7cKswpAgGHg2tXJQNwDclEMQ1T+URbJ3oIhul/RH8mRC40od9umyLs
 V8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cic571afCdenoYIujAwgJbnniDoPB8tOxI+wfTikR5k=;
 b=oQjs0++SfZE7zX3s9gKtxFmwc5MnV3Pi/T/52y9IXwHThId74RM60m61aoRzb6TIIv
 20I3RLuE/bSbhwA0bZCh+WBgSYWonBDwJgyarILuodPJXeXJaRA1aMtSilricFpFkIHo
 PZqtVlCa++6bQa+YqR3LYciz0MG8NCU6DCd2RUoiohJHDJcONa8gNetrf5DIWPYw9scI
 cpun3i3yBCn8WkEMHvRFg+KnOARaQCUsIl5txS2sonwSBn+Pjr7kODpIkRpxI249ljQB
 cYPCX1haw4cPLZjuPjMeAY2xp/6/GMuHo2gFfZBUgephxTiOq3rrbA5O5jU/frBxAaj2
 KJwA==
X-Gm-Message-State: AOAM532n0WQHuAqrPzKyjKEAO4C9kz8SkjRiq8tThuNA6yhgW5t1e72V
 O13XRgwXCEduCQFkSFkky0UYpg==
X-Google-Smtp-Source: ABdhPJxaOyCXEylrKzYY9NhY6xvmeZw689kVmnOedSlebjGJAU/sDnv0uOogjtOgc3pQat4GZXla+g==
X-Received: by 2002:a05:6402:2788:: with SMTP id
 b8mr51355954ede.305.1641373339705; 
 Wed, 05 Jan 2022 01:02:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p5sm15543368edx.34.2022.01.05.01.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 01:02:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CB191FFB7;
 Wed,  5 Jan 2022 09:02:18 +0000 (GMT)
References: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.3 release
Date: Wed, 05 Jan 2022 09:02:12 +0000
In-reply-to: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
Message-ID: <877dbelfmt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Philippe Mathieu-Daud_ <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brad Smith <brad@comstyle.com> writes:

> FreeBSD: Upgrade to 12.3 release
>
> Note, since libtasn1 was fixed in 12.3 [*], this commit re-enables GnuTLS.
>
> [*] https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Warner Losh <imp@bsdimp.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

