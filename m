Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3A71FEADA
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 07:22:17 +0200 (CEST)
Received: from localhost ([::1]:58514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jln0C-0007PO-L1
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 01:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlmzI-0006UN-UX
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 01:21:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43777
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlmzG-0003Tr-Ec
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 01:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592457676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=XzVF4eHUeHeV8A7xBkhMxP+XLtltJuwIr/RICrmDo78=;
 b=f+XPry0YKSUoOjxHQ38MXY3TvyqkurDX3Ldxs+iz3VhXI28gTyZXZT73gbXZjz7jSt68AC
 Wqv+1fj4Imz4tlGY1rNTNwTDSrs7TDfibuAECyE+jqfyKgulhgmCyf1Y/e9/5fwtma1XDu
 cGtIEZjvM7hBNT/TGIhDC9eSM3O8hkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-0ISOlBBlPoilWdkoyaSxxg-1; Thu, 18 Jun 2020 01:21:04 -0400
X-MC-Unique: 0ISOlBBlPoilWdkoyaSxxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 813CC108BD0A;
 Thu, 18 Jun 2020 05:21:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 963F45EE0E;
 Thu, 18 Jun 2020 05:20:59 +0000 (UTC)
Subject: Re: Query Regarding Contribution
To: khyati agarwal <agarwal.khyati5@gmail.com>, qemu-devel@nongnu.org
References: <CAJ70gCNkiiOzVsDsZgOJ2k6mOvT2aBX_4QcC8cc=Pu9Dqtzwog@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f100cc5e-4dda-d466-ba52-db9f82eebf08@redhat.com>
Date: Thu, 18 Jun 2020 07:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJ70gCNkiiOzVsDsZgOJ2k6mOvT2aBX_4QcC8cc=Pu9Dqtzwog@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/06/2020 20.25, khyati agarwal wrote:
> Respected ,
> I am Khyati Agarwal, second-year undergraduate in CSE, IIT, Mandi,
> India. I have good knowledge of git, Python, C/C++, php, machine
> learning and databases like mongodb, mysql. I'm interested in
> contributing to QEMU. I have worked with nlp, tensorflow, keras, etc on
> ML projects. I am also looking forward to the next Outreachy round.
> Could you please guide me on how to start expressing and contributing ?

 Hi,

thanks for your interest in contributing to QEMU! If you haven't seen it
yet, please read our guide for submitting patches first:

 https://wiki.qemu.org/Contribute/SubmitAPatch

And if you're looking for ideas for a patch, have a look at our list here:

 https://wiki.qemu.org/Contribute/BiteSizedTasks

If you have questions, don't hesistate to ask!

 Thomas


