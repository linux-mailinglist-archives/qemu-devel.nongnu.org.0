Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE6E2F76E6
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:44:34 +0100 (CET)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Man-0002X4-Bp
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l0MZi-00026s-0y
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:43:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l0MZd-0007tr-Hu
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610707399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8nIT9RxP5hozqX55lfuhf2braxQWNddqA8JFV1yPA0o=;
 b=hS01Zw74yz0wFbFWbYj3ppFdmFXZEdH+rlHmVzwlgqS699KHLsUCXCsOluqVhALV2FA4lp
 5SrO5go3jdd204FNuDKdFK9FG+7kd/yN/sz3JsKcqtFnhGFFkkmFec2PMjXBkb4yHF/Nu6
 dwc32UNEO6JUKrJ7/jkXbveemqn35fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-yf7Ckd5SPxSyrP6g5A7sLQ-1; Fri, 15 Jan 2021 05:43:18 -0500
X-MC-Unique: yf7Ckd5SPxSyrP6g5A7sLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9EAA806664;
 Fri, 15 Jan 2021 10:43:16 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 506E671D5E;
 Fri, 15 Jan 2021 10:43:15 +0000 (UTC)
Date: Fri, 15 Jan 2021 11:43:10 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] machine: add missing doc for memory-backend option
Message-ID: <20210115104310.GA2794356@angien.pipo.sk>
References: <20210114234612.795621-1-imammedo@redhat.com>
 <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA843rP6rvktc0FSZEjK8C9E8h_5_PbCBUXYM4XJRE7KHQ@mail.gmail.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 10:02:04 +0000, Peter Maydell wrote:
> On Thu, 14 Jan 2021 at 23:48, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > Add documentation for '-machine memory-backend' CLI option and
> > how to use it.
> >
> > And document that x-use-canonical-path-for-ramblock-id,
> > is considered to be stable to make sure it won't go away by accident.
> 
> That's not what the x- prefix is supposed to mean.

This is the exact reason I was asking on behalf of the libvirt team for
adding such statement if we were to use it. We want guarantee that it's
considered stable since without that it will not be accepted into
libvirt.

> If we have an internal constraint that we mustn't delete
> the option in order to support some other must-be-stable
> interface (eg migration of some machines) we can document
> that in a comment, but that doesn't mean that we should
> document to users that direct use of an x-prefix option
> is supported as a stable interface.

AFAIK the issue is that with the new approach to configure system memory
(via a memory-backend=id, since the old one was deprecated) migration
fails from/to older qemus ...

> Alternatively, if the option is really stable for direct
> use by users then we should commit to making it so by
> removing the x-.

... thus the idea behind keeping this interface as is is it also fixes
the migration compatibility for qemu 5.0/5.1/5.2 which were already
released.

Removing the 'x-' will fix it only starting with qemu-6.0 and any
downstream which backports the removal of the prefix.

Obviously not using 'x-' prefixed options is strongly preferred in
libvirt. 


