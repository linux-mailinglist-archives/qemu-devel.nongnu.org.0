Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C8147990
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 09:44:55 +0100 (CET)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuuaF-0005dQ-13
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 03:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iuuZY-0005ET-58
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 03:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iuuZX-0004BM-8M
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 03:44:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37046
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iuuZX-0004B9-4Z
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 03:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579855450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Z2U9067aIfcNx4R/qBys+r+vsmlmMB+Zj0AXOphKBOQ=;
 b=YdIYUWjqG2Zm98kwknat8B+ElRxAS6fbNB3/ftYeIBjjq2cwLswGvqP/X7D2EBvb2P4aWC
 tx0SpYGnZD8VmU6Q4ARUwA4yRVwebi22xxeJ+q6SfJFvIU0TnBG1yzqrWZWcCsG0Qfxg3l
 l97zzOMjL5m5epeJNE3wvEYl+8xCwhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-aXXMENSyNNWJ8PXSf9yaXw-1; Fri, 24 Jan 2020 03:44:06 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F009018FF661;
 Fri, 24 Jan 2020 08:44:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 432F260BF3;
 Fri, 24 Jan 2020 08:44:05 +0000 (UTC)
Subject: Re: [PATCH 1/5] target/s390x: Move struct DisasFields definition
 earlier
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200123232248.1800-1-richard.henderson@linaro.org>
 <20200123232248.1800-2-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f9104448-2013-a874-3299-0cb7344bf5e4@redhat.com>
Date: Fri, 24 Jan 2020 09:44:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200123232248.1800-2-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: aXXMENSyNNWJ8PXSf9yaXw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/01/2020 00.22, Richard Henderson wrote:
> We will want to include the struct in DisasContext.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/translate.c | 164 ++++++++++++++++++++-------------------
>  1 file changed, 83 insertions(+), 81 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


