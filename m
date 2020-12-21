Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7F62DFC23
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:02:06 +0100 (CET)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKpB-0008MW-Ia
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krKnW-0007Lp-Pz
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krKnQ-0004dI-TQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608555615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=suEYwfPWdaLWupUno6rJ+RD5ZVoFDeIY3jROtzij/I4=;
 b=QqOUEz5IHS+0CLke5+B1sqvuDGqONLLzMLs9tVwmAtwIL+9O9Oanncy7mkiQVAPYoVmSLR
 ipdhjmUdjZC6q+WHufTmE3DJn+EKiYt2EUynPdFqP25V4DhAPRihA41eU2InMXzolx+mXE
 v53WS33yTo+oVXIU6QngjfXj2C5ZTVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-2jckLrQpPaeJwQhhMERhHg-1; Mon, 21 Dec 2020 08:00:14 -0500
X-MC-Unique: 2jckLrQpPaeJwQhhMERhHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137CF10054FF;
 Mon, 21 Dec 2020 13:00:13 +0000 (UTC)
Received: from gondolin (ovpn-113-49.ams2.redhat.com [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C74B19C44;
 Mon, 21 Dec 2020 12:59:58 +0000 (UTC)
Date: Mon, 21 Dec 2020 13:59:55 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Willian Rampazzo <wrampazz@redhat.com>
Subject: Re: [PATCH v2] tests/acceptance: Add a test with the Fedora 31
 kernel and initrd
Message-ID: <20201221135955.69b0b182.cohuck@redhat.com>
In-Reply-To: <d341b59d-17bb-a159-0bbd-e53e2dab9f65@redhat.com>
References: <20201217085334.211772-1-thuth@redhat.com>
 <d341b59d-17bb-a159-0bbd-e53e2dab9f65@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Dec 2020 15:23:32 -0300
Willian Rampazzo <wrampazz@redhat.com> wrote:

> On 12/17/20 5:53 AM, Thomas Huth wrote:

> > +        # Hot-plug a virtio-crypto device and see whether it gets accepted
> > +        self.clear_guest_dmesg()  
> 
> Your previous patch "[PATCH 1/3] tests/acceptance: Extract the code to 
> clear dmesg and wait for CRW reports" defined the method as 
> "clear_guests_dmesg". After fixing this in the code:

Hm, I see clear_guest_dmesg in the code I have on my s390-next branch?

> 
> Tested-by: Willian Rampazzo <willianr@redhat.com>
> 
> > +        self.vm.command('object-add', qom_type='cryptodev-backend-builtin',
> > +                        id='cbe0')
> > +        self.vm.command('device_add', driver='virtio-crypto-ccw', id='crypdev0',
> > +                        cryptodev='cbe0')
> > +        exec_command_and_wait_for_pattern(self,
> > +                        'while ! (dmesg -c | grep Accelerator.device) ; do'
> > +                        ' sleep 1 ; done', 'Accelerator device is ready')
> > +        self.vm.command('device_del', id='crypdev0')
> > +        self.vm.command('object-del', id='cbe0')
> > +        exec_command_and_wait_for_pattern(self,
> > +                        'while ! (dmesg -c | grep Start.virtcrypto_remove) ; do'
> > +                        ' sleep 1 ; done', 'Start virtcrypto_remove.')
> >   
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 


