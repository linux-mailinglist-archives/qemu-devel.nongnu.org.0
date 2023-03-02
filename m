Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FC6A843A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 15:33:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjzJ-0005xG-LN; Thu, 02 Mar 2023 09:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <byzero512@gmail.com>)
 id 1pXeHy-0000si-Dp
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:46 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <byzero512@gmail.com>)
 id 1pXeHw-0002ih-JJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:46 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-172afa7bee2so17298192fac.6
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677745662;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cwrhbOonVe4ocN7aCVZDDEs26V/RnmLltUL1R5dSaJM=;
 b=kvmsJRKT/GDWDwQUCG5Zd2cZaAO2SQWzu2clcnU6WTU/hCwh4E9Sli8ll7l34cNhuh
 ISuTSfVL9dsouYcQXkVxf89h1KNslgH+s3rCrXyWIu/NNUut/+1npJiiNlkfsSlbHZzl
 lDfkhNqfk/ubjHNlgmO6FZZsQViAw9w/ckPs1wQ5W0hTx4cyNGv2vZbbCJ5PThgkKpHJ
 ox+9PuzwF+nBGnwijtMN3BWEiRv2Ai2YjNW/w8KwDTZELah21Bkzs7+EDX2pYCB3NSIG
 OD2Rj8UrpxpRrvaV45G0Ss3Ov39NXbX3C88BohXtJruzhqHqoXE078J9DPO4mTi/YHfW
 1/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745662;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cwrhbOonVe4ocN7aCVZDDEs26V/RnmLltUL1R5dSaJM=;
 b=n3iY5RmTMG/T2WJ8ehj8pf1ipm8DuafEj2wlM1fWbwITh/4KDeMGRxWcK27dtlJ5qC
 cnpJHfvoCcoOujWA4KSnGnq1HRYPgR/Ey/HszDqFoTRQrrUPI+pbaoWFzMmWCetE17GB
 ewpqO7uOZHW9NCERteBM8xNSuyoNG7vfPHpiVz1SkNyLsCstLrMeomhBpdDZXG/b55TP
 jLq84hgZw4lneAw74HAmzrvbYHy14gQd7D5azZcN6zG1vc+rq9HZ39DbGqjTpOhQZkC3
 3Lwvm46KOLJT6cicLAryYiepceIXIWpD9JQnKDbRF+uXy9i49o72mIxJqktwFef412TD
 Z/Vw==
X-Gm-Message-State: AO0yUKWapSXNF5SuIcJexmbLcuez0FUCdIH8lfqEWklwiHir+DMsT0bt
 27NN2NGV34jOVd+kELgM9DMpQQ4qpZHVFhZ0gZnPrwVlQSktbA==
X-Google-Smtp-Source: AK7set/Qjx/eCQjYRvgIWNx4Mij1uLnCthHaXwUiYlx9syC2Rab07bHcNQ2/MtpVroCeTcJTO5tXighMP2K6oDJ7epQ=
X-Received: by 2002:a05:6870:989d:b0:176:2cec:2c6c with SMTP id
 eg29-20020a056870989d00b001762cec2c6cmr1351943oab.3.1677745662327; Thu, 02
 Mar 2023 00:27:42 -0800 (PST)
MIME-Version: 1.0
From: byzero <byzero512@gmail.com>
Date: Thu, 2 Mar 2023 16:27:33 +0800
Message-ID: <CA+LXE64nmGveP834FfUKxfrGN5dGX-615-OvFsTSLCuoKombmw@mail.gmail.com>
Subject: Is the fix for "DMA MMIO reentrancy" in qemu stable now?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003a00e805f5e69a1a"
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=byzero512@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 02 Mar 2023 09:32:43 -0500
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

--0000000000003a00e805f5e69a1a
Content-Type: text/plain; charset="UTF-8"

Hi,
The bug class of MMIO reentrancy is fixed by adding a member "memory" in
the struct "MemTxAttrs", but the patch only exists in 7.x version, which is
only release version, but not stable version. The latest stable version is
6.1, and there is no stable version being released for nearly a year.
According to the docs(https://www.qemu.org/download/): "The stable trees
are located in branches named stable-X.YY branch, where X.YY is the release
version.".
  So I want to know that if the patch is stable enough? Will the community
be possible to change the way for fixing the bug class?
  thanks for reading this email.

--0000000000003a00e805f5e69a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,=C2=A0=C2=A0</div><div>The bug class of MMIO=C2=A0=
reentrancy is fixed by adding a member &quot;memory&quot; in the struct &qu=
ot;MemTxAttrs&quot;, but the patch only exists in 7.x version, which is onl=
y release version, but not stable version. The latest stable version is 6.1=
, and there is no stable version being released for nearly a year.=C2=A0 Ac=
cording to the docs(<a href=3D"https://www.qemu.org/download/">https://www.=
qemu.org/download/</a>): &quot;<span style=3D"color:rgb(0,0,0);font-family:=
Roboto,sans-serif;font-size:14.6667px">The stable trees are located in bran=
ches named=C2=A0</span><span style=3D"box-sizing:border-box;color:rgb(0,0,0=
);font-family:Roboto,sans-serif;font-size:14.6667px">stable-X.YY</span><spa=
n style=3D"color:rgb(0,0,0);font-family:Roboto,sans-serif;font-size:14.6667=
px">=C2=A0branch, where X.YY is the release version.</span>&quot;.</div><di=
v>=C2=A0 So I want to know that if the patch is stable enough? Will the com=
munity be possible to change the way for fixing the bug class?</div><div>=
=C2=A0 thanks for reading this email.</div></div>

--0000000000003a00e805f5e69a1a--

