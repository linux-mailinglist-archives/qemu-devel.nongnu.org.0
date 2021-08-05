Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE943E0EF8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:13:21 +0200 (CEST)
Received: from localhost ([::1]:40524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXZA-0005yi-UX
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBXYA-0004pZ-VT
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:12:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBXY9-00055F-Hw
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 03:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628147537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fy8O1M6kBiaQN7uOWnSGD2hLfvxZRvDlVzCC13w2uXI=;
 b=Xr8oftY3vIn9phRVnUrk2iWTMQ69Ej3/q26lIUigOm+yHSmpS+Uu0PSk3w4/o04pGwEyOu
 EOzIn3NT/BrmlU8TtN6C3hHVaRynKWH0MiHDGzk5V6gYJtD+LF+/24IP32N7QgCQb7xLJA
 9dvtx9ZJq7+ScB/aRHAQpPwoiVzGHCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-h_vDu8BrPwqzk0EeAKNS4g-1; Thu, 05 Aug 2021 03:12:14 -0400
X-MC-Unique: h_vDu8BrPwqzk0EeAKNS4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E171008063;
 Thu,  5 Aug 2021 07:12:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B1FA1000324;
 Thu,  5 Aug 2021 07:11:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C262818000B4; Thu,  5 Aug 2021 09:11:55 +0200 (CEST)
Date: Thu, 5 Aug 2021 09:11:55 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/7] floppy: build as modules.
Message-ID: <20210805071155.pkvs4fjjdlx3juoo@sirius.home.kraxel.org>
References: <20210804142737.3366441-1-kraxel@redhat.com>
 <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
MIME-Version: 1.0
In-Reply-To: <477961d5-576b-a588-9cea-dad796c592d2@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 05:19:02PM +0200, Philippe Mathieu-Daudé wrote:
> +Mark
> 
> On 8/4/21 4:27 PM, Gerd Hoffmann wrote:
> > Some code shuffling needed beforehand due to floppy being part of
> > several platforms.  While being at it also make floppy optional
> > in pc machine type.
> 
> >   floppy: move fdctrl_init_sysbus
> >   floppy: move sun4m_fdctrl_init
> 
> https://www.mail-archive.com/qemu-block@nongnu.org/msg84008.html
> 
> Mark suggested:
> 
>   You may be able to simplify this further by removing the
>   global legacy init functions fdctrl_init_sysbus() and
>   sun4m_fdctrl_init(): from what I can see fdctrl_init_sysbus()
>   is only used in hw/mips/jazz.c and sun4m_fdctrl_init() is only
>   used in hw/sparc/sun4m.c so you might as well inline them or
>   move the functions to the relevant files.
> 
> I did it and plan to send during 6.2. Sounds simpler than module.
> You could easily rebase your series on top (or I can include your
> patches while sending).

Feel free to include them.  But I can also rebase when your patches
landed upstream.  Your choice ;)

take care,
  Gerd


