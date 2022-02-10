Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 010124B12CB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:32:33 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICMy-0000oD-2p
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:32:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.j.gillespie@gmail.com>)
 id 1nI582-0004aj-4h
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:48:38 -0500
Received: from [2607:f8b0:4864:20::929] (port=41584
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simon.j.gillespie@gmail.com>)
 id 1nI580-000683-CH
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 03:48:37 -0500
Received: by mail-ua1-x929.google.com with SMTP id w18so2638283uar.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 00:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=C9JkpGMDNKPT5sdGRbY2aIUEhLcHfQX6MusSvSkYJh0=;
 b=SVO+Jz+JkCmprU0RJ+OTlokwvOdS/80XL+GBTnTiw+bqScRfnDrJoGk+OLj7yNv8Qk
 aWNErPt+axcyzqZFThKqkh+Eo0fXTGhtTHISEcYDkwgx75zJCY1twDJ3LQhUsKU2fp0k
 2q1vpyTVFgwg520zx7CtePk70zblcxqf6Jp85vBKDMXr7wRkK7Nm0b3LjOgmBUERcXYV
 MhuMxPYok2x6V0NbVRZVUqZrNhGIC6gqXeXidoD1m5T5m275yS+GU/7GcO2D8SBUQ9rY
 HBjBND7Y5M+wMmhpFSvkCBr1DyHLJbZM2n1hE3JNlJrhFK26xqunrFRsYlCFDskIzFSu
 yxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=C9JkpGMDNKPT5sdGRbY2aIUEhLcHfQX6MusSvSkYJh0=;
 b=vW1r4u2mqkZlPsCxjYh5apMT76wBjCyXSvKefaIkEco40sEq4oq6Z8zcQufb97BReR
 uy3pLjo0Ixt32r54Icctx9ePFByXijbEbd66Gc7gUNeicELI5VBP6MFD0MESbP+fj1ZI
 1VBOBOssPgH9vtkmoWT6qIqyH6zsv/ZqvpZ+AQw7UKiuElYGRdOQM6R9Pli2UlU7nQ3R
 vnrwT+/6DOpCSU+ethVGB0T5n2kjFyGNn4l1HsoiD4xqFmUp8YjLwHXxBWjAcgJJ0wp/
 1LPuT5PbhwM1Qpa2sK5OgERJ5cDsSSEtJl8MRkNotkrHWvu0yWYAihg+t5+5z3M/ejHS
 eaiw==
X-Gm-Message-State: AOAM532M1K+dcRBG7XQPE1fkJC/gHiJgX7sIK7xtayh1w2hHwMnahBio
 wmndplRBZo3JGJh/7Ns1YMVZGfKwb7pTjosDwBb+kJX7
X-Google-Smtp-Source: ABdhPJyu1UoSAOYpVsm0/NH2aP6V58iNw3lrB6rhFtCTwkQpBkHrqJtiG7WcD0oAs5pWrYDy152FH3jYGjBvq9TvaDA=
X-Received: by 2002:ab0:2117:: with SMTP id d23mr2181302ual.28.1644482914123; 
 Thu, 10 Feb 2022 00:48:34 -0800 (PST)
MIME-Version: 1.0
From: Simon Gillespie <simon.j.gillespie@gmail.com>
Date: Thu, 10 Feb 2022 09:48:24 +0100
Message-ID: <CALvnna2e7a5EiPKWopBcOSGK5QVTyB_8nAp4hJr1ibbTqLuN1A@mail.gmail.com>
Subject: Anjin Virtual Computer
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ef84e905d7a603d0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=simon.j.gillespie@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_95=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Feb 2022 09:35:17 -0500
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

--000000000000ef84e905d7a603d0
Content-Type: text/plain; charset="UTF-8"

Hello,

Could those interested in my project please contact me at this email
address.

I have been informed there are some interested parties via another channel.

Thank you for your interest.

Best,

Simon Gillespie.

--000000000000ef84e905d7a603d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Could those interested in my pro=
ject please contact me at this email address.</div><div><br></div><div>I ha=
ve been informed there are some interested parties via another channel.</di=
v><div><br></div><div>Thank you for your interest.</div><div><br></div><div=
>Best,</div><div><br></div><div>Simon Gillespie.</div><div><br></div></div>

--000000000000ef84e905d7a603d0--

