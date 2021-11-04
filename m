Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE0A445678
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:39:22 +0100 (CET)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miepl-0003KA-0M
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mieoU-0002TM-1l
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mieoQ-0003rY-Ak
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 11:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636040276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/laSJvSKilegPANgFFLwwJhIIcoXca+zhHhgcJGOxXQ=;
 b=TH1o7X2s4bymIZucmbt1NBek3eDEgNBYy6cOiG6dia9ehPFApwVyUJ1yxSyqU63C1aU8QJ
 bWC7kZ9MsZjayxWnudxK6UrtudRzriKqWOBIVqkDSSH2JtZ/ur2ESb8Nt139sjQr83E26J
 Sw4JdVZX7CmY4/AVZFSCamZK3IMddqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-LemAY0vCNLikkKKM_eagSQ-1; Thu, 04 Nov 2021 11:37:53 -0400
X-MC-Unique: LemAY0vCNLikkKKM_eagSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 644A987D545;
 Thu,  4 Nov 2021 15:37:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4149767860;
 Thu,  4 Nov 2021 15:37:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9CB3C11380A7; Thu,  4 Nov 2021 16:37:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v8 4/8] qmp: add QMP command x-debug-virtio-status
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-5-git-send-email-jonah.palmer@oracle.com>
Date: Thu, 04 Nov 2021 16:37:14 +0100
In-Reply-To: <1635334909-31614-5-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Wed, 27 Oct 2021 07:41:45 -0400")
Message-ID: <874k8s9bkl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command shows the status of a VirtIODevice, including
> its corresponding vhost device status (if active).
>
> Next patch will improve output by decoding feature bits, including
> vhost device's feature bits (backend, protocol, acked, and features).
> Also will decode status bits of a VirtIODevice.
>
> Next patch will also suppress the vhost device field from displaying
> if no vhost device is active for a given VirtIODevice.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---

[...]

