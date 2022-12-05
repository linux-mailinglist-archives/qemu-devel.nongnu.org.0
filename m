Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84360642882
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 13:30:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2AaC-0006jd-4s; Mon, 05 Dec 2022 07:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2Aa7-0006jQ-Ag
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:28:26 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2Aa5-0001nv-Qb
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 07:28:23 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3704852322fso115939767b3.8
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 04:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGWSWxPrcxruNLFBONYsXIgRmxv3SnO5Dvh6/AdXi/M=;
 b=RMgAjmwuPMt7Mz91gP3gDEjgmsEECv2yX7COxEnbxnO3xMhNiDjl74jHFsKed8pgsC
 TUij9KKEGj+Q7midUUhmDe8tE7jYoaZgB54SiXH/lSTg3AkftWPQDjFhFF3pfTmgTseX
 BUV0rE5+FCf/xg5Ekz7F2InN9SAeahbAxh0zqxGbOQL8Gca4I1QLKXUyFWWJVeGqLYY3
 3vcoiu59H1ufQPRTYmQ0qrijyUqyvYTxYigXkCwKTe+yCCgKmVY0NbNehOXXCus6berL
 0swjINa3DcmDwlxwzjfHSYAujeGJt3lWY2nErRySFLibq4NP+I7dopfdQNc0aymxs6o+
 uh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JGWSWxPrcxruNLFBONYsXIgRmxv3SnO5Dvh6/AdXi/M=;
 b=DGyoggcxBduvKuYOOK1wp8rl8eedH4Z3iBjZD/2W0SFLqiEgk4Afp/02wYqCTpBgKx
 9apwpNmigoh+IKLaDLbaIPto1vfdJu3SwgJ0iiHSO5O0ign4EuiZaUfmAkjFKY38d37Z
 aZv65Ed8KbC0I7eqbpQOT3K0g1dBf460icMcQ2BxInRgm7kBn+poRTRKS1ZXoOatiDwd
 9RRYRh8rRmlu2P99heGhoipzPAQGY4HoQwnZnmTxGEEOePYHm6Xagfu7xP0LAgFi+YiA
 +L6VAeM51kH0PhAWtoQN3mfrrtsPydH4DIcPw2Gob06n0WMpiV6oaMx2TP5FTORfnsO2
 vobA==
X-Gm-Message-State: ANoB5pnnD4wmdVPtxIjrVPAdvZwZtvLg2os1VOKAJ7jrQ5+mM7XY0z4u
 hzefGvySprN1ZpoeuHKLMi6wGeubJdtorghLoIg=
X-Google-Smtp-Source: AA0mqf71hbULazeQ6hoaPmQDA6EqIvCkKYwxrcILHKA8bdgFJrTKiQm1YupcBDr2cEpMe84RZHmloljYfL3ZBQm0oGg=
X-Received: by 2002:a81:3c7:0:b0:3eb:447b:56cc with SMTP id
 190-20020a8103c7000000b003eb447b56ccmr4894535ywd.296.1670243300660; Mon, 05
 Dec 2022 04:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20221202102550.4107344-1-gaosong@loongson.cn>
 <6fe3e752-a39d-38f9-e573-437547d19179@linaro.org>
 <72f22429-d51c-b2b8-49c6-59ba7df17ea7@loongson.cn>
 <CAFEAcA8Tep6GrSwoTSUi8Jjs2ntAqU_15nfe4DD=fZB2P-mp0g@mail.gmail.com>
 <e09f6366-1e29-2d13-c2f8-b9da3c2570e7@loongson.cn>
In-Reply-To: <e09f6366-1e29-2d13-c2f8-b9da3c2570e7@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 5 Dec 2022 07:28:08 -0500
Message-ID: <CAJSP0QV3AqFAZRVufNK5vTGmeiDDthRTpnoYxv5v_niMZ4Ee=A@mail.gmail.com>
Subject: Re: [PULL for 7.2-rc4 0/1] loongarch for 7.2-rc4 patch
To: "gaosong@loongson.cn" <gaosong@loongson.cn>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, maobibo@loongson.cn, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 5 Dec 2022 at 06:38, gaosong@loongson.cn <gaosong@loongson.cn> wrot=
e:
>
>
> =E5=9C=A8 2022/12/5 18:48, Peter Maydell =E5=86=99=E9=81=93:
> > On Mon, 5 Dec 2022 at 09:20, gaosong@loongson.cn <gaosong@loongson.cn> =
wrote:
> >>
> >> =E5=9C=A8 2022/12/5 15:24, Philippe Mathieu-Daud=C3=A9 =E5=86=99=E9=81=
=93:
> >>> On 2/12/22 11:25, Song Gao wrote:
> >>>> The following changes since commit
> >>>> c4ffd91aba1c3d878e99a3e7ba8aad4826728ece:
> >>>>
> >>>>     Update VERSION for v7.2.0-rc3 (2022-11-29 18:15:26 -0500)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>     https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221202
> >>>>
> >>>> for you to fetch changes up to 14dccc8ea6ece7ee63273144fb55e4770a05e=
0fd:
> >>>>
> >>>>     hw/loongarch/virt: Add cfi01 pflash device (2022-12-02 18:03:05
> >>>> +0800)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> pull for 7.2-rc4
> >>>>
> >>>> We need this patch.
> >>> FTR this is not a security/regression fix, but a mere feature.
> >>>
> >>> Certainly not justified for a rc4 IMO.
> >>>
> >> We hope LoongArch 7.2 version support pflash,
> >> otherwise the subsequent BIOS support pflash may qemu 7.2 does not sup=
port.
> > Regardless of how much it might be nice to have a new feature
> > supported, new features cannot go in after softfreeze, only
> > fixes for bugs. At rc4, changes should really be release
> > critical bugs and regression fixes only. Further, any pull
> > request  that should be going in for rc4 should have a clear
> > statement of what the changes do and why they are release
> > critical. "We need this patch" is much too vague.
> >
> > QEMU's release schedule is regular, so there will always be
> > another release in 4 months time. There is generally no need
> > to be in a huge hurry to get a feature in.
> >
> > I would favour reverting this change.
> Got it .
> I had send a patch to revert this.

I gave it the benefit of the doubt because it's isolated and only
affects LoongArch, but Philippe and Peter are right.

Thanks for sending the revert patch.

Stefan

