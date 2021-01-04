Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00C2E94A8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:19:56 +0100 (CET)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOq3-0007Uk-9g
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOoz-000723-L7
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOow-0006VU-0O
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609762722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHtlcU5LaBRMQSEyYG47KRXnt2tY54PhWgunxElnQX8=;
 b=B7zD73V0CdWrf6fQErhHRGKfmNkgjpvIgLXiMx6zTa70rpQHGp9I1bcFyDDEzSx/au1LJl
 A8kH2efOvicJBSo3L1waZrmy3fDGzpPEp7VNLy72RH7YUStmlMoKe0hRXnbP9GIACSDswu
 TMx03RBtUu/Ripm17Nk0fWgt6dNAQj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-qqAP2EbhOgeah18kcMk-dw-1; Mon, 04 Jan 2021 07:18:40 -0500
X-MC-Unique: qqAP2EbhOgeah18kcMk-dw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D505192CC44;
 Mon,  4 Jan 2021 12:18:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8BD25D9C6;
 Mon,  4 Jan 2021 12:18:38 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:18:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zihao chang <czh648639425@gmail.com>
Subject: Re: [Question] VNC CA certificate update live
Message-ID: <20210104121835.GG640208@redhat.com>
References: <-9hr4cg-d4yk46-3dd17uwyp2nz-55r6nkouccbe-md34fa5rys74-ydxc1l9fwp3o-h74zi8-5f2vsfpu8ul36vw8shpq5qlmcu1zwg-ifrvh5nktjt6z00lli1hyz8oze8hzn-oteilg-yts4god4aig3.1609160379148@email.android.com>
MIME-Version: 1.0
In-Reply-To: <-9hr4cg-d4yk46-3dd17uwyp2nz-55r6nkouccbe-md34fa5rys74-ydxc1l9fwp3o-h74zi8-5f2vsfpu8ul36vw8shpq5qlmcu1zwg-ifrvh5nktjt6z00lli1hyz8oze8hzn-oteilg-yts4god4aig3.1609160379148@email.android.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 28, 2020 at 08:59:39PM +0800, zihao chang wrote:
>    Hi all:
>    The VNC of QEMU suppots TLS encryption. The client & server can use
>    arbitrary certificates from CA certificates the running VM loaded(user can
>    use new certificates immediately), but if the CA certificate is changed to
>    a new one，the running VM still use the old CA. 
>    Is it reasonable to provide an API(e.g.QMP) to replace the CA certificate
>    for running VM live？Any security problem?

It makes sense as a concept. Just needs someone to write the code to
deal with it.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


