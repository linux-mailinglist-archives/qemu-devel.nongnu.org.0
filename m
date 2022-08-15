Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366CE593289
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 17:54:09 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNcPn-00081u-KU
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 11:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNYFk-0008Lx-Mv
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:27:28 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:36571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNYFj-0006KX-2k
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:27:28 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31e7ca45091so64625967b3.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 04:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=OowXZZC50NNtD1SLFqOKRTX+/bac2msdiPXsBCz+5+w=;
 b=SAzUGaD5ceUDd4BzFe3kbA3vIsD6nhTUaM90/OoPIkuSfMNj4GL1blu28z2tiTAkdu
 4XpftZ+cR/HiuuLuqqTbW5DPkhRbbNXOVLhooHChEfOcFC0kAWzZomkNRI7TYyyY+lkg
 Tn9iKPY3fSLfsHAZ0RMXk29FtL55//63Fe+M1Qe9rR9Pv9Boz78IFUk1Xfmv08esvTOG
 bIQg8eZ3Qv4vLEbXVXXWpY2s8Wrkm0vKXS32IDn4k+P5ud4UG6UsNJi5eNqnXJrQEuQ7
 16m93x09UxvKjUDpYBj3YLFA8AV04eeYVPPHMo7uwNBOHaWfUdSEtVAJYNsGKk6x/2GO
 mwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=OowXZZC50NNtD1SLFqOKRTX+/bac2msdiPXsBCz+5+w=;
 b=Mm8FpA3MfIvUKI9RxPf7BzBJdmiMoaF6oXpc86GxjdsCcRM5hiOqXU58nXuqIXYMgP
 AlAze3BRm//1iBmxfwRJaD9bEfmxHyTo7DP8lxfoPFGdtw/iubiUXQ9FbHOkbVz/3gfz
 v5GljiUDUG801c+R0sE2oMIdB5oTHNMmCPSpuw/47Ek6eGotJ+CBK8YvKj3gk21xlKzY
 MqBNP56uHfpRxtj3teDQxbPSf0GMgFQeZkk82aqA0ocbaWe7g+Meh0O6qNJ9197ITFqa
 0mQrZ9IHFhDlIgTNaiGbxtfKNORQkRzhvTwg9p9yRSJgsMoh/s8A+ICvOniGqVzeNRvw
 aOUQ==
X-Gm-Message-State: ACgBeo3E2y0U36GXvwCp1bo1P/mx1SkB7mqyqufzsU0ae6Otp2/2SDMm
 DBahEICg6YjjZAdaHPmB9Gy5uDfY4kE8shHV3ugL8Wz8atw=
X-Google-Smtp-Source: AA6agR7CXzTg1qjBLjjHu1w96IC+zTHlgT7q1AsoRMh9SDRGk6xuqAQWDSbSM8YVSyh2zwo2LPBGKncxpltuDQZzYMw=
X-Received: by 2002:a81:a24e:0:b0:324:61ef:70c with SMTP id
 z14-20020a81a24e000000b0032461ef070cmr12792081ywg.413.1660562845406; Mon, 15
 Aug 2022 04:27:25 -0700 (PDT)
MIME-Version: 1.0
From: vaishu venkat <vaishu071998@gmail.com>
Date: Mon, 15 Aug 2022 16:57:14 +0530
Message-ID: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
Subject: Bluetooth support in QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008717c005e645ea96"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=vaishu071998@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Aug 2022 11:48:23 -0400
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

--0000000000008717c005e645ea96
Content-Type: text/plain; charset="UTF-8"

Hi team,
            We are currently required to use QEMU for virtualization of
customized application. The application requires Bluetooth and Wi-fi
support, as observed below warning,
*qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is
deprecated and will be removed soon. If the bluetooth subsystem is still
useful for you, please send a mail to qemu-devel@nongnu.org
<qemu-devel@nongnu.org> with your usecase.*

 Could you please help us with the support of bluetooth in QEMU.





Thanks in anticipation.
Regards,
Vaishnavi V

--0000000000008717c005e645ea96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi team,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 We are currently required to use QEMU for=
 virtualization of customized application. The application requires Bluetoo=
th and Wi-fi support, as observed below warning,</div><div><b>qemu-system-a=
arch64: -bt hci,host: warning: The bluetooth subsystem is deprecated and wi=
ll be removed soon. If the bluetooth subsystem is still useful for you, ple=
ase send a mail to <a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@nong=
nu.org</a> with your usecase.</b></div><div><br></div><div>=C2=A0Could you =
please help us with the support of bluetooth in QEMU.</div><div><br></div><=
div><br></div><div><br></div><div><br></div><div><br></div><div>Thanks in a=
nticipation.</div><div>Regards,</div><div>Vaishnavi V<br></div></div>

--0000000000008717c005e645ea96--

