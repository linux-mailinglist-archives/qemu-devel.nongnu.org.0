Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CB5EF89A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:24:08 +0200 (CEST)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvOR-0007MF-N3
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odtAY-0001sq-M3
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:01:39 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:38508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odtAV-0007RH-PP
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 09:01:38 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3321c2a8d4cso13619907b3.5
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ypBC4AVAr8ukIDGYVCFxGDgCppkFwlsTKpIQoJXKozM=;
 b=NrRdWn7vHoDlJRDC0+ReXOigIQwQ8/DpOu1W91f7WErbzapxSARrOVcUTUld+pRgbS
 zbEP7GQ2HaZAEseVl55NU8qwWggRnTY2V/IKfU13TpqBi3aZBCHhrvxHqWXTXTy+P5MV
 MkOjttS/nvWDxQo3RPdQLuFo/6NqEXzyJaVre76e9XFq9s+DW6HnVSVAO/UP0AMPuGNy
 DZX7RTyTfz5yRRJe3mmykKBu2Zdxf/h5Fl6a1BzdNgubosnPQiqFZYsVRqwcsrjALmZq
 7uaUNh3zv6XLQPoS46Qt1tnwJbikLWt+7Pbb7SwXYOh+8Y5iv61CWkefaY8Pr2SeYazI
 kM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ypBC4AVAr8ukIDGYVCFxGDgCppkFwlsTKpIQoJXKozM=;
 b=C6N5+xk9NG9+uKnIwRSKDXOqf0gkXWHtVD3AlUxa3mZaU+obvmOAVWpFmAggA/uxSn
 riIlEsekrOJEB3DTTRumNE7DXSYlEtJeF/aolmvOiCt+W1M4qzXVopIdG31tpacD5QPo
 k0/kVaFoGusXa74btEuT1pWhsretQWUJGptPaX3EiXXgCXG5daS7MpMDfF2qElW23Nlo
 dCKxHwkwr0TOv03Jk2b7ix+TRDc+2rQb7LAFitQOOQqlVWxIyqFsllhOrMINAxxl4bBO
 Y1jK/6LvKrlwgirfINzfP8gC7CQaK99NmTXAHhCz4upnkHeSOxFAobzbrP8i6Dxa4Uyt
 1lYw==
X-Gm-Message-State: ACrzQf0SShGRiMtuBmagOsjDInjmZ5bYsnD1LtX0TfiRnHwelu5oWcyS
 Gh3Dgb69n9PdIzs+iOW9SYfkmb8yYgYsOELoJOyaHzvGzjs=
X-Google-Smtp-Source: AMsMyM7FZgonsMbUtwnpqMx158zMl1cR4ZpDHXV0WFHuLjSGfVcZZ1EG7s34OxaUcRaQqLC11bPVdFs8hafwEVmOXko=
X-Received: by 2002:a0d:dd05:0:b0:354:208f:f35f with SMTP id
 g5-20020a0ddd05000000b00354208ff35fmr3086566ywe.239.1664456493810; Thu, 29
 Sep 2022 06:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <YyyxrNp+5XrmLi1Y@fedora> <Yy1gB1KB3YSIUcoC@redhat.com>
In-Reply-To: <Yy1gB1KB3YSIUcoC@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 29 Sep 2022 09:01:21 -0400
Message-ID: <CAJSP0QUjT5nuiNnw-1AK4es3xjL57a5ZqopQ6YcqLkyYbtENDg@mail.gmail.com>
Subject: Re: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, thuth@redhat.com,
 Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I still don't know what the failures from the Avocado tests are:
https://gitlab.com/qemu-project/qemu/-/jobs/3100466535
https://gitlab.com/qemu-project/qemu/-/jobs/3100466546
https://gitlab.com/qemu-project/qemu/-/jobs/3100466539
https://gitlab.com/qemu-project/qemu/-/jobs/3100466548
https://gitlab.com/qemu-project/qemu/-/jobs/3100466537

There are lots of logs and I don't know what to look for.

Any ideas?

Stefan

