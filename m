Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982162F7711
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:57:46 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MnZ-00062o-5E
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l0MmY-0005TN-0G
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l0MmV-0005rN-6S
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610708197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k84oreXqDQxgkc8IDhaPoqh8mpary6pFBFfhZKOw2Uo=;
 b=Z45JXCCFnB48Ir0UlKR2+Wmy9afTVaKOXogqjYeoQBhzCxvuNEfArmAYXBv0qAb54PLhsm
 cJXyf+r9sMJK2ANs7gW1fwujFgF/R23l1RSrZelUbuQhjWaw4ApxaIj+kWxugWgV+oy3vh
 0RZpbbrnUbR6U159t7rgTSLr7R44nq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-LBd1f_mBP4qwc38CcLqxgw-1; Fri, 15 Jan 2021 05:56:35 -0500
X-MC-Unique: LBd1f_mBP4qwc38CcLqxgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A458F100C664;
 Fri, 15 Jan 2021 10:56:34 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEE8760C6B;
 Fri, 15 Jan 2021 10:56:32 +0000 (UTC)
Date: Fri, 15 Jan 2021 11:56:29 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
Message-ID: <20210115105629.GB2794356@angien.pipo.sk>
References: <20210114234612.795621-1-imammedo@redhat.com>
 <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
 <20210115104310.GA2794356@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20210115104310.GA2794356@angien.pipo.sk>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Michal Privoznik <mprivozn@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 11:43:10 +0100, Peter Krempa wrote:
> On Fri, Jan 15, 2021 at 10:02:04 +0000, Peter Maydell wrote:
> > On Thu, 14 Jan 2021 at 23:48, Igor Mammedov <imammedo@redhat.com> wrote:

[...]

> Removing the 'x-' will fix it only starting with qemu-6.0 and any
> downstream which backports the removal of the prefix.
> 
> Obviously not using 'x-' prefixed options is strongly preferred in
> libvirt. 

For reference, here are the relevant threads on libvir-list:

v1:
https://www.redhat.com/archives/libvir-list/2021-January/msg00601.html
v2:
https://www.redhat.com/archives/libvir-list/2021-January/msg00684.html

And my objection to use 'x-' prefixed features without being guaranteed
that it's considered stable (note that the premise is that it's supposed
to fix already-released qemu versions thus not completely refusing using
the existing naming)
https://www.redhat.com/archives/libvir-list/2021-January/msg00606.html
https://www.redhat.com/archives/libvir-list/2021-January/msg00699.html


