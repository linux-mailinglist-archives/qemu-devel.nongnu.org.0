Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12E3B0DA6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:29:31 +0200 (CEST)
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvm5S-0006ax-Ax
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm4T-0005vh-VL
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lvm4Q-0004ZU-1E
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 15:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624390105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgrAaUI+PNxp4/1jQwTbg2OOYTCC1OqFxf0cLe8Y5vw=;
 b=c4QWAErBiOwTZpZBHPpoRl4sOqfd/whjvB+pBnHWeHwbY/gyrk8TOl5fHB7y5jo5//mp/o
 b6WBfStLNGfoenzIhaO5g+01eIWyvF6wu8h8nP7ZxvTa/snWcdlLjSUeCRZkWAYLIhJNRr
 IjlC/7CDDy34FLzXgWHNeyAeC1YXOwY=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-afhMSezQN6WvFxFy2Milqg-1; Tue, 22 Jun 2021 15:28:24 -0400
X-MC-Unique: afhMSezQN6WvFxFy2Milqg-1
Received: by mail-vs1-f69.google.com with SMTP id
 v15-20020a67c00f0000b029023607a23f3dso70236vsi.10
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 12:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SgrAaUI+PNxp4/1jQwTbg2OOYTCC1OqFxf0cLe8Y5vw=;
 b=Us4Nz4ht2fL3jXh0ykbmjki0egA3h7LZNEvAj/GkyDIkP6B9Lsbx1QfuK/U2fgPhxV
 n/QpbTRnZv62geenGT/U+OxMWghGsqVCzZEnfEuUJGptjbAdUuPVodcDDLDjNEbKYgaQ
 qV2Y/sZhaTSvjICU1/++2CUqTByz4bg7ur+u82jYxc+7k3mxFMFJiR8iXaJ0pSO5yB+w
 3zYZeMMUAxuIJTWaB3jqt4CMevbljqYcWTxvtLSNI6QxiMiB+pmGhF0dgL9tx6XnnpsB
 KZax4nOBdQ/WNJMcpYCuuuQCyI/x41ZgGMN3k99s22gc/gUy7UVnjFNVEOJEbLJ9rK8V
 AWmw==
X-Gm-Message-State: AOAM531B9sHwngLANO34IiGEMzBHqrwcSTSMuJHD8x6Dghbr+H7Csjo3
 /rf4LTgCvEUQfdPMfLW1mPhyEJ8RkH+8VKpxSZyvFWvPf+/Kg4kaQVARtCKH3udUK5aNTpdSSnb
 1SbPJqa23S4gIC9DLZt3dw6hSIq1PD0M=
X-Received: by 2002:ab0:6199:: with SMTP id h25mr521249uan.113.1624390103650; 
 Tue, 22 Jun 2021 12:28:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUq82dFzDSBRTQ/BGhLcXvfXxO1FrUNkAV6sDwX8BRGGO2Kll/WSW8tSIgXa1OWoGM1t4zKwKwPT4PrvUogT0=
X-Received: by 2002:ab0:6199:: with SMTP id h25mr521225uan.113.1624390103505; 
 Tue, 22 Jun 2021 12:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332430515.194926.3763973184522036843.stgit@pasha-ThinkPad-X280>
In-Reply-To: <162332430515.194926.3763973184522036843.stgit@pasha-ThinkPad-X280>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 22 Jun 2021 16:27:57 -0300
Message-ID: <CAKJDGDbjazPqmTkXw338ek+1e=f2E6rK1p3pCsue8C=_ghj2mw@mail.gmail.com>
Subject: Re: [PATCH 4/6] tests/acceptance: add replay kernel test for nios2
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
<pavel.dovgalyuk@ispras.ru> wrote:
>
> This patch adds record/replay test which boots Linux
> kernel on nios2 platform. The test uses kernel binaries
> taken from boot_linux_console test.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  tests/acceptance/replay_kernel.py |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


