Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2757FC24
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 11:16:44 +0200 (CEST)
Received: from localhost ([::1]:44210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFuCg-0007Bi-R0
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 05:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu9i-0005SB-Vk
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:13:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFu9g-0000jO-HS
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 05:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658740415;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BGblRKFBrv/c4stfAS1P2dLIStx5EDYUvPGLdSH2+TE=;
 b=F2KMi/wNdkReszi4te2vnUn6R3BDD/NDre2EmQdow80iJZUXOaOxLBRpNTowL+pSgNGk/j
 bzS9QnUicbn87No9XDeuwbIYTh2CQMO2AtZUoaWsfV1LPXrt+vK7y5lONIVYNa9BoJJKDo
 YCIEBNJRaA+JFwcHJxVFpR8MqVkyHrc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-AyieZuuEPJGh-iTAJFiwDQ-1; Mon, 25 Jul 2022 05:13:32 -0400
X-MC-Unique: AyieZuuEPJGh-iTAJFiwDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD3A6185A7B2;
 Mon, 25 Jul 2022 09:13:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FB0740315E;
 Mon, 25 Jul 2022 09:13:31 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:13:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chris Murphy <lists@colorremedies.com>
Cc: qemu-devel@nongnu.org
Subject: Re: driver type raw-xz supports discard=unmap?
Message-ID: <Yt5etOfFUQb12ljA@redhat.com>
References: <4f9c91b1-719c-443e-a757-042e772d6019@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f9c91b1-719c-443e-a757-042e772d6019@www.fastmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 22, 2022 at 04:03:52PM -0400, Chris Murphy wrote:
> Is this valid?
> 
> `<disk device="disk" type="file">
> <target dev="vda" bus="virtio"/>
> <source file="Fedora-Workstation-Rawhide-20220721.n.0.aarch64.raw-xz"/>
> <driver name="qemu" type="raw-xz" discard="unmap"/>`
> `/>
> </disk>`
> 
> I know type="raw" works fine, I'm wondering if there'd be any problem
> with type "raw-xz" combined with discards?

This is libvirt configuration, so libvirt-users@redhat.com is the better
list in general. That said, what is this 'raw-xz' type you refer to ?

AFAIK, that is not a disk driver type that exists in either libvirt or
QEMU releases.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


