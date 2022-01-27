Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBE49E307
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:05:12 +0100 (CET)
Received: from localhost ([::1]:58282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD4Sd-0001j4-Dg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:05:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD4KK-00079R-1t
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:56:36 -0500
Received: from [2a00:1450:4864:20::430] (port=44787
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD4KA-0007US-M0
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:56:29 -0500
Received: by mail-wr1-x430.google.com with SMTP id k18so4547418wrg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 04:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIk2B6ruwOFjPPFmK9Jof83tdqLWOlnMCY6lskTOrjE=;
 b=edMbiVllqUm7A6lO1c37LfNg6YSnwGEJWxmJnhxkCXhenEd6+O2XQml8dIml3901bT
 CV4Nap5bL5s6px8XSMmICI452ROVw2a1ar1rrObvJmx6F7zFYS2LVHMEQgyJ3JYigeIV
 nUDep42z6mQL5CFBXtfu+hCqC+To376iqQAxciMqFhIG1uejo+Vf2Qx4gYTlFjROuvtq
 QbQX6Rr5vEhsl2F47Ha3lx7k5cryCYdFjlfsQ41t1f8haZGE1F+aEiTlYkJQBYmGlpU4
 2ogIQnLX2DrId75DgY12PSC06dOmIcMDCE7cGhQATBUjb4FPqrzD5EciQb7aJdq0gGPY
 JgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIk2B6ruwOFjPPFmK9Jof83tdqLWOlnMCY6lskTOrjE=;
 b=xwbXulSdpdI9IqN78JzHw4JWfCgaB1AUbVOyX0iZGvGtYq9cIh4gd9vdQs8pbf6Lmb
 vu5M0leyS7+W1XJELW/bXHHeByyMj+RouQNsG/X0Hn5gPVFGwRklhgaQY8UahQEVH806
 Q3EUTqP+0tvz9NJrgRCOZcHnpll80g1LXoVFDLe41qMZ+tqBzvBGpaKniFiSjpn2mWeC
 rBrMmI5zwBoPKW2Yqsk65mwdm9XtMuKb4X5rbaDcEtwkZiPzbUPw0v44f+rOEiOJCW1w
 UbsbWW5E68YFuOGFm3yRF90TiZgyT1oK+S+N+h6CkHzr9q8HQH5qu+Bdevimy/w80Juz
 6ZDQ==
X-Gm-Message-State: AOAM5312icfXRhB9C9SD7J7kPUujG+8/SUdcFRBWJwJwDE++0YZmE7FN
 F3XTGkeIhOXRxb/Gfggh5kC7BNlvhMxfzxr4yDMvNQ==
X-Google-Smtp-Source: ABdhPJxPLBswowkgS6RllCdfMy+gCO9AJKzhujQPX7lzlIQ0D2BlCS/kqg/zipz1ejEyDU4nqK6a+4LVI8FQUb/DgIg=
X-Received: by 2002:a5d:4573:: with SMTP id a19mr3016625wrc.319.1643288185115; 
 Thu, 27 Jan 2022 04:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20220127112859.222484-1-armbru@redhat.com>
In-Reply-To: <20220127112859.222484-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 12:56:14 +0000
Message-ID: <CAFEAcA-63VsRor-FbOo7KhR-5R1a2AeBmJc=GzNTZmPoq5kWWQ@mail.gmail.com>
Subject: Re: [PULL 0/8] QAPI patches patches for 2022-01-27
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022 at 11:29, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-01-27
>
> for you to fetch changes up to 5161c168b44f3a8fcae8c4f29c81f374ab0af8e1:
>
>   qapi: generate trace events by default (2022-01-27 11:28:44 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-01-27
>

Fails to build on the CI jobs that build docs, eg:
https://gitlab.com/qemu-project/qemu/-/jobs/2022584945
https://gitlab.com/qemu-project/qemu/-/jobs/2022585026

Warning, treated as error:
/home/gitlab-runner/builds/CMuZxyfG/0/qemu-project/qemu/docs/devel/qapi-code-gen.rst:1634:undefined
label: tracing (if the link has no caption the label must precede a
section header)

thanks
-- PMM

