Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF8E5F1670
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 01:03:01 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeP24-0008B8-Bq
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 19:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oeP0s-0006iN-6S
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 19:01:46 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:40951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oeP0n-0002t3-20
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 19:01:45 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id s14so6953560ybe.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 16:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=u+rWG0/w5S1kpFPDAJxEEUXE8S66zL3VpotAg5WD4Pg=;
 b=CtSx7FnMambZcT5UJlqzhj1blf7I4SaSf3P65Vy6hSqLp0/yMe4VxrWenRuU+O48kd
 HuW1RnN1JCYtvqh+xAOkHxOEJvLTCOVtWaQIpoja9WBXG9juARuGaJAE5T0eWmF9awBp
 ENuvkzwHaAntDi47GiOL4/7+z1TqjjBD99JhHSI2ZkvToBb7eFmqPPzreVwgpJT4g2QX
 z2EyV/wy1YDKEhtABFctKhfHP9XJEtZjWOMyJEHMSB/728AXdaJnw/+b1K/z82gg63YB
 TkZkT/0JjPMEj8/XPfAsRvDiYuhZQBRvHUbR+lSdy/mRJvKtdlh33l1xtDaUBZN53F3H
 /FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=u+rWG0/w5S1kpFPDAJxEEUXE8S66zL3VpotAg5WD4Pg=;
 b=VBsqkbgPEBmoNs9dVbyUFbw2Bw5aFEvqjwAsOP4XqSSokXwjNn29ZsqgAeP4GDlkRZ
 cVPhvld+xr9kYKoD1qSlsaQh7qKaWANHdY7OqE/qnOb9zAzdaWP2qL7iajMYNt0L2MJ4
 v3XOVOUoCT+gbye7cb5WDB8gRayO43kYk/AB3lNaX1c/fpRCcHqDZPRZzloEMPmulY3o
 BYRVI2CoQ5ZZUT5HGkQ6kC6pTiacdfQbYaEQyXGtASsMcqiZ4sz9KKZVz+fuKkj2kJug
 rLOc+BfkfddDn4jHgWE/0hpcWk7oaVpJhViA15ldjJL6k4DE+nGYmzGsgFXBBvPKUC8x
 NZJw==
X-Gm-Message-State: ACrzQf0tW4GoaVy0jRIopHR3Vluvi8jozuqC3Jn7Bfk+ahpgftzU8FrL
 KiIWXMyz24ZywLHLLocztMW0+iGBXIOdSl0SxdY=
X-Google-Smtp-Source: AMsMyM5GX9i5+Zi2xiDXnk/G/9C0kwwpWIHldCz/APJH1KZoaFdZ2L4UnO/osgIRraVfTzqAQrP6JfQxv4CDd/wsdgQ=
X-Received: by 2002:a25:ed09:0:b0:6bb:99fb:f9c8 with SMTP id
 k9-20020a25ed09000000b006bb99fbf9c8mr10345850ybh.207.1664578899325; Fri, 30
 Sep 2022 16:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220930091033.34379-1-pbonzini@redhat.com>
In-Reply-To: <20220930091033.34379-1-pbonzini@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 30 Sep 2022 19:01:27 -0400
Message-ID: <CAJSP0QUCtok_yXm5T+V7CCo1puznR_qLxuGvT6UXo0WpCo-oow@mail.gmail.com>
Subject: Re: [PULL v2 00/15] x86 + misc changes for 2022-09-29
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pull request doesn't build:

../meson.build:545:95: ERROR: Expecting endif got rparen.
gdbus_codegen_error = '@0@ uses gdbus-codegen, which does not support
control flow integrity')

https://gitlab.com/qemu-project/qemu/-/jobs/3112498668

