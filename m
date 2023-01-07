Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B6660C1F
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 04:09:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDzZ6-0003Lt-Uk; Fri, 06 Jan 2023 22:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pDzYz-0003Ld-Cz
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 22:08:06 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pDzYx-0006Kt-HE
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 22:08:05 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so7129286pjk.3
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 19:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L8TA4OFrkldy+4NZ4WEm1yDF9p6/ICz4oD6bAq9ZVY4=;
 b=K3eWbQMnZH+4tqN2fK5yH9n3EPnVlETS3LcbsVlxURJP5a44VyDDTopIxY2LoeMbTb
 XgQ7E3PgVCK9To4M8Z7Z7QpKYcnkLbBkxRkikvux6TRvitSNA3CYPf2iL7kWGYxeCWYZ
 m9nkYFM6A98R+z63ZL9WhtM+Wsp4YUSkTudKgbm5+DxM/nQrDgYIO5W3Bkkp+fSZtd3h
 SvZBRkF5aOFRLtnLtybiDbHYntQ+KsHgZRt2OZwxEpnhs4oFHpyBmxe1hESlcLkrEKXy
 VOc1Coqo0KT9LEB9v6yJrDoGPzCO6Ea/Bc8uohBCxX+GCXrczXstzAbnzqyeTcahwIIQ
 zW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L8TA4OFrkldy+4NZ4WEm1yDF9p6/ICz4oD6bAq9ZVY4=;
 b=pS1qPBBiF5I3pqrtzH2paCYwrUoFeoRD3USNVfoRW7aMcdpaKgr4FBWwIQAeDhhqDF
 QC8gzdngX6eIujmyi+4KKeBEgPa+gWHl9kSA7Pcr0YN/ZmcMr+FrglUn3Axg3ERQPTAy
 LxdnVtVeq/8XkFxNffeqOKFMTST9MyYDffFrL/Vhmd8k/9nAdvHqBiLMxCeL7FEJwVOb
 V8h4R5qBXRWT60hNJsZcEQO/sok7LLrs3JgDIjL0icXF+4/PjR+YhnUEopP3681mY02c
 EK8zwsMWu7uofsVHRkzQjJ4g2yD0U2MeypTxwMoqEB3VGM3WORT0UMAJ/+n0h7+vgBxy
 QJUw==
X-Gm-Message-State: AFqh2krkGnHi6L4DC9yXNdGg2GTkdaITwATThoqQMVFHDnbopF1lnwGu
 HfWbE9STY11oEcS3oXMNnVQsHuPVE6bAGLvaCp7ZEQ==
X-Google-Smtp-Source: AMrXdXtr7QOpRrdDjMzkwxMwlzOD2oxAnphm2geAke+21d7ipuav4ip7Z6aGJKoyP6y49EZn1wUT7/SCmFHVGaN2ixE=
X-Received: by 2002:a17:903:1249:b0:192:e157:319 with SMTP id
 u9-20020a170903124900b00192e1570319mr987614plh.77.1673060880811; Fri, 06 Jan
 2023 19:08:00 -0800 (PST)
MIME-Version: 1.0
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org>
 <Y3vdIHJrR1k1lmf8@strawberry.localdomain> <871qpwc6i6.fsf@linaro.org>
 <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
 <Y3zxW/vFsxCuDFW+@strawberry.localdomain>
 <Y4Ztn91bFssBdbmR@strawberry.localdomain> <Y56kG439aHBbKVLK@cota-l14>
 <Y6DFXNbHGu7boW6/@strawberry.localdomain> <87ilhkosxs.fsf@linaro.org>
In-Reply-To: <87ilhkosxs.fsf@linaro.org>
From: Emilio Cota <cota@braap.org>
Date: Fri, 6 Jan 2023 22:07:50 -0500
Message-ID: <CAJY1Aq7XgQgpj37MAdbHXYuUE1o+1NnS_aP1fSzsiA+F=c7s0w@mail.gmail.com>
Subject: Re: Plugin Memory Callback Debugging
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007d27f205f1a3d74d"
Received-SPF: softfail client-ip=2607:f8b0:4864:20::102b;
 envelope-from=cota@braap.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

--0000000000007d27f205f1a3d74d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 6, 2023, 5:31 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

> Are you going to be able to post the patches soon? I'd like to get the
> fixes in as early in the cycle as possible.
>

I intend to post this series on Sunday.

Thanks,
Emilio

--0000000000007d27f205f1a3d74d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Jan 6, 2023, 5:31 AM Alex Benn=C3=A9e &lt;<a h=
ref=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
Are you going to be able to post the patches soon? I&#39;d like to get the<=
br>
fixes in as early in the cycle as possible.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I intend to post this series on =
Sunday.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><di=
v dir=3D"auto">Emilio</div></div>

--0000000000007d27f205f1a3d74d--

