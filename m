Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B135AED73
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:37:52 +0200 (CEST)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZi4-0006bF-3v
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVZXg-0001Rb-62; Tue, 06 Sep 2022 10:27:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVZXe-0002t6-2b; Tue, 06 Sep 2022 10:27:07 -0400
Received: by mail-ej1-x631.google.com with SMTP id lx1so23645265ejb.12;
 Tue, 06 Sep 2022 07:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=VYgbRzofHKigbZ5U6ejPg9vdG48xpsKr+fBWhy4ZoVM=;
 b=nE8skTayzh8uYBDm6TXSBbUV5o4o8BC3gM6bkV8d5lvPE6fmhrkK1PWUtHMfnvYAcI
 PJ+tT7w7dLPbn4pEXDBiQ6sGaGDLimi/MJApG3h7XdSQh5NIwaBF+v6ZVicNSMXJFJLR
 vCiwcsbTN+vzq1eRzkePyc3jVdHwrz6jqYdMvzpvNFlYaSiM0PtC70Iw5t6PddHSju8s
 o0Qdu7pVjOK7T7mNtZop1PJn0G7q9Hv7+QrTso8YGGO7XhcIn5XqqfLgwRIJGNGYTHTh
 xufAGsulryVfHJTHSTA/mLKvT1fYnQN74MC7ls31wdXfXQYQkz9f7bXwz9uzuGb50MXp
 SqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VYgbRzofHKigbZ5U6ejPg9vdG48xpsKr+fBWhy4ZoVM=;
 b=SOFfTju1aMxW/IpJg90RhYnQfMwLl6vEvbXj0xBP7bUcCVgqKT0bH2fUzQpZ58phXj
 +Ilwepn9QexErL4oWrYMC+C5LluSEwWJyhcjz2m+KECpTu3CSsbMoh+aqEOGenwAbRiX
 2tyaxyc4Y5PLrwUQxg3fyatS+tKYiWLQLLmi5Wb1UyEuJCLQZa8+AuzBtM0ypc0MQdI+
 sJZKuKIsh3NDnKu9VFBKcjxkBsgz7bA+XCED0hWVzSU0LQbherSfK+HBpJuNjnRT9n1C
 W8WYu2GY/Z0deIm2c8+86hhA9qXVrooxsjScacYkbf8UDlpQVBVz1p41StER/mijMBQ4
 EO4Q==
X-Gm-Message-State: ACgBeo3ANUzWVDMB8gjjdu/7pGdD+TeVp8FMXNYQvYae9Hp2c/yg/mcu
 sIWY82hF+HD3hdtepIVAPYBLqPC9UmQ=
X-Google-Smtp-Source: AA6agR4NdcvKTgKciVMzXOulLDq0KV/MeyNS+YZeVDtPm/8wezq3UB6BwVxQ+HmC5NrULwQN2EH/lQ==
X-Received: by 2002:a17:907:c05:b0:73d:6e0a:8d22 with SMTP id
 ga5-20020a1709070c0500b0073d6e0a8d22mr39291142ejc.646.1662474422805; 
 Tue, 06 Sep 2022 07:27:02 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-188-175-122.77.188.pool.telefonica.de.
 [77.188.175.122]) by smtp.gmail.com with ESMTPSA id
 ez19-20020a056402451300b0043df042bfc6sm8391244edb.47.2022.09.06.07.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:27:02 -0700 (PDT)
Date: Tue, 06 Sep 2022 14:26:59 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Liav Albani <liavalb@gmail.com>
CC: jsnow@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
In-Reply-To: <20220219080818.327683-1-liavalb@gmail.com>
References: <20220219080818.327683-1-liavalb@gmail.com>
Message-ID: <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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

Am 19=2E Februar 2022 08:08:17 UTC schrieb Liav Albani <liavalb@gmail=2Ecom=
>:
>This is a preparation before I send v3 of ich6-ide controller emulation p=
atch=2E
>I figured that it's more trivial to split the changes this way, by extrac=
ting
>the bmdma functions from via=2Ec and piix=2Ec and sharing them together=
=2E Then,
>I could easily put these into use when I send v3 of the ich6-ide patch by=
 just
>using the already separated functions=2E This was suggested by BALATON Zo=
ltan when
>he submitted a code review on my ich6-ide controller emulation patch=2E

Ping=2E Any news?

>Liav Albani (1):
>  hw/ide: share bmdma read and write functions between piix=2Ec and via=
=2Ec
>
> hw/ide/pci=2Ec         | 47 ++++++++++++++++++++++++++++++++++++++++
> hw/ide/piix=2Ec        | 50 ++-----------------------------------------
> hw/ide/via=2Ec         | 51 ++------------------------------------------
> include/hw/ide/pci=2Eh |  4 ++++
> 4 files changed, 55 insertions(+), 97 deletions(-)
>


