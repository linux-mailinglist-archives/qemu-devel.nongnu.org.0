Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0034010D482
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 12:02:31 +0100 (CET)
Received: from localhost ([::1]:57090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iae2g-0002Io-VV
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 06:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iad7t-0004up-I0
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 05:03:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iad7q-0006hd-NE
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 05:03:47 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27544
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iad7q-0006dd-Is
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 05:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575021825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IXBNm0HSp69OMqi6Tlq8zF+viFigWeD9q9ZOr8OK09s=;
 b=Nx4Gaduf0jITqELOnBDJc+UP89jDPaZyYmhQ6TLDUTJKgbvZQewBpoFewExCWaN30LviJN
 4ZOvTYE7xkVzuqJL344nWuG+++H7AYtfcnayc8Zmf+kK1W3wtcaNV3xDby8iwsg5b75xK9
 IucI9jFrqWds9ZSrfR7XXb7KCGDloeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Uhpch9PzPEi8-iiq2ij6Ig-1; Fri, 29 Nov 2019 05:03:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06BD118557C0;
 Fri, 29 Nov 2019 10:03:41 +0000 (UTC)
Received: from gondolin (ovpn-116-140.ams2.redhat.com [10.36.116.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCB5C5D6D2;
 Fri, 29 Nov 2019 10:03:36 +0000 (UTC)
Date: Fri, 29 Nov 2019 11:03:34 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v4 0/6] s390x: Cleanup
Message-ID: <20191129110334.0846206b.cohuck@redhat.com>
In-Reply-To: <20191127175046.4911-1-frankja@linux.ibm.com>
References: <20191127175046.4911-1-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Uhpch9PzPEi8-iiq2ij6Ig-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Nov 2019 12:50:40 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> Adding comments and reordering code for better readability in the
> diag308 and machine reset functions. Also making the kvm sclp function
> void and refactoring it.
> 
> v4
> 	* Added sclp cleanup
> 	* Renamed ccpu reset wrapper
> 	* Added assert to cpu reset function
> 
> Janosch Frank (6):
>   s390x: Don't do a normal reset on the initial cpu
>   s390x: Move reset normal to shared reset handler
>   s390x: Move initial reset
>   s390x: Move clear reset
>   s390x: Beautify diag308 handling
>   s390x: kvm: Make kvm_sclp_service_call void
> 
>  hw/s390x/s390-virtio-ccw.c |   3 ++
>  target/s390x/cpu-qom.h     |   9 +++-
>  target/s390x/cpu.c         | 107 ++++++++++++++-----------------------
>  target/s390x/cpu.h         |   4 +-
>  target/s390x/diag.c        |  54 +++++++++++--------
>  target/s390x/kvm.c         |  12 ++---
>  target/s390x/sigp.c        |   4 +-
>  7 files changed, 91 insertions(+), 102 deletions(-)
> 

Thanks, applied.


