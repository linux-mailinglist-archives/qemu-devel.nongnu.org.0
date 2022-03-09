Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD34D2A8B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:20:52 +0100 (CET)
Received: from localhost ([::1]:46282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrYx-0003Nz-HN
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:20:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRrUW-00014e-Uv
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRrUU-000352-Bn
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646813773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yaEJA5aNR2RnPtTYZMcb9wUNcYzmVVwetfTZ7P4SQEo=;
 b=glu8bS6SxQzSZK2q29kP3mZGuIPPLW8jEX4oC28fQmgyzNBzh/guPSF8EzC//ePkemqFDE
 sHLIlPCCgMVwvW7MK3JCVMMOSl7GNOR8nsI2rtbOhxBJwMYDopujZ+yCrmrQkKRvLOaAdL
 8iGele6EctJLiIR5eDbpXWOlknAWv8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-YOa9XzwYMWClZWRQSG4uvQ-1; Wed, 09 Mar 2022 03:16:10 -0500
X-MC-Unique: YOa9XzwYMWClZWRQSG4uvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B0A814600;
 Wed,  9 Mar 2022 08:16:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9B24E2A1;
 Wed,  9 Mar 2022 08:16:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 357001800098; Wed,  9 Mar 2022 09:16:07 +0100 (CET)
Date: Wed, 9 Mar 2022 09:16:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 11/11] MAINTAINERS: take edk2
Message-ID: <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220308145521.3106395-12-kraxel@redhat.com>
 <cd9a9fda-7187-0601-49ca-20c649ba6cfa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cd9a9fda-7187-0601-49ca-20c649ba6cfa@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 04:08:40PM +0100, Philippe Mathieu-Daudé wrote:
> On 8/3/22 15:55, Gerd Hoffmann wrote:
> > Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Hmm?

Oops, Cc: prefix missing.

> 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 68adaac373c7..ad1c9a7ea133 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3144,7 +3144,7 @@ F: docs/interop/firmware.json
> >   EDK2 Firmware
> >   M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > -R: Gerd Hoffmann <kraxel@redhat.com>
> > +M: Gerd Hoffmann <kraxel@redhat.com>
> 
> Thanks :)

Any chance you can take over the macos support bits in return?

thanks,
  Gerd