> diff --git a/qapi/virtio.json b/qapi/virtio.json
> index 4490c2c..656a26f 100644
> --- a/qapi/virtio.json
> +++ b/qapi/virtio.json
> @@ -65,3 +65,258 @@
>  ##
>  
>  { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
> +
> +##
> +# @VirtioStatusEndianness:
> +#
> +# Enumeration of endianness for VirtioDevice
> +#
> +# Since: 6.2
> +##
> +
> +{ 'enum': 'VirtioStatusEndianness',
> +  'data': [ 'unknown', 'little', 'big' ]
> +}
> +
> +##
> +# @VhostStatus:
> +#
> +# Information about a vhost device. This information will only be
> +# displayed if the vhost device is active.
> +#
> +# @n-mem-sections: vhost_dev n_mem_sections
> +#
> +# @n-tmp-sections: vhost_dev n_tmp_sections
> +#
> +# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
> +#        by the vhost device.
> +#
> +# @vq-index: vhost_dev vq_index
> +#
> +# @features: vhost_dev features
> +#
> +# @acked-features: vhost_dev acked_features
> +#
> +# @backend-features: vhost_dev backend_features
> +#
> +# @protocol-features: vhost_dev protocol_features
> +#
> +# @max-queues: vhost_dev max_queues
> +#
> +# @backend-cap: vhost_dev backend_cap
> +#
> +# @log-enabled: vhost_dev log_enabled flag
> +#
> +# @log-size: vhost_dev log_size
> +#
> +# Since: 6.2
> +#
> +##
> +
> +{ 'struct': 'VhostStatus',
> +    'data': {
> +        'n-mem-sections': 'int',
> +        'n-tmp-sections': 'int',

Odd indentation.  Better

   { 'struct': 'VhostStatus',
     'data': {
         'n-mem-sections': 'int',
         'n-tmp-sections': 'int',

or

   { 'struct': 'VhostStatus',
     'data': { 'n-mem-sections': 'int',
               'n-tmp-sections': 'int',

More of the same below, and possibly in other patches.  I'm not going to
point it out again.

> +        'nvqs': 'uint32',
> +        'vq-index': 'int',
> +        'features': 'uint64',
> +        'acked-features': 'uint64',
> +        'backend-features': 'uint64',
> +        'protocol-features': 'uint64',
> +        'max-queues': 'uint64',
> +        'backend-cap': 'uint64',
> +        'log-enabled': 'bool',
> +        'log-size': 'uint64'
> +    }
> +}

I can't tell whether these are all needed.  Got to trust virtio experts
there.

I'm not checking the schema types match the data sources' C types.  I
hope you did :)

More of the same below, and possibly in other patches.  I'm not going to
point it out again.

> +
> +##
> +# @VirtioStatus:
> +#
> +# Full status of the virtio device with most VirtIODevice members.
> +# Also includes the full status of the corresponding vhost device
> +# if the vhost device is active.
> +#
> +# @name: VirtIODevice name
> +#
> +# @device-id: VirtIODevice ID
> +#
> +# @vhost-started: VirtIODevice vhost_started flag
> +#
> +# @guest-features: VirtIODevice guest_features
> +#
> +# @host-features: VirtIODevice host_features
> +#
> +# @backend-features: VirtIODevice backend_features
> +#
> +# @device-endian: VirtIODevice device_endian
> +#
> +# @num-vqs: VirtIODevice virtqueue count. This is the number of active
> +#           virtqueues being used by the VirtIODevice.
> +#
> +# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
> +#          FEATURES_OK, DRIVER, etc.)
> +#
> +# @isr: VirtIODevice ISR
> +#
> +# @queue-sel: VirtIODevice queue_sel
> +#
> +# @vm-running: VirtIODevice vm_running flag
> +#
> +# @broken: VirtIODevice broken flag
> +#
> +# @disabled: VirtIODevice disabled flag
> +#
> +# @use-started: VirtIODevice use_started flag
> +#
> +# @started: VirtIODevice started flag
> +#
> +# @start-on-kick: VirtIODevice start_on_kick flag
> +#
> +# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
> +#
> +# @bus-name: VirtIODevice bus_name
> +#
> +# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
> +#
> +# @vhost-dev: corresponding vhost device info for a given VirtIODevice
> +#
> +# Since: 6.2
> +#
> +##
> +
> +{ 'struct': 'VirtioStatus',
> +    'data': {
> +        'name': 'str',
> +        'device-id': 'uint16',
> +        'vhost-started': 'bool',
> +        'guest-features': 'uint64',
> +        'host-features': 'uint64',
> +        'backend-features': 'uint64',
> +        'device-endian': 'VirtioStatusEndianness',
> +        'num-vqs': 'int',
> +        'status': 'uint8',
> +        'isr': 'uint8',
> +        'queue-sel': 'uint16',
> +        'vm-running': 'bool',
> +        'broken': 'bool',
> +        'disabled': 'bool',
> +        'use-started': 'bool',
> +        'started': 'bool',
> +        'start-on-kick': 'bool',
> +        'disable-legacy-check': 'bool',
> +        'bus-name': 'str',
> +        'use-guest-notifier-mask': 'bool',
> +        'vhost-dev': 'VhostStatus'
> +    }
> +}
> +
> +##
> +# @x-debug-virtio-status:
> +#
> +# Poll for a comprehensive status of a given virtio device
> +#
> +# @path: Canonical QOM path of the VirtIODevice
> +#
> +# Returns: VirtioStatus of the virtio device
> +#
> +# Since: 6.2
> +#
> +# Examples:
> +#
> +# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
> +#
> +# -> { "execute": "x-debug-virtio-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral/crypto0/virtio-backend"
> +#      }
> +#    }
> +# <- { "return": {
> +#          "device-endian": "little",
> +#          "bus-name": "",
> +#          "disable-legacy-check": false,
> +#          "name": "virtio-crypto",
> +#          "started": true,
> +#          "device-id": 20,
> +#          "vhost-dev": {
> +#               "n-tmp-sections": 0,
> +#               "n-mem-sections": 0,
> +#               "max-queues": 0,
> +#               "backend-cap": 0,
> +#               "log-size": 0,
> +#               "backend-features": 0,
> +#               "nvqs": 0,
> +#               "protocol-features": 0,
> +#               "vq-index": 0,
> +#               "log-enabled": false,
> +#               "acked-features": 0,
> +#               "features": 0
> +#          },
> +#          "backend-features": 0,
> +#          "start-on-kick": false,
> +#          "isr": 1,
> +#          "broken": false,
> +#          "status": 15,
> +#          "num-vqs": 2,
> +#          "guest-features": 5100273664,
> +#          "host-features": 6325010432,
> +#          "use-guest-notifier-mask": true,
> +#          "vm-running": true,
> +#          "queue-sel": 1,
> +#          "disabled": false,
> +#          "vhost-started": false,
> +#          "use-started": true
> +#      }
> +#    }
> +#
> +# 2. Poll for the status of virtio-net (vhost-net is active)
> +#
> +# -> { "execute": "x-debug-virtio-status",
> +#      "arguments": {
> +#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
> +#      }
> +#    }
> +# <- { "return": {
> +#          "device-endian": "little",
> +#          "bus-name": "",
> +#          "disabled-legacy-check": false,
> +#          "name": "virtio-net",
> +#          "started": true,
> +#          "device-id": 1,
> +#          "vhost-dev": {
> +#               "n-tmp-sections": 4,
> +#               "n-mem-sections": 4,
> +#               "max-queues": 1,
> +#               "backend-cap": 2,
> +#               "log-size": 0,
> +#               "backend-features": 0,
> +#               "nvqs": 2,
> +#               "protocol-features": 0,
> +#               "vq-index": 0,
> +#               "log-enabled": false,
> +#               "acked-features": 5100306432,
> +#               "features": 13908344832
> +#          },
> +#          "backend-features": 6337593319,
> +#          "start-on-kick": false,
> +#          "isr": 1,
> +#          "broken": false,
> +#          "status": 15,
> +#          "num-vqs": 3,
> +#          "guest-features": 5111807911,
> +#          "host-features": 6337593319,
> +#          "use-guest-notifier-mask": true,
> +#          "vm-running": true,
> +#          "queue-sel": 2,
> +#          "disabled": false,
> +#          "vhost-started": true,
> +#          "use-started": true
> +#      }
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-virtio-status',
> +  'data': { 'path': 'str' },
> +  'returns': 'VirtioStatus'
> +}

Unstable commands now need to be marked with

     'features': [ 'unstable' ]

If you do that, the QAPI generator will demand documentation.  So add
   
   # Features:
   # @unstable: This command is meant for debugging.

You may want to grep for examples.  See also commit 9fb49daabf "qapi:
Mark unstable QMP parts with feature 'unstable'".

Hmm, this command starts with x-debug-virtio-, wheras the one added in
the previous commit starts with x-debug-query-virtio-.

By conventions, commands that just return information on FOO are named
query-FOO.  I recommend an x-query-virtio- prefix for your query
commands.  We can leave their purpose (debug) to documentation.


