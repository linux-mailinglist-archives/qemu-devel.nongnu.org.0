Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D38530C8B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:16:26 +0200 (CEST)
Received: from localhost ([::1]:40252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt56v-0006ZZ-6S
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt53Z-0004x1-Ci
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:12:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nt53X-00058Q-19
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653300774;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lyong23qMXke11z2iOQ99G1vZJsupYuz8uSmXiTt+Yk=;
 b=TcEnmpjaa5QFS4SayrAXhgCd//Tjz3xjBowYoFxxflS3XpyLn/r0EXF1Q38Sw2q+tgliYJ
 tOvlQQhSmuGXceHRONCoPnEmAxYL8tDkn4YwnxHpL7+aoB7iNj+G95FkoI1IXsOuNw0tpt
 BvO/GvdrV/i3PIPtD6Snrix4Z/58OZ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-RDU_a9sqOFqPVCPi0qyHXw-1; Mon, 23 May 2022 06:12:51 -0400
X-MC-Unique: RDU_a9sqOFqPVCPi0qyHXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EE4F29ABA1C;
 Mon, 23 May 2022 10:12:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6194E7AE4;
 Mon, 23 May 2022 10:12:49 +0000 (UTC)
Date: Mon, 23 May 2022 11:12:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] Trivial: 3 char repeat typos
Message-ID: <YoteH7Ise8EXDGrE@redhat.com>
References: <20220523095629.144441-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220523095629.144441-1-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 23, 2022 at 10:56:29AM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/intc/openpic.c                | 2 +-
>  hw/net/imx_fec.c                 | 2 +-
>  hw/pci/pcie_aer.c                | 2 +-
>  hw/pci/shpc.c                    | 2 +-
>  hw/ppc/spapr_caps.c              | 2 +-
>  hw/scsi/spapr_vscsi.c            | 2 +-
>  qapi/net.json                    | 2 +-
>  target/arm/cpu64.c               | 2 +-
>  tools/virtiofsd/passthrough_ll.c | 2 +-
>  ui/input.c                       | 2 +-
>  10 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


