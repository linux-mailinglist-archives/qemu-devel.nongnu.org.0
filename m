Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9FB5FC534
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:22:19 +0200 (CEST)
Received: from localhost ([::1]:60962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiakb-00081b-Tz
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiadA-00017i-F7
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:14:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiad6-0006kS-G0
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 08:14:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665576871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRiqtuA//5ZZ+q8bi4unerbYhRwpfW/Jawl1xZjTvZs=;
 b=ayiXq+7EZ/QI+Tf2uqh1ixo0er+BJeYbSZyA/0lhzX6mvq+T/oHmo/P3OlxQjk4zENqJTf
 /NcifqluPSP9im4Zih6YhtL/p8ta+tPev94jhShomnpSznTsOK4kPropB1vWJnfL+l4sZo
 E22useySSKSs2bBYj8N992IvzuLmG9Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-GvMXsjRTOkGpPKHeR9VHKw-1; Wed, 12 Oct 2022 08:14:27 -0400
X-MC-Unique: GvMXsjRTOkGpPKHeR9VHKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83CCE811E81;
 Wed, 12 Oct 2022 12:14:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B779863AE9;
 Wed, 12 Oct 2022 12:14:25 +0000 (UTC)
Date: Wed, 12 Oct 2022 13:14:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, stefanha@redhat.com,
 peter.maydell@linaro.org, agraf@csgraf.de
Subject: Re: [RFC PATCH  3/4] docs/devel: simplify the minimal checklist
Message-ID: <Y0avmWEScsC57zBt@redhat.com>
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221012121152.1179051-4-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 12, 2022 at 01:11:51PM +0100, Alex Bennée wrote:
> The bullet points are quite long and contain process tips. Move those
> bits of the bullet to the relevant sections and link to them. Use a
> table for nicer formatting of the checklist.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  docs/devel/submitting-a-patch.rst | 75 ++++++++++++++++++++-----------
>  roms/qboot                        |  2 +-

git submodule surprise !


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


