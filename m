Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A13D029B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:23:05 +0200 (CEST)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5wGe-000812-0m
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:23:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wEx-0006QI-19
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:21:19 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5wEv-0008JA-7F
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 16:21:18 -0400
Received: by mail-ej1-x630.google.com with SMTP id dt7so36134759ejc.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0Jlf5xcRChuS8Zt1dx/r9bGLjka+rINwOIYjw9lFqRg=;
 b=XA+mjlrswqYBsG4g7R3i4Nn+zEgMFyyWR84T/VaGWsYZzYeEeGrzbmXJXoKblbbjzw
 LlYxE8JYDa32nCE1JjKnOD5ow9PGjzibQSkBvgb4QKZUlKI067JjR/7S+M4vrcTWFnde
 R9ZoDzwjcH11dWDfOHDUX2TYUebQAnUi8yNQrT003HxgZPC1t+CuMdulKB8/wzdxEMFa
 fBhK02hYUmAd+bpmB8HwSe8UawFlrn0YdNIKhwvZqQX/aL/R8tvcPBEq77/x5wEzHDvh
 g3sWo1oncbfETI7fcWqRVGUqdFgwobB46caA8e7GB/qnuw8j/6v+u6UpjblIl6e4pAC8
 RSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0Jlf5xcRChuS8Zt1dx/r9bGLjka+rINwOIYjw9lFqRg=;
 b=Lpw9NRu/hTfdjvErh1VAxIEcslKdqPWp+Xl0zAwILCq/Pqb/TWmko+n49IYKhDYwuk
 LEQTY5lv9GFJ1p1BlwsxavGoT9Cyh5X/2Rl+QhVu60p1FcFGLyADmsocndCSFOvwaVt+
 y16cLV2tytz2Nt7s7RWdEiJtDVZph6KU23qx7i04IpGrVz7Iq+iSGDdxwhI9pOIZbSDZ
 Xdrdku9DILsU085CLXtlDXJRoqdr8shCK0o5znSZEx9eZtjim7G/VUPiFezxcKq6zJwi
 ZJ+ykzruJ3ZM2OHkkVjgOocfebewEv4RUbMnVmzN5syEUvaJTwEWzjFggEQxk8hqXPMr
 Sayw==
X-Gm-Message-State: AOAM530ILLG/UJ7QONzCp36/aWduzZk2JjLgRsyfOONq7fOishRtEwL4
 jS1UTO2DdDd17nvp3VBYnZvP5FMc7qaMWlycR2NBvQ==
X-Google-Smtp-Source: ABdhPJzhYJNvbPZHfeP2aQLM9w7cZP1ajq7qiL7ZOqQ6+BZzmbfW1uKlNUHOoO7yHFoa5DBYtfv5W2KewiuHrvdzEUE=
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr34932070ejb.482.1626812474474; 
 Tue, 20 Jul 2021 13:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+bd_6+2zk0N=s-D2OG4FUZ-HirJ+8HkMUktF=Jqyf9_HhyH1w@mail.gmail.com>
 <287d8097-f865-6f89-6062-567a7994987c@redhat.com>
 <87wnpr4t0d.fsf@p50.localhost.localdomain>
 <418D3B29-010B-4B5B-A310-F3E3DA110DA9@oracle.com>
 <87o8aw3k3p.fsf@p50.localhost.localdomain>
 <8D9638C2-D992-416E-9A92-58128F1001CB@oracle.com>
In-Reply-To: <8D9638C2-D992-416E-9A92-58128F1001CB@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 21:20:33 +0100
Message-ID: <CAFEAcA8jOf8-rojji7_z3-N10AeiynQ7NVv4aaMCZGL3npwpxg@mail.gmail.com>
Subject: Re: tests/acceptance/multiprocess.py test failure
To: Jag Raman <jag.raman@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 David Hildenbrand <dhildenb@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 21:18, Jag Raman <jag.raman@oracle.com> wrote:
>
>
>
> > On Jul 20, 2021, at 2:39 PM, Cleber Rosa <crosa@redhat.com> wrote:
> >
> >
> > Jag Raman writes:
> >>
> >> We presently don=E2=80=99t have permissions to send a PR to
> >> upstream (Peter Maydell).
> >>
> >> Presently, we are requesting someone else who has
> >> permissions to do PRs on our behalf. We will work
> >> on getting permissions to send PRs going forward.

> > I'm going to include that patch in an upcoming PR.  Please let me know
> > if this is not what you intended.
> >
> > PS: I'm not sure I follow what your specific permission problem is, if
> > it's technical or something else.  But, in either case, I'd recommend y=
ou
> > sync the MAINTAINERS file entries with your roles/abilities to maintain
> > those files listed.

> I have not registered a GPG keys to submit PR - please see following
> email for context:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg765788.html
>
> I=E2=80=99ll get started on this process as I can help with smaller patch=
es.

This isn't a technical thing particularly -- I just prefer that
if you're not going to be submitting a lot of patches that they
go through some other submaintainer who can review and curate
them as they go past. I do not want us to have a structure
where we have 500 "submaintainers" all directly submitting PRs to me.

thanks
-- PMM

