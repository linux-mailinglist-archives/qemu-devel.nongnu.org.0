Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C125336E14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:42:56 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGuF-0005Pw-Kr
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKGss-0004rJ-9p
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKGsq-00030P-K8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615452087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r81LhqhEGh6tj3DkbIHFkBGLcOm4HACA5GUFCGBeZZU=;
 b=Gw7PUCYyFatw+3nW82Ms+mFDCjko8ncokZfOkimUZ9siF/w9TKO0Tq3xhIOFEfAaigAmkJ
 vF0ZzqJj6FsDgPlTMxXcQ5Xngaiw8gqhrG/SSzvlQpoh1AEamTZB9GC5h31JzPTJ8/o95y
 OF766o9PZS+uZDAf2wgiRmKvNzeaxRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-MJoVXTfpP2SNRBGCpvWrsA-1; Thu, 11 Mar 2021 03:41:25 -0500
X-MC-Unique: MJoVXTfpP2SNRBGCpvWrsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B88CC26862;
 Thu, 11 Mar 2021 08:41:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97FAF60C6E;
 Thu, 11 Mar 2021 08:41:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C7B0A180087E; Thu, 11 Mar 2021 09:41:16 +0100 (CET)
Date: Thu, 11 Mar 2021 09:41:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/4] Clean up the -usbdevice mess
Message-ID: <20210311084116.gagegk2kusap5472@sirius.home.kraxel.org>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 06:33:19PM +0100, Thomas Huth wrote:
> "-usbdevice" is still useful for some users. Thus let's clean up the
> unwanted parts and make sure that the rest is in a better shape again.
> 
> Paolo Bonzini (2):
>   usb: remove support for -usbdevice parameters
>   usb: remove '-usbdevice u2f-key'
> 
> Thomas Huth (2):
>   usb: Un-deprecate -usbdevice (except for -usbdevice audio which gets
>     removed)
>   usb: Document the missing -usbdevice options

Added to usb queue (and unqueued the obsoleted patch of course).

thanks,
  Gerd


