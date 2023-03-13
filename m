Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44926B788D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 14:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbhxQ-00012w-P6; Mon, 13 Mar 2023 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <billow.fun@gmail.com>)
 id 1pbbGP-0000xb-33
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 02:02:29 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <billow.fun@gmail.com>)
 id 1pbbGN-00023H-Ha
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 02:02:28 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-541a05e4124so33943387b3.1
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 23:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678687345;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R4z9ti3XArleI0/o5jxc04jj5Lkhqpr2W5MMm/jbXXQ=;
 b=TN7b6VrSMgM02ISVtsPKdpI/oeTnaPTx7JCbBQ3oNXUYwqkdnFw76V8ziNJ4mrfWJD
 OWurddTPB1WHQ22ZTaMH+y7pYUpqqZHsaT/UVoi6hSDd0UcC6a6pHYnH0pa8+PYNN1zN
 MzXIBt+6cl+LBaPyKtYaqEKTLfk/fkfCmjMYoG1uW7jt/hN5r/uoHK7ZDPYU6OwRYvqD
 6EX4ejb+s7fzTzOAXD/TMJcNd8mtiuofVzsdJP50XZpsaevMCGFchREXhDrNXgfARs3F
 bHXr0EYHVTdLj/9g+CcFU0ZE30APG4kNZqQy9N1RXKmr3WCDj0FHBbigElPmGqpgL+Up
 KEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678687345;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R4z9ti3XArleI0/o5jxc04jj5Lkhqpr2W5MMm/jbXXQ=;
 b=s0MhglAAflPNPF0abQd5wkt8axFmM/jLAqJvV/aNN7fzRBXwOmwg8AFBn2noJhbtMv
 BGmJNuOgjwcyj1UdcYHs10AewnX5YExaT98hVUsoRZ4PKDloK0mx7FZdUw9UOO3NGPBG
 k8aY0du1upb+B6Y2iQ7Mo5Wfn+noEGptfEgsBAMrQ6/D/e144/kA4b8Q8BphepIIZrap
 r+koUy8rdDvx0pSzUpHImxMcbB44nvHnxrmy1jAxTicKWZq+NSTQzIMghqQay3ejAYfM
 xJpxDa5dR887eeCggWy7bQqJ6psWH9lU7HFi2yiEHDoB/Wn9Q2F4RewLedlLeqPMtVKA
 E+dg==
X-Gm-Message-State: AO0yUKVut5XGw4hol7V7qYUyGSOkT/uXajXRU9hB/Hy2/1DyhPfnrGNx
 5XpRXmXy4y/FvV2GKwBGdmF12d91K3rPazjfP6QMjLEEMf2oLt2p
X-Google-Smtp-Source: AK7set/QV6+6MUAYWHnAzgr0/T0hbh8CSHvMvctOuZQ5rCGDjwVilX7gxGHUUi11ogdTuwSiddeUJbQZHq2VMJndpzc=
X-Received: by 2002:a81:b656:0:b0:541:642f:2fa9 with SMTP id
 h22-20020a81b656000000b00541642f2fa9mr4494951ywk.7.1678687345486; Sun, 12 Mar
 2023 23:02:25 -0700 (PDT)
MIME-Version: 1.0
From: "_ *" <billow.fun@gmail.com>
Date: Mon, 13 Mar 2023 14:02:10 +0800
Message-ID: <CAPLqH_6R_mtZr1aWT9PqfBAMesxkNuPYEZMR_RcXKQ0G_S0zag@mail.gmail.com>
Subject: [Capstone] TriCore support in Capstone
To: qemu-devel@nongnu.org
Cc: kbastian@mail.uni-paderborn.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=billow.fun@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Mar 2023 09:11:15 -0400
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

Hi!

My name is billow, I currently work on TriCore support in Capstone.
Maybe later on it could be used in QEMU
as a disassembly engine for that architecture?

It's in an early stage, but some feedback would be welcome.
Any suggestions or improvements would be greatly appreciated!

The draft PR: https://github.com/capstone-engine/capstone/pull/1973

Cheers.
billow

