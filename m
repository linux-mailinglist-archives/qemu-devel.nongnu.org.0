Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD832563E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:10:34 +0100 (CET)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFM1w-00079I-Nx
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFLzN-0006be-3M
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:07:53 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lFLzL-0005Bc-IF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:07:52 -0500
Received: by mail-ej1-x631.google.com with SMTP id r17so10624651ejy.13
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9isQOYBPWfdvTL9zI7Vqn8Ub/skUrRwLK6O4RCvPCY=;
 b=NfEKF2a9CK3bKfmkkP17F+W7E8t09P/a/eHsEsKPkZm5T/HYdfb3g8X6gUEEZ+HsFa
 cY8MnQ3J7OeD7h1xDmIoTBIrKKFkEBVHrFMir2TsqMDXTI4jk49drYsrMF73xRzpSQk6
 QdkuduYM9GPyZ9QSRan+BtAkNay6MtKEp4w3VoTUGPmJjhgCK4o1bYqhEiEE1NwEohhv
 U1iF0pga+3HhB+ELsayxKnjFyosuuZhPOQjvluuuKhyrHfX/M45n6pCk29teShR3Fm8A
 VKfGV+T4ULZPNhmNvEDYgLP/81zBN5RqqJFd8eMGmycuQK0bI8jw+3b3J8OsmPXaejRj
 VC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9isQOYBPWfdvTL9zI7Vqn8Ub/skUrRwLK6O4RCvPCY=;
 b=sli05Q7l17gHd2z6MaDQQqT/1rPKfMERRU5/adkae2/TnE/3U8+rfhsVz0pzmBRmke
 PCbtePZanK3MweNPeg7tmkCB0eirgTG3R2vN8+O6NgBOENdwwSB5LPXLd7ypWUjIvPlx
 Hr8DfjCgI3H0+A4huweKF0N1aKq3mhntANTqILkZDbxTUNxt1i/55Qwu19eXflVcYYbZ
 elyKz87SPVhwVydRtIHIzJBr2YI8MdmSf1GrLC7w0DBQ0Z2UfgwDXWZI0/ZRnDV2Sx+x
 0c/3jdVZ+dPuaoWIVDwYh5q0FNbkjeG/D+DL0eQjBPPjChb+pR30NF4/3gk+sdCBKgNS
 N3aA==
X-Gm-Message-State: AOAM531g0yvH07rIfYP+Yx/sjFEVBpsOTuDBSOnkN+8O6R6/ZwmDsgbn
 9IP/L3dxa6KD6nM4qWKXkMbhneDPy3/83rnhY/ht/g==
X-Google-Smtp-Source: ABdhPJw2ga0Jowkoz2U21pgUnPQ51RKJxUylkIo64QMLC3tXdjqZnNAt9CcqsnWZrar0oEKWn0fuiGr5ulCXBBUJGLA=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr4275545eje.56.1614280069535; 
 Thu, 25 Feb 2021 11:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20210223160144.1507082-1-mst@redhat.com>
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2021 19:07:36 +0000
Message-ID: <CAFEAcA-D3fYjYddDYhhf+LgTVUrci1Vx6hx1H6DKzYdfTznh6A@mail.gmail.com>
Subject: Re: [PULL 00/17] pc,virtio,pci: fixes, tests
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 16:03, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The following changes since commit 7ef8134565dccf9186d5eabd7dbb4ecae6dead87:
>
>   Merge remote-tracking branch 'remotes/edgar/tags/edgar/cris-next-2021-02-22.for-upstream' into staging (2021-02-22 14:20:32 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
>
> for you to fetch changes up to 7b630d937a6c73fb145746fb31e0fb4b08f0cf0e:
>
>   qtest/acpi/bios-tables-test: update acpi tables (2021-02-23 10:58:42 -0500)
>
> ----------------------------------------------------------------
> pc,virtio,pci: fixes, tests
>
> Fixes all over the place, a new test.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

