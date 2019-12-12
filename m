Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594811D7EA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 21:34:54 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifVAj-0007Uc-2e
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 15:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ifV9a-0006rD-1d
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:33:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ifV9X-0007dG-Pb
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:33:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23953
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ifV9X-0007bG-M8
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 15:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576182818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pyO696uob2HJVChusxNI4eBjlq617MhVP3u6k2x4F18=;
 b=b2sgKR/dlPPhrVL2dbwSDSscm6xVnSb/mCkSBWaDXdtUdP6e80gR+fNLubBWlgYp52+v+V
 7yeXMGiKUTCmNLgY7bimJlzfqJPqKm06M9S817fSzVyNxWGL8dO8Tq86ipQtF0r2F4D1CQ
 5QwgolyY+/QTQ0hP0xcROKT3ui+3sYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-LyWuxHnDMZKXWHG6wPwcFw-1; Thu, 12 Dec 2019 15:33:37 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E192A100551D;
 Thu, 12 Dec 2019 20:33:35 +0000 (UTC)
Received: from [10.3.116.171] (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C01310013A1;
 Thu, 12 Dec 2019 20:33:32 +0000 (UTC)
Subject: Re: [PATCH v5 1/5] tpm_spapr: Support TPM for ppc64 using CRQ based
 interface
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org
References: <20191212202430.1079725-1-stefanb@linux.vnet.ibm.com>
 <20191212202430.1079725-2-stefanb@linux.vnet.ibm.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a7312621-b3d4-6ee1-5e44-70d34dfbd2a2@redhat.com>
Date: Thu, 12 Dec 2019 14:33:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212202430.1079725-2-stefanb@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: LyWuxHnDMZKXWHG6wPwcFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/12/19 2:24 PM, Stefan Berger wrote:
> Implement support for TPM on ppc64 by implementing the vTPM CRQ interface
> as a frontend. It can use the tpm_emulator driver backend with the external
> swtpm.
> 
> The Linux vTPM driver for ppc64 works with this emulation.
> 
> This TPM emulator also handles the TPM 2 case.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> diff --git a/hw/tpm/Kconfig b/hw/tpm/Kconfig

Odd that your diff doesn't include the usual --- marker or a diffstat.


> +++ b/hw/tpm/tpm_spapr.c
> @@ -0,0 +1,405 @@
> +/*
> + * QEMU PowerPC pSeries Logical Partition (aka sPAPR) hardware System Emulator
> + *
> + * PAPR Virtual TPM
> + *
> + * Copyright (c) 2015, 2017 IBM Corporation.

Do you want to claim 2019?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


