Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B9C24046C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 12:00:20 +0200 (CEST)
Received: from localhost ([::1]:44996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k54bL-0005o7-Ep
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 06:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k54aA-000565-LR
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 05:59:06 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37120
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k54a9-0004Ll-1L
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 05:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597053543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1wlANsCvIHazDba2qSBZe7nbGZnW6Wg902xNGMDRR4=;
 b=WVchgsTePiJq3WQyyzZYq4SdYBKKAkBTZ3FvltamckTShbrvy7hwXSTWfzRPbumN4KlIXd
 BRcEU2/qi228bzRR1+08dRAl8wFrM/aaMoin36YwGWCf5gI0ueMlZkeblT7tWHnY6ykGYY
 Uopcxj2BPkhfprkByiLy8v/kJFICZH0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-FJu32DjPO0-s2TRUJuQxYQ-1; Mon, 10 Aug 2020 05:58:59 -0400
X-MC-Unique: FJu32DjPO0-s2TRUJuQxYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0066C106B242;
 Mon, 10 Aug 2020 09:58:59 +0000 (UTC)
Received: from gondolin (ovpn-112-218.ams2.redhat.com [10.36.112.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 488FE5F1EA;
 Mon, 10 Aug 2020 09:58:54 +0000 (UTC)
Date: Mon, 10 Aug 2020 11:58:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
Message-ID: <20200810115851.36c21729.cohuck@redhat.com>
In-Reply-To: <9b8cacc4-e60e-d436-4666-1457ec68e510@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <20200807085302.7d7616df.cohuck@redhat.com>
 <499b18ae-b15d-abbb-faf5-d9bdd5262fa4@redhat.com>
 <20200807113557.178825af.cohuck@redhat.com>
 <20200807142021.53967299.cohuck@redhat.com>
 <9b8cacc4-e60e-d436-4666-1457ec68e510@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, alex.bennee@linaro.org,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Aug 2020 17:18:42 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 07/08/20 14:20, Cornelia Huck wrote:
> >> - on an s390x system, it mostly builds, but I end up with a bunch of
> >>   link errors for libblock.fa, where it fails to find various ZSTD_
> >>   symbols  
> > Still happening after switching to the latest version of your branch.
> >   
> 
> Fixed thusly:

(...)

Thanks, that makes it build now on my LPAR, and it seems to have
created a working qemu-system-s390x.


