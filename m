Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C4D109979
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 08:15:23 +0100 (CET)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZV4E-0004Ek-Ms
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 02:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iZUuq-0006Wh-Dm
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 02:05:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iZUun-0007D8-0U
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 02:05:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25158
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iZUum-0007Bv-DW
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 02:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574751935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS03t7k26JxzbJCWnE0wtpzg5KasVpTZ3633HpwUGQw=;
 b=J7Ld+qUQbsD3ljh8yZyR/A8t/VwmHEf9LDFyTPal8qq6sKNwP+ev+OYt/LIks/CEi7jNQj
 bc+aBEwPonePueab/sEMSzI27uKbLqt/ZqvrcOkoqjMUa6c7CsOAwC4ys6viXEZUqjzzcx
 5uRBDaR8SXL72OEewKIsrQeycEnX/8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-EI99xznsPsqTXPhqg7vzTQ-1; Tue, 26 Nov 2019 02:05:34 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6977B800D4C;
 Tue, 26 Nov 2019 07:05:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-166.ams2.redhat.com [10.36.116.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8CC5C219;
 Tue, 26 Nov 2019 07:05:32 +0000 (UTC)
Subject: Re: [QUESTION] What is the best license option for new files
 introduced in QEMU?
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAL1e-=gmaimCBh5NBBYFp6Z1ci4ZheQtXpyjU9Uexqi4zSHh2A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Organization: Red Hat
Message-ID: <75666793-6933-d26d-1519-c88eb5e33670@redhat.com>
Date: Tue, 26 Nov 2019 08:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAL1e-=gmaimCBh5NBBYFp6Z1ci4ZheQtXpyjU9Uexqi4zSHh2A@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: EI99xznsPsqTXPhqg7vzTQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/2019 18.49, Aleksandar Markovic wrote:
> I read LICENSE file, but I read also recent contributions, and it is
> not clear to me what version of GPL is best/recommended for new file
> just being introduced to QEMU:
> 
> * GPL 2.0
> * GPL 2.0 (or later at your option)
> * GPL 2.1
> * GPL 2.1 (or later at your option)
> 
> or something else. (The rest od wording of license preamble is clear
> to me.) Please somebody explsin snd clarify.

There is no GPL v2.1, you likely mixed that up with LGPL v2.1

For new files, you've got to choose a license that is compatible with 
GPL v2.0 (or later at your option). So LGPL v2.1 is fine, too.

  Thomas


