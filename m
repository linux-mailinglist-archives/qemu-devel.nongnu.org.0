Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E134161F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 07:49:32 +0100 (CET)
Received: from localhost ([::1]:53980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN8wt-0007tz-Il
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 02:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN8v2-0006yM-9I
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 02:47:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lN8uz-0006cG-Mk
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 02:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616136453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDMoR5LXu+dBurP384usiVuWvrrxtS2HyP4qnr1VQE0=;
 b=LbSTFQbvDYXSlrLfxJHRFoxaz+Ish5A6esbpS51kGUbsdBVGqiDPHV1wYlKLFaUSbWwu+t
 X+J43zq42C5/XImF6SdFpEBQazfNjoOdX6gwZkemolSJ7mWUbu7zKHE/Ujt/ay2GHbql2l
 e9AkN6a12JjeXPOt3buu4Wg/8D1B3hQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-Uwew5uf9MqC4TsR49NPFZg-1; Fri, 19 Mar 2021 02:47:31 -0400
X-MC-Unique: Uwew5uf9MqC4TsR49NPFZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4ABC100746C;
 Fri, 19 Mar 2021 06:47:29 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7471992D;
 Fri, 19 Mar 2021 06:47:26 +0000 (UTC)
Subject: Re: [PATCH 1/4] m68k: add the virtio devices aliases
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-2-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fbd7ab18-d287-012a-48c8-b20ef1c662be@redhat.com>
Date: Fri, 19 Mar 2021 07:47:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318223907.1344870-2-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/2021 23.39, Laurent Vivier wrote:
> Similarly to 5f629d943cb0 ("s390x: fix s390 virtio aliases"),
> define the virtio aliases.
> 
> This allows to start machines with virtio devices without
> knowledge of the implementation type.
> 
> For instance, we can use "-device virtio-scsi" on
> m68k, s390x or PC, and the device will be
> "virtio-scsi-device", "virtio-scsi-ccw" or "virtio-scsi-pci".
> 
> This already exists for s390x and -ccw interfaces, adds them
> for m68k and MMIO (-device) interfaces.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   softmmu/qdev-monitor.c | 46 +++++++++++++++++++++++++++---------------
>   1 file changed, 30 insertions(+), 16 deletions(-)

With the typo mentioned by Philippe fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


