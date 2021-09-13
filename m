Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8040898A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:55:29 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjcT-0002fd-Oc
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjaS-0001Ae-Oh
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:53:20 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPjaQ-0000XN-7e
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:53:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id d6so13931116wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 03:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=23CQT8JHOlj1uTBsgIsUVOu8S+bFha+sGbNUIz59m4c=;
 b=CXV4x9cmXFUJnxnzWTPd1r1YiQ5NLHH0YD3C2tYjthDp9Ure2a1sQHinHBpVMIPAcB
 mkh+gInDJgwHbJFWl8ZYY5NRR5VfWPNxQe8Rd8hkERTAI3BBf+gco0Zo3ckZLYUBD0+9
 bw2QkfS2B4aAKc+rWnZ+Rm8myL8DVxDswz61jqCR0ekpInPL8g8Am8PHZMnk3YlDpz+Z
 m7L5n9qgf7QbVpwH2j7irRhwh4KSqqERr1fRoviA3qPTdybsaCRAHVaWapqZMZQ3O9wb
 HeKFHILIE2KmYbzgllsZtQH5w+AGM+sgC8QS+kgjvqDDHceVT+06sQ9xKkfjPjg1D8qc
 azag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=23CQT8JHOlj1uTBsgIsUVOu8S+bFha+sGbNUIz59m4c=;
 b=dLXnyKOJYE5TQWBeKYBsfjRnKPyqSFAE+N0vLacsSYtbcu4YeLLk1z3A9DPELX7hyb
 T8ys/GqXaa5tv6evt5L5wYnuY7NAxRD7+ePRqBTcTXD8SdDPtA0515e5F7eLEG/mP716
 DhObODe5CkIs4f0dEuAsC++odBmRGINGB8J/4PBLmLX2D4+49gqHh5HR/eFQ4qmLiXpH
 t7VYrvMFuSbU4J1yeDUJtr3vsgkiB72DrBXV8urwVeVSP6+z8cZ6nJxojjNrfyqHIYAi
 hlVqVI8ksIx0xGSs/4rQhe5x2dP6jCKfaljirBnvBh1Owycchl9/ybO0QJW7pEV+hSTe
 zJeA==
X-Gm-Message-State: AOAM532cqsalW+hYDJGeLREXGXwhWKcVJncudFcPK2sPuLKIxOq/KERp
 PYlcR5/3PoqsSVVG/HM4m5tAFcVuMeMAytcMkLPGVw==
X-Google-Smtp-Source: ABdhPJxcy23iiNtmwprkTe735895MZoa9QgvLKDwpLv/FYoqI7WwYl8J4jgdsiW6EHZqnG184mGDyGQl52sQTimy8hA=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7730796wrr.275.1631530396691; 
 Mon, 13 Sep 2021 03:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
 <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
In-Reply-To: <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 11:52:26 +0100
Message-ID: <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 11:46, Alexander Graf <agraf@csgraf.de> wrote:
> Why? You only get to this code path if you already selected -accel hvf.
> If even a simple "create scratch vcpu" syscall failed then, pretty
> failure when you define -cpu host is the last thing you care about. Any
> CPU creation would fail.

General design principle -- low level functions should report
errors upwards, not barf and exit.

-- PMM

