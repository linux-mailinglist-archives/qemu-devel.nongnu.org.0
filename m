Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A059631D813
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 12:23:02 +0100 (CET)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCKv7-0007aa-Oh
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 06:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lCKtI-0006gs-3n
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:21:08 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lCKtG-0007n1-E1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 06:21:07 -0500
Received: by mail-pg1-x52d.google.com with SMTP id n10so8274987pgl.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 03:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i6f3GZ8jdDvgbs0AJK9wY2MdXfBUn9J76vvvhk6rUzQ=;
 b=BXfpnpf1tEDVdt0zSqhShr3IJ3HDd5f/dzBuXW/ga7x6DAq2pwJ8hMm0j7lOURobcY
 xLabBJ7qmv6NyW+Ib/mIP3usdLSoMTW5syXcJE2Cl3YD05vtSJPhNLdfGfmjwbcrYWUU
 8h71BUj6frkglDOXfnX1vy1eQoW+Rq3qxjIYacNMOYWIW/4ruZL4BgSdwEi7iIj+DZkD
 oz2RPudYZPBurvF+iHOTSWgq2rC5hPYL37LDttAPv4c5cJwwne763RTsAkbs+WesfJp7
 YpUeJzte+NK+DXmJqNVlASu9lnkk2miPhOEXFh/2Grc6whnN/FhwWCNZgBzZHoaFoUqN
 RM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i6f3GZ8jdDvgbs0AJK9wY2MdXfBUn9J76vvvhk6rUzQ=;
 b=OIq6mUunVGtkz31DSPmgn2Y67HIhoGV8OJ/Jlh+xfGnMxjj3dQd8drO/cqd5kYK+hM
 jAbKZm8GiFTsvrtyedqMRQsn9quqKkHX+uk1uY5Nzb9Rf9kCOTQO8PNiXGppR/KMrvZA
 oQkNuqQ2N6aCf7GW3cndI8n9pGvWkHTqpR7uFFo4ICr/RZyKOVs0eUh39XfCeuOgA2GE
 oYKlzft85Pkdd4JX/dMj0Fpwob9uJv48y9fdmNkjCQ/y7lJeHXloJKEOv5v6sYWYZpPT
 GqhPuUPXhkt73rcrclKwVRij3Y9w7vPZqyr2uSCXa0Kez6rq4UOCKmBUz2aXScEArA9Y
 F/ug==
X-Gm-Message-State: AOAM530wz0Nuq8euDZBNhXY811jx5xA7EMdqWCfCMq8Gfa9OLg5mI+JU
 jajEz2wxhhx6aDfFnKC7ivxtMOgcHYAGc4kpZhM=
X-Google-Smtp-Source: ABdhPJxnMSdsOKBDhot8t2lbuadLZ52XpYW7Jies9d7/3O9VtW7EQGfaVeGbIyZOc5+Ue61YQUfvQ7XILuvqF+YQPh4=
X-Received: by 2002:a62:683:0:b029:1ec:c88c:8ea2 with SMTP id
 125-20020a6206830000b02901ecc88c8ea2mr6215189pfg.27.1613560864360; Wed, 17
 Feb 2021 03:21:04 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <1613136163375.99584@amazon.com>
In-Reply-To: <1613136163375.99584@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 17 Feb 2021 11:20:53 +0000
Message-ID: <CAJSP0QXEvw6o7XFk9FXudr9PmorFHiOuNRg16DjJhBgj_qC-FQ@mail.gmail.com>
Subject: Re: [Rust-VMM] Call for Google Summer of Code 2021 project ideas
To: "Florescu, Andreea" <fandree@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Alberto Garcia <berto@igalia.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm <kvm@vger.kernel.org>, David Hildenbrand <david@redhat.com>,
 Sergio Lopez <slp@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Julia Suvorova <jusual@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Markovic <Aleksandar.Markovic@rt-rk.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, I have published the rust-vmm project ideas on the wiki:
https://wiki.qemu.org/Google_Summer_of_Code_2021

Please see Sergio's reply about virtio-consoile is libkrun. Maybe it
affects the project idea?

Stefan

