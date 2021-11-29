Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC454612EF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:52:03 +0100 (CET)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mreGP-0000fJ-4H
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:52:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mreEy-0007xQ-JD
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:50:34 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42993
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1mreEw-0006aK-E7
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:50:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 fv9-20020a17090b0e8900b001a6a5ab1392so13831260pjb.1
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=gStws1BsQA7ChV+ZSOVJ9jMVkmG66GOwFLh7gMjyE60=;
 b=eFKqu69J/Xgt/F4Of/guUi6aEe+helelYIpfX+KeICrG5Rzdt8j+JFGrckSGfKG7iE
 hiSL6y4lrUxN2EaYjWpezUfjBviv9HrdLyI90giBnknKV0ftt6PyVGxpcwdDm1nIqxRI
 uyXgfysMboWLQEqnOf+FHDm8pkBKAJFXAndwBkhJFMR9Zc4gvvL4A8h6LTe/4p1rb9sS
 R0Rnxn4c+ub0ZdNoBPpyIzlZFEpXJmVpNAQY5l5TIkydTk4hXvGjzFX5CHREJy03x6jF
 JpQaDL3q/YWUymDyinOcTVmYfXub5uyx6uLyszaTsuzY2fhqiSYfQFWjKrPJVeyhjYG8
 7PAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gStws1BsQA7ChV+ZSOVJ9jMVkmG66GOwFLh7gMjyE60=;
 b=sfWV0uMuICpPrkXHPvgCNnza4KixOPELYfxw9xVw+15vpuEMnWVwiSSEU+dprlqB7K
 J5rIAyZea0WrMeF/aVadFpMGL7Pt23Zd3E6UdpHqhUrh8lBba74FQvi8lOeDtJ7Vta1P
 HmlQVaYjf0aRpiv1///Afu6Y4HD5aaclU4smR1/9pZeqUPssAcCm+MXXKM/PBpMzJkFn
 zor5sYcBttC5lId0Ba5/0ST2IvVZIVfaWx5Y2Z694D9myF4ER9lwF6d7IW3bnjLaaWoH
 BgajFZytT+11OR3T15rN6OIqYv8vg92gjFM3EVOhQXzklq38QFBSNmST1fCCezJOPZHw
 l6yg==
X-Gm-Message-State: AOAM532IcwAn0YamAtSR1W7yyZTGQNTDYXAR7q2/+zYSWbplDDiG0iTR
 HRzhY059jPP4frgp/9g8FxpbOPtvw38cq5mBbcjUFuCLnDrpSw==
X-Google-Smtp-Source: ABdhPJyLpiR54bj8wEc5kd9QSP7ECQOnGRiHdUENcm6EwCf3Iqcexd5Y0gvCXhvAnpEEHG4be4ZYB+UN0h3MfIaDqdE=
X-Received: by 2002:a17:902:c20d:b0:142:21e:b1e8 with SMTP id
 13-20020a170902c20d00b00142021eb1e8mr57188517pll.27.1638183028486; Mon, 29
 Nov 2021 02:50:28 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 29 Nov 2021 10:50:17 +0000
Message-ID: <CAJSP0QWB=-CaLHFz_0qxrQpkAKgXVoki=bHjpWcFSR-bunqXSw@mail.gmail.com>
Subject: FOSDEM 2022 call for participation
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear QEMU and KVM community,
The FOSDEM free and open source software conference takes place on 5 &
6 February, 2022. It is free to attend and will be a virtual
conference.

You can now propose talks about QEMU or KVM at
https://penta.fosdem.org/submission/FOSDEM22. The deadline is December
28th.

If you have something fun or interesting to share, please go ahead and
submit a talk! Don't worry if this is your first talk or you are not a
regular contributor. If you still have doubts, email me and I can help
you with your proposal.

You may be interested in the following devrooms:

Emulator Development:
https://lists.fosdem.org/pipermail/fosdem/2021q4/003293.html

Virtualization and IaaS:
https://fosdem.org/2022/schedule/track/virtualization_and_iaas/

Retrocomputing:
https://fosdem.org/2022/schedule/track/retrocomputing/

FOSDEM website:
https://fosdem.org/2022/

I hope to see you at FOSDEM!

Stefan

