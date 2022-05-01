Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D515164DB
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 17:07:09 +0200 (CEST)
Received: from localhost ([::1]:59198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlBAC-0004Pa-97
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 11:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nlB97-0003iu-JT
 for qemu-devel@nongnu.org; Sun, 01 May 2022 11:06:01 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nlB96-0002P2-1X
 for qemu-devel@nongnu.org; Sun, 01 May 2022 11:06:01 -0400
Received: by mail-oi1-x231.google.com with SMTP id r8so13216959oib.5
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yyM2lISxheERx4J9tPLOiplQq1MnbupJZ+6JA9CpgFI=;
 b=I0e/3VrjmMhDQB5y9TPtbxFZi5ssmnUqmtLclkGW0+0tMcYECaMbsle9OAGJCu+Yfz
 LAgKCZk4gz+rQJ/RuNB5muPrRr6UV/hdESbKgSNDmNIxwVhluqcyEMDvwoHF9F/ikiqz
 +okqjRtPKonIeeM9fwwT6vaoGJ/DXIJCPjX9PA9M904ND8DAez6LeYivLI0mvDwi3Ir5
 3rzEPBra+xWQy/di6Qc4yxjwPcFMN3mFO1Ghx3JluQvY2JvBcFc67Y1KnTQyz0fEpkPp
 L+Z4uQTwhlwB/fJfPIH9K+gFgg7jxOlcDDNjGwExMq5VAUrGJ/wCuQpLFfTvgsOuzcRl
 /zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yyM2lISxheERx4J9tPLOiplQq1MnbupJZ+6JA9CpgFI=;
 b=g4YaiI6J7vgAP6ctN6jKN6f8kEbSGgsoVdADQxDlWWyi3FRuUXdlLVcptZfqpkvJQU
 M41/HiLF3v4qEKkMyshGs7nQqRu1lSO3z/olWoa6WSzqJ+AGgkhs3C34xt7bk/d4Ynxr
 G1cErmngrW8FAxkQmepBCtlGCcy0kiDHyrMGkboc4LlHvOsUQtvUnT+sOZpIaZp2ZIk7
 EWOExbwy8QZ5Ww23anUaToi4WiC8XCy4BjYHMCofEe+lBTo6tHjMUYHe0+ZtKMYmioSM
 HS05jkjJB/u432fOHflcwF/2gHXCADxxtUAdVZmouX8S8Q5SQqiL4q82I3/pHVgllzAb
 WpTA==
X-Gm-Message-State: AOAM5300dPGmYxF3ETMZ1TkbvqWUkl4jzUXUShEXbu+xmB/6Leai255x
 SG3Lywj9/xSs4XEDhIgD7tni5bMdWqGwCveXC+4=
X-Google-Smtp-Source: ABdhPJwXDsFtwhUcOquullU+y4rxzqaffaoiNvN8uhoaGLj0OIVU/pr5ubd+cLrDP8UXLDUCLzufOlAwTyPaqrPIEDA=
X-Received: by 2002:a05:6808:1693:b0:2f7:2aac:b47f with SMTP id
 bb19-20020a056808169300b002f72aacb47fmr5749929oib.104.1651417558463; Sun, 01
 May 2022 08:05:58 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 1 May 2022 16:05:47 +0100
Message-ID: <CAJSP0QVLMWMnAz+TaqUam7OivAekGLy7p58tr2Q-_0Ynx-XZJA@mail.gmail.com>
Subject: Where to find QEMU release signing public key?
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mike,
CyperCare came on IRC and asked where to find the public key used to
sign QEMU releases.

The website links to the signature files but there is no public key
file on https://download.qemu.org/ or the website that I could find.

Is the public key already published somewhere or could you add it to
the download.qemu.org?

Thanks,
Stefan

