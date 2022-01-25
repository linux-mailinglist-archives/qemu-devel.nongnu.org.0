Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4A49ADDF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:18:51 +0100 (CET)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCH2Q-00025q-88
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGve-0007dS-FJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGva-0000bf-PZ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643098305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wKsQD29lcKk3G+kRCMtcf4lrXXoAYw8xyMglfn31/Hg=;
 b=BUQ34xt0238c4gDb2lZSvqMR5ELSFFftI7l2OdHk+XdlpNX5V/zF66llpJxc/Tuey2Y907
 oDaaMaN2epmzeXGHCyxdM/SvUgnK8afvYFTw45/ihGI/ZGqP1yRmUqZ3haZZRtQxibrHI2
 VCY/ucmDbzb4Vt2HzUnuiNjrr+2N6vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-_19Vrh0BNNq8hJA1p9F1Qg-1; Tue, 25 Jan 2022 03:11:41 -0500
X-MC-Unique: _19Vrh0BNNq8hJA1p9F1Qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC83D8519E0;
 Tue, 25 Jan 2022 08:11:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F5FD1059104;
 Tue, 25 Jan 2022 08:11:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9750E18003A0; Tue, 25 Jan 2022 09:11:38 +0100 (CET)
Date: Tue, 25 Jan 2022 09:11:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sven Schnelle <svens@stackframe.org>
Subject: Re: [PATCH 2/3] hw/display/artist: allow to disable/enable cursor
Message-ID: <20220125081138.3ymhvnlvy37bdejr@sirius.home.kraxel.org>
References: <20220121221619.1069447-1-svens@stackframe.org>
 <20220121221619.1069447-3-svens@stackframe.org>
MIME-Version: 1.0
In-Reply-To: <20220121221619.1069447-3-svens@stackframe.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> @@ -1419,7 +1424,7 @@ static int vmstate_artist_post_load(void *opaque, int version_id)
>  
>  static const VMStateDescription vmstate_artist = {
>      .name = "artist",
> -    .version_id = 1,
> +    .version_id = 2,

Which machines use that device?  Usually we try avoid bumping the
version as this is a one-way ticket (migration to newer versions works,
but back to older doesn't).  But for machine typess which are not
versioned this isn't that much of a problem.

>      .minimum_version_id = 1,
>      .post_load = vmstate_artist_post_load,
>      .fields = (VMStateField[]) {
> @@ -1440,6 +1445,7 @@ static const VMStateDescription vmstate_artist = {
>          VMSTATE_UINT32(line_end, ARTISTState),
>          VMSTATE_UINT32(line_xy, ARTISTState),
>          VMSTATE_UINT32(cursor_pos, ARTISTState),
> +        VMSTATE_UINT32(cursor_cntl, ARTISTState),

You need another variant of that macro (VMSTATE_UINT32_V() IIRC) to
declare that field as "new in v2".

take care,
  Gerd


