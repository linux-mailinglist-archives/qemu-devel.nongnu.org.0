Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A214495532
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:04:09 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdfD-0006RO-KO
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZ8f-0005CO-Iz
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:14:13 -0500
Received: from [2a00:1450:4864:20::32a] (port=47052
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZ8d-0002m3-F5
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:14:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so14434659wmb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IogVwR0JEQ1aQS9gzhq8kcdl8IFdw2NlrDiATe7UQD8=;
 b=TvcpVIAL5JiRVCpLJDBwtxFbbzzkTCo+xRcAyneaLm3XvvpbXHm/3rPCMdeAJyWlAX
 7dmsYdGQsqqBSN93EoxXVXrQVI9hMn6q31tCkdsc0Tw5blBfkGHKecCQ+hDKvz6Y3NVE
 PRz+KfHBYhglTfC0EyLdd+3yWHSvEUK0TytemjxZi6g/xMxzCLvGj9E0+lI34FMh7UhV
 cnMB5jRRDr01RUe0expt+lrWdx1fYGaj5slH6tv6h2wmwPKWCj+gvX07L20++yVzEM1R
 p4eq5aJGY2o6dD1tltWzYJ33++127MXB9MuWjvZB+nAJCl//D7q3waPsTo+k+sWif2tZ
 U6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IogVwR0JEQ1aQS9gzhq8kcdl8IFdw2NlrDiATe7UQD8=;
 b=JfCn7vZVUaz2vjTgNp9tu+H4ZhMT98Tbsxjk4HqVtU+nIJWQGKrGwAwqj/tcBQZ6PC
 1ESN/yd+JaHZxLFL/iC5eCWfYkpBPpyiOpgSFG0WoojWOAnxLZSUxQdfbIPo0tDR1rcE
 QsByRr4aDiYvVyx2/5Ps12bliZQZC8Gb1V/vCE/xJar6X6KzdcliiGTfrFZX8/QpdoIw
 HyyJ3RPX+dNuTFRfDMPRZRNdx1CoQUzeZy+wXS1KvszBa7hG+3znKdizocA8xPAOMRIf
 4ZijaEpr7q/lUbE2HQUGxufi9lZHjeBCgZ+gGh/yEzR+/+8V+oPwKNQulWk3jNKtsJEz
 70Vw==
X-Gm-Message-State: AOAM5311UwUYH4P64fzEI+OahtCwgJZ+27tKo5xb3eMaR3aUAIOkuDjt
 yw+RAk+ZoQUOmO7QB+9k1MEKoa6iDHQG61CQfS1bYZja5uw=
X-Google-Smtp-Source: ABdhPJwzzB150MYIZUJMVvI0D67pBKhiuLTmHQQT+vSmpCzj0SsyOH39ut82z+lfsfrlq8tcIAa5arFL9XXMkG7lcEo=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr35650833wrv.521.1642691647185; 
 Thu, 20 Jan 2022 07:14:07 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 15:13:56 +0000
Message-ID: <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
>
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.
>
> Output saying where the time went. The first two tests take
> more than 10 minutes *each*. I think a good start would be to find
> a way of testing what they're testing that is less heavyweight.

Does anybody have some time to look at this? It makes
'check-acceptance' almost unusable for testing fixes locally...

-- PMM

