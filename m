Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECB51244F2
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 11:46:16 +0100 (CET)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihWqN-0005hK-4f
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 05:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48265)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihWpI-00059O-7N
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:45:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihWpH-0003eb-8s
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:45:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41317
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihWpH-0003bQ-3x
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 05:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576665906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=PfRYu5SFYULdTnFAlnKL0mMCnmFVx2LnQrm1ihQGRUY=;
 b=Yu5no08TLEMSOXfJ+57c8BQgMPFblkEJVKTMEBRTkQFKknwtXb/xyneQfYFZxGweXV44zN
 aapuK0BCCliNsRKd5Q2fBV3t5yTC9oGtXfT6DiRfo1i/KEKlRMNDIQC5VO5qlQq139JfMv
 B4JF8gANf3u3v+/CGk4UoZwiSBM5XZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-sdHmw58aO1CxZCazR1Tf9Q-1; Wed, 18 Dec 2019 05:45:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D1DA10054E3
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 10:45:01 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-150.ams2.redhat.com [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 661E56887F;
 Wed, 18 Dec 2019 10:45:00 +0000 (UTC)
Subject: Re: [PATCH v2 09/10] migration-test: Rename cmd_src/dst to
 arch_source/arch_target
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20191218015520.2881-1-quintela@redhat.com>
 <20191218015520.2881-10-quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <6403c007-64af-fc9f-2e5d-ef4156fe9404@redhat.com>
Date: Wed, 18 Dec 2019 11:44:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218015520.2881-10-quintela@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sdHmw58aO1CxZCazR1Tf9Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2019 02.55, Juan Quintela wrote:
> This explains better what they do and avoid confussino with
> command_src/target.

s/confussino/confusion/

Cheers,
 Thomas


