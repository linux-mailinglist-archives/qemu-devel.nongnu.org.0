Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6713F6E44
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 06:24:43 +0200 (CEST)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIkSw-0001LZ-LI
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 00:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mIkS3-0008NH-Oy
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 00:23:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mIkS0-0008Tr-1i
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 00:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629865422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QGbnzkdQ62tEP8oT+XbP5fZ6CyuvIdn+Q7QeB9ZobsA=;
 b=hp4ZuzY6sm/uE3xp98z55nmZVxde4HrigZguPsFYX4tChRT1VVfGps0EEwjEsHRvE/eEth
 z26wZtWrpUWgz3ggb3LxNKVBEXcKpwj6zbO9LbYl7BJXwGF+iar7urxvNYAhrzeB2CahM/
 k1Nut9AessggMNkCs2BOVbuNky1hb7s=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-KY-vfgZ5OjuwzS430ugT5A-1; Wed, 25 Aug 2021 00:23:38 -0400
X-MC-Unique: KY-vfgZ5OjuwzS430ugT5A-1
Received: by mail-lf1-f71.google.com with SMTP id
 u13-20020ac2518d0000b02903c786451a4cso6807511lfi.20
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 21:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGbnzkdQ62tEP8oT+XbP5fZ6CyuvIdn+Q7QeB9ZobsA=;
 b=aFpuIgKJOmRU1kkcILjUdxF5sW+yQ6cbc+b1wMpzaRxtp7+K81UbGLB8JipcSup8c1
 Y6Rp5CVEzj8cgtlsML/SEkXhWQCERBogCM9ASOx+Pg107LV+vPpgXfGf/zQNhBXW1afx
 8UtVUW+3Ni6ZsyFTXcxb7Gwp7J53BaLvqvRtkjG+EPZdV9PNJtlT0xJ77GlxkJTAvtaC
 4EZCZY0guFQPxo5rkUeA0p3vcauOGIjJODAEwj6dABnRpT88/YzkPRUmqcsUWKusK+Jo
 wXHZYB8kxZl3mcp5omJmrdvVaVWVomAgQ07wGRxWEcOQrj1gflyEkMBpWIlW2HuLIe30
 cqHw==
X-Gm-Message-State: AOAM5329GNV3CUn71bOJawhlDZIbrPvmUzcggxHeqfpl+9Ms/1Ofemz2
 MhNierTIBNWPYghIynnpAstH2VxKnbz42IUZEtuV0wNCTpiGieo/upoIcOzbacn7uAITYtLHb/Z
 4/rKJsITFJjCyUJIHnFRph+o6RP44J7k=
X-Received: by 2002:a05:651c:1124:: with SMTP id
 e4mr33508888ljo.261.1629865417035; 
 Tue, 24 Aug 2021 21:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw12pmjpsqr+h9l4/saUYdifUgwo4K2wmYADHqCEnycDKEPxMXt3q2WRlHaSZSkxoPdIdYFkcpxblioCVB6kSI=
X-Received: by 2002:a05:651c:1124:: with SMTP id
 e4mr33508871ljo.261.1629865416820; 
 Tue, 24 Aug 2021 21:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823175457-mutt-send-email-mst@kernel.org> <YSQjBX9SwzgNGiag@t490s>
 <CACGkMEttajn8xihZCw8UYVHxGu1wE8eDoEhuc7Ug7_Q_aKCyRQ@mail.gmail.com>
 <YSUVO7sVsgsZiCHF@t490s>
In-Reply-To: <YSUVO7sVsgsZiCHF@t490s>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 25 Aug 2021 12:23:25 +0800
Message-ID: <CACGkMEvYxibuozehc3m2rETBTWNWT4jg+M5RA1-4rMDW78f8yw@mail.gmail.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 11:50 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Aug 24, 2021 at 10:52:24AM +0800, Jason Wang wrote:
> > It looks to me this doesn't solve the issue of using virtio-mmio with vhost?
>
> No IOMMU supported for any of the MMIO devices, right?  Or am I wrong?  Thanks,

I guess virtio IOMMU has that support, but I might be wrong.

Thanks

>
> --
> Peter Xu
>


