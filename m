Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E8AF691
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:18:29 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7wtX-0002AJ-H5
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42648)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i7wch-0002i5-8m
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:01:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i7wce-0002Z9-Rb
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:01:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45578)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i7wcc-0002T4-KO
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 03:00:58 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3327FA37182;
 Wed, 11 Sep 2019 07:00:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
 [10.36.116.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB27610016EB;
 Wed, 11 Sep 2019 07:00:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D3FA345B8; Wed, 11 Sep 2019 09:00:51 +0200 (CEST)
Date: Wed, 11 Sep 2019 09:00:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>
Message-ID: <20190911070051.wbixuyqnmi6dlpmw@sirius.home.kraxel.org>
References: <cover.1567965065.git.DirtY.iCE.hu@gmail.com>
 <cfcf71fb1bd09b3a7599c77f1d31b516b2da0109.1567965065.git.DirtY.iCE.hu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfcf71fb1bd09b3a7599c77f1d31b516b2da0109.1567965065.git.DirtY.iCE.hu@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 11 Sep 2019 07:00:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 04/24] dsoundaudio: port to the new
 audio backend api
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +static void *dsound_get_buffer_in(HWVoiceIn *hw, size_t *size)
>  {

> +    int err;
> +    void *ret;
> +n
> +    hr = IDirectSoundCaptureBuffer_GetCurrentPosition(dscb, &cpos, NULL);

Huh?  Stray 'n' here.  That can hardly survived a build test ...

Removed it.  Builds now.  Continuing testing.

cheers,
  Gerd


