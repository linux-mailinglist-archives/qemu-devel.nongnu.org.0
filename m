Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B21B2AED69
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:24:09 +0100 (CET)
Received: from localhost ([::1]:42902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmMJ-000687-L1
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:24:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcmLF-0005a9-2t
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcmLB-0006Ld-SD
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLj7gSvhz462vhO0GJH5gT6/7l2y8CEmbDTdtpO+m/w=;
 b=UBIV9MPRAew/Okn9+9JtdjJuoYcqx0QVkKaCZbRxsB5e3UGxXGIaF/kzi5yYTlQfU2eU6d
 kCFsFmG97go81f1zPpFFqJJMkP+oDnrgJFl7aS1boKP4A8SO7jew4pvey7v4CHgd2Aril9
 CRdlgGZoWVUNltFC0ZbTc9iUM6LjY54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-TtzW_M3PPaOex7yhlJGQfg-1; Wed, 11 Nov 2020 04:22:50 -0500
X-MC-Unique: TtzW_M3PPaOex7yhlJGQfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA1BC8049DF;
 Wed, 11 Nov 2020 09:22:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E12F227BB8;
 Wed, 11 Nov 2020 09:22:46 +0000 (UTC)
Subject: Re: [PATCH 0/3] Fix LGPL information in the file headers
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201110184223.549499-1-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6b4c64b8-b3fa-8388-c750-4a918480bf1b@redhat.com>
Date: Wed, 11 Nov 2020 10:22:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201110184223.549499-1-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, Chetan Pant <chetan4windows@gmail.com>,
 philmd@redhat.com, zhang.zhanghailiang@huawei.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2020 19.42, Gan Qixin wrote:
> Hi all,
> I saw some tasks to replace "LGPL version 2" with "LGPL version 2.1" in BiteSizedTasks. So I modified the file in the test folder that contains "LGPL version 2".

Thanks, but before you continue here ... there were already some patches for
this recently on the list, look for the "Fix Lesser GPL version number"
patch series from Chetan Pant ... I think some of them got merged already,
but some are still pending...

 Thomas


