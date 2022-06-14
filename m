Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AD54B044
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:17:46 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15UP-0007IP-03
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15RJ-0004Dg-4F
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15RG-0007Dk-92
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jTV1MdFQUjOD6SaouLkpusNhrO6aKybutsMy/w9e6iI=;
 b=P0c6Gf07yMd6wHY0hBXVoJWyP24LJRhQOBuFQsCz0t7sjthdaJC4aB73Achywqw8E75roL
 AOIKk9u1FMECbLQf+j4Rr+VhhyfEVMmt6+s9rDTIK/PYoXa9HL43KeI7JOUjy1+hydU3GC
 Hdk+KvlZknXl0mbgcMBJVazbcXS5gPU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487--g9QEbfoMZ26_nSdNrXxLQ-1; Tue, 14 Jun 2022 08:14:26 -0400
X-MC-Unique: -g9QEbfoMZ26_nSdNrXxLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4282A3C025CE;
 Tue, 14 Jun 2022 12:14:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0072026D64;
 Tue, 14 Jun 2022 12:14:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37DAE1800084; Tue, 14 Jun 2022 14:14:23 +0200 (CEST)
Date: Tue, 14 Jun 2022 14:14:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Canokeys.org" <contact@canokeys.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PULL 00/16] Kraxel 20220613 patches
Message-ID: <20220614121423.2hykgv7dn2qfo2dz@sirius.home.kraxel.org>
References: <20220613113655.3693872-1-kraxel@redhat.com>
 <37f8f623-bb1c-899b-5801-79acd6185c6d@linaro.org>
 <20220614094038.g2g6lzeviypcnqrb@sirius.home.kraxel.org>
 <YqhaKi8K2EATpAlN@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqhaKi8K2EATpAlN@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > Hmm, build worked here and CI passed too.
> > 
> > I think this is one of those cases where the build directory must be
> > deleted because one subdirectory is replaced by a compatibility
> > symlink.
> 
> Except 'configure' deals with that, as it explicitly rm -rf's the
> symlink target:
> 
> symlink() {
>   rm -rf "$2"
>   mkdir -p "$(dirname "$2")"
>   ln -s "$1" "$2"
> }
> 
> so i'm pretty confused as to what's going wrong here still

'git rebase -x ./make.sh master queue/kraxel' not working (where make.sh
is a script effectively doing 'make -C build/$name' for multiple build
trees with different configurations).

'git status' lists ui/keymaps/* as deleted.
'git reset --hard' fixes it.

take care,
  Gerd


