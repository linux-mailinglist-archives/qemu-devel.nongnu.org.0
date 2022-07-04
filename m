Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8079E56569E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:10:22 +0200 (CEST)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8LqH-0007jr-K6
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LgU-0005cx-Tq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:00:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8LgT-0007oY-AC
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:00:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656939612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mH+PVwQi9YOevrHsYOJ3xk+Ac1GYDfe+zmFGGYUswSE=;
 b=jGE6gnhMPChlOO2nt4XKO8B+WSa+CCpMupSyR2KrdFtYoQDT4mTd7Xa+qsbscP5vGFVF7n
 E2MPCxuqKbNLxmEaBHwHuDEcH4FFq1WqhgPAaKquxG5UXnphQXC8qFVL0YR+dmTrH/yzVP
 8ocyyQvKw1lrfDXdk1c0yC4O4JGJQak=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633--_zdqvz3OPSB1QOZZsIwgA-1; Mon, 04 Jul 2022 09:00:11 -0400
X-MC-Unique: -_zdqvz3OPSB1QOZZsIwgA-1
Received: by mail-io1-f71.google.com with SMTP id
 n19-20020a056602341300b0066850b49e09so5535328ioz.12
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mH+PVwQi9YOevrHsYOJ3xk+Ac1GYDfe+zmFGGYUswSE=;
 b=FebhlN56quDKeH5KzPWcbmoBwp5WM4MF4PV3E8FFAo9SpVmj/Ac8XZ53T9yGhHyZfY
 vE0Hz7m/pfUMokahcwprTuwVCM7J22BDrBPK1Bf92q9KiN4LTt5TE4QrwPBULg/Ile/d
 OPX1rs9bmcG39ZkeIdKYkMrN/mW3c0doZS0Cc28h369OZpna3JyEeIaRetwVlStg1BYu
 EdPUpCeqqt072a2f2cWJnlXui4vuHD575SZet+ffCQXrnHD4Km3NkLj4uFE3021vCGqz
 3q6rcS+hwSlwFGySE6kDj/n2/+xA20K/i7HZ/LQ4yUcISRczh8M22aE/UBhnUwKiRtkF
 itUQ==
X-Gm-Message-State: AJIora8OzU6nIwxSN8vpQlNTvavskrx/TB8VByLPSxDporqeON8e0C7Y
 ZqDh8zgMCR3FUr9o38T32IYCkx5oAD+NoQE510cF3hm/3yAjA0O7gtC7Ft105D7AmQtKB0HbraR
 zbtyYhSGYU/Q4BQAM4ZczM9XviX1Ic6c=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7551665jav.93.1656939610852; 
 Mon, 04 Jul 2022 06:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0guSlxng6jmnwo6x47J4EOjEEDIznGY7YD7f5XTaZzVaM+gQ+lyr4DPOiXYELM2K4SwAmP7b3nYK3t71WzEg=
X-Received: by 2002:a05:6638:339c:b0:33e:b766:1bf1 with SMTP id
 h28-20020a056638339c00b0033eb7661bf1mr7551529jav.93.1656939609298; Mon, 04
 Jul 2022 06:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220509103019.215041-1-pbonzini@redhat.com>
 <20220509103019.215041-15-pbonzini@redhat.com>
In-Reply-To: <20220509103019.215041-15-pbonzini@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 13:59:33 +0100
Message-ID: <CAELaAXzQMP8aW_5TYOdFyq2Ph_vP9VfsMzCyU1RzxLg39aTAVQ@mail.gmail.com>
Subject: Re: [PATCH v2 14/26] qcow2: add missing coroutine_fn annotations
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 9, 2022 at 12:01 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/qcow2-cluster.c  | 18 +++++++++---------
>  block/qcow2-refcount.c |  2 +-
>  block/qcow2.c          |  4 ++--
>  block/qcow2.h          | 14 +++++++-------
>  4 files changed, 19 insertions(+), 19 deletions(-)

Some overly long lines.

Reviewed-by: Alberto Faria <afaria@redhat.com>


