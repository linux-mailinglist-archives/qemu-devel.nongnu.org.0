Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DF3B24C7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 04:12:57 +0200 (CEST)
Received: from localhost ([::1]:54276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwErQ-0006kN-IE
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 22:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwEqN-00064P-6C
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 22:11:51 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwEqL-0005c5-N8
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 22:11:50 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 m6-20020a9d1d060000b029044e2d8e855eso2044749otm.8
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QumqO9u33T+h2IOaSPpLpFLAszV6T0MC/Hq0htOLvUY=;
 b=ToN+MC3BH04Tg4RboVK8zs7gU6ApqlHiDknyZUzboHOAyr3+hDuCAjeMaTLCrIZZyq
 M6KBLrTxCWw8PR1BSKy2o8FCy8z/z4u134jAmF/P1qfXKtbWMdxp6kbv+q42X6O+Bz2Y
 eSY320B4hbpCfsnakERb3xf2v9fIYBIgOKr2zUMLoMf0CIKPPAukc0yAo1g3DX7EdGYw
 +J1qSFhJDIFxmqgFSYmACbTyY/q0yVDsDQOsXopKEKCDpjKB3FTIYNm0znEFDkMYGE4+
 TfvezEqvM77nzCdQYfx6bEFc5D1tXy/qC78DJJYgOr37kPq4Ef/In3QivKegIWzEOecy
 mmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QumqO9u33T+h2IOaSPpLpFLAszV6T0MC/Hq0htOLvUY=;
 b=Uls+GP9h9IsxvGQEVEXPym1P9EOZvfjxjgkgTgVcoOLcdsGrSOCUT2iVfgHrNqNxuD
 8X7DqtF6e/u4drQIdQ26sTywHxtMNAYAs42Tm6lqWsl6u7LQllmH5dHw3KWrNIhwAvVN
 HF2pX63cdAnxPV/V/N3iJAgodrK77rAwxeZMLPe8Y+N2S53AXVVgEgjTZcDGQBcxYR6t
 1N+Go6Ze23xgbDv1bI4SO2tyAyhY3p/Uun/ubtj6Md6I7ipapZQcy3jAc0d4O8npOW9L
 VkZmvvzcw9w/hofnhWGmCSyuB6aXt1ke6KYvx+m8YD+dHqoicV4UqIAsbiieN13TcR/E
 Wkuw==
X-Gm-Message-State: AOAM532boArIzC6Yql7tDYV0cshbCJHWUYkeCZYnrVjXMcUSIHL6BYHx
 wPs2HjkLVYmTC10AJE3Ui5HQr+9ogi/3OsCOYKM=
X-Google-Smtp-Source: ABdhPJxeHZczIORl45ssemjVWGzkTERposaADoGryJMsd3XgvSl083sDvpol/3agnX1xFUWK9mfseHeUvW3mWRNJcac=
X-Received: by 2002:a9d:7f14:: with SMTP id j20mr2561507otq.156.1624500707956; 
 Wed, 23 Jun 2021 19:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAKa2jkj=rJVhOuE9XXC9ccsAt=2vg3_MO_NDL3OL98ALHMeFw@mail.gmail.com>
 <CAAKa2jnbOLuaDbhaVT9Pc7BVfdJ632hpbFBsfk7eCW3evzzsgA@mail.gmail.com>
 <20210623122046.q57ydwxnhomhdjrj@sirius.home.kraxel.org>
In-Reply-To: <20210623122046.q57ydwxnhomhdjrj@sirius.home.kraxel.org>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Thu, 24 Jun 2021 10:11:35 +0800
Message-ID: <CAAKa2jn-YU6H1U5vzRqFpbZbCCWoq-xpOnXHPeD5dg5S1VdJTw@mail.gmail.com>
Subject: Re: [PATCH] hw/audio/sb16: Restrict I/O sampling rate range for
 command 41h/42h
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

> This looks like your mailer mangled the patch.
> Can you resent using 'git send-email`?
Yes, I can. I finally figure it out how to config my Gmail. I should
send a new email
and this thread is supposed to be closed, right?

Best
Qiang

