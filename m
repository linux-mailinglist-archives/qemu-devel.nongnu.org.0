Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A60691A46
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 09:48:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQP3Z-0002lp-DS; Fri, 10 Feb 2023 03:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pQP3W-0002lb-MM
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:46:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pQP3U-0007aE-W9
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 03:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676018811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nCTe/6KzqCOtM8a6ao0yNPmn1pwBgufAXKCHR+cSHtA=;
 b=WpNloRjXjL978KFGt4VYVAhozFELpCemSjJu0xQ4Swz580D8CzUXCM8XLyX6dowwarcXUG
 dqCq1YMvH0QXAoq3MasjbAxl6O4zfmAV6Uc/KbxwjjysRpne7Q3Q8zWTFZkdu9Fhchf+MA
 RhDQhVH+MntUre3ntJyNoWoPYqYxips=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-2MECCljRMJucGvqv54G6Qg-1; Fri, 10 Feb 2023 03:46:47 -0500
X-MC-Unique: 2MECCljRMJucGvqv54G6Qg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88E59101A52E;
 Fri, 10 Feb 2023 08:46:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D248492C3E;
 Fri, 10 Feb 2023 08:46:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D0D6B1800082; Fri, 10 Feb 2023 09:46:45 +0100 (CET)
Date: Fri, 10 Feb 2023 09:46:45 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] hw/misc/sga: Remove the deprecated "sga" device
Message-ID: <20230210084645.pktzzjo4qi3esgzx@sirius.home.kraxel.org>
References: <20230209161540.1054669-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209161540.1054669-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 09, 2023 at 05:15:40PM +0100, Thomas Huth wrote:
> It's been deprecated since QEMU v6.2, so it should be OK to
> finally remove this now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>


