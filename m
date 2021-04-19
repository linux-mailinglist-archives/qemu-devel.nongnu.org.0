Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5D3641AC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 14:29:17 +0200 (CEST)
Received: from localhost ([::1]:56354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYT1g-0004mp-8W
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 08:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lYT00-0004KN-5o
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:27:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lYSzw-0000av-FD
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618835247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxZ9NiM6/wuS6fXBpgVtJfS/258XO3FgDAzJBjMUX2M=;
 b=BH4rtaHHm+j9v+X5j8a7ehMbb7BQfGLRobhnra5lnnKUbw/5VhM/WjV/FuDmnTgtjTc6BN
 sKoR2SPQqHLr+g8xd7u2/H7AxjR5JK3W5WVVlgUVmdI/768RrU4PnDHAElmpnMCh2Bg/O1
 ws0e+bztjq0OqFerMhm9dDZYuhkp0/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-Ql_b3zF2Px6W5yK2zqQgJw-1; Mon, 19 Apr 2021 08:27:23 -0400
X-MC-Unique: Ql_b3zF2Px6W5yK2zqQgJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B8F87DAC3;
 Mon, 19 Apr 2021 12:27:22 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC5F5D9C0;
 Mon, 19 Apr 2021 12:27:20 +0000 (UTC)
Date: Mon, 19 Apr 2021 14:27:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ed Davison <1923497@bugs.launchpad.net>
Subject: Re: [Bug 1923497] Re: bios_linker_loader_add_checksum: Assertion
 `start_offset < file->blob->len' failed
Message-ID: <20210419142719.226ddb77@redhat.com>
In-Reply-To: <161842923676.15588.10923516048871617719.malone@chaenomeles.canonical.com>
References: <161825934506.9582.2393035423485633300.malonedeb@chaenomeles.canonical.com>
 <161842923676.15588.10923516048871617719.malone@chaenomeles.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 19:40:36 -0000
Ed Davison <1923497@bugs.launchpad.net> wrote:

> The patch may be a bit beyond me at the moment as I use a package to
> install this and would have to figure out how to download source, get it
> configure, patched and compiled.  Whew!  Maybe ...
> 
> But here is my XML config file.
> 
> ** Attachment added: "domain xml file"
>    https://bugs.launchpad.net/qemu/+bug/1923497/+attachment/5487970/+files/win10-virt-domain.xml
> 

I don't see anything in this config that could trigger the assert.
(RAM size is 2Kb off 4Gb, but that's probably not the issue)

Can you provide a stack trace, it should help to find out
which path triggers assert.


