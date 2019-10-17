Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFFCDB001
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 16:26:05 +0200 (CEST)
Received: from localhost ([::1]:49226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL6j6-0007RJ-Ek
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 10:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5s5-00019o-CJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5s4-00036j-Bj
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:31:17 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:42064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5s4-00036X-71
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:31:16 -0400
Received: by mail-il1-x142.google.com with SMTP id o18so2016702ilo.9
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7d/+485lo6M8a0AMPPaFjTHJtJpL7YzBomI/jRF3jB4=;
 b=WdGpMc7kYwUpvkBEFbJ0/lX+0Sf5KzC9Zrh4XbuAjMREBaIt/iErPB4A9EYkKNSBzC
 SCGSbv7iivHbiX2PW4l5/L6XvOC5mzWv/whho4joevvUFyI6yMRj5QH6J/yihiU2u4I8
 UDJ0iCVVFB0slMVI0GM4QEp6gsXMoJpqB87BolV/i5anK0q8KyrZc/KkWDD+ysIMLfsv
 o06uWBNdLbrD9+K+8/pstVs4kWy/xoFHi9l44BbUTxSt7bG9tuwHAwdc95yVDSwiD0lQ
 J4DqG0R1eXXIejrRBMO9futPHr+Ep7a9LSzjhRkKptvMtYtTmw+m+dSE5Gff3sczS6Dc
 k4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7d/+485lo6M8a0AMPPaFjTHJtJpL7YzBomI/jRF3jB4=;
 b=SOOVMl3MYioy8w9es4p8TH6b7uyMQFP4tJUeYR3w+WfdMleR5NFE0LD+bKq4tXSeGs
 4HqAJGNjN0zu13cN7KBnC9wNYVgzmTkuUGZkAfhCXhNBd56/3ZVvBE03hs8+AT43A1NV
 89Kqj0X8hdLusuBLgcB2SvxeciVzlNXWGANbQlV2ixawI9DtQfhzc8jygoHtNj/aQ4qq
 /UwmaOCR50f7AyVUlZrmc2bwgLJrWWUFdfFX1wAYOJKYskRl/izreBlT5XFr4GiSOEhd
 xnzocPCPL2y4ntETowyQXjO/24wNd3FKDnyCJHOUfTgkubZluFCGF/yD1gNjVAUl7STR
 0mHQ==
X-Gm-Message-State: APjAAAWJpBit2IQF9BjYxFSKenSj9xl58QnMBYaJ0kYTfoAsSyBn4DBN
 msIytaoLyVZxQotoUDBwYdmVq1S7Ep8n3VY3eJNTCyMEMKg=
X-Google-Smtp-Source: APXvYqzQml7nu8yj3Bc1F8WNgETRz2QTw11zmwB+iv8tlBztXNl0P/iizA1OFnDHihg9bdD7J2lj2L02y5RKz4xK8Zg=
X-Received: by 2002:a92:1948:: with SMTP id e8mr3762268ilm.292.1571319075093; 
 Thu, 17 Oct 2019 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132110.4343-1-peter.maydell@linaro.org>
In-Reply-To: <20191017132110.4343-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 14:31:03 +0100
Message-ID: <CAFEAcA-PgynTS2Tc9Zgi0ynes35Os4s0GQ2NnhUox=zk9eg0xA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert ppc and microblaze devices to new ptimer API
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::142
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Oct 2019 at 14:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the devices used by ppc and microblaze
> machines to the new ptimer API. (xilinx_timer is used by both,
> hence putting both archs in the same patchset).

Apologies for the duplicate cover-letter: messed up the
git-send-email command line the first time and sent just
the cover letter without the actual patches.

-- PMM

