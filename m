Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5A85E86F3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 03:15:17 +0200 (CEST)
Received: from localhost ([::1]:39376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obtlE-0000nb-8z
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 21:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obtjU-0007qZ-NS
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 21:13:28 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obtjR-00039P-Nz
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 21:13:27 -0400
Received: by mail-qv1-xf29.google.com with SMTP id mi14so982679qvb.12
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 18:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=qBbGw/L3cm37/wWWUa79inDV8AXJoDytugSZ7h9Xv9o=;
 b=REIXz7ssT5jGEIj4ZjQMwBqvLLfTGscRmufYmWX4gsisRSVVIl5absP4EtqAeeRvZp
 aK2VAMOBISibc5DzUNQ0apD9qjnsYNCoRMI4xxv0DXdxmV9TKV5mBhBCc5bOcg3mps+o
 3cRs6EyFlRqVUp22K8gwl01NTnjHOZol8PihcEqEdaozm/yypwX0ZwEfJcEOye3rRK0w
 QITEGVtInvwv4m1g5JLbgkesFpsXZRhQSVGaHPK1IMUFLaJXV/20U8zOY1GE80ZcMmG8
 c59fZxoMxwjNtmpnox6Rfuo9TBD+Z4STE9sR7qmXypN5DeKXSvTnT/+wXfzgSdJ1Rviz
 j5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qBbGw/L3cm37/wWWUa79inDV8AXJoDytugSZ7h9Xv9o=;
 b=Az+H5JuMWKEotd1Pc3UZVYyjczVCwPTLyWCrzQQiwIgjjOcKMMFmmRf0H5Qvu6UWCr
 C5IJdtKM2bRTNX2eRVn8/KvFnWIy4t/l0SHhWoy7qG1NGlpZ+jQZ+0PdbK0M/axu5V2Q
 4m6d/8qodlouIhyIr6zCfqlqnLTlx3f48oP4wdcRw1L99cg1MYMQDpZz/0M262LFMEM3
 RfJddmz9AmkdR4g6nDMDOtqgrAACjJUxwYPUPHXyp8wWSbBjtprVLLsSuHE+iq921RvK
 J//LRdyohEZ7WtOREu7TW4qEJgqJHVMsrfdeHXLlEAMSp7dmXwbrUO6e5iNwW4ZiwEV3
 nNLg==
X-Gm-Message-State: ACrzQf2LTFP/qLBnPLAmzZ3jQ2yLHwkr+jE2PkZomcD10XchctibSThR
 eqwX/VW4ewEzHd6EdnX8RIAFMcCRE1G+Ohi+Ohg=
X-Google-Smtp-Source: AMsMyM7hTK7dPjk6yBz3bmVAAWMya2b0NkwUhp7RwakSI5HYHwnfkBUWffvYYpkuoS9dhIh+M6J1JoU15xnj/VP7AS8=
X-Received: by 2002:a0c:810f:0:b0:47b:299a:56d7 with SMTP id
 15-20020a0c810f000000b0047b299a56d7mr9152080qvc.12.1663982002846; Fri, 23 Sep
 2022 18:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-37-bmeng.cn@gmail.com>
 <87pmfmukib.fsf@linaro.org>
In-Reply-To: <87pmfmukib.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 09:13:12 +0800
Message-ID: <CAEUhbmV57dWv-hm10vBNL7DEWBC6qz-OHER58oVyaQs3SSVnjQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/39] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 24, 2022 at 12:24 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using =
--without-default-devices"
> > changed to compile QEMU with the --without-default-devices switch for
> > the msys2-64bit job, due to the build could not complete within the
> > project timeout (1h), and also mentioned that a bigger timeout was
> > getting ignored on the shared Gitlab-CI Windows runners.
> >
> > However as of today it seems the shared Gitlab-CI Windows runners does
> > honor the job timeout, and the runner has the timeout limit of 2h, so
> > let's increase the timeout to 90 minutes and drop the configure switch
> > "--without-default-devices" to get a larger build coverage.
>
> I'd like to push back lightly against increasing the time because it
> lengthens the total run time before we can merge a branch. Ideally we
> could come up with a combination of build and tests that exercises all
> the Windows code without exhaustively testing code paths that are tested
> elsewhere. For device emulation are there any host specific things we
> are testing?
>

Yes, the upcoming virtio-9p Windows support will update the qtests to
test the Windows specific 9p implementation.

Besides that, during the development of this patch series, several
QEMU code bugs were exposed only when we run qtests on Windows, or
even Windows 32-bit. I still see benefits of running qtests on
Windows.

The thing is that we need to find a more powerful machine to do the
CI. Current GitLab shared Windows runners are just too slow.

Regards,
Bin

