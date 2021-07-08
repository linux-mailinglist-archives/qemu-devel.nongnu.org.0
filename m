Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F13C19BD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:23:28 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZcN-0002Sn-EF
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZA8-0003kc-Gi
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1ZA6-00005k-Pu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625770454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GkMqPbXQVmD5LTvDPibKYuPdl35GzC+BdeEkF9gOJ3A=;
 b=Peagg6N9XEmdNYehn4l8gEL7fOGkbNlJoVRPxo+xHabMNXm7iIr0Jp6bFOidUElChUAF3f
 PpCAJPo5cvK2+hONv4wtlE3L3k6l9dZA94q/0v9sPGwx6O6F3+knp/RZlVGfFBcfxsvwxX
 edYNKjCqew0Rneek7V3yxqmDDZsWY2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-x3m9H_tLONWeJ-FKcXs_LA-1; Thu, 08 Jul 2021 14:54:12 -0400
X-MC-Unique: x3m9H_tLONWeJ-FKcXs_LA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2D621084F4C
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:54:11 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D5911970F;
 Thu,  8 Jul 2021 18:54:08 +0000 (UTC)
Date: Thu, 8 Jul 2021 13:54:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 09/18] crypto: delete built-in DES implementation
Message-ID: <20210708185406.l2zetut5mvltulz7@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
 <20210706095924.764117-10-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706095924.764117-10-berrange@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 10:59:15AM +0100, Daniel P. Berrangé wrote:
> The built-in DES implementation is used for the VNC server password
> authentication scheme. When building system emulators it is reasonable
> to expect that an external crypto library is being used. It is thus
> not worth keeping a home grown DES implementation in tree.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  crypto/cipher-builtin.c.inc |  72 -------
>  crypto/desrfb.c             | 416 ------------------------------------
>  crypto/meson.build          |   1 -
>  3 files changed, 489 deletions(-)
>  delete mode 100644 crypto/desrfb.c

Nice diffstat!

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


