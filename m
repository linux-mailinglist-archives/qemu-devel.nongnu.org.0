Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7503251278
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 08:58:40 +0200 (CEST)
Received: from localhost ([::1]:60580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kASul-0005Zo-Jm
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 02:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kASu6-0005Aw-K2
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 02:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kASu4-0006Tr-JV
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 02:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598338675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZZ8JhvCEx/uEiycsP3nRlgAJdAsj52JI8Lzza5AEWBw=;
 b=Qy4uZ0xX1GIAkE3RgiFEjnMgd/KVT7685MIXEanr3PqIFib4O1cViXrNKITpZo2MYrOE3A
 MAKvDVIPKFHvUNII73FrfrpjNgKqKcPMLcQgdZGstpo8ojQUKeLQTDosiVKimeSp+hmiNE
 n+6nrnZQ/0d7rDr/IvCfTZadiufVkTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-AbiXBG_WN7OJK7Hbl8Og5w-1; Tue, 25 Aug 2020 02:57:49 -0400
X-MC-Unique: AbiXBG_WN7OJK7Hbl8Og5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B92BA425CD;
 Tue, 25 Aug 2020 06:57:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 007BC5C1CF;
 Tue, 25 Aug 2020 06:57:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EF371753B; Tue, 25 Aug 2020 08:57:47 +0200 (CEST)
Date: Tue, 25 Aug 2020 08:57:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?B?Q8Opc2Fy?= Belley <cesar.belley@lse.epita.fr>
Subject: Re: [PATCH v2 08/13] configure: Add USB U2F key device
Message-ID: <20200825065747.pxa242epeyzk6n5e@sirius.home.kraxel.org>
References: <20200824114827.81623-1-cesar.belley@lse.epita.fr>
 <20200824114827.81623-9-cesar.belley@lse.epita.fr>
MIME-Version: 1.0
In-Reply-To: <20200824114827.81623-9-cesar.belley@lse.epita.fr>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +# check for u2f support
> +if test "$u2f" != "no"; then
> +    if $pkg_config --atleast-version=0.0.0 u2f-emu; then
> +        u2f_emu_cflags=$($pkg_config --cflags u2f-emu)
> +        u2f_emu_libs=$($pkg_config --libs u2f-emu)
> +        u2f="yes"
> +    else
> +        if test "$u2f" = "yes"; then
> +            feature_not_found "u2f" "Install u2f-emu"
> +        fi
> +        u2f="no"
> +    fi
> +fi

The libu2f-emu check can be handled by meson instead.  That will
probably simplify things a bit thanks to meson's build-in pkg-config
dependency support (no need for explicit cflags/libs variables).

Here is an example for moving a pkg-config check from
configure to meson:

https://patchwork.ozlabs.org/project/qemu-devel/patch/20200824152430.1844159-2-laurent@vivier.eu/

> +if test "$u2f" = "yes" ; then
> +  echo "CONFIG_U2F=y" >> $config_host_mak
> +  echo "U2F_CFLAGS=$u2f_emu_cflags" >> $config_host_mak
> +  echo "U2F_LIBS=$u2f_emu_libs" >> $config_host_mak
> +fi

This is a bit confusing as patch #7 uses these variables already.  I'd
suggest to either reorder the patches so the detection comes first, or
just squash the two patches into one.

take care,
  Gerd


