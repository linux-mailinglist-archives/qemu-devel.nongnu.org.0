Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C424AE81
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 07:41:06 +0200 (CEST)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8dJy-0001cU-1F
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 01:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8dIp-00016q-Dn
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 01:39:55 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36739
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8dIn-0001iM-4v
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 01:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597901991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FRCCW20JUI2vua1p3yMpfT0eGrqepoQ21tLYLFwquKM=;
 b=XY52vS0xmfpwk1SHnxCuZU/hky9guYjSA+sUGdfYhg/4Tr3/q58fXeqtDg+G0btXOazszA
 TzLC+wTjzIgjsliXF986fgk6wS8tNSHwP2FUQdKT3pLKY3lhRL28tkn7q4KtUmrbW4XovO
 FS0QuHzuZlBtyqwY9jzz//ef2u7Cyyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-fZxBiWvpMD-W1oVKwCsyFg-1; Thu, 20 Aug 2020 01:39:49 -0400
X-MC-Unique: fZxBiWvpMD-W1oVKwCsyFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50171084C8D
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 05:39:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2DA439A55;
 Thu, 20 Aug 2020 05:39:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C6F2097AF; Thu, 20 Aug 2020 07:39:41 +0200 (CEST)
Date: Thu, 20 Aug 2020 07:39:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 29/58] vhost-user-gpu: Move QOM macro to header
Message-ID: <20200820053941.jmuh7umy2snvtuh3@sirius.home.kraxel.org>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-30-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200820001236.1284548-30-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 20:12:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 19, 2020 at 08:12:07PM -0400, Eduardo Habkost wrote:
> Move the VHOST_USER_GPU type checking macro to virtio-gpu.h,
> close to the TYPE_VHOST_USER_GPU #define.
> 
> This will make future conversion to OBJECT_DECLARE* easier.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


