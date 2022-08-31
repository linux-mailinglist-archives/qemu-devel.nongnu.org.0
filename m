Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1718F5A876E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:17:36 +0200 (CEST)
Received: from localhost ([::1]:39518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTU9W-0005QM-Qh
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsc288@gmail.com>) id 1oTSBv-0001Ix-Br
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 14:11:55 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tsc288@gmail.com>) id 1oTSBt-00029B-PL
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 14:11:55 -0400
Received: by mail-pf1-x436.google.com with SMTP id p185so15192690pfb.13
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=X2+uWVnXCa2SoJ1RI5JeG9IRasyaB24NsOPLZ8XZqiw=;
 b=bKky2pQW0HEM3CXSOA0zudqdAWsmSM8EfA8PtKtq2Qh3mOZpgSzwks95/sbrfX1WMK
 MMyssXE5GzUvflECUJgqqlNxoULjRpzoQi4xXhkj2Rl7Ax7Clj11tc0U202BOrWhrEkM
 cvEw9rrmwd4xM2r5FVZ1Qtu2xKkKVdyf/KH4waVa6KcRcyz76TplyKuqkONcXuK7IjNW
 0XDkay+dy4QM/zUQ3kvyDq99dE8l7YGpC4K6pIafQ6SXs/zXZVsW7QnGbWTRJLEWrLuT
 72XAY2cXWohI1Anm80uUdI9/s5JJbAcUWugqQhF2D/eDPoWP6hVvi9ikiVYYxISToE44
 GAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=X2+uWVnXCa2SoJ1RI5JeG9IRasyaB24NsOPLZ8XZqiw=;
 b=3+GJCF1wnDPcWJT+N/ag7R/WmS1ePsy4LiBywuoLrH1gnkd/D4okiJv7FDEc6XbP06
 Awodqxq4uucdyDa+QigcfcGnzNN9naUCVsFYI2isoHoOwxoaAu53FVO3b1Qlxj+uVtuI
 qGq0CKo3sJM2Tp/1xLFDB6/0efDpLmLUJUwcEKQWy5HKD6JspgaXRC9x9gQygBrdI885
 c/8hqDEpoVbhFNzQ2UgHvst0LaGvf6V4i6cig/0by8yMjgiXNHvstO4Rrd9f0KJtzwVw
 x9ivlG0MhKZYoKbCHEusQZxI1y/cCi3B1CqLqs5+TbB17pH4WJAAEscadrLmvL2A5Yp8
 dx0A==
X-Gm-Message-State: ACgBeo0TWYkJSH4RWNbF6ZMNlRRHAPpPN1Sg1AFDqXRz1xsX/pKNV/Ke
 5qcD9bwqhTrkgs09Y2Py6c4C++QxzvXnJO08qMHW2+j5
X-Google-Smtp-Source: AA6agR5LulXLWR5n89Vhke6L5phSg91RI6CTbE8iFkqdYEsLipF4AZmhcC91x4/s+KFkOKi7xiU5LbZOwAKrH5NE3PY=
X-Received: by 2002:a05:6a00:2485:b0:52e:ca57:5018 with SMTP id
 c5-20020a056a00248500b0052eca575018mr27353933pfv.43.1661969511607; Wed, 31
 Aug 2022 11:11:51 -0700 (PDT)
MIME-Version: 1.0
From: Tom Clark <tsc288@gmail.com>
Date: Wed, 31 Aug 2022 14:11:15 -0400
Message-ID: <CAA_GOyF3YxqT4-9gv-u-3pSK7zPZq7YiGCpsUUvmYbuE_h33_w@mail.gmail.com>
Subject: TCG IR extraction
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005df26605e78d6e1f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=tsc288@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 31 Aug 2022 16:01:34 -0400
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

--0000000000005df26605e78d6e1f
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks so much for reading this and I appreciate any and all time you put
into this.

I'm a dev working on a project that's using QEMU as its basis. I'm
interested in extracting the IR representation of translation blocks,
preferably at the instruction level, to do some analysis on it. In various
documentation around the web I see lots of references to textual examples
of the IR so I assumed it would be possible to extract it in byte format
and convert to textual myself.

I've done a lot of digging in the source and found the code_gen_buffer and
determined that's where the IR generation is being written to, but I'm
having trouble cross referencing DisasContext, etc, with that global to
actually identify individual lines of code. I'm also assuming there's some
kind of framing going on, so I don't think that I can even expect it to be
a simple buffer of bytes.

So my  - is this reasonable to even attempt, and if so, how would you go
about doing it?

Regards,
-T

--0000000000005df26605e78d6e1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Thanks so much for re=
ading this and I appreciate any and all time you put into this.<br></div><d=
iv><br></div><div>I&#39;m a dev working on a project that&#39;s using QEMU =
as its basis. I&#39;m interested in extracting the IR representation of tra=
nslation blocks, preferably at the instruction level, to do some analysis o=
n it. In various documentation around the web I see lots of references to t=
extual examples of the IR so I assumed it would be possible to extract it i=
n byte format and convert to textual myself. <br></div><div><br></div><div>=
I&#39;ve done a lot of digging in the source and found the code_gen_buffer =
and determined that&#39;s where the IR generation is being written to, but =
I&#39;m having trouble cross referencing DisasContext, etc, with that globa=
l to actually identify individual lines of code. I&#39;m also assuming ther=
e&#39;s some kind of framing going on, so I don&#39;t think that I can even=
 expect it to be a simple buffer of bytes.</div><div><br></div><div>So my=
=C2=A0 - is this reasonable to even attempt, and if so, how would you go ab=
out doing it?<br></div><div><br></div><div>Regards,</div><div>-T<br></div><=
/div>

--0000000000005df26605e78d6e1f--

