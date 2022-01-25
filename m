Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339049ADCA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:02:22 +0100 (CET)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCGmQ-00029H-Gy
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:02:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGcT-0007f9-PJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nCGbw-0006E3-4t
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 02:51:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643097059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HpobS/A5TxpuIkK985E0eICG44H+KXxkK+//fuzSD94=;
 b=Pp9xoUQilji8UWuLtNYE3ZmnxwVFqZ29dixapBQSetZgBIBdjsMPhdo2nain6VI01XSJtg
 NZrDB4j04aQVcf+TPbywBVM67ZEk7YkeUq2U0HjBCb5HvJwB88x5GKzqQRnDPiBHc/8zfL
 xNPFTVOjGz2QOO7MFb+6CrSSdtGH7U0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-RNVuxf_RPoOG9Ufxal7yzg-1; Tue, 25 Jan 2022 02:50:57 -0500
X-MC-Unique: RNVuxf_RPoOG9Ufxal7yzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BF5D18B9F4F;
 Tue, 25 Jan 2022 07:50:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5D64EC71;
 Tue, 25 Jan 2022 07:50:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4699418000B2; Tue, 25 Jan 2022 08:50:54 +0100 (CET)
Date: Tue, 25 Jan 2022 08:50:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] docs: expand firmware descriptor to allow flash without
 NVRAM
Message-ID: <20220125075054.dnlnr4pliw3bio2k@sirius.home.kraxel.org>
References: <20220121153444.527707-1-berrange@redhat.com>
 <aa00dae7-e092-573a-a6ce-f7cf347f294c@amsat.org>
MIME-Version: 1.0
In-Reply-To: <aa00dae7-e092-573a-a6ce-f7cf347f294c@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >   { 'struct' : 'FirmwareMappingFlash',
> > -  'data'   : { 'executable'     : 'FirmwareFlashFile',
> > -               'nvram-template' : 'FirmwareFlashFile' } }
> > +  'data'   : { 'mode': 'FirmwareFlashMode',
> > +               'executable'     : 'FirmwareFlashFile',
> > +               '*nvram-template' : 'FirmwareFlashFile' } }

I think for backward compatibility reasons we want 'mode' be optional,
with 'mode' = 'split' being assumed in case it is not present.

otherwise looks sane to me.

take care,
  Gerd


