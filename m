Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA24A59E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 11:21:07 +0100 (CET)
Received: from localhost ([::1]:36148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEqHa-0001KW-QA
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 05:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEqEU-0008Sp-K0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:17:54 -0500
Received: from [2a00:1450:4864:20::62d] (port=44638
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nEqEN-0003iW-PK
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 05:17:52 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ka4so52432793ejc.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7ejQz4zmASG8K5kSmVEDZnl6Zusvm5+Hadrnix/u4fI=;
 b=aw1Cxg7ob0XoNVRMyEp6cRY+fSaw5LTsyjxNn++29i9p5GSX4KumD6VrEt6gx8lkI9
 r12DYIfrFZ2P8lMtIuW/QmkFEDtph0zQgIOvamfd21R+79WDqBUGatD793Hi0byvXzCb
 wy0wPAWoFlzqQYFEvwd+d2k0jiG5SvCqxsjtxGdX7GETsZ+JWhtFD1Oafb+UgGNFNd9c
 2N5ZYRpGd8qM9Dq9rrP73lPGR4cxRa1YmhvhdQM6Q/SBbOU198QC8pZl3NrG2ypevhii
 Dplh+HSY6kFzlpA6MJ2h05Vl8JaVQwEjwiq6lUX6CHrjlsHWngekuuxVz4GDRjFUp+JC
 M5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7ejQz4zmASG8K5kSmVEDZnl6Zusvm5+Hadrnix/u4fI=;
 b=km9t5oKGTNWvx8BqTrCh/i1Z/EdpwOcY8bYjhWmEw0oab1Jq3eFVirx1j78T55k9Ec
 4VkYtMniFSeURGW1mOfuecHe8a429V6UqHrqxUqiLwF+NpwM/JAqe5N/YsrpFdwjbonN
 t5CZQxEBvkzCkgAullMv5pyXBLfO/0bcLKVKi4xews0HE2LHAqe8b86eEXW01ZUhERxg
 W1+MKIK7aUkKgVzMqAUPvaYVHLBuwAV//AcM1SkC6spgAdyj2Rl88AhQM4HEqzDoTEFD
 CEZfnvLUPVlxQuOLN6U7CIK3LWDyePzq/t2/6NVUvvisb6LEjgT7lDjhnfUDvDDXr6vy
 OwTQ==
X-Gm-Message-State: AOAM531dGPvE9p1Fa1slutEtb0f5Jxp6OrEH1ouSlaqmZD9YNudIPQHl
 41aVcR1azR0myvGQg3XE66TcFQ==
X-Google-Smtp-Source: ABdhPJz7sF16pAovZOML+m8FDYyTSMXjEoLRfSia5K5P3XAPSNXBwalcL3SY9N9ln0+iZszKuCFfng==
X-Received: by 2002:a17:907:2da2:: with SMTP id
 gt34mr21138097ejc.620.1643710638945; 
 Tue, 01 Feb 2022 02:17:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k7sm14309930ejp.182.2022.02.01.02.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 02:17:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89DFE1FFB7;
 Tue,  1 Feb 2022 10:17:17 +0000 (GMT)
References: <20220201085554.85733-1-thuth@redhat.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Date: Tue, 01 Feb 2022 10:17:12 +0000
In-reply-to: <20220201085554.85733-1-thuth@redhat.com>
Message-ID: <87a6fazyaa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?utf-8?Q?Daniel?= =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> When running "make lcitool-refresh" in an out-of-tree build, it
> currently fails with an error message from git like this:
>
>  fatal: not a git repository (or any parent up to mount point /)
>  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set=
).
>
> Fix it by changing to the source directory first before updating
> the submodule.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

