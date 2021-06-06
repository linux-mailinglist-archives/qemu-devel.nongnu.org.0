Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1339D20D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 00:53:09 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq1dk-0001yL-2z
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 18:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallolkernel@gmail.com>)
 id 1lq1d2-0001K0-Cu
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 18:52:24 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kallolkernel@gmail.com>)
 id 1lq1d0-0002s5-Ri
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 18:52:24 -0400
Received: by mail-ej1-x62d.google.com with SMTP id og14so18171521ejc.5
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 15:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=wcAkMaw0SllUMobELfXDZm6VyuCNoalJutydeuw6yT0=;
 b=p9jfA0uT2scxa7rUo+QVhu08O1EyLpomA5TUPfskTHFzWGA6IlEf4ph9Uf2VhXJPKd
 JV0tgG0aQgjnKoFDJP1vCFoIq0OS4VrmW7SM8iy/HtCi/823eViOcTMhZj5aGmOhp2K3
 rUz2wvM9djPJyTpBzTiJDPgGxfg0amQoo0M/k56Ac7bhDTOsYaXKuZWJ8YpcxqXfYFiV
 /a4xurcgVrQ6+Aa9O4QDx/iujhwg+gD/UjeIni+z5fsnX2dKfT/FgeoBh5VCafohnCNI
 JzmDqwzZ65U2U+GmWuzCChQ+Rv+TXme4n1falP4+A36fz3Lu/01E0PA3sJKUktr/AyZS
 x9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wcAkMaw0SllUMobELfXDZm6VyuCNoalJutydeuw6yT0=;
 b=aFGGsiCPetyxGdi16koiZdS6T4WeVJnWdrzZvAWW6ZjW87RgFj5WwpqcjgXRxw6woD
 mJbcuBYJbGQTLtcuCvXNSnxyWebPvQOhrPAh7qIA8Ov3ydO7KZr2m2oUGkvxpSb0ggJl
 P1meyzc+w9Bt3X7MJbDWkRifGuVwcMYLZTjYNVoBhqFVGmu8U38nuG4nwD4l+ZSGsvCY
 zLXKycmIKG5wyhgRKjAgeg2sKKKRxV5ZjCrq0woYbUQnvpOkS6pPzDOen6cVtPqxzJyz
 eEKLMrYxLnv87xQa1ZBGTjdIzP80bazZVtfzJxejkseLjkfg9/YPxUzUqMzjpCiG5ScM
 Le9A==
X-Gm-Message-State: AOAM53133h0pw+Cr93C7aiuqzS3VEYhNnReg17wT8fBQR0m9Mu4aIhPW
 bEZBM0yqWttkhFB33RezSVubh4qF0PuWNL7WowKiduqNDig=
X-Google-Smtp-Source: ABdhPJxV/R/lCKvSzx3Om9o5ub86zpGwZMbXFUii9r6bwIy735gb4tFr2InjnkmFW6chANC3RvC6jKiMNkbH2AYSwWo=
X-Received: by 2002:a17:906:b754:: with SMTP id
 fx20mr14345640ejb.201.1623019939963; 
 Sun, 06 Jun 2021 15:52:19 -0700 (PDT)
MIME-Version: 1.0
From: Kallol Biswas <kallolkernel@gmail.com>
Date: Sun, 6 Jun 2021 15:52:07 -0700
Message-ID: <CANcxk1j5qrz5zOqXMdYCb9U17jar8OMWybyFUEaRyK7SPwe8Og@mail.gmail.com>
Subject: debug script for QEMU/KVM
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=kallolkernel@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hi,
   I am planning to develop an open source debug package that will
bring visibility to a KVM

It will navigate through the data structures and display information
in a text file and on a web page.

I have never worked on Qemu/KVM and so a guideline from a book like
Qiang Li's book "Qemu/KVM Source Code Analysis and Application" would
be great. Unfortunately there is no english version.

It seems the Qemu developers have blogs that I can follow to get
familiar with  the design and data structures of QEMU/KVM. I would
like to start with memory virtualization data structures.

How can I find Qiang Li's blog and other qemu-developers' blogs?

