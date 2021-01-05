Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF102EADD8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 16:02:44 +0100 (CET)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwnr9-0004s2-C3
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 10:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kwnpA-00041f-VX
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:00:40 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kwnp9-0003kF-Do
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 10:00:40 -0500
Received: by mail-pg1-x536.google.com with SMTP id g15so21430585pgu.9
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=+DB+mAoUmUcUr/smaSqjsuSZTKMfRfZX/Ro8fBKSem8=;
 b=KBi3la8EM9OydWFJ4tAwhJfXdnj9xVFuNHK7AsltIW2Org1zT+HNJqnyuPQAndrHJX
 QhftmIhqO5JVl70H/ua0vay94c9wOtow+Tb81Ndj2K0CmpdgMmhekVT3ekWR9H0d2+Ku
 T3mW5CbnW6izDQe8WN4zTyk105nNVbYwOWYn+DgAKFCrSNejf4KjAaOuYM2aIJiOq8HU
 gdsycw3zpxZ/q3/AR5JXuMs88w8oCFY9SDiSzEu2uUcV5kKmv1Pa8v/Rt1Ap1JCi73I1
 TUuM+d+oZwcXbLQX+6UjD5YEuIFJ1wxQPfjYeDHsJPsB/yD9YSma9ur8cnXXHWUFI+Ae
 yO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=+DB+mAoUmUcUr/smaSqjsuSZTKMfRfZX/Ro8fBKSem8=;
 b=IO5M1TKkD0zCY8HlPenwoEAckh4/MR+qgQQCrvLOTTO6IB2l81GQFB+FeAxoFwPqcV
 CF8BQBq8LHHe2KNoKT0RhCqCiELpINpFtl8enbJX209okHvcUPVNpfeeCyc8/u2Kh+qj
 RBdPfSDF++J185k9iw57ePIEUJvEUTWvcDau9/1s+n4x95ZGFHPXabX1eAStLN9iHhUl
 JiMOvFFppYSmcjQv77PLKUmrcSwkKW0lIpzMjDt7ZquqMXjkrNyhoxzwOvau9WqM1m9P
 wWP1xAAIFmYV2AwlRqNlFaF/ZAiKmqlOzGZuW9EpcYUk5mLkYAFjyuu6uFMd+Q1KmCQF
 TwBA==
X-Gm-Message-State: AOAM531CfDX5XyE5ji0/FWquW/LdeoRJy4Jy6/mUgpgdbnQqYejYus3u
 JVbIz7M1bFpLRFvZUzVY+APHfhbbtDF2elWTVfw=
X-Google-Smtp-Source: ABdhPJx2xG56IG3i2H9YJjaDH1HN10P8pgh1jn2dfX7YWD53D3X983FkCdLOugOqaiHRWQWNQU9HDr2BIj5l8zI/ZKo=
X-Received: by 2002:a65:48cb:: with SMTP id o11mr74649193pgs.121.1609858838207; 
 Tue, 05 Jan 2021 07:00:38 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 5 Jan 2021 15:00:27 +0000
Message-ID: <CAJSP0QXCXUtze8ATyPK0uybC+FVrX1tPfqO2DmqVL6XQpUFxxg@mail.gmail.com>
Subject: Adding dedicated runners to Gitlab CI
To: Cleber Rosa <cleber@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x536.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cleber,
I noticed there are already two dedicated runners registered in QEMU's
Gitlab CI and you have documented gitlab-runner setup steps in a patch
series on the mailing list.

A few higher-level questions come to mind. Maybe you could document
this when you send the next version of the CI patches:

What about the process for adding a new dedicated runner?

Who should I talk to get a machine added?

What are the security implications?

Who is responsible if a runner starts failing certain tests?

What happens if the runner disconnects from Gitlab CI?

Thanks,
Stefan

