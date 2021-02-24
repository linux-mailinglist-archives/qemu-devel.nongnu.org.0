Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE99323F22
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:24:23 +0100 (CET)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEv5S-00072R-Im
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEv3z-0006Bq-Qi
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEv3y-0001PI-9O
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614176569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4lt/looMaorLMRoiPJ2uWyE+cTp8PYc3N6O5aQZfunk=;
 b=MHiF/44fhon+0Wizq2wptvw2aNE/+jrRloYi7Axf2+qnIX8nppG71JCLEnAF7/buRT+bL7
 SPmU4o/vduPF+UZaCZi1UyygijJaB1XUjslUsfdh6X5DUUuROMTl00lSS9DKuNMPlAYSFi
 ueIeh+hdsuJ2+qmpKfxrqGyRXI0ubo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-juvjvvZwP_aNxdrl8NI_Dg-1; Wed, 24 Feb 2021 09:22:45 -0500
X-MC-Unique: juvjvvZwP_aNxdrl8NI_Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CFD594EC1A;
 Wed, 24 Feb 2021 13:37:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-142.ams2.redhat.com [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADB805D6D3;
 Wed, 24 Feb 2021 13:36:47 +0000 (UTC)
Subject: Re: [PATCH 01/14] ui, monitor: remove deprecated VNC ACL option and
 HMP commands
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-2-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c82447de-e268-4237-248f-cb9017798b09@redhat.com>
Date: Wed, 24 Feb 2021 14:36:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/02/2021 14.11, Daniel P. Berrangé wrote:
> The VNC ACL concept has been replaced by the pluggable "authz" framework
> which does not use monitor commands.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/system/deprecated.rst       |  16 ---
>   docs/system/removed-features.rst |  13 +++
>   hmp-commands.hx                  |  76 -------------
>   monitor/misc.c                   | 187 -------------------------------
>   ui/vnc.c                         |  38 -------
>   5 files changed, 13 insertions(+), 317 deletions(-)

If I run:

  grep -r vnc.*acl *

I also see some lines in tests/check-block-qdict.c ... are they related and 
should be removed, too?

Apart from that, patch looks fine to me:
Reviewed-by: Thomas Huth <thuth@redhat.com>


