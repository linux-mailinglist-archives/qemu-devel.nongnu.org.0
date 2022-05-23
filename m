Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FA53119B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:32:37 +0200 (CEST)
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntA2r-0005At-J0
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt9z7-0002Dk-DG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nt9z4-0003d9-I3
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653319716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=loD9d+RLdPf6FqmNTQT6GM59VeTiSIN5y+QF8lRXcqI=;
 b=iCP/2Wu1HK9CwYMVaq1Bjzl8EDEVcxu1Exdxf8ki9IIvuRK+291gK0gKV0Wfrv++s1jYLi
 KblaQKwq9fstBXXQMYJ89abghwXQXxoSDl2kOKNz5tyHSj1d+UmipfU/Q9IotHaJ7aZQbL
 FATsWPXnj/q1wfi1mpqdrRoiIR/v248=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-tGA2jZSdNhqcau2I5GGOdQ-1; Mon, 23 May 2022 11:28:32 -0400
X-MC-Unique: tGA2jZSdNhqcau2I5GGOdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05D99395AFE4;
 Mon, 23 May 2022 15:28:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDA5F1121319;
 Mon, 23 May 2022 15:28:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A60718000B4; Mon, 23 May 2022 17:28:30 +0200 (CEST)
Date: Mon, 23 May 2022 17:28:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geoffrey McRae <geoff@hostfission.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Windows QXL Display Driver
Message-ID: <20220523152830.3n6xnletrexmvjiq@sirius.home.kraxel.org>
References: <0c317d39fa81e000a1b7717ab4fde75d@hostfission.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c317d39fa81e000a1b7717ab4fde75d@hostfission.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Tue, May 24, 2022 at 12:35:49AM +1000, Geoffrey McRae wrote:
> Hi Gerd,
> 
> Over the past few weeks I have been adding spice display support to Looking
> Glass as a fallback mechanism for during system boot (or diags) before our
> application is loaded in the guest VM. The idea is to have the VFIO GPU
> duplicate it's output to the QXL device, which works fine until you load the
> QXL display driver.
> 
> The issue is that once the driver is loaded windows removes the option to
> duplicate the output.

Just don't load the driver then?  Or use stdvga instead?  Shouldn't make
a big difference performance-wise given that qxl supports 2d accel only
which is pretty much dead these days.

> Is this something that needs to be tweaked in the
> driver to allow this? or is there a technical reason why this can't be done?

I don't have much insight into the inner workings of the qxl windows
driver, sorry.

take care,
  Gerd


