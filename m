Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0704DA232
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:17:36 +0100 (CET)
Received: from localhost ([::1]:36714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBjj-0002pO-0U
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:17:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUBex-0000WP-Qv
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:12:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUBew-000117-7v
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647367956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/mZtqBemQ82fUq/2ac+++1j4cZh9nT9Ih2f42f+ntg=;
 b=KKVSlvLIGRREi4M+O9AfQ2chDsmjKcf8s5IboET+p6+8W+qgL7hjopKSoZrvS4+YP0KESP
 k7uWfdUt8utCeR9q/bEsatX7HxgThQNfDhGZg4gMT6ONGGHo4jfiKztlAkKu+hBm0oz1/m
 EN5MN8TMjzx9MNnyllJX0ksRI2E0YXo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-CKaXpwQ_PeWDo9ad2qA7aw-1; Tue, 15 Mar 2022 14:12:23 -0400
X-MC-Unique: CKaXpwQ_PeWDo9ad2qA7aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 972E73C18528;
 Tue, 15 Mar 2022 18:12:22 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F2FE40E80E2;
 Tue, 15 Mar 2022 18:12:20 +0000 (UTC)
Date: Tue, 15 Mar 2022 18:12:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
Message-ID: <YjDXAi+qMD/LCQxU@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9y0xQ2O00y1uJ5@redhat.com>
 <32b0d8eb-e00f-8468-135b-d508b82978ca@redhat.com>
 <YjBdIA7ZecVr7C+f@redhat.com>
 <14e1f954-8db9-6309-f423-c9f4fbca4f71@redhat.com>
MIME-Version: 1.0
In-Reply-To: <14e1f954-8db9-6309-f423-c9f4fbca4f71@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 06:27:57PM +0100, Paolo Bonzini wrote:
> On 3/15/22 10:32, Daniel P. Berrangé wrote:
> > > > So NetBSD is our biggest constraint on requiring GCC 10
> > > 
> > > Do we care about the BSDs since they have newer compilers (including gcc10)
> > > available in pkgsrc?  If you go by the base system, then RHEL8 has 8.5.0 and
> > > newer version are only available with packages such as gcc-toolset-10 and
> > > gcc-toolset-11.
> > 
> > I mention NetBSD because we had an explicit request to support
> > 7.4 GCC from there, as it was the current system compiler.
> 
> Thanks, do you have a reference?  I would like to understand the reason for
> that (adding Werner too).

It was commit 3830df5f83b9b52d9496763ce1a50afb9231c998

> For RHEL8, considering that the switch would be several months away anyway,
> I don't think it would be an issue to require AppStream toolset packages.
> It's unlikely that RHEL8 would rebase QEMU in 2023 and beyond.

It isn't so much RHEL8 rebases I'm thinking of wrt the policy, but
rather our corporate contributors who can be constrained by annoying
corporate policies to only use RHEL-8 for their work.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


