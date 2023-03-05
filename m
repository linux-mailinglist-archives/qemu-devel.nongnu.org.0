Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8716AB0FE
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 15:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYpCL-0005Qa-OK; Sun, 05 Mar 2023 09:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ido.ber3@gmail.com>)
 id 1pYnte-00056P-8P
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 07:55:26 -0500
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ido.ber3@gmail.com>)
 id 1pYntc-0001Qr-Fw
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 07:55:25 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id nv15so4878231qvb.7
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 04:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678020922;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yY6wDT+rJGBVfH/7jcIGUZdQs6zkoYj8CPMI+LSK1VY=;
 b=SoM33u5TZiGiBrL+IEp+Abu0kWTFN4APbg7F6tooiZ2YuFHLwm9SiAFIs+LxcBF4XD
 SNHMU5j+igyzm1SFlv3iDI51DeOLzgUTGBndLtW9qJZbDnvqWsPQpaG69Zg75HDN8drY
 06jkQHhjRZyu7kg01J1l68nNXYMXEVDDBh5qe6TsMdWvWFpJDg2/Mp5PPEhpthafjVzq
 QUrp+7GW7TU8SKQXeX4e5STAF8V/aeTRlHqXirQlYKEu3gpxH4ZUkW4ttwgxWXKu/BeG
 hX6s4zvrQ/DeKu5/0J1HB0CK+3dJiN+CEFwjrIEdqf97swui5KtlnlUuK+4PTv3fPCE1
 PsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678020922;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yY6wDT+rJGBVfH/7jcIGUZdQs6zkoYj8CPMI+LSK1VY=;
 b=i7iwPy7gw5HslW2fsw9Rx9GHZUSLxvGIQsSaU9UZrtKpwV7Yh8afbaQoujgpQnfVez
 QHdB47gyJygiw+akXnZzdq//4fVgO2lLOfxqnDea2zy2/1Kp+JRLmaYAUhDgIrAD5D0K
 dKoWBEIimereGGpRd3PVLSJTX0UZCwFtrqxcAfoVSu/re2Zdxp7wPqkaSsEUsoL9T7OT
 ioRXR811i6mnNsB80DGwI91iMDKXJO+vxRGY+0yA2qwp2dP1/tNWaIE9XPvPqiaElNMs
 XHT2Jqn2pGdsHoABap+h9sQpUoted4E6OeSmN+ufrfTMeq10SVZfPTORvR73ns2RhF5+
 B8gg==
X-Gm-Message-State: AO0yUKWLInL1MELyM3oPK4ypuU+frj/F9gKd4zOGcic3SPxTvjVELSmp
 a5gYPc6t59Q87gydHUwziVqU3TOlksHdE3ybre3g7tK1mhc=
X-Google-Smtp-Source: AK7set/5FGxDfrgdo7uUUY+yAJULgiUjjN8f+gGytSJN1MAxKFPtOXAN407JZfto7rnaCtNvrIe6g/K8gqpiodKWhLk=
X-Received: by 2002:a05:6214:1408:b0:56c:2300:298 with SMTP id
 pr8-20020a056214140800b0056c23000298mr1979975qvb.8.1678020922506; Sun, 05 Mar
 2023 04:55:22 -0800 (PST)
MIME-Version: 1.0
From: ido berenbaum <ido.ber3@gmail.com>
Date: Sun, 5 Mar 2023 14:55:09 +0200
Message-ID: <CANamGFFGx2vqrkdRD1rG+oaJ7_EO8w+oQL8viNanKpiP7P9O=w@mail.gmail.com>
Subject: starting developer and imx8
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000301c405f626b185"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=ido.ber3@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 05 Mar 2023 09:18:46 -0500
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

--0000000000000301c405f626b185
Content-Type: text/plain; charset="UTF-8"

Hi,
I am beginning to get into the virtualization realm, and had a few
questions, some regarding the process of learning the development, and some
regarding the capabilities of me and qemu.
I would love to get any resources you might think are relevant to get into
developing in qemu. Currently, I am reading the developers guide in the
qemu wiki. if you have any other resource it is welcomed, and also if you
think I should make a certain project of development inside qemu to
understand it I am happy to hear about it
Now to the technical questions,
One of the reasons I am getting into qemu and virtualization, is to emulate
an IMX8 processor. Now, correct me if I am wrong, but as far as I have
seen, the IMX8 family is not officially supported.
I thought about the available ways for me to still manage to do it.
First, is off course just implement the whole emulation of the processor,
as someone that is a beginner in this field, I would love to hear fro, you
what do you think about it, How much work does it actually entail, and what
it includes (learning the imx8 datasheet for example)
Secondly, which is quite similar, I thought about that the IMX7 family is
supported in qemu, and so, the individual cortex cores are supported. From
what I know, the IMX8 family is built from similar cores, is it possible to
take the cores and assemble a IMX8 processor?
Third, any other way that you think is feasible to get what I need.

Thanks, Ido

--0000000000000301c405f626b185
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I am beginning to get into the virtuali=
zation realm, and had a few questions, some regarding the process of learni=
ng the development, and some regarding the capabilities of me and qemu.</di=
v><div>I would love to get any resources you might think are relevant to ge=
t into developing in qemu. Currently, I am reading the developers guide in =
the qemu wiki. if you have any other resource it is welcomed, and also if y=
ou think I should make a certain project of development inside qemu to unde=
rstand it I am happy to hear about it</div><div>Now to the technical questi=
ons,</div><div>One of the reasons I am getting into qemu and virtualization=
, is to emulate an IMX8 processor. Now, correct me if I am wrong, but as fa=
r as I have seen, the IMX8 family is not officially supported.</div><div>I =
thought about the available ways for me to still manage to do it.</div><div=
>First, is off course just implement the whole emulation of the processor, =
as someone that is a beginner in this field, I would love to hear fro, you =
what do you think about it, How much work does it actually entail, and what=
 it includes (learning the imx8 datasheet for example)</div><div>Secondly, =
which is quite similar, I thought about that the IMX7 family is supported i=
n qemu, and so, the individual cortex cores are supported. From what I know=
, the IMX8 family is built from similar cores, is it possible to take the c=
ores and assemble a IMX8 processor?</div><div>Third, any other way that you=
 think is feasible to get what I need.</div><div><br></div><div>Thanks, Ido=
<br></div><div><br></div></div>

--0000000000000301c405f626b185--

