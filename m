Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C864339BA6E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:02:09 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAOm-0000XI-RJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAMe-0007Kp-Uw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAMb-0005nm-GB
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622815191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=goZ3oPAz24i4DzCnWBsmLEuBXSTsxqsF5knRLtUTI54=;
 b=IvBV5EynvQuvN2PZ1+5Afuzu0bW2ZErk1eSq7HSHMVeWcnsmRvsU9Q1Rf92ROOPb0KWFzY
 EvLfTuMyeNxaAWcsi234MdOrYIMYXaK4rrdF/Oi1giXdQfIfCjGjLYkcTwQb+IfpvqHbNC
 rIIWKLmdBOd2d1eSVFv0C5pajTGpD9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-jrxGWPFjPhWL-JlcSn59xw-1; Fri, 04 Jun 2021 09:59:47 -0400
X-MC-Unique: jrxGWPFjPhWL-JlcSn59xw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3659B106BB2A;
 Fri,  4 Jun 2021 13:59:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CF405C1C5;
 Fri,  4 Jun 2021 13:59:25 +0000 (UTC)
Date: Fri, 4 Jun 2021 08:59:23 -0500
From: Eric Blake <eblake@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 08/22] cpr: QMP interfaces
Message-ID: <20210604135923.4tyhd2hoakhoz5qr@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-9-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-9-git-send-email-steven.sistare@oracle.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 07, 2021 at 05:25:06AM -0700, Steve Sistare wrote:
> cprsave calls cprsave().  Syntax:
>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>   { 'command': 'cprsave', 'data': { 'file': 'str', 'mode': 'CprMode' } }
> 
> cprload calls cprload().  Syntax:
>   { 'command': 'cprload', 'data': { 'file': 'str' } }
> 
> cprinfo returns a list of supported modes.  Syntax:
>   { 'struct': 'CprInfo', 'data': { 'modes': [ 'CprMode' ] } }
>   { 'command': 'cprinfo', 'returns': 'CprInfo' }
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---

> +++ b/qapi/cpr.json

> +##
> +# @CprMode:
> +#
> +# @reboot: checkpoint can be cprload'ed after a host kexec reboot.
> +#
> +# @restart: checkpoint can be cprload'ed after restarting qemu.
> +#
> +# Since: 6.0

We've missed 6.0; this and all other since tags should mention 6.1.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


