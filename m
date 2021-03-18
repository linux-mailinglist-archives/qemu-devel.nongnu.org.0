Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF53410A3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 00:06:56 +0100 (CET)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1jD-0000pi-PC
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 19:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN1h0-0007pc-4T
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:04:38 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lN1gy-0006Yg-Ia
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 19:04:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id j3so8632411edp.11
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0HXKEedXpeGB26rzVZkNW5hHu2/armxJGbpPvcC94yM=;
 b=No5JQAZjqU5zVjsT3i3rsUUtFROxEeJLXcaK7inJmRLZxKVzmQ+9xbHpRTn9NQowle
 oEwrH3P/qsvEXIU5tftSEaJxFwqYcRsEbaDuqIrBj3E610iMFEb+mU6dcdUraA+ZbOSQ
 orgRCOC3+/+umdPQQ+vk907apn58BFhOYC+IUuEYe1LbjUjEDF6JQxblqW+z7mrh4eEv
 jY3cnJPN57aayge+ySDqpLlfdIPD38X3Qm0WFAj7zkntANT6rKE9yd1Peu0PBiLp5h/+
 Wt3lGvGQmca1rqSVF59MU5GdmW/Bt21p0T5WBnVJymxzBB+04IDlgRNvXehb6qRu3Naa
 u3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0HXKEedXpeGB26rzVZkNW5hHu2/armxJGbpPvcC94yM=;
 b=IwHUliZ5anQPehKiiyiOe7mpgs4kMlKay5Vi9ZaFieWxsnRsDmKc9UKFwNcTq3YoMx
 9by2cEpsGE58YFWvwv3Uffw5WT5OsG1qThsE/g8c+Q2xPcGTB1zBRLDe0PDruttBCFpr
 UJnbnW+xKE/z1b3S1VEqKUpRez17VtZtPein1WzB4uou4MO05X1O2fqmgPkFwaapXI8z
 pPbHVFtpagyLH/x1bhUWdMHowOnY8woU8eKG9gHyy2pVvXV8YzMFRZm6TM67jnvtgk78
 SlXj6E6ZOWa+Yn1uaYBqTaMhDq7LX6jgdQJoTxpigNMD/rrKkiy+UjCUVYkxGJ/Dz8De
 4CUA==
X-Gm-Message-State: AOAM53349QYkk58DcCZt78Gq5BFhto8fzdCvatkW/6Nm7OhxfSqnqWTg
 MAPqIL0a+a73/2khdvzkbd9Kcbg6DiVT6USdEu64pN5ehSFS9NbJ
X-Google-Smtp-Source: ABdhPJwV1GyvkmtXy2Uz0lzZ3+ZBO4zeJ8voJnHELJZsMFJRx9pVwI+MdRccHzePzC9PItiNWhmsyqGip55cGjDr+sk=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr5389166edu.52.1616108675275; 
 Thu, 18 Mar 2021 16:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210318122739.634472-1-armbru@redhat.com>
In-Reply-To: <20210318122739.634472-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 23:04:10 +0000
Message-ID: <CAFEAcA8smviRfjAo2=pv6NNEz76kz51VYB4cXN4Hf6LssSCqmQ@mail.gmail.com>
Subject: Re: [PULL v3 0/6] QOM and fdc patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 12:27, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 571d413b5da6bc6f1c2aaca8484717642255ddb0:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210316' into staging (2021-03-17 21:02:37 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16-v3
>
> for you to fetch changes up to 3e659bd899d321fb4a56527cb8e5d3662a889c11:
>
>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-18 09:54:27 +0100)
>
> ----------------------------------------------------------------
> QOM and fdc patches patches for 2021-03-16
>

CONFLICT (content): Merge conflict in docs/system/removed-features.rst

Can you fix up and resend, please?

thanks
-- PMM

