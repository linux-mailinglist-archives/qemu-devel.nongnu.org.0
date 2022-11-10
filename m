Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B741624DD1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 23:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otGNt-0004Ev-6o; Thu, 10 Nov 2022 17:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otGNi-0004EL-TN
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:50:49 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otGNT-0007NZ-2S
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 17:50:32 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 78so2925410pgb.13
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 14:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=c4rW1ZoelIZADnENS8GXV9ca/7Kg9DGO6ozoLO3rztM=;
 b=edN+NAxOlw8PDbTWXchha04iok5JAmbz9lULJJ2bK1N7du8KmNYzUvubWE2lFxJRj9
 7IBFQFBt6es75CCVLOhan1ULoV1fNcql4EFkToS4Lq7zaRp8VoNtx/VmCj1+hh5WBYt5
 YyeHmKBSa8mtB/guQov8kaGCDC6h/0rdQoOYQxOj83UGHl9NQ+GXWWJCIGRdedYyL1i6
 YJJjoK1qUYGqtqOufaiWdZCn7j4+vPrxju81L27TvLn01BE/OZE9cwtmNqXr69upsw+j
 GRDxi+q0XIbb0z+bKPvp5n+JyqpSeIdd3hO43pOcBGGPB2zYtfPQn5SoPS1KGQfS6ZxK
 TsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c4rW1ZoelIZADnENS8GXV9ca/7Kg9DGO6ozoLO3rztM=;
 b=b+5U6pbzVXH5f0jCrSay6ING+96vRAXBLo5UhTwPFFcm7G+jL+PMg0KLWegP38+eVq
 tq+kkl/Knsigz1JghQf55ae3mvonyfmloE9Li8ejv49t3cdev7m3wuQA8cp5ekVDHHH5
 +qC5qttjCUlO/fygoTyHF3qG/s/dAEziy7xdo7rAsCFc4mYtcagaPMP5y6K3Hi5dxcDU
 loAYWmF9AqUDZkgtlLx3+kXFRW1qkFdxBxJ7qq3B1RSpznh8Sce6aDFKMAopmGg0wCpI
 UMUgtsgPctEH0I5HOse2R5AlCXTmNSUW7RmkEQ9NNJS7upsYvufRcyPhHbUC+Pc/dMbJ
 I9VA==
X-Gm-Message-State: ACrzQf2/HXvy5AV+aG0o8z7RnoWURpfr4wU0gZ1sfM1yR+roirC1p8pm
 dJn9shl+t9QxXvP2LEkwHSb3q2R4c2GXWr2kUrIJIA==
X-Google-Smtp-Source: AMsMyM47XkKh88NrHYEpNaFR3K1D92a/OxpxtDYzT2oE2IA/RFmkNr4nNBNlu4F+lEAIImkVpkUG8DSWAIJHFqQcT4Y=
X-Received: by 2002:a05:6a00:179f:b0:56b:bb06:7dd5 with SMTP id
 s31-20020a056a00179f00b0056bbb067dd5mr3901772pfg.3.1668120629635; Thu, 10 Nov
 2022 14:50:29 -0800 (PST)
MIME-Version: 1.0
References: <20221028191648.964076-1-alxndr@bu.edu>
 <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
In-Reply-To: <CAJSP0QXf3ZiNOQc7ok8Wq6C5np+Q7SDuXu6jmuMivxq6RkGFQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 22:50:18 +0000
Message-ID: <CAFEAcA9L=r=KubxGdKbX5JAM2YHxbvngPZCrRECJuY57VT1vDA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] memory: prevent dma-reentracy issues
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 10 Nov 2022 at 20:51, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> Preventing this class of bugs is important but QEMU is currently
> frozen for the 7.2 release. I'm a little concerned about regressions
> in a patch series that changes core device emulation code.
>
> I'll review the series on Monday and if anyone has strong opinions on
> whether to merge this into 7.2, please say so. My thoughts are that
> this should be merged in the 7.3 release cycle so there's time to work
> out any issues.

Yeah, we've lived with this class of issues for many releases
now; I would favour landing any solution early in the 8.0
cycle so we can make sure we've worked out any problems well
before release.

thanks
-- PMM

