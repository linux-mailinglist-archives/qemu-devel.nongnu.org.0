Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5518A3DB4F8
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 10:18:15 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Nig-0007uq-Dh
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 04:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m9NhZ-0007Dr-M0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m9NhW-0001tH-Ba
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627633020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yuHh2G8m61zl3SFHl0CXftseLo4Vdyu2H/skIm40zIQ=;
 b=GGewt1Cs6yZtnEibB7CLNlp4LPTDDdRGKvYfpwAHLad7VTo+VS1yQZFm9ePOcxi8rCwcug
 rdCsFWqD2PI5VEKuWaQoaSeSS2DRuUnnUqh042B0k2ZmKajeoIvZLbEzPYANFawBo8eYD8
 2eElkALqcLa7kDA9gn039IdNqCB/nNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-kESKAXDbMTmqhrBohsCJ8Q-1; Fri, 30 Jul 2021 04:16:58 -0400
X-MC-Unique: kESKAXDbMTmqhrBohsCJ8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4312800D55
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:16:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8379410631CC;
 Fri, 30 Jul 2021 08:16:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A48311380A0; Fri, 30 Jul 2021 10:16:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
Date: Fri, 30 Jul 2021 10:16:55 +0200
In-Reply-To: <20210729175554.686474-7-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Thu, 29 Jul 2021 13:55:50 -0400")
Message-ID: <87eebg43ns.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> When there's no specific class struct used for a QOM type, we
> normally don't define a typedef for it.  Remove the typedef from
> the minimal example, as it is unnecessary.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index 05d045bf570..dee60a64c0a 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -20,9 +20,6 @@ features:
>  
>     #define TYPE_MY_DEVICE "my-device"
>  
> -   // No new virtual functions: we can reuse the typedef for the
> -   // superclass.
> -   typedef DeviceClass MyDeviceClass;
>     typedef struct MyDevice
>     {
>         DeviceState parent;

Documenting existing practice makes sense, but I'm not sure the existing
practice to elide this typedef makes sense.


