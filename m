Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09426475E3E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:11:17 +0100 (CET)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXoC-0006t8-2z
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXXg-0003Ex-Ul
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXXe-0002je-2c
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639587249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
 b=g3H3HklgkbPdlV8zjGRMPqYEPTnskYh41421Yu9L8ZbwgKGWa3ex9gCG/c6f5j7W3Vu/lK
 SpeX3854Z6qaZSdlHWcsOBDmNEJ0sb/QAqeg/XMcWKnE6O7LDNny4slbWmlHYOeKFgFuY+
 DQ1Mk0dlgWuasqfvkYq8QaOfh5QkbjY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Er_5di04OnS5YAZ5DQmrOg-1; Wed, 15 Dec 2021 11:54:08 -0500
X-MC-Unique: Er_5di04OnS5YAZ5DQmrOg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso9273243wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
 b=SGtbTlFTVsNMry+AJvzxxjDXBKuFJUsuA9H2TIBX4v6yLd/rMhLM0a2qhCTFpRfrem
 jAKRM9fONSwJomut51TQP+Cunly+J3hC/jXGetR5TuDDxKDFyrWhAQLqkn/W8lEvqnmK
 pAQB6XWvhkFNaxHNfrtxQI/gfKycSB/3hLZRkFqN4jtF7pMIuKlxLKQi7zQvPmaoWP4A
 /vrREFP0gx6HXmvgfeSDEYqBjZ8ao9tumQgIHJYzU2T9LTInqEJ3PWwSkn/aQCirS8KT
 KvSPAFodwFi1wLxR3u2DdkEQaPnrdwnzV2p3aVhbZpIjX2oowAQTE11jUS8S0pNBVXaF
 h8UQ==
X-Gm-Message-State: AOAM530JpxmoH0kJgE/siNdohQ6FfUlS/G86qMxdnmV+85KnPegRvr+x
 Bo7T3mkpMX2oaZhbsfCWaMxEuGofaIlJVzhr+IeBjEo84yeGCT8K3UMOYjlq98iRIWAhdDurJRW
 tsy8JddjCbW0GpxXOOXqVYlAVWIkXo7QloHsiEmDHqQ73fDtYFQp4OSbjJq2EUmRP
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr2922526wry.72.1639587246852; 
 Wed, 15 Dec 2021 08:54:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5QP7MhMqInb5DgABgsa2EPArTJizZ3GkYW1VUxkoLuSUx8YDf5Tk+w1yQpDo9A6IqlXABSQ==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr2922471wry.72.1639587246493; 
 Wed, 15 Dec 2021 08:54:06 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v8sm2393630wrd.84.2021.12.15.08.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 08:54:05 -0800 (PST)
Message-ID: <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
Date: Wed, 15 Dec 2021 17:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210903174510.751630-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 9/3/21 19:44, Philippe Mathieu-Daudé wrote:

> This series provides the safely equivalent g_memdup2() wrapper,
> and replace all g_memdup() calls by it.

> Philippe Mathieu-Daudé (28):
>   hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>   glib-compat: Introduce g_memdup2() wrapper
>   qapi: Replace g_memdup() by g_memdup2()
>   accel/tcg: Replace g_memdup() by g_memdup2()
>   block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>   softmmu: Replace g_memdup() by g_memdup2()
>   hw/9pfs: Replace g_memdup() by g_memdup2()
>   hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>   hw/acpi: Replace g_memdup() by g_memdup2()
>   hw/core/machine: Replace g_memdup() by g_memdup2()
>   hw/hppa/machine: Replace g_memdup() by g_memdup2()
>   hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>   hw/net/eepro100: Replace g_memdup() by g_memdup2()
>   hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>   hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>   hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>   hw/rdma: Replace g_memdup() by g_memdup2()
>   hw/vfio/pci: Replace g_memdup() by g_memdup2()
>   hw/virtio: Replace g_memdup() by g_memdup2()
>   net/colo: Replace g_memdup() by g_memdup2()
>   ui/clipboard: Replace g_memdup() by g_memdup2()
>   linux-user: Replace g_memdup() by g_memdup2()
>   tests/unit: Replace g_memdup() by g_memdup2()
>   tests/qtest: Replace g_memdup() by g_memdup2()
>   target/arm: Replace g_memdup() by g_memdup2()
>   target/ppc: Replace g_memdup() by g_memdup2()
>   contrib: Replace g_memdup() by g_memdup2()
>   checkpatch: Do not allow deprecated g_memdup(
Is it possible to take the reviewed patches 2, 24 and 28
via qemu-trivial, so the rest can be merged slowly by
each submaintainer?


