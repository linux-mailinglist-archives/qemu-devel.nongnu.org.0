Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A179B3064F0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 21:19:33 +0100 (CET)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rHo-0008Hp-P4
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 15:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4rGw-0007r7-6L
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:18:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4rGu-0001b1-1X
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611778714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3zwjOG+tRC7TxZSYSwG21HhHcFl5gkGV8dOowLpcFs=;
 b=KCWDZYTPjxTC9FWQCZGuqMTDo32z+zMnDsvyLfI34Bs1TqeEjR31ecgcNac6ravw2Y/r3W
 emdlQUNS7OV/FhkeIh8mWnKEx5vUcfkM99XFVNL7Hu7QgiXyJO8mYOYiI9mwEA6uST6K23
 n0WTTh5E5T7WhqD6D011HiJcJTA02Ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-aoBN9Pm4Oa28dwzPxav3Zg-1; Wed, 27 Jan 2021 15:18:32 -0500
X-MC-Unique: aoBN9Pm4Oa28dwzPxav3Zg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6198E1005513;
 Wed, 27 Jan 2021 20:18:31 +0000 (UTC)
Received: from localhost (unknown [10.40.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A78360864;
 Wed, 27 Jan 2021 20:18:26 +0000 (UTC)
Date: Wed, 27 Jan 2021 21:18:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ben Widawsky <ben@bwidawsk.net>
Subject: Re: Handling multiple inheritance [for CXL]
Message-ID: <20210127211824.4d64b45d@redhat.com>
In-Reply-To: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
References: <20210126213013.6v24im4sler3q3am@mail.bwidawsk.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 13:33:52 -0800
Ben Widawsky <ben@bwidawsk.net> wrote:

> I'm working on CXL 2.0 type 3 memory devices [1]. In short, these are PCIe devices
> that have persistent memory on them. As such, it would be nice to inherit from
> both a PCI_DEVICE class as well as an NVDIMM device class.
> 
> Truth be told, using TYPE_MEMORY_DEVICE as the interface does provide most of
> what I need.
could you be more specific on what you need from it?

>I'm wondering what the best way to handle this is. Currently, the
> only thing NVDIMM class provides is write/read_label_data, this is driven by
> _DSM. For CXL, the mechanism to read/write the equivalent area is not done via
> _DSM, but done directly via a mailbox interface. However, the intent is the
> same, and so utilizing similar code seems ideal.
> 
> If there's a desire to unify these code paths, I'd need something like multiple
> inheritance. I'm looking for some feedback here on how to do it.
> 
> Thanks.
> Ben
> 
> [1]: https://lore.kernel.org/qemu-devel/20210105165323.783725-1-ben.widawsky@intel.com/
> 


