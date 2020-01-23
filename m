Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33314721D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:50:32 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiUp-0002pk-Tf
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43760)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iufj2-0001wr-3T
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iufj1-0003Tz-0g
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:52:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56094
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iufj0-0003TH-Si
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=G7RMspX811ClQYO1dlj+AbobtxRle92iuouZRMT944M=;
 b=LYKDLeaZSSaMuQG7Hmt0DkKfutyBLVaccYTrUWQcYk7An8VkvCsUJJ6C3VlZp95jl68OJY
 /E1/8Mip8+DPqmipbWWjzIf2/oVYgEg+y8vqFVqTp5II1udAqD8SjbGR270Ot1tmmcGMqI
 IwyC3vc1Ek97zMWOd8T9QQ0VFeRPh7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-JxtLTniFMrmAOtLDXjwXTw-1; Thu, 23 Jan 2020 11:52:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11DC0800D50
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:52:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A8CF85791;
 Thu, 23 Jan 2020 16:52:55 +0000 (UTC)
Subject: Re: [PATCH REPOST v3 80/80] tests:numa-test: use explicit memdev to
 specify node RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-81-git-send-email-imammedo@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <daf0c109-ee02-af82-968c-1b90362ba921@redhat.com>
Date: Thu, 23 Jan 2020 17:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-81-git-send-email-imammedo@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JxtLTniFMrmAOtLDXjwXTw-1
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
Cc: lvivier@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/01/2020 12.38, Igor Mammedov wrote:
> Follow up patches will remove automatic RAM distribution
> between nodes and will make default machine types require
> "memdev" option instead of legacy "mem" option.
> 
> Make tests to follow new rules and add an additional test
> for legacy "mem" option on old machine type, to make sure
> it won't regress in the future.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

Acked-by: Thomas Huth <thuth@redhat.com>


