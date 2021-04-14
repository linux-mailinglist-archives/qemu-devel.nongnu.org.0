Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C959035F4EB
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:37:08 +0200 (CEST)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfhb-0002cf-DY
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWfgS-000276-4X
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:35:56 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWfgO-0008R4-CT
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:35:55 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so7910675wrm.1
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=P1cIAxhfaytO8R7c7r0MvpQ2wAmXXlOCtzEXSsk5B6k=;
 b=aWp8bSi7KU3J/hGvwKXRAs4mJTtpcOM29iAw19YLXgBILLOhb2jntkTmcUZu9eTcln
 tiMuL4VapJ33m8RFpFix6YV9u+uGBfi3Z5jiUxUuQvXvWLawAaXp9GwrBK+PgEhlAE8U
 oyuXXWsSho8Nrac9K9SKBfHyPwbYGF7G2QppdUO90aZ0gDNQP5awCMdIt5fBY/sctJAF
 SRHkpzHjuRfcxuEI2WoFC/iVpYhN8vY26Fr5afcj9AmTDi5hAh2izqnHQc3BBYpN1pLx
 J0vcjZhPLBMYg7YRDTVj+T9O/1PdGN+gfs2PZfEa9GpbuYJ0fI/zjmy6mD/oA4GRE6b/
 ol8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=P1cIAxhfaytO8R7c7r0MvpQ2wAmXXlOCtzEXSsk5B6k=;
 b=UwQIKz/fuimhHV8wff9rwhOVNrQIJKXeIItCnIacg5X6YgT5aUOyyTQq0/mDqh/dnp
 mPQqd44VRQBDATGyw0LKmT6NPdZ7mlglaz4OMB9o9yTp8lAqoo5mKwEHOdfyrWacsM7Y
 S9TvuwSYn3g9/YaqnaPRRgGH8vvFTqaV+XqCsqX1KfGIZFU9QDMwXVkqKpx83vRAgKnE
 Njr4/vtOJnD7e8pT1khFbi3GJTFyCIz9ZIOLm9ReKRVX9Fy+lcq5HojfL18XqIff1xNr
 uIjqW8esC8c5jJ4uihAzAtZVEIVlQGVWt4XwNfBAKNM76AxKyDDgAKUYAfWBJM/Oloyn
 LqpA==
X-Gm-Message-State: AOAM533lKvlhxcJFFvnQFZS8gwPQvpVCT/qoeaRbDjXF3BYFBfPd1jtk
 8aX2aF4KyuxTCkMSh/2XQAKWXw==
X-Google-Smtp-Source: ABdhPJyB9YVRVcMfpMFIkhQmPgzVukt1k3lcKE7/vFeY5SYQtT8f5v75srstIKDXsBMoJznYi3yQ9g==
X-Received: by 2002:adf:f150:: with SMTP id y16mr16591656wro.186.1618407350693; 
 Wed, 14 Apr 2021 06:35:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c12sm24677851wro.6.2021.04.14.06.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 06:35:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D2131FF7E;
 Wed, 14 Apr 2021 14:35:49 +0100 (BST)
References: <20210406082947.672708-1-andrew@daynix.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [PATCH 0/1] libbpf dependecy for docker containers.
Date: Wed, 14 Apr 2021 14:35:43 +0100
In-reply-to: <20210406082947.672708-1-andrew@daynix.com>
Message-ID: <87wnt5kmyy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: willianr@redhat.com, thuth@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Melnychenko <andrew@daynix.com> writes:

> For eBPF RSS steering, qemu required to be built with libbpf.
> (https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html)
> So, for few docker containers there was added libbpf.
> Some docker containers doesn't have that library, g.e. Ubuntu 20.04.
> On some systems, like Centos7 or Debian, libbpf is pressent but doesn't
> resolved as dependency by meson(may be pkg-config issues?).
> On those systems qemu will be build without eBPF RSS steering.
> The patch privedes changes for containers that able to build qemu
> with libbpf: Alpine, Centos8 and Fedora.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

