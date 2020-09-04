Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0D25D3E9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 10:47:25 +0200 (CEST)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE7NU-0004nz-NB
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 04:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kE7LH-0002CW-8z
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 04:45:07 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kE7LF-0006Ba-H9
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 04:45:06 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-CUCXlQ4PMb6T2ejJiUC90g-1; Fri, 04 Sep 2020 04:45:03 -0400
X-MC-Unique: CUCXlQ4PMb6T2ejJiUC90g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5CDA801FAE;
 Fri,  4 Sep 2020 08:45:02 +0000 (UTC)
Received: from redhat.com (ovpn-114-5.ams2.redhat.com [10.36.114.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7C1F1001B2B;
 Fri,  4 Sep 2020 08:44:54 +0000 (UTC)
Date: Fri, 4 Sep 2020 09:44:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/8] i8254: Rename PIT to ISA_PIT
Message-ID: <20200904084451.GE721059@redhat.com>
References: <20200903180128.1523959-1-ehabkost@redhat.com>
 <20200903180128.1523959-3-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903180128.1523959-3-ehabkost@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:57:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 03, 2020 at 02:01:22PM -0400, Eduardo Habkost wrote:
> Rename type checking function to be consistent with the type name
> constant (TYPE_ISA_PIT) and type name string ("isa-pit").
> 
> Suggested-by: "Daniel P. Berrangé" <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  hw/timer/i8254.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


