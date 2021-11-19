Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E14577AC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:21:55 +0100 (CET)
Received: from localhost ([::1]:60836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAOQ-0004yv-G8
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:21:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1moAMU-00049z-2i
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1moAMR-0004Cf-8w
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637353189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=399TOKL7u68lbOzzMcUHZ4+t0mRIZS9Z4Vgn2k6ppSk=;
 b=GVqvAGwxc5wWHICY7mf8/7aIf4UMwDL+CSXvWevKI8Gh0mWyMZHlV4l1GvON5pgqd35kK2
 lw+e4ITeiNmsihwkJiSOqeEYulsf86sON/uhi8K+hmzysrjvjLF6cVd0aNCVauWezfUUeG
 leIIVGFvikh62wZHR0fyDW+orMfIPjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-KFgaPLC1MgSLsoCJZSoG7A-1; Fri, 19 Nov 2021 15:19:44 -0500
X-MC-Unique: KFgaPLC1MgSLsoCJZSoG7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A0318125CB;
 Fri, 19 Nov 2021 20:19:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC6025BAE5;
 Fri, 19 Nov 2021 20:19:29 +0000 (UTC)
Date: Fri, 19 Nov 2021 14:19:22 -0600
From: Eric Blake <eblake@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Subject: Re: [PATCH 0/2] Fix broken rST conversion of "submitting-a-patch.rst"
Message-ID: <20211119201922.gdgjwvpjeavthzbw@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211119193118.949698-1-kchamart@redhat.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 08:31:16PM +0100, Kashyap Chamarthy wrote:
> I completely botched up the merged[0] rST conversion of this document by
> accidentally dropping entire hunks (!) of text. :-(  I made it very hard
> for reviewers to spot it, as the omitted text was buried deep in the
> document.  To fix my hatchet job, I reconverted the "SubmitAPatch"
> wiki[1] page from scratch and replaced the existing rST with it, while
> making sure I incorporated previous feedback.  Sorry for the sloppiness.
> 
> More details in patch-1.
> 
> [0] https://gitlab.com/qemu-project/qemu/-/commit/9f73de8df033
> 
> Kashyap Chamarthy (2):
>   docs: Fix botched rST conversion of 'submitting-a-patch.rst'
>   docs: List more commit-message tags "in submitting-a-patch"

Series:
Reviewed-by: Eric Blake <eblake@redhat.com>


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


