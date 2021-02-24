Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBE323F56
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:01:56 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvfn-0004EA-MW
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEvbv-0001zh-Eo
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lEvbs-0008RQ-8z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614178671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbKoo/93d8Krs0RnnhagxmHbFSq+0NiLdOzqxj6dNcY=;
 b=d3ssd+aoQOgSLNoGV3KdLPyXYgPCalnB0yChT6k0yv3WGo0rmki1CYnuOFebA8s5D1YOSs
 r2yLinyJFs0Jjbyut+/bhLDCnkvtY8aT75p3hpa7DWijqlpfbielxt4OSha3+AtREYqmKO
 O/n0Yih5iC3zyBKaeKma0wHPLMZSn9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-CVQhynBiPEOtKByAO_htbg-1; Wed, 24 Feb 2021 09:57:41 -0500
X-MC-Unique: CVQhynBiPEOtKByAO_htbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4937F1149980;
 Wed, 24 Feb 2021 14:27:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-142.ams2.redhat.com [10.36.115.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B56F19C71;
 Wed, 24 Feb 2021 14:27:00 +0000 (UTC)
Subject: Re: [PATCH 10/14] hw/scsi: remove 'scsi-disk' device
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-11-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <007eb811-6c4f-b456-2536-40dfb254ff14@redhat.com>
Date: Wed, 24 Feb 2021 15:26:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-11-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> The 'scsi-hd' and 'scsi-cd' devices provide suitable alternatives.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   docs/system/deprecated.rst       |  9 -----
>   docs/system/removed-features.rst |  6 ++++
>   hw/i386/pc.c                     |  1 -
>   hw/scsi/scsi-disk.c              | 62 --------------------------------
>   hw/sparc64/sun4u.c               |  1 -
>   scripts/device-crash-test        |  1 -
>   tests/qemu-iotests/051           |  2 --
>   tests/qemu-iotests/051.pc.out    | 10 ------
>   8 files changed, 6 insertions(+), 86 deletions(-)

I see some occurrances of "scsi-disk" in the config files in the 
docs/config/ directory, too ... I guess they should also be removed?

> diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
> index d7c27144ba..cda7df36e3 100644
> --- a/hw/sparc64/sun4u.c
> +++ b/hw/sparc64/sun4u.c
> @@ -749,7 +749,6 @@ static char *sun4u_fw_dev_path(FWPathProvider *p, BusState *bus,
>                                  DeviceState *dev)
>   {
>       PCIDevice *pci;
> -    int bus_id;
>   
>       if (!strcmp(object_get_typename(OBJECT(dev)), "pbm-bridge")) {
>           pci = PCI_DEVICE(dev);

This lonely hunk should be squashed into the previous (ide-disk) patch instead.

  Thomas


