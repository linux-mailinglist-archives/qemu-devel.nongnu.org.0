Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CA48E85B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:33:28 +0100 (CET)
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Jtf-0002mo-3y
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n8Jrm-0001pX-JQ
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:31:31 -0500
Received: from [2a00:1450:4864:20::530] (port=44831
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n8Jrk-0006dr-Eq
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:31:30 -0500
Received: by mail-ed1-x530.google.com with SMTP id w16so33270674edc.11
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=YWAHgxdTzyv21LORiz3Eq6c2CC2+eAcWxKIQe73RCeM=;
 b=Ybq5BZXUfn7YghhkRKSix4p1AHuQ6ix4H9+9sd0K/oTg+wil78escndr1wAVipZioN
 S+OuFc3LNtxN5LDeGu1tkcWxgZNUUN5//K4jXezmHKZZVbEK5wpj04RhLSICTjw+NgH5
 G/4Cf/VNVy+0cy+B8AZTLbGuQv8F3HkCe4B49f6U+Eibj26ywQUk1jaxiNYJZGAvHOdc
 EXybibI+jpTS6NIN+CXdb7bMVJqphVqSyxXaHOkQrylHzqlJM/yvUcY13CWapztG7dAF
 KZdhl8zY2yOYnKuTl1r9ilKOt+nzm3joeAmfihwEN/dm+h9gHA0+cYOVichWPUuOm2k1
 WWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=YWAHgxdTzyv21LORiz3Eq6c2CC2+eAcWxKIQe73RCeM=;
 b=dspSluvPIuFnzMKPkrzYK/oXpyunfTO3+SOOLY4FMTT2rluXH/rQmdWXs2FGs2/oQt
 kcGFxvDYVlCJizoSZ4SJlp+TVwUc63I+1QzRjFxAX87mqeQztxDkpBFZYS4SaRjnBZoc
 iKV23yd7x1s53+frPp+S80hn1QRYAkJE1drQiZbrsbG6ScAV/Oyj/7hmuclIlId/oxO8
 t0r/WhcqvsxiiJHL34cmR1tTOly1FuLfMAD7iGU0uNr5EVlLUvWU14s96TfvcwTBEwh5
 BTQv3+YaLs0GsKzPA+gMaKBh9efbs322FL4qcXqQGvphzHFWYhBRdI8fVKAfsQVc5+ux
 iLCg==
X-Gm-Message-State: AOAM532s07gfpUeGLzK1NjBkaGQtw593oIncY6bFqh7cJcQU4hNXrXjH
 ppQ5ZcJrDCkCDD1mrSQrWWReMoIURJErTdtV+W7VMw==
X-Google-Smtp-Source: ABdhPJzxMfRVmh5pq5VX57UFZ8S81ylV20DIACLZ0asm8UL8qs4V2GBQdSC9oO9Mn73zxxSzmbIAw62qXkCevNjJo5g=
X-Received: by 2002:a17:906:1315:: with SMTP id
 w21mr6577299ejb.51.1642156285998; 
 Fri, 14 Jan 2022 02:31:25 -0800 (PST)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 14 Jan 2022 16:01:14 +0530
Message-ID: <CAARzgwx6YtzANV1z24bCmnDiu3bEsX1SSiJ8HjZbmryA2N2Uyg@mail.gmail.com>
Subject: Re max ISA serial ports
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000017ca9f05d5884e65"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x530.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017ca9f05d5884e65
Content-Type: text/plain; charset="UTF-8"

I have a question re the following commit :

commit def337ffda34d331404bd7f1a42726b71500df22
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Fri Apr 20 15:52:46 2018 +0100

    serial-isa: Use MAX_ISA_SERIAL_PORTS instead of MAX_SERIAL_PORTS


Does this mean that this limit of 4 slots qemu / hypervisor specific or is
it limited in general by hardware across all hypervisor? Can you please
clarify?

--00000000000017ca9f05d5884e65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I have a question re the following commit :<div dir=3D"auto"><br></div=
><div dir=3D"auto"><span style=3D"word-spacing:1px;color:rgb(49,49,49)">com=
mit def337ffda34d331404bd7f1a42726</span><span style=3D"word-spacing:1px;co=
lor:rgb(49,49,49)">b71500df22</span><br style=3D"color:rgb(49,49,49);word-s=
pacing:1px"><span style=3D"word-spacing:1px;color:rgb(49,49,49)">Author: Pe=
ter Maydell &lt;</span><a href=3D"mailto:peter.maydell@linaro.org" style=3D=
"font-size:1rem;word-spacing:1px" target=3D"_blank">peter.maydell@linaro.or=
g</a><span style=3D"word-spacing:1px;color:rgb(49,49,49)">&gt;</span><br st=
yle=3D"color:rgb(49,49,49);word-spacing:1px"><span style=3D"word-spacing:1p=
x;color:rgb(49,49,49)">Date:=C2=A0 =C2=A0Fri Apr 20 15:52:46 2018 +0100</sp=
an><br style=3D"color:rgb(49,49,49);word-spacing:1px"><br style=3D"color:rg=
b(49,49,49);word-spacing:1px"><span style=3D"word-spacing:1px;color:rgb(49,=
49,49)">=C2=A0 =C2=A0 serial-isa: Use MAX_ISA_SERIAL_PORTS instead of MAX_S=
ERIAL_PORTS</span><br style=3D"color:rgb(49,49,49);word-spacing:1px"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><font style=3D"color:rgb(=
49,49,49)"><span style=3D"word-spacing:1px">Does this mean that this limit =
of 4 slots qemu / hypervisor specific or is it limited in general by hardwa=
re across all hypervisor? Can you please clarify?</span></font></div><div d=
ir=3D"auto"><span style=3D"word-spacing:1px;color:rgb(49,49,49)"><br></span=
></div><div dir=3D"auto"><span style=3D"word-spacing:1px;color:rgb(49,49,49=
)"><br></span></div><div dir=3D"auto"><span style=3D"word-spacing:1px;color=
:rgb(49,49,49)"><br></span></div>
</div>

--00000000000017ca9f05d5884e65--

