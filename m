Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47301639C52
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMJP-0000ni-BP; Sun, 27 Nov 2022 13:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMJN-0000na-RM
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:23:29 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMJK-000139-Qw
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:23:29 -0500
Received: by mail-yb1-xb33.google.com with SMTP id y83so10793201yby.12
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b4lBquwBlLv4+pKoYoK4DjjKk7sh2cbH5ky7agLRKxE=;
 b=nU+QpAtavgG+HvdlaEAZs3lG8qtCOW13estB54bBMM771aAnpLrDBwa+bjfyOW0i47
 Mx5mFsPA3oEDgiupuIgFW4gd9z4xrbGHgEDYMFrOQOt9mNSCsV+WGxJnP01ZXIxoTZ3d
 X3HfGMIc6Vx9AGM2HMsHLpG4dk1EOQy+AfxEc9LaYG8qb7JEWtauffyygsX0vh8MpuuV
 UaVNlrm9/znYTqFzsT/02O3hY/vFKMWxW7BorX676mJN0WBipNIQLTKO5ivABALE1pME
 KBLehpjbh4DWBtW/oSPI19EGbo8/mDjfMNbaawdWh+so8Y+8wLZddQXdSqbvYTWFKGlu
 xR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b4lBquwBlLv4+pKoYoK4DjjKk7sh2cbH5ky7agLRKxE=;
 b=7NRe9uin6LpMVUCTs6mnu6oZLQugGT42O6GogfrXHvLOfP1tW/8EfhOCJX9itMgKec
 MNF770ksd6fjTbBjn5f5G4GaGQnp8arZzRJEA6NhUgZhxAfWKyTmCVZ1DfSo2tjWZrWw
 GQNxbAYDPIskhBsmfCj8aG3Ak+XWYPNpJPQLLZrYDqawqrvXtgzuFX7WhBC2bWtEJ6/2
 Q1fdW4SPeZJ+84CvTvr/IAz4Ie5qzm9WLS2DzDCfyPmHsFfm1jYulXusfrTJ38i0a3KR
 I9I8WJ5L4WvwR8ycbD5sKD1hdXZv8m5kxF0+jFS0fCj9QjChx5y49MulweBjcU2Wmyqu
 C8dg==
X-Gm-Message-State: ANoB5pmt6HCHOJwt4AyAX/Ty7kttrEa3cAPv/5WLp9dV2U26d1Kqk2EL
 76uJFNSyhP7zYVnwEoL3EwTmNXAhx8ZuHw0t1y0=
X-Google-Smtp-Source: AA0mqf5k3XAuXMYg5g0Aw2tjeltT+1o4HZA2XA6gAbMlExJGGsn0yZlO2MwWzp44isho7CzXttO2ygrzaCtYAKYaLWw=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr30834883ybj.58.1669573392819; Sun, 27
 Nov 2022 10:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
In-Reply-To: <20221126152507.283271-1-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:23:00 -0500
Message-ID: <CAJSP0QXaWMq=z943sLHkZtSDLSaezNQwtJaFy9A12yyh9zfSoQ@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 0/6] Add format attributes and fix format
 strings
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
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

We need to wait for Michael to agree to maintainership in patch 5. If
we run out of time I suggest splitting out patch 5.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

