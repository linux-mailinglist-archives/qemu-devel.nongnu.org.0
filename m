Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4A30B401
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 01:19:27 +0100 (CET)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6jPi-000647-4H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 19:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6jOq-0005et-Ka
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 19:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6jOl-0007lU-TC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 19:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612225105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aq20+GRtJ85u1rTXNkXu0ckDeR7mHVZtKJO4GEfbkjg=;
 b=hMcAH8JvYfoLjls1ly5zClZ8izaa5f7Jq6XqSvp5cX0U0kypalif05eXI/MHFfi8owHXwF
 uLccu9lvk7MOFPrt4czbCi/9aAekE9K/kwkzD2U+EKvbDJP1+ItmoCdxCuK3VS3zIJgEqh
 YI5lbXCd7Tani4a4xuoYRPAcJ77mDYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-F-7SNLk9Mkq50Q_QrHBgxQ-1; Mon, 01 Feb 2021 19:18:16 -0500
X-MC-Unique: F-7SNLk9Mkq50Q_QrHBgxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99BF41005513;
 Tue,  2 Feb 2021 00:18:15 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3149B5D749;
 Tue,  2 Feb 2021 00:18:14 +0000 (UTC)
Date: Mon, 1 Feb 2021 19:18:14 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
Message-ID: <20210202001814.GK3872207@habkost.net>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
 <20210201225404.3941395-2-ehabkost@redhat.com>
 <CABgObfaWW+ON4AA6cqygOkCMrruMbUqCR32R=uVhxnm4yUa6eQ@mail.gmail.com>
 <20210201230544.GJ3872207@habkost.net>
 <CABgObfYrOG1QBHskP4=Rwcp2uwOZKDCE9_RF1mmJWngD90zSjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfYrOG1QBHskP4=Rwcp2uwOZKDCE9_RF1mmJWngD90zSjA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

On Tue, Feb 02, 2021 at 12:28:38AM +0100, Paolo Bonzini wrote:
> Il mar 2 feb 2021, 00:05 Eduardo Habkost <ehabkost@redhat.com> ha scritto:
> 
> > On Mon, Feb 01, 2021 at 11:59:48PM +0100, Paolo Bonzini wrote:
> > > Il lun 1 feb 2021, 23:54 Eduardo Habkost <ehabkost@redhat.com> ha
> > scritto:
> > >
> > > > Not having a feature name in feature_word_info breaks error
> > > > reporting and query-cpu-model-expansion.  Add the missing feature
> > > > name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].
> > > >
> > > This is intentional, because there's no way that any hypervisor can run
> > if
> > > this feature is disabled.
> >
> > If leaving the feature without name enables some desirable
> > behavior, that's by accident and not by design.  Which part of
> > the existing behavior is intentional?
> >
> 
> Not being able to disable it.

We can make it a hard dependency of vmx, then.  We shouldn't
leave it without a name, though.

-- 
Eduardo


