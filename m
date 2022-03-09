Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF9E4D3D76
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 00:14:33 +0100 (CET)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS5Vn-0003Jg-Iv
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 18:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nS5US-0001uj-Sv
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 18:13:08 -0500
Received: from [2607:f8b0:4864:20::e33] (port=44828
 helo=mail-vs1-xe33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nS5UP-00084T-AF
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 18:13:08 -0500
Received: by mail-vs1-xe33.google.com with SMTP id y4so4070373vsd.11
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 15:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7QlrusR+Irh8nbj7AwMUwmWUb3AkSKHrIjafic9HSiY=;
 b=XxsyLFHycXfn0O7dqUnXmMD7l7042m+XphOMEcyGsoMtZkk8CcRKsKVXaRY/bPkAX/
 cRilwm41JbK+It4S9NAiLIPvHUjeSXxbsHMe5C84ohhhAtFDB3pUbgslJ2cZfCTwocEP
 3wARVesYm3Txss3OQni6r+KYFK+6eIUBJqhbUxRilHvtFfRj+cToMtt3Ia/6xClfllE2
 TWw+nTq5vYbLPs37NSethQeLRcJ4l44Hedg42yklGpKko5++0FNCPb+sxEQj4uaPMU5Z
 nTKVRwYkTKA8eUhLUZOPyR8C9aTujpS2IBxjiECiz32L9dPxwYei6L0LWcXQnkw7QlkW
 GEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7QlrusR+Irh8nbj7AwMUwmWUb3AkSKHrIjafic9HSiY=;
 b=4YNhu3Jhu6jndEqrDvM+DD0oDy7zPiooZIfGDHy6HTpFVaySTEofYR1IQc6Mf/YSMg
 haz6Kgpwp47MOPND8SttNC074Cjiek6AuQpUPyJCxCKu5MxvkeBogVQR6QOL/rPw0D4C
 xdEKevCikj0dLcPMHe9YenNnVb6eMgJmBX3pHshKTD8O7LSrXZU1BAU62LFS1zfnCuZ2
 yjRINObA83HupUZbo5RUQsB29bwg2jI73VcyarBYXQLS4Ph0CMN/hADwVBXW1l46x8GI
 Y6OGkg2lV0Yuo5u2UxjUb7wHlm06fhUQMAbOIsimcbFEvewSV1g02wjMwabrPkZ6rIoc
 DPGA==
X-Gm-Message-State: AOAM530Z8/OJNJOpSWMc1UBR8sWRAxrRXBNxLyQoCyt8YRlGetQa7+y0
 R0TdaHN6HKPs8twY6kb3hDBY3f8z7NB/hsnbMbdmAA==
X-Google-Smtp-Source: ABdhPJygPj4cZVLEdjPKokALXlaWcqhICiCrUVFbkxsfo0rhiPpdXG6pbRKQ8omsK3tMIFEJnAZR3zjWgY4GDywCAQ8=
X-Received: by 2002:a67:fdc9:0:b0:320:c64c:3204 with SMTP id
 l9-20020a67fdc9000000b00320c64c3204mr938223vsq.36.1646867581937; Wed, 09 Mar
 2022 15:13:01 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 9 Mar 2022 15:12:51 -0800
Message-ID: <CAO=notw1Aacb+EXLOBw4fy3rt2cFSkYmeXtJx6UziBdz7tveTg@mail.gmail.com>
Subject: Lost patch
To: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000037324d05d9d13d36"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=venture@google.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -134
X-Spam_score: -13.5
X-Spam_bar: -------------
X-Spam_report: (-13.5 / 5.0 requ) BAYES_50=0.8, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--00000000000037324d05d9d13d36
Content-Type: text/plain; charset="UTF-8"

Corey and Peter;

I was about to submit a fix to the at24c-eeprom device and noticed that my
v2 patch appears to have been lost to time.  Is there any way we can get
this pulled into 7.0?

https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03485.html

Thanks,
Patrick

--00000000000037324d05d9d13d36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Corey and Peter;</div><div><br></div><div>I was about=
 to submit a fix to the at24c-eeprom device and noticed that my v2 patch ap=
pears=C2=A0to have been lost to time.=C2=A0 Is there any way we can get thi=
s pulled into 7.0?</div><div><br></div><a href=3D"https://lists.gnu.org/arc=
hive/html/qemu-devel/2021-12/msg03485.html">https://lists.gnu.org/archive/h=
tml/qemu-devel/2021-12/msg03485.html</a><br><div><br></div><div>Thanks,</di=
v><div>Patrick</div></div>

--00000000000037324d05d9d13d36--

