Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430051D23E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 09:27:51 +0200 (CEST)
Received: from localhost ([::1]:53562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmsNS-0004s1-0n
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 03:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmsKo-0003EU-7P
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:25:09 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:52720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1nmsKk-0008Jp-D6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 03:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651821901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wep84ps590PkyVxR7RDGjl30jm7YU601QgBddRXIN24=;
 b=QFQ+pPoZlCiz9hBrzLlthuLduJY0WH/+yLaBsC5MFAy24p0to19NyXfeV8B25TryBsb8Te
 WboE9RyV0ksWcyoy8OCbvzzF1KFz2VCxkqxGodcVtI9KPJ4vPSoWepWEIJBKogJMlVIdTU
 bdZOVAt+4jCdfY+bRYQWu2eTTemihCE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-eJb3o--aNACiuGTrMZm3OQ-1; Fri, 06 May 2022 03:23:45 -0400
X-MC-Unique: eJb3o--aNACiuGTrMZm3OQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ED9B101AA42;
 Fri,  6 May 2022 07:23:45 +0000 (UTC)
Received: from localhost (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D85BC40D2820;
 Fri,  6 May 2022 07:23:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, Eric Farman
 <farman@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] hw/s390x/s390-virtio-ccw: Improve the machine
 description string
In-Reply-To: <20220506065026.513590-1-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20220506065026.513590-1-thuth@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 06 May 2022 09:23:43 +0200
Message-ID: <878rrf5dkw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.74; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, May 06 2022, Thomas Huth <thuth@redhat.com> wrote:

> The machine name already contains the words "ccw" and "virtio", so
> using "VirtIO-ccw" in the description likely does not really help
> the average user to get an idea what this machine type is about.
> Thus let's switch to "Virtual s390x machine" now, since "virtual
> machine" should be a familiar term, and "s390x" signals that this
> is about 64-bit guests (unlike S390 which could mean that it is
> 31-bit only).

Do we foresee any s390x machines that don't default to ccw virtio
devices in the future?

> Also expand "v" to "version, since this makes it easier to use

s/"version/"version"/ :)

> this macro also with non-numeric machine names in downstream.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 8fa488d13a..11a942a325 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -768,7 +768,7 @@ bool css_migration_enabled(void)
>      {                                                                         \
>          MachineClass *mc = MACHINE_CLASS(oc);                                 \
>          ccw_machine_##suffix##_class_options(mc);                             \
> -        mc->desc = "VirtIO-ccw based S390 machine v" verstr;                  \
> +        mc->desc = "Virtual s390x machine (version " verstr ")";      \
>          if (latest) {                                                         \
>              mc->alias = "s390-ccw-virtio";                                    \
>              mc->is_default = true;                                            \


