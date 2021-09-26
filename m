Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766AB418980
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 16:38:01 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUVI0-0001oc-1Y
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 10:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVFw-0000GK-0t
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 10:35:52 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:39881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUVFu-0002D8-Es
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 10:35:51 -0400
Received: by mail-oi1-f179.google.com with SMTP id a3so21939064oid.6
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 07:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c2M4Z/le+kID9uoTTaJBoU0G0ivPNFKtYKhx1aM7VOA=;
 b=zSsOuJPj2TNf6F9Xq4O2v24RlwA+FfgT2PbqRb4z7aulaj1SEISzETrCmfR+ND1i5v
 e/9JTatGK2hdM+8pwgrvfuudms31RZhwpLypdx8dN658Bn1dLHF1TF5+opoL1D+MC/v9
 lwyH+/xkko+cx191yvTS1ntN7O2boRpXU7V2zsbRI+2Ves/YDNOlAIZ/itBwYnr+4n97
 pbSb8I8Vpyq/YoleayvBnjxnWJxfMa+gp5nU+lJz4RMiHNZ3Q7pkgpk8yXewzIsUj1xO
 ihlNaJyQVg5uZ5dCum38jjA+j+bW9MICtlt2usPV/ypP6Qx8SIuPEAj12cbHY6FjvEbb
 6jrQ==
X-Gm-Message-State: AOAM533c6yuTE+dyrjeyM1Q+us5zBMqaEdFRp3ZofS7VWCYU3ACK3bBe
 3/80LB2CDLsT7ofl0iTn8V54QflZpI1T8CLhrY4=
X-Google-Smtp-Source: ABdhPJwoTJY4qNYez/J+pGM+DMMwgjl5uTpkaZq5SO5i2obGPn240XnkrduEG62Gnjg9MyFr4ppr8lV4vtSxk9wIwjM=
X-Received: by 2002:a05:6808:cf:: with SMTP id
 t15mr1018714oic.46.1632666949283; 
 Sun, 26 Sep 2021 07:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <e5d5a725-d2f3-8866-4882-11632adb6f52@amsat.org>
 <28636647-b87d-1e5f-dc54-a56bf27b1ccf@loongson.cn>
In-Reply-To: <28636647-b87d-1e5f-dc54-a56bf27b1ccf@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 26 Sep 2021 16:35:37 +0200
Message-ID: <CAAdtpL73NfnguXd6j+EktFieYiWc3=FqftZ2euwTKRmetm7LVg@mail.gmail.com>
Subject: Re: Add LoongArch support to RISU?
To: Song Gao <gaosong@loongson.cn>, WANG Xuerui <git@xen0n.name>,
 maobibo <maobibo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.179;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I meant to include the qemu-devel@ mailing list in Cc but forgot to...
Doing that now.

On Sun, Sep 26, 2021 at 11:25 AM Song Gao <gaosong@loongson.cn> wrote:
>
> Hi, Phil
>
> On 09/26/2021 04:25 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Xuerui,
> >
> > Looking at the script [1] used in your series adding LoongArch TCG
> > backend [2], I think all the bits are in place to also generate most
> > of the files required to run RISU [3] and use it to be able to test
> > Song Gao's LoongArch TCG frontend [4].
> >
> > Do you know developers / companies who might be interested in working
> > on this?
> >
> We can do it. Our plan is to complete LoongArch linux-user emulation, sys=
tem emulation , TCG backend and others support.
> We plan to submit the system emulation code in mid and late October.  Xue=
 rui had finished TCG backend. So we may doing this work after system emula=
tion.
>
> We welcome others to do the work=EF=BC=81

This might be a good project to present to Outreachy internship:
https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg03970.html

 "QEMU will apply for the Outreachy December-March round. This
  internship program offers paid, full-time, remote work internships for
  contributing to open source. QEMU can act as an umbrella organization
  for KVM kernel projects."

Stefan, are we past the deadline for submission?

Regards,

Phil.

> > [1] genqemutcgdefs from
> > https://github.com/loongson-community/loongarch-opcodes
> > [2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg06601.html
> > [3] https://git.linaro.org/people/pmaydell/risu.git/tree/README
> > [4] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04558.html
> >
>

