Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267AB213DA7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:37:20 +0200 (CEST)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOgh-0003tb-39
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jrOPG-0006CX-TV
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:19:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37086
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jrOPF-0004eM-0K
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 12:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593793154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Fk6SyDxzNjz+9czjM2xdv/qjRhkmMBD8VMWbMN7ABM=;
 b=O4LeHXjmNOMWlvlrNGScZFkWFFnWV9as5OlxEG18+3jxzOgF/Rq1tFy2wQLzS/fplFiJcb
 5TxfGOjGjfyKrdhRx+5gP6//aGd2whRY7FmBys3OhaVmSRGGLvUZgxgkTKC3dOP/MAGzlf
 DYVZV8WWJu1RMAP6YXSCNiwrYKVOCI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-Ja4w9KHuNFOxnaUtH1znPw-1; Fri, 03 Jul 2020 12:19:12 -0400
X-MC-Unique: Ja4w9KHuNFOxnaUtH1znPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5501100CCC0
 for <qemu-devel@nongnu.org>; Fri,  3 Jul 2020 16:19:11 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFF119697;
 Fri,  3 Jul 2020 16:19:01 +0000 (UTC)
Date: Fri, 3 Jul 2020 17:18:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH] MAINTAINERS: Cover the firmware JSON schema
Message-ID: <20200703161858.GO2213227@redhat.com>
References: <20200703161453.8406-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200703161453.8406-1-philmd@redhat.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:34:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 03, 2020 at 06:14:53PM +0200, Philippe Mathieu-Daudé wrote:
> Add an entry to cover firmware.json (see commit 3a0adfc9bf:
> schema that describes the different uses and properties of
> virtual machine firmware).
> Cc the libvirt maintainers if it ever changes.
> 
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based on a comment from Laszlo:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg604925.html
> 
> I don't think Laszlo should be the sole maintainer, not sure
> who else should be listed. Gerd and Kashyap? :)
> Can we add it 'maintained' without specific maintainer?
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dec252f38b..57c90201df 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2601,6 +2601,12 @@ F: include/hw/i2c/smbus_master.h
>  F: include/hw/i2c/smbus_slave.h
>  F: include/hw/i2c/smbus_eeprom.h
>  
> +Firmware schema specifications
> +M: Laszlo Ersek <lersek@redhat.com>
> +R: libvir-list@redhat.com

FWIW, I don't think libvirt needs to review this. Our firmware handling
code doesn't really care what specific files exist - it just follows the
declared logic to pick amongst whatever exists.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


