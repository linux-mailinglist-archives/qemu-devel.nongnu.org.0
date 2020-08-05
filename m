Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB423C9CA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 12:11:46 +0200 (CEST)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3GOf-0003GX-Bq
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 06:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3GMA-0000VI-Qr
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:09:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47165
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3GM8-0001NT-TS
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 06:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596622148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=owIIgW76pNzQpJdG7wD1/IysGWIzVM2HXD2xJXbP2ww=;
 b=Btj33DsoNQY9r6l5E9LU85Fb2Z+gtQ3HeqgfCxfsgTCEOtV0Aca8gRuO7C8v42MZ1OfVRr
 pk7TvpCjWjst9sTHfFpjYvwbUxBfE2j7rLzlPdIDV8H2ITwGLgS0cMI5jR0RBcTOCSMUQG
 oSMDlAFsMIOSs4iZwbAcLO1GPIz5G68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-0WC4j0ROPh2Ht-qfDbmgtg-1; Wed, 05 Aug 2020 06:09:06 -0400
X-MC-Unique: 0WC4j0ROPh2Ht-qfDbmgtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0515757;
 Wed,  5 Aug 2020 10:09:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-142.ams2.redhat.com [10.36.112.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B6C60BF3;
 Wed,  5 Aug 2020 10:09:01 +0000 (UTC)
Subject: Re: [PATCH for-5.2 6/6] pc-bios/s390-ccw: Allow booting in case the
 first virtio-blk disk is bad
To: Cornelia Huck <cohuck@redhat.com>
References: <20200728183734.7838-1-thuth@redhat.com>
 <20200728183734.7838-7-thuth@redhat.com>
 <20200805120418.072042c8.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7810397f-4199-ffab-1bc2-9b7513133aff@redhat.com>
Date: Wed, 5 Aug 2020 12:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200805120418.072042c8.cohuck@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 00:45:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Collin Walling <walling@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2020 12.04, Cornelia Huck wrote:
> On Tue, 28 Jul 2020 20:37:34 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> If you try to boot with two virtio-blk disks (without bootindex), and
>> only the second one is bootable, the s390-ccw bios currently stops at
>> the first disk and does not continue booting from the second one. This
>> is annoying - and all other major QEMU firmwares succeed to boot from
>> the second disk in this case, so we should do the same in the s390-ccw
>> bios, too.
> 
> Does it make sense to do something like that for other device types as
> well?

It would be nice if we could do the same for virtio-scsi disks, but the
code is written in a way here that it will need much more thinking,
cleanups and time to get this done right...

 Thomas


