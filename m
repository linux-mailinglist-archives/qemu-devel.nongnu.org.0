Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28404332F5A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:54:11 +0100 (CET)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiQk-0004oF-4F
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJgpe-0005xJ-0U
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:11:46 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:43098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJgpc-0003Cx-Ev
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:11:45 -0500
Received: by mail-io1-f44.google.com with SMTP id f20so14912454ioo.10
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5CakexBoo6FKy/3SWG7urTGYA76flnV07TYSWfCOtAo=;
 b=ZVKZmnaYB0srxQye4I5kFYU2jyX/k7dZBIRb3yyDZ3WRIOnE1BTk553PtWJFvwWlU5
 4nYbQEACmWYWqrYUa0ytIQSaKO7SZ5tJW8xyTvYDluNzhgsJT4GO7jNr3Ji369+I7EE5
 uxJMk3q3LDMXeDExdAKiDxAaET38heq04wh1s5Hpb7c2/9hQVZLBQ6T4bxeM2HsGNFwm
 58qbITuV0l1nyRgg7VLpA3i+HeVjDvr0nlSyNo2wL6+21QPnN7AW4Sx437R5kU/bxZTj
 62khiA+32+v6ZiRFhS4fvV83OSmSZZqo8bIL8V5YLSeZIRhasLjJjSqh/EcPlpP/GpWw
 kf3g==
X-Gm-Message-State: AOAM530uEAMnvBuTiqen+/S5D8U2LfxspebP0+Sb6FGVbPDF4rLrKPLr
 oKpd/E7Zf+Y/1S6nBF+92Cz/nxiDXb4=
X-Google-Smtp-Source: ABdhPJySPyurozzuCt5EDpazYjbCMtrmcJ6iaKJtYFeJiWqj3mosbchcOhzLLNBt1Fvj6qPzEoKWwQ==
X-Received: by 2002:a02:971a:: with SMTP id x26mr29461035jai.61.1615313503197; 
 Tue, 09 Mar 2021 10:11:43 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id b9sm7973583iob.4.2021.03.09.10.11.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 10:11:42 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id e2so13068052ilu.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:11:42 -0800 (PST)
X-Received: by 2002:a92:d2c6:: with SMTP id w6mr25451589ilg.273.1615313502729; 
 Tue, 09 Mar 2021 10:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-5-j@getutm.app>
 <b1c93f8e-5c4c-9ad8-e9b3-a846fe9f5661@redhat.com>
In-Reply-To: <b1c93f8e-5c4c-9ad8-e9b3-a846fe9f5661@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Tue, 9 Mar 2021 10:11:31 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCPTbqsXYqtfVKbVDVCHjF12keOoSYnKFdu0+ugyuj12Q@mail.gmail.com>
Message-ID: <CA+E+eSCPTbqsXYqtfVKbVDVCHjF12keOoSYnKFdu0+ugyuj12Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] slirp: feature detection for smbd
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.44; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f44.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Joelle van Dyne <j@getutm.app>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 9, 2021 at 6:09 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi Joelle,
>
> On 3/9/21 1:27 AM, Joelle van Dyne wrote:
> > Replace Windows specific macro with a more generic feature detection
> > macro. Allows slirp smb feature to be disabled manually as well.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  configure   | 26 +++++++++++++++++++++++---
> >  meson.build |  2 +-
> >  net/slirp.c | 16 ++++++++--------
> >  3 files changed, 32 insertions(+), 12 deletions(-)
>
> Hmm v1 had: Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> did you change something to not include Samuel A-b tag?
>

Sorry, I must have missed it!

-j

