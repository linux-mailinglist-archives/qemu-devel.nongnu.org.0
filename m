Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC79209D51
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 13:14:32 +0200 (CEST)
Received: from localhost ([::1]:44104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joPpv-0002iQ-Pg
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 07:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1joPoU-00017m-7x
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:13:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37800
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1joPoQ-000647-C0
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 07:13:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593083577;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bArJkRA48HLUuff0xloxtbcY/bIgCi2ICoQ0QidDkG4=;
 b=Zb0RlB/k+BxnlTm+Ftmm1RmGa1imboJQVTAKGni/FNAA2nrUzSBI2GFf8gx5dNPEIk+NYb
 cGCz13EsVuTXSVfhJpYJWYt72R9k7IBfxqfgacNnyGndzuXj9IIC9u1+lCfWv5Jq2bJP9T
 4P92LoYdc0DXYw4SQkFhKooTDdRNwlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-z-fhWNHUOS6fVXz4TpVm8Q-1; Thu, 25 Jun 2020 07:12:55 -0400
X-MC-Unique: z-fhWNHUOS6fVXz4TpVm8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14CDA18585A2
 for <qemu-devel@nongnu.org>; Thu, 25 Jun 2020 11:12:54 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E93AE71660;
 Thu, 25 Jun 2020 11:12:49 +0000 (UTC)
Date: Thu, 25 Jun 2020 12:12:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v10 2/5] hw/nvram/fw_cfg: Add the FW_CFG_DATA_GENERATOR
 interface
Message-ID: <20200625111245.GJ1009994@redhat.com>
References: <20200623172726.21040-1-philmd@redhat.com>
 <20200623172726.21040-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200623172726.21040-3-philmd@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
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
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 23, 2020 at 07:27:23PM +0200, Philippe Mathieu-Daudé wrote:
> The FW_CFG_DATA_GENERATOR allows any object to produce
> blob of data consumable by the fw_cfg device.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  docs/specs/fw_cfg.txt     |  9 +++++++-
>  include/hw/nvram/fw_cfg.h | 43 +++++++++++++++++++++++++++++++++++++++
>  hw/nvram/fw_cfg.c         | 35 +++++++++++++++++++++++++++++++
>  3 files changed, 86 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


