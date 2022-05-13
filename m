Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2FC525B28
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:02:46 +0200 (CEST)
Received: from localhost ([::1]:45028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npONx-0007Rh-4s
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1npOKj-0006k0-Lj
 for qemu-devel@nongnu.org; Fri, 13 May 2022 01:59:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1npOKi-0004qS-8e
 for qemu-devel@nongnu.org; Fri, 13 May 2022 01:59:25 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bv19so14188378ejb.6
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 22:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=s7TH8vZs85VPi+qp/KLaNe0wN4cNrGndbmeVz9ZOzeU=;
 b=SRR6MVVGqQcsuFoVR2baEHkLLrRticJ1jokBgPqc6XdvEsx85O6ZmonqWE0MP32F/7
 Wzwu4qDH5NhHAk2rZwAJ/45yfp7RMqDXpfeoTjTAkEWSTjpF/svLyMg6VrjbFZWqob+U
 lQTB/OsQiO6q8YeR8ujZZZrVw0DXVOk+JrvmbrxMA/smN/p8ToeTo6iMPYZBbT8W2iBO
 aX7yT8egS7NGmyGtBvJE978ldTCRxlNQyxyUWkGAYz0uPGabmmU9cCbOI0nXcS75UU65
 eOtgXl568KkX6U00hf1havArczhjTbBi6sFXNpe79U7/drAsru4ya8fp5oX52mWBbllh
 3GTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s7TH8vZs85VPi+qp/KLaNe0wN4cNrGndbmeVz9ZOzeU=;
 b=xNTbc5dLfqIFNSWTD1Nl8pkDXez3t2NkplcyaVoSS7Kn1UYFcG7/iXJO0UycyPvvgA
 wJDxvX5T3tGwRhTaxPQY/nJdKS95dJNnYlWnQdMPCCOWWmTwoS6ndA5za/DICg5/N5Xd
 Zb4cTeHT24nPLsTBkSbStgX+AS2PM7E18LJeFJYARQ2UACy4IW/OXE0cetceUF471acE
 3CPC/aCeCjL9njCeM40CR9qbsjCXqf8mXCyyIdyPvaGYkHXZYdXFGzec8V1N61o5Khpi
 w9eVhEx6e8BPhiQjjzB+l380RaUycFMVnNrFI4m2M+SEtMIO51hBwXgYpLUkkfM5H7Aa
 aPTw==
X-Gm-Message-State: AOAM532J+8CfchG9agm9W+zRMug6dwZlJRCby8GZjh3zfgTJOyfmDbpz
 8wJtSLv1+OGkZGifBj/ZLGFPyZzX6DZT8qIutr2kMppt
X-Google-Smtp-Source: ABdhPJyOdO1p88d/LgzBQYIEdtf4BqkUTqvf1IRF1/Zjz3zeBHc3TDxC1mwO+h2+dStlPwpbzKg3F/Nc2O9cXJdeijI=
X-Received: by 2002:a17:906:ece3:b0:6f3:da10:138a with SMTP id
 qt3-20020a170906ece300b006f3da10138amr2915729ejb.438.1652421560985; Thu, 12
 May 2022 22:59:20 -0700 (PDT)
MIME-Version: 1.0
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 13 May 2022 14:59:09 +0900
Message-ID: <CANW9uyswqzNGwkzbbNK_OcA-eF6Uf+Q3EkWgJrz2CudvQW4yPQ@mail.gmail.com>
Subject: sbsa board boot with neoverse-n1
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-ej1-x62f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard,
I'm wondering what options you use to bring up sbsa board with neoverse-n1
as I am only able to do it with cortex-a57, no other CPU types works.

Itaru.

