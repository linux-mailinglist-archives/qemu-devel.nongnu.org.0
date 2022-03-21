Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19094E2373
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:38:20 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEUW-0005kN-0C
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:38:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWESt-000519-BE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWESq-0008Tj-KK
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647855395;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MW7JS0qpK4BW/1e09zh/R1G/H1lic+P5SxLRWv4MSVk=;
 b=hyD+hSjKojgcqSyDHObf9MPLs9t4vWl2WIcm5np3ClCp3ovO75iSMYHzXY2dXO7xHE2PnC
 BrawwWB4Buv4qKJipu2v3hcbJLnH3RDUm73PmBCNRzVtC9dTjjWAkq2iKDZ4CQLejSX/os
 NDoxdGR5b+5AD8EgRytarpYTmYWyTKA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-Sw8ABt4qN0CNSceQYqUkZg-1; Mon, 21 Mar 2022 05:36:34 -0400
X-MC-Unique: Sw8ABt4qN0CNSceQYqUkZg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D73AC899EC1;
 Mon, 21 Mar 2022 09:36:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5733042D430;
 Mon, 21 Mar 2022 09:36:33 +0000 (UTC)
Date: Mon, 21 Mar 2022 09:36:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ben Westover <kwestover.kw@gmail.com>
Subject: Re: Account creation on QEMU Wiki
Message-ID: <YjhHHkBdh7XDbCs1@redhat.com>
References: <cbb051b2-956d-9720-34cb-764034a0dd84@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cbb051b2-956d-9720-34cb-764034a0dd84@gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 20, 2022 at 06:04:17PM -0400, Ben Westover wrote:
> Hello,
> 
> I'd like to create an account on the QEMU Wiki, but as it says on the main
> page, account creation is currently disabled to reduce spam.
> It says to ask someone with an existing account to create one for me, but I
> don't know anyone who has one, so I'm asking here.

I'll take care of this for you.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


