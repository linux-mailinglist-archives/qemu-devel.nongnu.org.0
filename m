Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7712C67D694
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL90s-0005N4-FE; Thu, 26 Jan 2023 15:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL90q-0005Mk-Lr; Thu, 26 Jan 2023 15:38:24 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pL90p-00034N-7P; Thu, 26 Jan 2023 15:38:24 -0500
Received: by mail-yb1-xb31.google.com with SMTP id b1so3507486ybn.11;
 Thu, 26 Jan 2023 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=X5rYk20a+9VSOxcHVWmsTgwmmkZpxfgZlMcLu/PLt6Y=;
 b=TZ0ky1HjHN92JBG+iA+2auOQn98Vg8YM+zlTmeKDb6qL9VxExyKYTAWoozUo1sm03X
 Nbli/Su5eN6kOac1QbzWIYmu/JCKcERZ1E0UjWcE/eS6Mfp4xBg+aHrBgf/teQSx2/rL
 O6qcRuATXQAnkOexdEvUubpYH3BPRK1kFhCuPvKBkZ10t/zlFvWMae3lCF7v+0scMBgv
 5c9aYK5X38jcKcBw/ZpqEQbHHUitguMo3ZWDSKVbWNBV0resIRRYszlIjZTWvgiuML8x
 aWGxaWLXlf0GeqLVctOFTnlXHqeDXvCSuKsg+ygDJ92vUXDg6Qxjp0ICuiT9buaQ9A6w
 lcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X5rYk20a+9VSOxcHVWmsTgwmmkZpxfgZlMcLu/PLt6Y=;
 b=vcuGYzNvhN7Pi7A5HMoDhSOAQgO4npfy9/gcCE717+VgmuChhrBszAGOkbAnQQotNI
 BNgTxnpBVM6snmoinQsVjacsB7e0vyOEVX0/OgGwCrxtr3+KPgC5rtohsq9MXz9w07w3
 za1fzmUervXv8RB9OgU6j2hgmhHVTUUMP5S+Hrh05Baz5xHUHyOoy+3Z8jXxeRKUEMWp
 PDYHuVmw/iQ8NwG+/v8iqYUslqMJkgeLmkO1CgHJf7+Sh8wEfp5vTEKhZwcOjNrGf05o
 MJvsQ7QCmUegG6PMFDbzcXRRdxC+s9lU8r7thu7R7Hln7K4ZlaSpHzINDcBS8bldy5ln
 lQOw==
X-Gm-Message-State: AFqh2kqbWU14TcLj1KmV3CXpVuyqakG0QN7SvslHfNhHW1AmdfuvqzJW
 6Jc8Zsxi70SpCKv3cKwNzJv2GhdngMNHjgJGmimeQHr4
X-Google-Smtp-Source: AMrXdXuxrGLtLbRsyJFpBKBcBPmYxXNC0sUVP0gLvXeFyNfBAp0uHPmLhe0gldPVagb3U4N1bGSYCJW7kiXD9nIlkbc=
X-Received: by 2002:a25:9291:0:b0:799:6d5f:d851 with SMTP id
 y17-20020a259291000000b007996d5fd851mr4775089ybl.537.1674765501728; Thu, 26
 Jan 2023 12:38:21 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 26 Jan 2023 15:38:10 -0500
Message-ID: <CAJSP0QV+snj62LnD35WVA05s0msRr-xxwkfYKMb-eGTnffLwDA@mail.gmail.com>
Subject: Migration of download.qemu.org server in progress
To: qemu-devel <qemu-devel@nongnu.org>, qemu_mail <qemu-discuss@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
New hosting for download.qemu.org has been arranged. It made up a
large portion of the bandwidth costs that we've been working on
reducing.

Paolo can give more details about the new hosting later, but I wanted
to let everyone know that DNS is already pointing to the new server.

If you experience SSL certificate errors temporarily, please be
patient. I recommend not trusting files from download.qemu.org while
you see SSL errors. I'm monitoring this and will revert if SSL doesn't
come up correctly.

Thanks,
Stefan

