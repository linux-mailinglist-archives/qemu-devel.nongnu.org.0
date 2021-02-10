Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7273D3169E8
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:17:03 +0100 (CET)
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rEk-0007QY-2W
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l9rD5-0006i2-Bp
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:15:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1l9rD2-0002kj-Fi
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612970113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dltgvfFPdZQcvsTGsv0GNDmx0ZIQAC2Ok//fX5xk0Bc=;
 b=IYjiZPAaqPl23LL9Nf+eKFobmxjTmo7oiYT1nApQHPEp1op+UaYlM59uhJuv2ZtSCu91uj
 jVN4TTvpvH9/2UOHWXbJlOKfiOIEKl0Za4qZ1oqbliWyAQW1aRDZGREb+RafSdEAVQhlPS
 vfMPglCTP6E9Gyt3x2SKUS0x0XXc7lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-aMXTG7UMNhuKYPVA7eEnmw-1; Wed, 10 Feb 2021 10:15:11 -0500
X-MC-Unique: aMXTG7UMNhuKYPVA7eEnmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E66F11005501;
 Wed, 10 Feb 2021 15:15:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD20D10013D7;
 Wed, 10 Feb 2021 15:15:09 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 791E14E58E;
 Wed, 10 Feb 2021 15:15:09 +0000 (UTC)
Date: Wed, 10 Feb 2021 10:15:09 -0500 (EST)
From: Cleber Rosa <crosa@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <1935839985.36186507.1612970109135.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAJSP0QW7WqH1mmni84nn+id63nHLDNXd_nUDRaXKEifa2Jp=sQ@mail.gmail.com>
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
 <CAJSP0QW7WqH1mmni84nn+id63nHLDNXd_nUDRaXKEifa2Jp=sQ@mail.gmail.com>
Subject: Re: QEMU hosting
MIME-Version: 1.0
X-Originating-IP: [10.10.116.89, 10.4.195.1]
Thread-Topic: QEMU hosting
Thread-Index: u8GtoNCVGAVPAjt/lKqmdiKN4fFoyg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Fosshost <admin@fosshost.org>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <cleber@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Stefan Hajnoczi" <stefanha@gmail.com>
> To: "Fosshost" <admin@fosshost.org>
> Cc: "qemu-devel" <qemu-devel@nongnu.org>, "Cleber Rosa" <cleber@redhat.com>
> Sent: Wednesday, February 10, 2021 9:28:29 AM
> Subject: Re: QEMU hosting
> 
> On Tue, Jan 5, 2021 at 6:55 PM Fosshost <admin@fosshost.org> wrote:
> 
> > If you would like to apply, you can do so at https://fosshost.org/apply
> >

Hi Stefan,

I've made an application for one x86 virtual machine on behalf of the QEMU
project.  It's not clear to me if the VMs, in addition to being powered by
KVM according to the docs, if they offer (nested) KVM.

That would be an improvement from what we get from the GitLab shared runners.

Thomas,

Would you be able to tell if nested KVM is available for the x86 VMs?

Thanks,
- Cleber.

> > Feel free to join our IRC channel on freenode #fosshost if you have any
> > questions regarding our work and service
> 
> Hi Thomas,
> Thanks for the reply! I have forwarded the information to Cleber Rosa,
> who is working on QEMU's CI system.
> 
> Stefan
> 
> 


