Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD467224A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIArr-0007DL-T4; Wed, 18 Jan 2023 11:00:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIArU-00077U-63
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:00:32 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIArS-00011T-TG
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 11:00:27 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-4d59d518505so304905407b3.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hr0dgoHtifo6ZQFNT3To4gYl+dOd8XLgJ/IYxFEIioU=;
 b=G9nlST8vtzdyF8ZjuzB+78zKSk4ZgxkGRG4q3AG9TzkSmcqcNtv7oOqG48OxHNgGLB
 R1/0broziPy7RBae5VNid/ygRwspP2CV8xGIMLSOjgPW0P4dcXWgSu47L+6Fg/yTUmYI
 sgzlkCMI8AJQ2RE8Vu4JKyTrjv+mvLCPnoALfuoVzbJ23Cmr6hoMZaKOFFJbsYHHGvDG
 XPFDyGHwQxw3okFfOhGYsHGmNFZ9EgmSBg/J5LBHV+8XtPjLi+FV+cIwg6eZzcZi88He
 j6AGYPielKFHsYRgs61KeK0UGKwxJKag9whhtFosgq9uhRpokfpFqzNX1WpBVab1y38x
 5zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hr0dgoHtifo6ZQFNT3To4gYl+dOd8XLgJ/IYxFEIioU=;
 b=jHDM34P4kGWYNriCmLO+gdnKjGowMpiFvCsk+I3/0pI+vdsU/Qxfq4xhz7fzTadJyl
 g2m1I4Du3z2LssLMgHNOX0lKU1S0beuWO08T+pNEHchdKRt6Cv8ZAQuPFDV8fBUfYJZj
 m0tuiDl2d7hUyPgDwxWAKEYHzD1/BXft2mo0l9PDdxrdI6qyte3xkvNpKyteAffVuyFU
 lqvJwQxBFtBYW7Zx+YEqpj8GqXwSO3IP+cX2kROmQcLfoKyULn056KcUl+p1Is5mgFJ/
 jPbTkRVbJDLq+NEJ0OeS3wOurPqNf/lwHK2mBYEUOWMbR0/h/naZW7js60NiK6fWHQVU
 86SQ==
X-Gm-Message-State: AFqh2kocCioZ5cN27lUBI31LffeL5e6A7WrH6QKU0096yhWJP1h9u++n
 TkzrAfmvJtDMNUOdAoFoCuVMb6q/Ql6FKaByaUk=
X-Google-Smtp-Source: AMrXdXtbflg3auLjntpmHt4jcdymVNaecGPTb9oy+UIo8wwxqkYUSsGEtIqCWpKbHUtQDjfcboyRc191Z6dTTGtdurI=
X-Received: by 2002:a0d:db56:0:b0:3eb:447b:56cc with SMTP id
 d83-20020a0ddb56000000b003eb447b56ccmr1032396ywe.296.1674057626008; Wed, 18
 Jan 2023 08:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20230118153833.102731-1-dgilbert@redhat.com>
In-Reply-To: <20230118153833.102731-1-dgilbert@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 18 Jan 2023 11:00:13 -0500
Message-ID: <CAJSP0QX9TnaWnkhAneFzZsj0A+c4j0A9mCPSy1i31a3dOnhWbA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Remove C virtiofsd
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com, 
 hczenczek@redhat.com, gmaglione@redhat.com, virtio-fs@redhat.com, 
 pbonzini@redhat.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
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

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

