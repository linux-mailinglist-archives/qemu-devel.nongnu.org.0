Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3B62A1A4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 20:00:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov1AD-0001vf-RZ; Tue, 15 Nov 2022 14:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov1AA-0001sd-Nt; Tue, 15 Nov 2022 14:00:02 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ov1A8-0002M4-Vn; Tue, 15 Nov 2022 14:00:02 -0500
Received: by mail-yb1-xb31.google.com with SMTP id j2so18267089ybb.6;
 Tue, 15 Nov 2022 10:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LbApaizAwtpC2gsR0z8rGmWvV6/ZKJUomwK/oJup0sE=;
 b=lJt2M18LXicADriY1LEIp2fvDlLg0TN0hvIsVHLegox09cEOJ4WxbeoqaoZPyK8w8D
 /uzornnytm+kyIm1WNmDlz4+ujJdEEMrFjiuqY1tf0NUoQnWPty6QTy14SEA3dazwN70
 j7gq14garFMhsELZ04z7THUOzF7LeX1vZeXC0qMvw9Aha/M8XgbkxsCoXr6rQxDnDo4a
 KzOQRnplcmipcBNGqT3FMeYTnDC0SzXaiBTfQ45Z9zb08R3N/vmiiolQOgGBf3VoV607
 qMS52YRKn7TMv/OZ/WbFNyiJadmJ0c0cdYMuBGbbiXzCcEEntnf5xGxMeyDnqmDgJRnu
 GANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LbApaizAwtpC2gsR0z8rGmWvV6/ZKJUomwK/oJup0sE=;
 b=ePOanlvBOs0mLzJDuDvdmBAj17Teoe4iru3oaOUhjZHnGrK36/5OW4pY7+H64mcTHK
 i32HmScBQnwkH0OpXXoDd6Wnwaqjwx8USGeGelECXSz1ykOVLsEWaU4BN3/9PupVU5h8
 tpX1D8mZM7U6ePoimJo/xCOaeLoPePyqLM+TtIyvjUpST9acv7uIntiPgSSktk+ibUJ0
 LMcUKcqqydLhUjuLyB8L6M+N8RNI+bNWfD1soj2Lu+QpyTT3H0i8FGrjp3KMQEsvWvAo
 hLXLstj5okXPZQEooUdTCzT2iczZ0vkkBlA12lYbn+FrSY60I0g2CWSMvyl0fe7qT3DB
 2xCw==
X-Gm-Message-State: ANoB5pk78Ydr17G7JbdLrcTMg4e0vgyx7KcYDvGvsOi5XEa9nHBt7vEq
 yzrlybFMnKn0pzsZWYPwBRQ/GKf6PiDwVfvYseY=
X-Google-Smtp-Source: AA0mqf4jeqF7TClMj8CIX4aC/UWjNtRkjL5yUhbso94LQeDT8BzsHRxEB2AJdcJPwmNvelTCNw3P/anTyrp87iUXh6E=
X-Received: by 2002:a25:698a:0:b0:6e4:f81:707b with SMTP id
 e132-20020a25698a000000b006e40f81707bmr3864473ybc.366.1668538799275; Tue, 15
 Nov 2022 10:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20221115153514.28003-1-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 15 Nov 2022 13:59:47 -0500
Message-ID: <CAJSP0QUV-Pv25bV=TS9q2=Chr-E8=Sh4e=oZboPcyvMx7i4a4g@mail.gmail.com>
Subject: Re: [PULL 00/30] Next patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fam Zheng <fam@euphon.net>
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

Please only include bug fixes for 7.2 in pull requests during QEMU
hard freeze. The AVX2 support has issues (see my other email) and
anything else that isn't a bug fix should be dropped too.

Stefan

