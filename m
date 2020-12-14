Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273EB2D945C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 09:54:34 +0100 (CET)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kojcm-0000jK-Np
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 03:54:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kojbo-0000Fs-D9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 03:53:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kojbm-0005y9-FV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 03:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607936009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2JkHBt/Qn8Mh98kUGXvjEiTASZ6F6UdGDDt+hvjGVTo=;
 b=Ha+OeYbTXmX9LqcxO7etrKgyejFfhWUuz/c3R29ynRsPzK7Ikx+/amX70JFcakaYAuH2mZ
 q2U8PvqvQ0AjfhjBQqULddOtiP1JaFrJer1nT93UIoxdYe/MLarwY4wIAWLW7Ezi8hMivp
 XSpbXYkokDvz/xljIpRwSROf9lj2G3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-ZOhbUYKfORitMDRBafdgtA-1; Mon, 14 Dec 2020 03:53:25 -0500
X-MC-Unique: ZOhbUYKfORitMDRBafdgtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B1DF195D560;
 Mon, 14 Dec 2020 08:53:24 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AFB695C1BB;
 Mon, 14 Dec 2020 08:53:22 +0000 (UTC)
Subject: Re: [PATCH for-6.0] qga/commands-posix: Send CCW address on s390x
 with the fsinfo data
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
References: <20201125105417.380317-1-thuth@redhat.com>
Message-ID: <19721a4f-d566-44d5-6eb6-ff892e5cb502@redhat.com>
Date: Mon, 14 Dec 2020 09:53:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125105417.380317-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/2020 11.54, Thomas Huth wrote:
> We need the CCW address on the libvirt side to correctly identify
> the disk, so add this information to the GuestDiskAddress on s390x.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1755075
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
>  qga/qapi-schema.json | 19 ++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index c089e38120..5aa5eff84f 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1029,6 +1029,38 @@ static bool build_guest_fsinfo_for_nonpci_virtio(char const *syspath,
>      return true;
>  }
>  
> +/*
> + * Store disk device info for CCW devices (s390x channel I/O devices).
> + * Returns true if information has been stored, or false for failure.
> + */
> +static bool build_guest_fsinfo_for_ccw_dev(char const *syspath,
> +                                           GuestDiskAddress *disk,
> +                                           Error **errp)
> +{
> +    unsigned int cssid, ssid, subchno, devno;
> +    char *p;
> +
> +    p = strstr(syspath, "/devices/css");
> +    if (!p || sscanf(p + 12, "%*x/%x.%x.%x/%*x.%*x.%x/",
> +                     &cssid, &ssid, &subchno, &devno) < 4) {
> +        g_debug("could not parse ccw device sysfs path: %s", syspath);
> +        return false;
> +    }
> +
> +    disk->has_ccw_address = true;
> +    disk->ccw_address = g_new0(GuestCCWAddress, 1);
> +    disk->ccw_address->cssid = cssid;
> +    disk->ccw_address->ssid = ssid;
> +    disk->ccw_address->subchno = subchno;
> +    disk->ccw_address->devno = devno;
> +
> +    if (strstr(p, "/virtio")) {
> +        build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
> +    }
> +
> +    return true;
> +}
> +
>  /* Store disk device info specified by @sysfs into @fs */
>  static void build_guest_fsinfo_for_real_device(char const *syspath,
>                                                 GuestFilesystemInfo *fs,
> @@ -1081,6 +1113,8 @@ static void build_guest_fsinfo_for_real_device(char const *syspath,
>  
>      if (strstr(syspath, "/devices/pci")) {
>          has_hwinf = build_guest_fsinfo_for_pci_dev(syspath, disk, errp);
> +    } else if (strstr(syspath, "/devices/css")) {
> +        has_hwinf = build_guest_fsinfo_for_ccw_dev(syspath, disk, errp);
>      } else if (strstr(syspath, "/virtio")) {
>          has_hwinf = build_guest_fsinfo_for_nonpci_virtio(syspath, disk, errp);
>      } else {
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 3b3d1d0bd9..8be84b56e9 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -846,6 +846,21 @@
>    'data': {'domain': 'int', 'bus': 'int',
>             'slot': 'int', 'function': 'int'} }
>  
> +##
> +# @GuestCCWAddress:
> +#
> +# @cssid: channel subsystem image id
> +# @ssid: subchannel set id
> +# @devno:  device number
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'GuestCCWAddress',
> +  'data': {'cssid': 'int',
> +           'ssid': 'int',
> +           'subchno': 'int',
> +           'devno': 'int'} }
> +
>  ##
>  # @GuestDiskAddress:
>  #
> @@ -856,6 +871,7 @@
>  # @unit: unit id
>  # @serial: serial number (since: 3.1)
>  # @dev: device node (POSIX) or device UNC (Windows) (since: 3.1)
> +# @ccw-address: CCW address on s390x (since: 6.0)
>  #
>  # Since: 2.2
>  ##
> @@ -863,7 +879,8 @@
>    'data': {'pci-controller': 'GuestPCIAddress',
>             'bus-type': 'GuestDiskBusType',
>             'bus': 'int', 'target': 'int', 'unit': 'int',
> -           '*serial': 'str', '*dev': 'str'} }
> +           '*serial': 'str', '*dev': 'str',
> +           '*ccw-address': 'GuestCCWAddress'} }
>  
>  ##
>  # @GuestDiskInfo:
> 

Ping!

Michael, any comments on this, or do you think that it ready to go?

 Thanks,
  Thomas


