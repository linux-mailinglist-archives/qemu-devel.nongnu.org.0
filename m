Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7866028FA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:04:16 +0200 (CEST)
Received: from localhost ([::1]:53002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjSJ-0000Ns-2S
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okj39-0001Qr-Ec
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:38:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okj30-0005Cp-Q6
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666085885;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nevK8VBB1xi/gO7QeCesjf8TUsT2qcMf10dPrHg860k=;
 b=Wvf7B9UZ6Fpgo8cypkOhYnruYwtUIuIMTfUUwwijOiShVkZ9u3f0MADo4njLZhzDRD/zGs
 t4L3G4bgHftjbP3CauqttAvjUY1aa02iHmIYPPqNzE0J4rRoqwb3fMIpGFVAO0sVCDRSCf
 vfF0uGTVxavx4KjuImP0R5r53Gjq24E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-sFWDVUhkMw6HSyQXpMxjUA-1; Tue, 18 Oct 2022 05:38:04 -0400
X-MC-Unique: sFWDVUhkMw6HSyQXpMxjUA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E88D6833A19;
 Tue, 18 Oct 2022 09:38:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FE3245359A;
 Tue, 18 Oct 2022 09:38:02 +0000 (UTC)
Date: Tue, 18 Oct 2022 10:38:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: amarjargal <amarjargal16@gmail.com>
Cc: qemu-devel@nongnu.org, sgarzare@redhat.com
Subject: Re: [PATCH 1/4] ui: fix tab indentation
Message-ID: <Y05z+HGk8zyRmIGf@redhat.com>
References: <cover.1666029821.git.amarjargal16@gmail.com>
 <91d870b3c88c5c31bb8cfcabbf7ca28b34899aa4.1666029821.git.amarjargal16@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91d870b3c88c5c31bb8cfcabbf7ca28b34899aa4.1666029821.git.amarjargal16@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Tue, Oct 18, 2022 at 02:23:56AM +0800, amarjargal wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> Signed-off-by: amarjargal <amarjargal16@gmail.com>
> ---
>  ui/vgafont.h                 | 9214 +++++++++++++++++-----------------
>  ui/vnc-enc-zywrle-template.c |   20 +-
>  ui/vnc-enc-zywrle.h          |   16 +-
>  ui/vnc_keysym.h              |    2 +-
>  4 files changed, 4626 insertions(+), 4626 deletions(-)
> 

> diff --git a/ui/vnc_keysym.h b/ui/vnc_keysym.h
> index e8a2ec73c5..19d5ce7cf7 100644
> --- a/ui/vnc_keysym.h
> +++ b/ui/vnc_keysym.h
> @@ -102,7 +102,7 @@ static const name2keysym_t name2keysym[]={
>  /* latin 1 extensions */
>  { "nobreakspace",         0x0a0},
>  { "exclamdown",           0x0a1},
> -{ "cent",         	  0x0a2},
> +{ "cent",               0x0a2},

The rest of the entries are vertically  aligned. Can you fix this
to match.

>  { "sterling",             0x0a3},
>  { "currency",             0x0a4},
>  { "yen",                  0x0a5},

With that addressed, the whole patch would be

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


