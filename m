Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46F2F5347
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 20:28:39 +0100 (CET)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzlor-0000tj-8G
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 14:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzlmK-000097-EO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:26:00 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:37764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzlmI-0004zS-NQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 14:26:00 -0500
Received: by mail-ej1-x629.google.com with SMTP id ga15so4719415ejb.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 11:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8a5molCzaApS5ulpjKV/tYq1hOIzzaj44w88fPdH6Sk=;
 b=Vtwbwd7rmwgmxcmAFW7mrYD6stovZLjwPMsJd/tzaOzKa5KknPxmarX+kyT3AF3UGQ
 dU7LVx8F6qsYYK6bzHGgM9T623cDkJcBTufTC4/4K7fp8wlGFTPW8rlbtTbuZZ4sZU0/
 Lh7cdX+cKs4VwvryyJuAnt8GX/H4Tc9bhN5x8IVZsBwyNpqv+ycqjgtQWqmR/68O8+CI
 SgufPThCwZrdyI8ve6nBjnkEJ5oO2bPIlBfQShevME4VzfCoGHYOkfw29IeLRCx0wzp8
 pq7TCiMBLg6MKftXViBQn5+V3WbsZHrXqhQafxt43u9xJ4bExpATlLWGzA8aphCo34GP
 NtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8a5molCzaApS5ulpjKV/tYq1hOIzzaj44w88fPdH6Sk=;
 b=fq+cikj3DjiXvNRYuCbfGAI4VW/33SAruUfeOo6Ywylmvgg2pPFGItGKUuxbFWfs7p
 fq9Sk8JCiJWCebaWbzlqu6AlrnNIvHPQfGfDw0NP2kdMYO0eK8ZApbzkt58HC3ki8+Jo
 fvXLOizbGZtKUB91G2wm1Keao35kmAhgmJr+mAc0G/iNkghkku70kW6dkpeHxN9qCAHJ
 t1HzsQiy8XVpsLiHEsIMc73iYhh76C3G8WtDJ9T9zZqCruIAvbbrLkU+82iNNoC9dDal
 n8E1Oi7frVq9jaLQyKAXkzeudu5CD0TWmcy+F9qqjRYE0eMnVf7ev0pUveBI48wNajr9
 A3jw==
X-Gm-Message-State: AOAM530gtXsp+FqkpWsJyEBXHdhMPn1QGNQwqDtqZoi8m2zLlrwX7iu8
 aqafQIaSi/eXdCxu6zgakvmETHaKAPP7cL2gxMbGpw==
X-Google-Smtp-Source: ABdhPJxhD2d5jhYr7aGNBZy/nq9f2gCAig9N8aDeD1k9jVvtqVM0msNSKURYS4Ba3qQ5AhK4Vw8bE4TZQDRl5oEkXZ8=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr2616261ejb.382.1610565957118; 
 Wed, 13 Jan 2021 11:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
 <20210113153728.GF1568240@redhat.com>
 <8735z4n6kz.fsf@linaro.org> <20210113163224.GH1568240@redhat.com>
In-Reply-To: <20210113163224.GH1568240@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 19:25:45 +0000
Message-ID: <CAFEAcA_ugxOkEx6oDAa9XChrmuw5vNMj=MAtQmeZasJ6ZnCbtQ@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] gitlab: move docs and tools build across from
 Travis
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 16:35, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Jan 13, 2021 at 04:27:54PM +0000, Alex Benn=C3=A9e wrote:
> >
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> > > Do we actually need this job at all ?
> > >
> > > Assuming the depenedancies are in the dockerfile, then all the
> > > build jobs will be testing docs and tools already, as meson will
> > > auto enable it.
> >
> > I pondered making an explicit --disable-docs to save some run time but
> > really this is providing a golden build of the docs which can tehn be
> > deployed bypages.
>
> Oh right I missed that subtle detail. I saw the separate pages job
> but didn't realize this was a pre-req of it.

This suggests that a brief comment for each job explaining why
we have it would be useful. (compare my inability the other day to
identify what the 'pages' job was doing -- a comment saying
"This job publishes the HTML docs previously built by the
$whatever job as gitlab pages which can then be viewed at $url"
would have helped a lot.)

-- PMM

