Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F9715E2D2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 17:25:28 +0100 (CET)
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2dmR-0003q8-Ti
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 11:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1j2dlR-0002x3-Hu
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:24:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1j2dlP-0007da-Cx
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:24:25 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56909
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1j2dlP-0007b9-99
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581697462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjof82zXOz+QH1ZXX9yiowgDiKGt7uhIzjJlX4SlWAI=;
 b=F+upu12rcuLtiCgbDBfgezYwGzSsAK/ZZ//dMysgNz3dQsvqwHFuxSd6pBOqjtmA6U5vg3
 BLHUN7O2v40f201nSPGbK73S+xedxaSy8HnGl01xqvTHG0wNg9s3+Lk0btjVqWIxgS1Or+
 rL+vTc2iYiHhjEutl19ZoOrlbZRWSOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-DsuoXC8xN_mR4r2vkdJeDQ-1; Fri, 14 Feb 2020 11:24:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A50D718A5500;
 Fri, 14 Feb 2020 16:24:15 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-153.ams2.redhat.com
 [10.36.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A544C60BF1;
 Fri, 14 Feb 2020 16:24:11 +0000 (UTC)
Subject: Re: How do UEFI on Windows host
To: Jerry Geis <jerry.geis@gmail.com>
References: <CABr8-B4_mEkOkodKVVe=U_eiMemWictNSQj4T5R6nEynVXCEGw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <58491266-962f-4c4f-9a51-829ec30f008b@redhat.com>
Date: Fri, 14 Feb 2020 17:24:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABr8-B4_mEkOkodKVVe=U_eiMemWictNSQj4T5R6nEynVXCEGw@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DsuoXC8xN_mR4r2vkdJeDQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/20 21:23, Jerry Geis wrote:
> How do I start a UEFI install (centos 8) for UEFI with 4.2.0 on Windows
> host ???
> I can do a regular install just fine. I desire to do UEFI install.

What is the list of files contained in the qemu-on-windows installer? I
looked for a manifest at <https://qemu.weilnetz.de/w64/>, but couldn't
find any.

Thanks
Laszlo


