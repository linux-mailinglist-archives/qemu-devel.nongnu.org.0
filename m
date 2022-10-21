Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9060730D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:56:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnpH-0003jE-HH
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:56:25 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olndt-0002Cw-5y
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olndR-0001sk-2C
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olndP-0000g0-Gi
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666341846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgtnC9HGsNuLdyZttExUaJKDQyO65ihPNHSrfyWjW4k=;
 b=Cgv0eDtpdgc+Ds5CmZdp9WFZoFpbWCp7mVGmz/nO11DMCyzS8DyDQomoc8G4JgQFJq3Ive
 LV/I5UQbgSAUmXiJk4v2OgD9uP3L8hdBIYbZpMG48ZdehS8OHg+B423Gv/KPKwa8Uuo9sM
 ADS7RxNSA5rxUr4pnP3EW2fqgDSJGIg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-JhDNzyA0NCmrbVyobckvmQ-1; Fri, 21 Oct 2022 04:44:04 -0400
X-MC-Unique: JhDNzyA0NCmrbVyobckvmQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 q14-20020a05620a0d8e00b006ef0350dae1so2817793qkl.12
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgtnC9HGsNuLdyZttExUaJKDQyO65ihPNHSrfyWjW4k=;
 b=2wpNBdY0L0fjwBui+UdD0iTA2s672V98g7AfrjzZE0zMlnqalNuEkOqt85Or009AkT
 mYlzGjid2VqiQAV9ZQwx0Ja/MPwFfnomW0Uka8UjxVl1Zt1qEjg2K7C9Kb2qbcHrAYSz
 WmV2Me+OD2MK6oMGAgibx2iFtCpxP6qrPaADoymqXA/PHeS83yligkn4V9k15NtFqAhz
 3p5bPx+XJ1yTitgc911cWaiGJz4rvFtACeVuYyvRyzlCTQYpwDe/v2ki0t01wLp8AGbR
 ommDdj7aL30JsyUarFd39ZDKNXDO8qTP5sOLrxNlj81a/wNuJrvz4RpIkZiwFIxFhYod
 5B+Q==
X-Gm-Message-State: ACrzQf3iuaLITs6hyec6ir2RDBIKzFWd2Yywi3geEDHr6Y4DXh0m0iPd
 MLkgmgHJhiY9ysKeKf+cEiEtJ1lUN0paRLGdRcRYRS7t/qNMXXWMnJOR3uHGSwYammu7Sqf93JC
 gBopkNXAPV+FDN84=
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id
 8-20020a0562140d0800b004b17127f615mr15634947qvh.92.1666341844227; 
 Fri, 21 Oct 2022 01:44:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6JJsnzxeixtY63ogvNQl94ky4fV5fZcMZxPyI0H491y9Vc3Mp02kLYSv2y4rUpZ7nrpzuTvg==
X-Received: by 2002:a05:6214:d08:b0:4b1:7127:f615 with SMTP id
 8-20020a0562140d0800b004b17127f615mr15634924qvh.92.1666341843987; 
 Fri, 21 Oct 2022 01:44:03 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 f7-20020ac84707000000b003431446588fsm7668132qtp.5.2022.10.21.01.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 01:44:03 -0700 (PDT)
Message-ID: <b595c7fe-bf31-7cc1-e7ed-cad390875bad@redhat.com>
Date: Fri, 21 Oct 2022 10:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
 <87h6zx4qsk.fsf@pond.sub.org>
 <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CACGkMEsnq2pFaLwBpzpCSiD8jZrx77SUTn_6JhGG9jKe1PJkwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/22 08:50, Jason Wang wrote:
> On Fri, Oct 21, 2022 at 2:46 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Jason Wang <jasowang@redhat.com> writes:
>>
>>> I've queued this version and will send pull requests shortly.
>>>
>>> Any future comment we can do patches on top.
>>
>> Please give Laurent and me a few hours to try to improve PATCH 17's
>> commit message.  Which you could then integrate without a respin.
> 

I'm going to send a new version, only patches 15 and 17 change.
I moved some changes from PATCH 17 to 15 as asked by Markus,
I have updated the commit message for patch 17:

     net: stream: add QAPI events to report connection state

     The netdev reports NETDEV_STREAM_CONNECTED event when the backend
     is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.

     The NETDEV_STREAM_CONNECTED event includes the destination address.

     This allows a system manager like libvirt to detect when the server
     fails.

     For instance with passt:

     { 'execute': 'qmp_capabilities' }
     { "return": { } }
     { "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
         "event": "NETDEV_STREAM_CONNECTED",
         "data": { "netdev-id": "netdev0",
             "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }

     [killing passt here]

     { "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
         "event": "NETDEV_STREAM_DISCONNECTED",
         "data": { "netdev-id": "netdev0" } }

Thanks,
Laurent


