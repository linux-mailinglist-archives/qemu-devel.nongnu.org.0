Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B432A50DDA0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:08:30 +0200 (CEST)
Received: from localhost ([::1]:37000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivdt-0001Na-RV
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivb1-0007cO-Gc
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:05:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivav-0001Iq-Dz
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 06:05:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650881124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SrUsM3TKvEQKOMIbOEFE9JQa61jrc9FOraWawCzr64g=;
 b=bJulswuavl1bvrvwSJEizxEm3EyTEEuntsS9s9drVQ9mTvW7C2xcwrx62LbFPHOBW0T2g0
 nGWFo3DDdUHTlRcmsEqtaX8cMYf4VSm2lKfE8PKhySTCQB5VODdcBAr2u2ufIhtfDP/09/
 1IDRwUAtzJYgbzdlFVC7CjyJ1aI2Yfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-aW7IMEpaO5iD9KHBmdiu6g-1; Mon, 25 Apr 2022 06:05:20 -0400
X-MC-Unique: aW7IMEpaO5iD9KHBmdiu6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED4371875070;
 Mon, 25 Apr 2022 10:05:19 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 679074047D0A;
 Mon, 25 Apr 2022 10:05:19 +0000 (UTC)
Date: Mon, 25 Apr 2022 11:05:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 14/17] vfio-user: handle PCI BAR accesses
Message-ID: <YmZyXrJWloInu5mo@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <b01b6963d6d342aac6d715aa83695e7998826223.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aY0zdnoP99Zn1rmU"
Content-Disposition: inline
In-Reply-To: <b01b6963d6d342aac6d715aa83695e7998826223.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aY0zdnoP99Zn1rmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2022 at 04:44:19PM -0400, Jagannathan Raman wrote:
> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
> +                                hwaddr bar_offset, char * const buf,
> +                                hwaddr len, const bool is_write)
> +{
> +    MemoryRegionSection section = { 0 };
> +    uint8_t *ptr = (uint8_t *)buf;
> +    MemoryRegion *section_mr = NULL;
> +    uint64_t section_size;
> +    hwaddr section_offset;
> +    hwaddr size = 0;
> +
> +    while (len) {
> +        section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
> +                                     bar_offset, len);
> +
> +        if (!section.mr) {
> +            warn_report("vfu: invalid address 0x%"PRIx64"", bar_offset);
> +            return size;
> +        }
> +
> +        section_mr = section.mr;
> +        section_offset = section.offset_within_region;
> +        section_size = int128_get64(section.size);
> +
> +        if (is_write && section_mr->readonly) {
> +            warn_report("vfu: attempting to write to readonly region in "
> +                        "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
> +                        pci_bar, bar_offset,
> +                        (bar_offset + section_size));
> +            memory_region_unref(section_mr);
> +            return size;
> +        }
> +
> +        if (vfu_object_mr_rw(section_mr, ptr, section_offset,
> +                             section_size, is_write)) {
> +            warn_report("vfu: failed to %s "
> +                        "[0x%"PRIx64" - 0x%"PRIx64"] in bar %d",
> +                        is_write ? "write to" : "read from", bar_offset,
> +                        (bar_offset + section_size), pci_bar);
> +            return size;

Missing memory_region_unref(section_mr).

--aY0zdnoP99Zn1rmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmcl4ACgkQnKSrs4Gr
c8hhsggAvYUNV+sYEgOHsQ9wdn956Nlhy+LHUtKqwuwOm2Hxg8YgmScDni5xOR+Q
h1bdqyjs1F5AAxi/3u/xiW5C/wBrX/cPgcdxdtNsqlRsxHPcFV1sFNyTSoZzLbiS
R292/a5nAAIRZyMSYTUXb5a7bC17O69B3mTNf6NgNyOO83nrO/pCIbyk3tG4hMOI
r7/Cn195bu9/D5OBbr68hSlyX140HjkJQhjoC6bJ070xhCrpBfZ6EXrmWaDgmh+P
2WglsmqDL9/L7WOoGbIQYxDXplVPVTwjb+qzoZ0y5tFF9JeXyLgXb91eAy3ua2Mw
Lg9h7DPhs68pQtU5w2hju5NrqDbawQ==
=3dlA
-----END PGP SIGNATURE-----

--aY0zdnoP99Zn1rmU--


