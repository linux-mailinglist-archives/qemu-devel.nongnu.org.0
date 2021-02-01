Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C0730B31D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 00:07:49 +0100 (CET)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6iIO-0005sE-PQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 18:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6iGa-00053v-Bu
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6iGW-0007Ji-JC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 18:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J2PN1h4fq5qcgRKtMeA3wIi20yBkiprLjoQk2sREYuU=;
 b=OpNstQwRTCoxux+m8lUs/Xah0x0K5mmf2j2lgQu7484LjSTWzVpDi5+NTT3FfvHYqg2utc
 wsAUvavTBm9qgyCNpUepvuIIQCG/obnJiEXcuXXgQg2kyUR9mF28maREFRMUb6mWdM4iah
 AaWiBXYbNw2HgnWUzh18J5iQAMdRcwc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-lMWuoIqFNuau-UL1lusvmQ-1; Mon, 01 Feb 2021 18:05:46 -0500
X-MC-Unique: lMWuoIqFNuau-UL1lusvmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8641823DD5;
 Mon,  1 Feb 2021 23:05:45 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E745D50C0E;
 Mon,  1 Feb 2021 23:05:44 +0000 (UTC)
Date: Mon, 1 Feb 2021 18:05:44 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
Message-ID: <20210201230544.GJ3872207@habkost.net>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
 <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Babu Moger <babu.moger@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 11:59:48PM +0100, Paolo Bonzini wrote:
> Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
> 
> > Not having a feature name in feature_word_info breaks error
> > reporting and query-cpu-model-expansion.  Add the missing feature
> > name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
> >
> This is intentional, because there's no way that any hypervisor can run if
> this feature is disabled.

If leaving the feature without name enables some desirable
behavior, that's by accident and not by design.  Which part of
the existing behavior is intentional?

-- 
Eduardo


