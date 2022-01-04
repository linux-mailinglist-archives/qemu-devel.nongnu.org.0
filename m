Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC77483E4F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:38:06 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fKV-0007tz-RU
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fIn-0006Vn-CN
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:36:17 -0500
Received: from mail-yb1-f172.google.com ([209.85.219.172]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fIl-00028e-UA
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 03:36:17 -0500
Received: by mail-yb1-f172.google.com with SMTP id y130so81569001ybe.8
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 00:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=65faz1aS+ocE8++djW9miUT9U5+hAGiLEfUTO28dByg=;
 b=a9XUq5F9ErzRywhDpU07tqrrFMmRbkfMTE8lmxHer2KXVa67L6uUfNoWoipARLXdnP
 Z2eZLlFzhak+RNZW/Q3lps8cEiTbmt7Tnv5CcwKUTZAS0FMmIzI/GZ1YbsNU7ZNvN8xP
 WQlpxk0wrKE0RhK2nejYuLGPDyEi3IfcuCetjq5pg/MQxRyg923Nf6AM5I1kimaDniS4
 ODYAEBDRDTjedGuCdf4hUMVCK3wKllqqgTCQGI+fWHNCR5kJkwXgTTQ9ivW3AaNkJpCv
 m4ARArKqPd+f06NGunDdDJ/Zp8eWISevaYsZJpRTUPGNcvSwI1Vhk05llvgZPd3Hqt2r
 13IQ==
X-Gm-Message-State: AOAM530bp6RRVLaCCZHRATe23tWzAhYESeDzV8C+Fcqa/1WSKRwInNK3
 3AkxeT3XTsO9VEi0qJCX+VxABS//XkI2Ee6vPRw=
X-Google-Smtp-Source: ABdhPJzxJhddaYjn+yluS7kHMriGEoxo100b/e8bVIi8H9lV4ipg3JSluIYWU/Jz2LMQuGQbvqY9NS0jOk/j7gaNeps=
X-Received: by 2002:a25:2f58:: with SMTP id v85mr34703161ybv.663.1641285374939; 
 Tue, 04 Jan 2022 00:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-4-philmd@redhat.com>
 <YdP2g1kKQ7azrwV4@xz-m1.local>
In-Reply-To: <YdP2g1kKQ7azrwV4@xz-m1.local>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 09:36:03 +0100
Message-ID: <CAAdtpL7NN4rOvcs+pCObSBMRCm-XnuuF5V=Y360Gcr-Vh2e6Gg@mail.gmail.com>
Subject: Re: [PATCH 3/8] hw/pci: Document pci_dma_map()
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f172.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 8:27 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Dec 31, 2021 at 12:48:56PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > +/**
> > + * pci_dma_map: Map a physical memory region into a device PCI address=
 space.
>
> Shouldn't this be: "Map device PCI address space range into host virtual
> address"?

Yes, certainly... Thank you!

