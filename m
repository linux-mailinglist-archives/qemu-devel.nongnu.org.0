Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B099207174
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 12:47:05 +0200 (CEST)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo2vo-0003TK-GO
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 06:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jo2tB-0000Fj-J2
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:44:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49268
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jo2t8-0007Hk-Pg
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 06:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592995456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tum7sPWxceGYikL602YBYIsjONxZUeJwF1Ja9jLV6wo=;
 b=SGj2tmvoC3Lqx0zxFHZavo4MMzF4X7+i4lOFs3gU7B3pI96ifTpeMXlqDtoIlzpb1jcBtu
 6yEzvl8ODpaRwErgeOuzUfwgpWchFaWjNqCnuSt8002vh54JKD/cHj1r5g/5Siw4qXbxlK
 Mkz7+G4ExlqOO+7ANmW945PM1R0hRp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-PeWS8_1yOOaS1TRQM6Biag-1; Wed, 24 Jun 2020 06:44:14 -0400
X-MC-Unique: PeWS8_1yOOaS1TRQM6Biag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7C7687950B;
 Wed, 24 Jun 2020 10:44:12 +0000 (UTC)
Received: from gondolin (ovpn-113-3.ams2.redhat.com [10.36.113.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D75E7403F;
 Wed, 24 Jun 2020 10:44:08 +0000 (UTC)
Date: Wed, 24 Jun 2020 12:44:06 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v5 00/12] pc-bios: s390x: Cleanup part 1
Message-ID: <20200624124406.2baac59f.cohuck@redhat.com>
In-Reply-To: <20200624075226.92728-1-frankja@linux.ibm.com>
References: <20200624075226.92728-1-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Jun 2020 03:52:14 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> The bios is in dire need for a cleanup as there are still a lot of
> magic constants being used throughout as well as duplicated code.
> 
> In the first part of this series we consolidate constants and
> functions, as well as doing some minor cleanups and fixes.
> 
> The patches are available here:
> https://github.com/frankjaa/qemu/pull/new/cleanup_bios
> 
> v5:
> 	* Fixed whitespace damage
> 	* Removed reset PSW mask changes in dasd-ipl.c
> 	* Added jump2ipl.c cleanup patches
> 
> v4:
> 	* Renamed time.h to s390-time.h
> 	* Fixed function names in sleep()
> 	* Changed order of sense_id_ccw initialization
> 	* Added missing include before sleep()
> 
> v3:
> 	* Dropped 0x00 to 0x0/0 patch
> 	* Moved some timing functions into helper.h instead of time.h
> 	* Fixed IPL psw manipulation in dasd-ipl.c
>  	* Minor cosmetic fixes found by review
> 
> v2:
> 	* Included cio fixup to get rid of compile errors...
> 	* Minor cosmetic fixes found by review
> 
> 
> Janosch Frank (12):
>   pc-bios: s390x: cio.c cleanup and compile fix
>   pc-bios: s390x: Consolidate timing functions into time.h
>   pc-bios: s390x: Move sleep and yield to helper.h
>   pc-bios: s390x: Get rid of magic offsets into the lowcore
>   pc-bios: s390x: Remove unneeded dasd-ipl.c reset psw mask changes
>   pc-bios: s390x: Rename PSW_MASK_ZMODE to PSW_MASK_64
>   pc-bios: s390x: Use PSW masks where possible and introduce
>     PSW_MASK_SHORT_ADDR
>   pc-bios: s390x: Move panic() into header and add infinite loop
>   pc-bios: s390x: Use ebcdic2ascii table
>   pc-bios: s390x: Make u32 ptr check explicit
>   pc-bios: s390x: Fix bootmap.c passing PSWs as addresses
>   pc-bios: s390x: Cleanup jump to ipl code
> 
>  pc-bios/s390-ccw/bootmap.c     |  9 ++++----
>  pc-bios/s390-ccw/bootmap.h     |  2 +-
>  pc-bios/s390-ccw/cio.c         | 40 +++++++++++++++++++---------------
>  pc-bios/s390-ccw/cio.h         | 17 ++++++++++-----
>  pc-bios/s390-ccw/dasd-ipl.c    |  3 ---
>  pc-bios/s390-ccw/helper.h      | 19 +++++++++++++++-
>  pc-bios/s390-ccw/jump2ipl.c    | 35 ++++++++++++-----------------
>  pc-bios/s390-ccw/main.c        | 15 +++----------
>  pc-bios/s390-ccw/menu.c        |  1 +
>  pc-bios/s390-ccw/netmain.c     | 23 +++----------------
>  pc-bios/s390-ccw/s390-arch.h   |  4 +++-
>  pc-bios/s390-ccw/s390-ccw.h    | 27 ++++++-----------------
>  pc-bios/s390-ccw/s390-time.h   | 23 +++++++++++++++++++
>  pc-bios/s390-ccw/start.S       |  5 +++--
>  pc-bios/s390-ccw/virtio-net.c  |  2 ++
>  pc-bios/s390-ccw/virtio-scsi.c |  2 ++
>  pc-bios/s390-ccw/virtio.c      | 18 +++------------
>  17 files changed, 120 insertions(+), 125 deletions(-)
>  create mode 100644 pc-bios/s390-ccw/s390-time.h
> 

Hm... what's the general status of this? Most of the patches have at
least one R-b/A-b already, I see.

Do the s390-ccw boot maintainers want to pick this (once the rest has
been looked at) and then send me a pull req, or should I pick it when
it is good to go? Softfreeze is less than two weeks away :)


