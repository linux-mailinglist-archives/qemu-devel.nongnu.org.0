Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51B2166BC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 08:49:34 +0200 (CEST)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jshQ5-0000aR-Ih
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 02:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshOO-0007JH-1D
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:47:48 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20756
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1jshOL-0000gd-8B
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 02:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594104463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PqMarEvLLdYTERwCgzqYfxISP+EuYNnSGyBf+U9vmog=;
 b=exsStQ49B9XNYIyLfuKlEpghycaynyl/1fDtNcYzV38/I+jyNNkoEFzPDGTaJ9HEiR+2M+
 ydOlih/mARC1DxLktcX6nvZuzi0DAY+asJ+wC/m1yQqsa04R/ggNShEehKlTUi/ce+/jq/
 xAWFFo1D/tRCKGw7/mGK53CC+WfD150=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-C3ptYPdgMeOTflP43OpsSA-1; Tue, 07 Jul 2020 02:47:42 -0400
X-MC-Unique: C3ptYPdgMeOTflP43OpsSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 043FC107ACCD;
 Tue,  7 Jul 2020 06:47:41 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E3E60BF3;
 Tue,  7 Jul 2020 06:47:35 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:47:32 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 1/2] hw/sd/ssi-sd: Deprecate the SPI to SD card
 'adapter'
Message-ID: <20200707064732.GB9048@angien.pipo.sk>
References: <20200705220731.28101-1-f4bug@amsat.org>
 <20200705220731.28101-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200705220731.28101-2-f4bug@amsat.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:20:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <huth@tuxfamily.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 libvir-list@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 06, 2020 at 00:07:30 +0200, Philippe Mathieu-Daudé wrote:
> This device duplicate the SPI mode of the sd-card device. The
> SPI protocol is better handler in the sd-card, however as the
> TYPE_SSI_SLAVE is not an interface, the sd-card can not implement
> it easily to be pluggable on a SPI bus. Meanwhile the ssi-sd
> device acts as a bridge, but is bitroting. Deprecate it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 47f84be8e0..5e67d7f3e0 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -343,6 +343,11 @@ The 'ide-drive' device is deprecated. Users should use 'ide-hd' or
>  The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
>  'scsi-cd' as appropriate to get a SCSI hard disk or CD-ROM as needed.
>  
> +``ssi-sd`` (since 5.1)
> +'''''''''''''''''''''''''
> +
> +The 'ssi-sd' (SSI to SD card adapter) device is deprecated.

libvirt didn't allow configuring this device yet, so from our view it's
okay to remove it.

ACKed-by: Peter Krempa <pkrempa@redhat.com>


