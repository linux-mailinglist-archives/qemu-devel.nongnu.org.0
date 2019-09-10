Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D5AF23F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 22:25:10 +0200 (CEST)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7mhJ-0008RZ-Vv
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 16:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <devtoe82@gmail.com>) id 1i7mgI-00081s-Ie
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 16:24:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <devtoe82@gmail.com>) id 1i7mgH-0006Dx-La
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 16:24:06 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:41191)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <devtoe82@gmail.com>) id 1i7mgH-0006DQ-Ef
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 16:24:05 -0400
Received: by mail-oi1-x234.google.com with SMTP id h4so12245474oih.8
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zASmb1FXxCAOcT0V77pcGOmw3rf3L4X3a8DFICILbQo=;
 b=CJoRGq8xVPIFrysnZ5PPF9bjrPeKTjDew6K8Mj8b9eqGPUemXBHiMbJvoKKNt4Re30
 E5/zVRXulTnjU5XiVWwR+rqeQMoMRNtjPlmqnwXfNjTFib80l8iguwb9NwugXReQjWog
 hlJgMbcFALFsCjJq7Lwk39GnVb8RrOdCO/3FIllbiGlhEKWP6Tsif49H8NwIvCg27jKE
 wjCKdzfq3YcFrix+nbXxeIIKHNLYAfgtIASUDll3uNbJdswfejXRiJjgGEWYEAlfhNAj
 cvrWVk0O30WnCPj0SgoaGCDVJUk8Ngqg1Fa44wpzFSKImcvgZbKFeyaysEO9d/qh1l+u
 FhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zASmb1FXxCAOcT0V77pcGOmw3rf3L4X3a8DFICILbQo=;
 b=WTIyAR1aF9Uv5XuI07SLPSiKe+nY7OgzlwK+d7ury/PXdqWQg+Mrs8HDi4y2c6vBLD
 OtPl/HuHM8E5pd4eE+I+c4foArNfEpZqa286+vTD1WJkxwNmDjcFvzKlV58UDA6yklT0
 pkatwhk1y32ochiBwv65s6WFNDvY/5biyjlawG+6X1eUINQDsuTxm5n791VBaA80KqlN
 KLd6CLWsfztBQb7wf6QRIvSONhBVGjl7zSFBd7InzbiLivi1tpCFIfDOm00qa2gSWetY
 u9/neshKhvR7VNoOkiZ5OMcoEdHWGsnQ86KxTKh/86ohr05wEINGMoU19vqY3rqONnn0
 QnHA==
X-Gm-Message-State: APjAAAWfbUsHkBscPQXNY68Hk+63fstzVc6oJwIBnz5J11H8Eh1o0SOy
 qLgZr/SNFhjpLtnydqSaySF2C3K4dTHSOMYExqo38nQl
X-Google-Smtp-Source: APXvYqx9+4ldo9tJe48gQWz/akepFJmUZRQ0u9eOqHmOXxhVjZ8CHNXnPnvLGz4J+NsgOT1VJJhIa4EI+/ZX46UChCQ=
X-Received: by 2002:aca:7509:: with SMTP id q9mr1180639oic.111.1568147043825; 
 Tue, 10 Sep 2019 13:24:03 -0700 (PDT)
MIME-Version: 1.0
From: Toe Dev <devtoe82@gmail.com>
Date: Tue, 10 Sep 2019 23:23:50 +0300
Message-ID: <CAN+O=TJAFiBEUVudnQ8cszfpo48GG9z-9FecsOtU+HU3PNisHQ@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Subject: Re:  [PATCH] hw/block/nvme
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
Cc: keith.busch@intel.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey,
While reviewing I noticed maybe we need to update the spec revision.
In: nvme_class_init(...)

current code  pc->revision=2
change to: pc->revision=3
However not really important I think.. Just for consistency.
When I done reviewing, should it be patched too, How?
