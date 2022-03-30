Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED664EC4EA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:49:30 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZXlR-0003mW-Cm
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:49:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1nZXjX-0001fD-Kf
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:47:31 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=37563
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouteau@adacore.com>)
 id 1nZXjV-0000IB-7z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 08:47:30 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id m67so36596760ybm.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 05:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xi+BHC21K8niI1suo3bapb2Q8F8jGu2U3Rl2Ocpo3D0=;
 b=Iz9VeVYd5dEeTX1VcjGCY8kkFQs64YsesGhLhxurDh0O7Fu71uitbdJ4FtcJNX2y56
 NTo4+6ukrzjieuktwnBBpD8KHYikbNfAdz+bsgck1wys/+YclO6RrnPszSEI4QutGphf
 A4UHteNpYaiAmJG8ogJDvZddb/xJhA0tZUf7JdMAVo3TRlinHoyUI+6ZPa2+3EcyDDYC
 WuCBaN8Qha9f1kDl1lIfzq6xaFuiwq+tARZ+q0JECfwvlEXW9pF65dNspdWSzlD1vdii
 8vtcp86lUizMCYO03TFItPVk2EHSdrMQV/rJDL+6eln2/WUNS87r1HSskbYnzox2j2kL
 uvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xi+BHC21K8niI1suo3bapb2Q8F8jGu2U3Rl2Ocpo3D0=;
 b=1aEfqEyWoQ5qE9pfZYJAwViHeQ/d9OzlUFtHokW+/w6dd/59k338nHCRcRSQHoRZvs
 hkJ1AfhYw1aAfUCzERbSPh6Wy6KEZZOoF+oU4wIklPH5wJmZbUEldRJHZfaSQ0P6YOrQ
 4k75t1vxQGWW7+IF5KLc93Uc2HhfxJlP2cT3rujI2sQnnyGmuXrUERpK8/364FK0eKiD
 BZ6TKaXsuKHcgVpNfxPE3f0K4Du6hxgBU6oCFNWMUFAmDSIifp6eQT/4Z1ifdsXFyrOn
 ORMh05MYQeNyrvqOEbsBkHdh5ocaO2QAy9ykYLd3ArRQUQkwGQ5Xmn+Wy7v1CPab3Iz6
 Df9g==
X-Gm-Message-State: AOAM531YVyT61OGVDzVtS/nuASsnzCMgG6hWd9cNNX2K6QCvJipyZvMO
 zSRJZpDV5WBfoDm1yDglmhOezzkPWOAuKrSVTwYZ6v2sk2Nfytr1
X-Google-Smtp-Source: ABdhPJx8PiouVd0BV+uM/uy4dqZuNNSMwohoV9A1LA1I9dCrZ5a3ZSPpGGPcnOAMOEAfUaGkKNDOXCSdfIaT4WpZZH0=
X-Received: by 2002:a81:78f:0:b0:2e5:bf12:5edc with SMTP id
 137-20020a81078f000000b002e5bf125edcmr35777349ywh.433.1648644079116; Wed, 30
 Mar 2022 05:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
In-Reply-To: <1648643217-15811-1-git-send-email-frederic.konrad@adacore.com>
From: Fabien Chouteau <chouteau@adacore.com>
Date: Wed, 30 Mar 2022 14:41:08 +0200
Message-ID: <CALQG_WjoK5QRNZWbz+7ZgRCPw7gUJy3J-tSZ7Mnz5RXqY+xZnA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: change Fred Konrad's email address
To: Frederic Konrad <konrad@adacore.com>
Content-Type: multipart/alternative; boundary="000000000000b275b405db6edc4e"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=chouteau@adacore.com; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Frederic Konrad <frederic.konrad@adacore.com>,
 QEMU Developers <qemu-devel@nongnu.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b275b405db6edc4e
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 2:31 PM Frederic Konrad <konrad@adacore.com> wrote:

> frederic.konrad@adacore.com and konrad@adacore.com will stop working
> starting
> 2022-04-01.
>
> Use my personal email instead.
>
>
Reviewed-by: Fabien Chouteau <chouteau@adacore.com <clg@kaod.org>>

-- 
Fabien Chouteau

--000000000000b275b405db6edc4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Mar 30, 2022 at 2:31 PM Frederic Konrad &lt;<a href=3D"mailt=
o:konrad@adacore.com">konrad@adacore.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><a href=3D"mailto:frederic.konrad@a=
dacore.com" target=3D"_blank">frederic.konrad@adacore.com</a> and <a href=
=3D"mailto:konrad@adacore.com" target=3D"_blank">konrad@adacore.com</a> wil=
l stop working starting<br>
2022-04-01.<br>
<br>
Use my personal email instead.<br>
<br></blockquote><div><br></div><div>Reviewed-by: Fabien Chouteau &lt;<a hr=
ef=3D"mailto:chouteau@adacore.com">chouteau@adacore.com</a><a href=3D"mailt=
o:clg@kaod.org" target=3D"_blank"></a>&gt;</div><div>=C2=A0</div></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Fabien Chout=
eau<br></div></div></div>

--000000000000b275b405db6edc4e--

