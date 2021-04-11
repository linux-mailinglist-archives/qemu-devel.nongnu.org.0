Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502B35B297
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Apr 2021 11:20:04 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVWGA-0004mz-Pc
	for lists+qemu-devel@lfdr.de; Sun, 11 Apr 2021 05:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrozenfe@redhat.com>)
 id 1lVWFS-0004N3-5p
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 05:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vrozenfe@redhat.com>)
 id 1lVWFP-0002Yw-S2
 for qemu-devel@nongnu.org; Sun, 11 Apr 2021 05:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618132753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDyTNkqTwA1dkkT9F4Mjj3j1hv2SMFGBnBQxiiYuxl4=;
 b=iFGE5uHtGcuMDLmfKCjXA/Ogx0LUNnGkHSInTvIAtMpdpLPPD/gl1Jy/NxhZjKksZ+fT9j
 OHcBwDomyn2vPkWzCJwbefO0jilFKBQ9zr+IB6vVTH8uGXv1huoyZdpwj+EqYDbXywnFoP
 3bADeAV1Z2jN0DWBgDziu7PFMWv2xjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-w0dgxgYKObWCuPyqmgrVtA-1; Sun, 11 Apr 2021 05:19:08 -0400
X-MC-Unique: w0dgxgYKObWCuPyqmgrVtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4C38030A0;
 Sun, 11 Apr 2021 09:19:07 +0000 (UTC)
Received: from vpn2-54-20.bne.redhat.com (vpn2-54-20.bne.redhat.com
 [10.64.54.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01D9D60D01;
 Sun, 11 Apr 2021 09:19:06 +0000 (UTC)
Message-ID: <0816fe9cd366237982fa5341744ea6832cb0dc4a.camel@redhat.com>
Subject: Re: [Question] Binaries of virtio-gpu-wddm-dod?
From: Vadim Rozenfeld <vrozenfe@redhat.com>
To: Mike Ladouceur <mike.ladouceur@live.com>, qemu-devel@nongnu.org
Date: Sun, 11 Apr 2021 19:19:05 +1000
In-Reply-To: <CAHC8f_edLsS0QZhzP6HCEz_bP_pQaVrN7Kw9FBU-bwcCSLybUg@mail.gmail.com>
References: <CAHC8f_edLsS0QZhzP6HCEz_bP_pQaVrN7Kw9FBU-bwcCSLybUg@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vrozenfe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="=-sYTo8trxhvzrDC0jNla+"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vrozenfe@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-sYTo8trxhvzrDC0jNla+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-04-09 at 09:27 -0400, Mike Ladouceur wrote:
> Hi, I'm wondering where I can find binaries of virtio-gpu-wddm-dod to
> test? I tried to build but I guess I'm running too new a version of
> Windows or VS/SDK/WDK? I've seen mention of prewhql ISO's with
> binaries but there's never any links? I understand it's in
> development phase. Thanks!

Hi Mike,

I'm going to update 
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/
latest  with build 196 soon.

Best,
Vadim.

--=-sYTo8trxhvzrDC0jNla+
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Fri, 2021-04-09 at 09:27 -0400, Mike Ladouceur wrote:</div><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><div dir=3D"ltr">Hi, I'm wondering where I can find =
binaries of&nbsp;virtio-gpu-wddm-dod to test? I tried to build but I guess =
I'm running too new a version of Windows or VS/SDK/WDK? I've seen mention o=
f prewhql ISO's with binaries but there's never any links? I understand it'=
s in development phase. Thanks!</div>
</blockquote><div><br></div><div>Hi Mike,</div><div><br></div><div>I'm goin=
g to update <a href=3D"https://fedorapeople.org/groups/virt/virtio-win/dire=
ct-downloads/">https://fedorapeople.org/groups/virt/virtio-win/direct-downl=
oads/</a></div><div>latest  with build 196 soon.</div><div><br></div><div>B=
est,</div><div>Vadim.</div></body></html>

--=-sYTo8trxhvzrDC0jNla+--


