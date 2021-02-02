Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB3530C6A0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:54:53 +0100 (CET)
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yx2-0000ZI-Qp
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6ySi-0007fI-Rk
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6ySg-00069e-Qt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BlDnZWvrK0Zd+X3ytD/nlHlHN1cR0LzvC2x7au4OCQE=;
 b=QtgZXvm4AN7CbCxUv4akLEBDYSD3D7ABxfTE4FBDlrLWO9UWuTVZxpya66M4E1pcqvgiEz
 d2CuBOtKN20hyuLngiscDOMT7apoCJVqS/8B3XlsseTPSFmIUK6A5lgJ4wT9SPOsR6ohkN
 gHuUVM/4qJ1skXHZAfNqCAhgtJFe3pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-k8D1oXmvPSeRJDbR1UIusQ-1; Tue, 02 Feb 2021 11:23:27 -0500
X-MC-Unique: k8D1oXmvPSeRJDbR1UIusQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F46585C87F;
 Tue,  2 Feb 2021 16:23:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A49C65C5FC;
 Tue,  2 Feb 2021 16:23:20 +0000 (UTC)
Date: Tue, 2 Feb 2021 17:23:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: iotest failures in head [was: [PATCH v4 00/16] 64bit
 block-layer: part I]
Message-ID: <20210202162319.GG5184@merkur.fritz.box>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <81abe7dc-6053-72d2-ddf7-352dc21e75b6@redhat.com>
 <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9e71568c-ce4a-f844-fbd3-a4a59f850d74@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: fam@euphon.net, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.02.2021 um 17:13 hat Eric Blake geschrieben:
> On 2/1/21 8:56 PM, Eric Blake wrote:
> 
> > I had planned to send a pull request for this series today, but ran into
> > a snag.  Without this series applied, './check -qcow2' fails 030, 185,
> > and 297.
> 
> 297 appears to be fixed once Kevin's pull request lands (well, that may
> be needing a v2).  185 appears to be just a whitespace difference that
> missed fixing in 362ef77f9 and similar:
> 
> --- /home/eblake/qemu/tests/qemu-iotests/185.out
> +++ 185.out.bad
> @@ -89,7 +89,7 @@
>                        'format': 'IMGFMT',
>                        'sync': 'full',
>                        'speed': 65536,
> -                      'x-perf': { 'max-chunk': 65536 } } }
> +                      'x-perf': {'max-chunk': 65536} } }
> 
> 030 is a bit tougher to figure out.
> 
> 030   fail       [09:40:32] [09:40:48]   16.9s  (last: 15.4s) failed,
> exit status 1
> --- /home/eblake/qemu/tests/qemu-iotests/030.out
> +++ 030.out.bad
> @@ -1,5 +1,45 @@
> -...........................
> +WARNING:qemu.machine:qemu received signal 11; command:

So some qemu process segfaulted. Did you have a look at the resulting
coredump?

Kevin


