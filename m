Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF47833AC75
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 08:46:09 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLhvU-00054O-OP
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 03:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLhuB-0004dj-B6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lLhu8-00050M-I7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615794283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05dDXXhui2nMxHr8s5f6KcwQrOOpgP6LXoUDyuYyIgs=;
 b=Exh1PceS/WJkiD+gxox9E+CA1KDIcNvT00urMrT+uLTHuseZjb+XLveo5Z5zl09NWwY5+/
 JWvjISs5g6trCRA9BfkhMdRIsQNvqYef5QEGfLT+P4XHo6BZK16A6pRqtCsxy3frcrx9rt
 LlacvnIXPy0nsykb5jDNnp6u4pcXK/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-Cpt7CjU_P9mVAm6dsRF4Sg-1; Mon, 15 Mar 2021 03:44:41 -0400
X-MC-Unique: Cpt7CjU_P9mVAm6dsRF4Sg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADC9F817469;
 Mon, 15 Mar 2021 07:44:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5006C620DE;
 Mon, 15 Mar 2021 07:44:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3C17C18000B7; Mon, 15 Mar 2021 08:44:38 +0100 (CET)
Date: Mon, 15 Mar 2021 08:44:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Konstantin Nazarov <mail@knazarov.com>
Subject: Re: [PATCH v2] edid: add support for DisplayID extension (5k
 resolution)
Message-ID: <20210315074438.ijtuet4vkra7o56d@sirius.home.kraxel.org>
References: <20210314091236.44313-1-mail@knazarov.com>
MIME-Version: 1.0
In-Reply-To: <20210314091236.44313-1-mail@knazarov.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +typedef struct Timings {

> +static void generate_timings(Timings *timings, uint32_t refresh_rate,
> +                             uint32_t xres, uint32_t yres)

Adding these should be splitted to a separate patch.

> -static void edid_checksum(uint8_t *edid)
> +static void edid_checksum(uint8_t *edid, size_t len)

Why this change?  Also a good candidate for a separate patch.

> +    if (size >= 384) {
> +        did = edid + 256;

"if (size >= 384 && large_screen)" ?
Also setting did should be next to setting dta.


       if (did) {
> +        dummy_displayid(did);

init_displayid() ?

Especially if we generate that only in case we actually have a large
screen so we never have an empty extension section?

take care,
  Gerd


