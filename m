Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBF18A0C4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 17:43:19 +0100 (CET)
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEbmm-00025G-QH
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 12:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jEblv-0001dw-JL
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:42:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jEblu-0003Ha-OF
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:42:23 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:54065)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jEblu-0003H8-LN
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 12:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584549742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzeMD5uJIwVP8KZoOHZrYXi/SGg5VOyA8M/pnX7OjdM=;
 b=cL4UQ190EZ3z+SplSllXRZ1v4uKWVB1DC0rPWK7ZncdSumnvn1y42RapOwDNtO+bfMsBry
 Tjm4SamHaypiYUmoTr9GUhZnBYgSGjJ5gmfZr9oYqGrQAdaDPj6fX7XoOMPAP6yx0I6EER
 M2zeLQcEH4ADhumZTl6vP4ta4b528bA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-WLfL-AjjO82YLCRj2hDJEQ-1; Wed, 18 Mar 2020 12:42:18 -0400
X-MC-Unique: WLfL-AjjO82YLCRj2hDJEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B012107ACCA;
 Wed, 18 Mar 2020 16:42:17 +0000 (UTC)
Received: from gondolin (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 210EB60BEC;
 Wed, 18 Mar 2020 16:42:10 +0000 (UTC)
Date: Wed, 18 Mar 2020 17:42:01 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v10 01/16] s390x: Move diagnose 308 subcodes and rcs
 into ipl.h
Message-ID: <20200318174201.7eab0e17.cohuck@redhat.com>
In-Reply-To: <20200318143047.2335-2-frankja@linux.ibm.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
 <20200318143047.2335-2-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Mar 2020 10:30:32 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> They are part of the IPL process, so let's put them into the ipl
> header.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  hw/s390x/ipl.h      | 11 +++++++++++
>  target/s390x/diag.c | 11 -----------
>  2 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


