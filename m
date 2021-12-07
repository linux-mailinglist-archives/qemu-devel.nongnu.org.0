Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F446BF55
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:30:54 +0100 (CET)
Received: from localhost ([::1]:57120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucQf-00072K-9q
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:30:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucKY-0002P6-Er
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:24:34 -0500
Received: from [2a00:1450:4864:20::42e] (port=34644
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mucKT-0004rw-WE
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 10:24:33 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j3so30311843wrp.1
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wj/CUL6QPWm9ZM72JjgJCyemakkMWGTJi3KA9fKpRPo=;
 b=Cf0aLpCDD7rtqwMCqJtYUcMWjk7n/XhYArs470746Ku/jMZP3DdJdAG5+JBPo5SeEp
 VIOkhV2xAAUSqVUqmeJQOth9v1T9PC2WVDfTUJGw92BZ1HsH67R5HFtKFzQsuHfdxjzD
 bBY1qgTRmCDQslz4+MUVHQ84/BIngU9D+Ofhav7JpcO/qQjNn5+Jc8UvUgrBX7xV29rS
 NXobwEuvYVR9AUuglYTYakOBACucq0P+GaDqNrr0BrLPdzmNVFFW5KaIoPB87KMo4xrF
 KYAQGhGLo4WM3pxzyz09kGI9RM1WXAA9a03rK1yTZxqeZtQUcS0MDDGOa4yyh4dsdTII
 dAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wj/CUL6QPWm9ZM72JjgJCyemakkMWGTJi3KA9fKpRPo=;
 b=jclrnucEJXhK9FpW9SGY0skE5ZW+krrkFXuF/gB5ZgVPFSncZq/r97lMKe8wNc9Xv8
 UNY232Ql1MSgBS+7huFvJcXinHG1TarWrs+sot5xlCY+DwBuC6kT0BlWttzn3VtSIb9l
 pDqPkHZDHp37krttRS6XEDZfq9M1NMLIFCFBdURUiCz8PX6DeZChzDDFPM8AwwwWFvk+
 eeENNuUXc9suuvISWJ/sjDXwRCEWnYmMppON8Vl4N8aeD/RHr43PGtALEq5d/yqqO8hq
 5xMs5bZCrvPSf8Box/W3aELmTsjCCF8Ga1rxMTFXf1SBAwRVVco+8ZVRZFpqSiWuFCH8
 wxsw==
X-Gm-Message-State: AOAM5327Df3w06QIf0/O8Q21Kc+86w6w9I/To6n40ItvlY7bLkUXzZtZ
 dOONkYjspYnnlHiF0Dt/OO+GtTzVoA0XvsBxNdk4nA==
X-Google-Smtp-Source: ABdhPJzwj0LDU/4dgip1iO7f4ps0hWvNgykXRgZAsaoK0D9zcZenmOAj9iRxfQm6cQ93WKdh0sVzSIXUhPkIOMxi0io=
X-Received: by 2002:adf:f64b:: with SMTP id x11mr52799817wrp.4.1638890666745; 
 Tue, 07 Dec 2021 07:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 15:24:15 +0000
Message-ID: <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Brian Cain <bcain@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Sid Manning <sidneym@quicinc.com>, Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 15:18, Brian Cain <bcain@quicinc.com> wrote:
> Peter Maydell wrote:
> > I won't try to put this into 6.2 unless you have a common guest
> > that runs into this bug.

> I know that Qualcomm encounters this issue with its hypervisor (https://g=
ithub.com/quic/gunyah-hypervisor).  Apologies for not being familiar -- "co=
mmon guest" means multiple guest systems/OSs that encounter the issue?  Doe=
s that mean that it would not suffice to demonstrate the issue for the one =
known case?

It means "if you see this with a Linux, BSD etc guest that's
more important than if you see this with some oddball thing
nobody else is using and whose users aren't as likely to be
using release versions of QEMU rather than mainline".

The bug is a bug in any case and we'll fix it, it's just a
question of whether it meets the bar to go into 6.2, which is
hopefully going to have its final RC tagged today. If this
patch had arrived a week ago then the bar would have been
lower and it would definitely have gone in. As it is I have
to weigh up the chances of this change causing a regression
for eg KVM running on emulated QEMU.

thanks
-- PMM

