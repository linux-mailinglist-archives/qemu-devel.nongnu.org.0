Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 093113240ED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:49:15 +0100 (CET)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwPa-0007F0-30
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEwNv-0006Rw-H2
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:47:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lEwNt-000744-RC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614181649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XlRZceeU5sDQFdt6bz3pb/nB1UyyLc0dL0K07Ddp3Kw=;
 b=f9B58iC9G5YhiDFUHDNmb1mlp4T8A5TZdG8Auv5m96xMBCajaLnFsfg4jJ49rMU4x63lg4
 wjCXTQ3ZNe80eN9CIYfKFLb65+Z3xSEaQaeMiG3OixEZ6FNvJa6EXfiR0mZHba97Nq6jXu
 5qJhDqdiYqs+1Zwg3pbN6OseY9FZCQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-9LC8t-jqN-25HBasDDR2Kw-1; Wed, 24 Feb 2021 10:47:25 -0500
X-MC-Unique: 9LC8t-jqN-25HBasDDR2Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B901D7FB4;
 Wed, 24 Feb 2021 15:21:42 +0000 (UTC)
Received: from work-vm (ovpn-115-71.ams2.redhat.com [10.36.115.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA031001281;
 Wed, 24 Feb 2021 15:21:39 +0000 (UTC)
Date: Wed, 24 Feb 2021 15:21:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 16/31] qapi/qom: Add ObjectOptions for
 confidential-guest-support
Message-ID: <YDZvAGrnlhPzodbU@work-vm>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-17-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-17-kwolf@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> This adds a QAPI schema for the properties of the objects implementing
> the confidential-guest-support interface.
> 
> pef-guest and s390x-pv-guest don't have any properties, so they only
> need to be added to the ObjectType enum without adding a new branch to
> ObjectOptions.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/qom.json | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index e7184122e9..d5f68b5c89 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -633,6 +633,38 @@
>    'base': 'RngProperties',
>    'data': { '*filename': 'str' } }
>  
> +##
> +# @SevGuestProperties:
> +#
> +# Properties for sev-guest objects.
> +#
> +# @sev-device: SEV device to use (default: "/dev/sev")
> +#
> +# @dh-cert-file: guest owners DH certificate (encoded with base64)
> +#
> +# @session-file: guest owners session parameters (encoded with base64)
> +#
> +# @policy: SEV policy value (default: 0x1)
> +#
> +# @handle: SEV firmware handle (default: 0)
> +#
> +# @cbitpos: C-bit location in page table entry (default: 0)
> +#
> +# @reduced-phys-bits: number of bits in physical addresses that become
> +#                     unavailable when SEV is enabled
> +#
> +# Since: 2.12
> +##
> +{ 'struct': 'SevGuestProperties',
> +  'data': { '*sev-device': 'str',
> +            '*dh-cert-file': 'str',
> +            '*session-file': 'str',
> +            '*policy': 'uint32',
> +            '*handle': 'uint32',
> +            '*cbitpos': 'uint32',
> +            'reduced-phys-bits': 'uint32' },
> +  'if': 'defined(CONFIG_SEV)' }
> +
>  ##
>  # @ObjectType:
>  #
> @@ -661,12 +693,15 @@
>      'memory-backend-file',
>      'memory-backend-memfd',
>      'memory-backend-ram',
> +    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
>      'pr-manager-helper',
>      'rng-builtin',
>      'rng-egd',
>      'rng-random',
>      'secret',
>      'secret_keyring',
> +    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
> +    's390-pv-guest',

If pef-guest is conditional on PSERIES< shouldn't this be dependent on
s390?

Dave

>      'throttle-group',
>      'tls-creds-anon',
>      'tls-creds-psk',
> @@ -716,6 +751,8 @@
>        'rng-random':                 'RngRandomProperties',
>        'secret':                     'SecretProperties',
>        'secret_keyring':             'SecretKeyringProperties',
> +      'sev-guest':                  { 'type': 'SevGuestProperties',
> +                                      'if': 'defined(CONFIG_SEV)' },
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


