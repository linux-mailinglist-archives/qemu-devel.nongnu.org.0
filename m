Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7041962D93A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:17:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovcs0-0004nU-No; Thu, 17 Nov 2022 06:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovcry-0004n7-WE; Thu, 17 Nov 2022 06:15:47 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovcrx-0003p3-HE; Thu, 17 Nov 2022 06:15:46 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id k84so1475798ybk.3;
 Thu, 17 Nov 2022 03:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OWLZNKhXlbZLZGchnB8JPafg/R0XnoZaPqTly1bXY5A=;
 b=fRBPG/u6SfJh7qgkewgjO3NAZTigvteK93DIHqeWB7wQwI6Za8Rq9r7EldNb3XQdkC
 zhfYZhA/XFsNAorXygExkGBc7XKJQ1aib0kz6EcUic8pyPxH8JYFP8pXa+R8eTCoHcCa
 yiPPlQhwdaNcOKHFlJB85N0TATHEGBVWU/posgA1CjcXG6iH2eebM12/4IakdjzjMo25
 8HTwtzQEH/E/Ru2/dS/PV1MSQ10gz0ZGyGOrCA5Q9iDizldgGr+YQDoIPS2FTcxTNqTi
 rOtE91E2H0FBp5ppxxjOA+gJOGl5US9rqG/8nDx6TLNgdEG7899B9NCSuRFt+ysHFHlH
 Ka7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OWLZNKhXlbZLZGchnB8JPafg/R0XnoZaPqTly1bXY5A=;
 b=6SLoguoEgc5tTCUJ1/amxq4eaFqx0JIdwjdJUjNwYqK/NaM0XQV8rJeERjF/FG4ifG
 saI2tpxbgOF4Q763YSsvWuYWYuGYMcetaqHuTJleaEtj3FIIsMjslpG0PIRiM1vKl5gN
 iRj1kqBEQePjSOzioJELCAdoHDLNlB3xRCLIc1rV++JRghAewBV1W9q25gdO70rlCGe/
 YaUGhm2W4RM+ZezLqqe3zIMCxGSi+ugN4KuqhLe2eHBaZCa8x/GG11fUZZuT0HXhrD7q
 SxlN2sLxL7/Gb/nzI+pl2Jp1Ox1cpgpoxVjt8pJG+Z4GQWz77T2ClD732rf+kgUyjrl+
 TENQ==
X-Gm-Message-State: ANoB5plfhMdFSUWRgZ/9xuMD4GnuS8maGdOoKuF6TL1Z2TDrlUds5oeQ
 of+gh3ldk4BaWwy9CR8J+diYpx+JsJmEKJGixrc=
X-Google-Smtp-Source: AA0mqf6ue1OY5FvnyE4nz2rh2IOgRx0ehCEzdYv2BU+363GZlkUjjMItzyLLWaYn5vFMa7kcua69RgUCxuOLY3y4Qeo=
X-Received: by 2002:a25:af54:0:b0:6dc:e3ee:3e60 with SMTP id
 c20-20020a25af54000000b006dce3ee3e60mr1646928ybj.58.1668683744063; Thu, 17
 Nov 2022 03:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
 <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
 <01e701d8fa2f$4124d750$c36e85f0$@fiebig.nl>
 <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
In-Reply-To: <CAJSP0QX_PCNU6PFd8svnGJq5U9-0+weAN6MyiyYqWHkssY4QPA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Nov 2022 06:15:32 -0500
Message-ID: <CAJSP0QW76L82s=LM=RpWEwiFPFaNBe4J4AXBi6jtDR2h8dE1UQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
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

After looking more closely at txdw0 it seems that the code mixes "Tx
command mode 0", "Tx command mode 1", and "Tx status mode". The bits
have different meanings in each mode, so this leads to confusion :).

Stefan

