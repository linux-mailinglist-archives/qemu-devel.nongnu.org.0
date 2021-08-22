Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16643F403D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 17:11:07 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHp7q-0004XL-5M
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 11:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mHp70-0003rh-FX
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 11:10:14 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mHp6y-000277-Gj
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 11:10:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c4so8677204plh.7
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=lzPWIOFTaDvShJw4KaGFpv372GcYKVbRpRW7JBQFdZc=;
 b=TBG8y282YC/FjhKV7153yB1OegEYUTcnNGNMucHmRaQwGUC9cVAOTqrse5zUPm143F
 3sSFBpsvm9V+m5/Rjo5iGpgVVN37q9cqJxET/6Dn0sOamIUeE3zB/5RDRg8RZFF+9xes
 qPjkczNMy3zwszid1sUfWBP+by8rYq3COBK4aMXXdl1rCg79EaH/X+oG0Z5sRXbbPguL
 fvkoleGKE+FuwrT7UySYPv4XrcsK8DJqt1xTcCb2cbNJi5ELanSyBxVXWvM2f4ZxM0dJ
 r+ejZFqW1DKnLAWAOQYzkgs0H/bTta6kg5uJyZwgjSIFuJATb6CsiYk2lGdjeSewZ6T1
 G+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=lzPWIOFTaDvShJw4KaGFpv372GcYKVbRpRW7JBQFdZc=;
 b=gg+vcuKOhnkHVFxjHCuJQZ5dtR1ctq0d9uOlJudskYeRn/iDo9ciRRb0xL1QwOQ9zG
 TJ+iBr2/S/V9hDthTWzhiKlmX5SLyyjqRMYeAYrLa4bfcLM/axqvlCMv9iJTvBVHUJMf
 4lG8i3eZ5E/uxKl/A4mAgxjydSNj0Yvucp0VK0CMVkvYIRkbiks3HK8bJ0XtHOdnbTYe
 smgT8l5c2RFrNdNQ6/KaJJK0yTEgDWTDC34DBQrVTzOk/dPr7n3I+sXRc4/Mqh4/ZMJg
 TziFVv4QrJaTBRP5TxtDx3oCdmNDAxK74mEJRj3CxYdkg6l5aSCH8qHY/zLUv76ptlzn
 txyw==
X-Gm-Message-State: AOAM532ibLSaOKsHbgY6++doQtkFajVOoZ+kvys+zBrtcBjNH07uQbXU
 GijuyoF66CrERA1K9VZMxDO6Pw==
X-Google-Smtp-Source: ABdhPJzzV9MkmTJ4qflMuWw0aR/kgg54y8+RNVRu3pHnXQR7b5AdnazjX4qirPATxr2ZYU7kpzci6w==
X-Received: by 2002:a17:90a:19c2:: with SMTP id
 2mr15149575pjj.17.1629645008612; 
 Sun, 22 Aug 2021 08:10:08 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.145.203])
 by smtp.googlemail.com with ESMTPSA id u3sm15217211pjr.2.2021.08.22.08.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 08:10:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 22 Aug 2021 20:39:56 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Roman Kagan <rkagan@virtuozzo.com>, Laszlo Ersek <lersek@redhat.com>, 
 Ben Warren <ben@skyportsystems.com>
Subject: vmgenid no maintainers
Message-ID: <alpine.DEB.2.22.394.2108222034070.810518@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi :

All of you have contributed to vmgenid device at some point.
Unfortunately, this code currently has no maintainers. I had looked into
this feature as a part of another project for a previous company, hence
noticed it. Will any of you would want to be the maintainer of this
codebase in Qemu? I do not know all the parts of this feature and the
spec well enough to be confident to be a maintainer but I can be a
reviewer if you want.

Thanks
ani


