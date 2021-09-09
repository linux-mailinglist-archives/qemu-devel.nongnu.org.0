Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD540462E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:29:34 +0200 (CEST)
Received: from localhost ([::1]:33726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEV3-0005kA-SC
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOET0-0004PY-Ac
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOESy-0006d7-A9
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631172443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q0Uqqw0vMQHQ0jthcPNOutKIY73nfeO1L0aqWtO2toE=;
 b=i/7tagwaMKR+OJWT8n0zMrQJwK7xMUSdlCVCdAZSHH4Alb9MTtXdrvN6P+PPJON0EvYvdi
 58OyBE+jdS8lvDObKsnst7yJHLiqmWDO0vx99ydfRuCACr0lcQlB7t+8x5XI3GBjqRJTZw
 Bzbfwh95UFKDX3zkg7gzYU6jPIrqhls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-QPQetmxuNleoX6mgTbA1SQ-1; Thu, 09 Sep 2021 03:27:22 -0400
X-MC-Unique: QPQetmxuNleoX6mgTbA1SQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C39880196C;
 Thu,  9 Sep 2021 07:27:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A71B6A902;
 Thu,  9 Sep 2021 07:27:16 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:27:16 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 06/11] vfio-user: handle PCI config space
 accesses
Message-ID: <YTm3VGiIeRh3+JBs@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <5f371fa15eb347317ce9ce56a329a24c713129e0.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5f371fa15eb347317ce9ce56a329a24c713129e0.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nlEl5rc/0XC4+xor"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--nlEl5rc/0XC4+xor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 01:53:25PM -0400, Jagannathan Raman wrote:
> +static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
> +                                     size_t count, loff_t offset,
> +                                     const bool is_write)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint32_t pci_access_width = sizeof(uint32_t);
> +    size_t bytes = count;
> +    uint32_t val = 0;
> +    char *ptr = buf;
> +    int len;
> +
> +    while (bytes > 0) {
> +        len = (bytes > pci_access_width) ? pci_access_width : bytes;
> +        if (is_write) {
> +            memcpy(&val, ptr, len);
> +            pci_default_write_config(PCI_DEVICE(o->pci_dev),
> +                                     offset, val, len);
> +            trace_vfu_cfg_write(offset, val);
> +        } else {
> +            val = pci_default_read_config(PCI_DEVICE(o->pci_dev),
> +                                          offset, len);
> +            memcpy(ptr, &val, len);

pci_default_read_config() returns a host-endian 32-bit value. This code
looks wrong because it copies different bytes on big- and little-endian
hosts.

> +            trace_vfu_cfg_read(offset, val);
> +        }

Why call pci_default_read/write_config() directly instead of
pci_dev->config_read/write()?

--nlEl5rc/0XC4+xor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5t1QACgkQnKSrs4Gr
c8hgiQf8DhKk0Nhh3cJ5zax1D+KjFJm7sNeDO5n1qCdemjZl+lWh/1z7B7M/llCq
NBEW0LIlSi/JP5M4GOnW/Lp39EmAjfoK98vIxoKPHowxUoYxQdKJ9NWsEFKLmFkO
ooVpJnt1Ju2+zIiuKepKQSIEbl2yYLHkC/PziZWX99q6i+it1HOYC726KUFj0lfP
iJHTfP1kFhhTwRNRumAFxBQEWl2IWV0Ojos2HZXg7x4Z9bNy6bCt8IEESiiC4mWf
v9hGfTl16hvQRuPyQikN3u2ldeFG+HF1pbS8KPaBjNkFkq1L4osLWNPInOFBqTLI
ZqeEQOvjtuPERUHXQfQrO9YSOcFgAQ==
=TmZl
-----END PGP SIGNATURE-----

--nlEl5rc/0XC4+xor--


