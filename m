Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353A5524C3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:43:03 +0200 (CEST)
Received: from localhost ([::1]:53834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NIc-00040s-Kv
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3M4c-00050U-7U
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o3M4Y-0006YW-FE
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655749464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9s/rc7mx2lBl6+KDikkz/mD8342YzCqLpmcb5HZmpk=;
 b=cH1aN9C600eSu72oQkEuHEJ+bqTGZIR50Avei0zSUEgpG59xmQffM91Pt4DM2i3/vi44NZ
 GVPoRVrDGpAvjPNve4Xsk8k4b2/Ly4p+EzSRXKSht6J2lWYXC6Ay+I59dzOOXxe8TI6Ml9
 eP+UIlNqV13Cghc5wmvBPEQoZDHjHIc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-74PWyRFJOcyr4Rls8sJMjA-1; Mon, 20 Jun 2022 14:24:23 -0400
X-MC-Unique: 74PWyRFJOcyr4Rls8sJMjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so7226328wmq.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 11:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=h9s/rc7mx2lBl6+KDikkz/mD8342YzCqLpmcb5HZmpk=;
 b=peUtKyJHwmEdB/mimME5o0cDk7zT08UbB5S1lp3jcmvCLuwzikYvlZX1NlDaWVQss4
 YqeHeEn03lA7ff9xVR4B5f9mu5IwM+HF1kDAPbc9G9A4SOpvfzUPJf8HrHO4IHng29C1
 hausCoSc3T53b6hsKN16Bm4f+mbFqy0Srb5i8M8YRC/rd0dI4x7EuLurt6Ah8XWMCzP0
 wZp8LPryrbAYegCR2BD1VoxKSUenlaX90a+Qq8EUs/t8npos0l9fgmY/jueKqLrr3mir
 DtSw32c99a3PxF+e4p/YUkgOn4PwgAOsP9L0zKAOiZkozavFp2FcB4gbG5O5eYLJ8j4U
 ABsQ==
X-Gm-Message-State: AJIora+FQV0pHEcO1CT/QINqx++lgOhzvHxUhG/EP/qXl/ZBPZionmjK
 IibueV0Jpie+c515Mj5DBx4UMUkC9pMjUM4fZ0iU7eF83iAIYiHjrAq3w5b8MRsstREoP9MHB3O
 R9Lm5WOV/WMREQ/c=
X-Received: by 2002:a5d:64c4:0:b0:219:b73f:48a7 with SMTP id
 f4-20020a5d64c4000000b00219b73f48a7mr23849294wri.180.1655749462685; 
 Mon, 20 Jun 2022 11:24:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vCH4XlK0ydH0QJxynr51QaYe1HC8Gj6Ro/+bPYwyTpxPPo59pRKThE305n3o2oQyjalF+URA==
X-Received: by 2002:a5d:64c4:0:b0:219:b73f:48a7 with SMTP id
 f4-20020a5d64c4000000b00219b73f48a7mr23849271wri.180.1655749462362; 
 Mon, 20 Jun 2022 11:24:22 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 o4-20020adfcf04000000b0020ff877cfbdsm11332477wrj.87.2022.06.20.11.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 11:24:21 -0700 (PDT)
Date: Mon, 20 Jun 2022 19:24:19 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [RFC PATCH v3 00/11] qapi: net: add unix socket type support to
 netdev backend
Message-ID: <YrC7U1XH0pGsn5Df@work-vm>
References: <20220620101828.518865-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220620101828.518865-1-lvivier@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> "-netdev socket" only supports inet sockets.
> 
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.
> 
> As discussed in:
> 
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com/
> 
> This series adds support of unix socket type using SocketAddress QAPI structure.
> 
> Two new netdev backends, "stream" and "dgram" are added, that are barely a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).

Had you considered a -netdev chardev?

Dave

> Some examples of CLI syntax:
> 
>   for TCP:
> 
>   -netdev stream,id=socket0,addr.type=inet,addr.host=localhost,addr.port=1234
>   -netdev stream,id=socket0,server=off,addr.type=inet,addr.host=localhost,addr.port=1234
> 
>   -netdev dgram,id=socket0,\
>           local.type=inet,local.host=localhost,local.port=1234,\
>           remote.type=inet,remote.host=localhost,remote.port=1235
> 
>   for UNIX:
> 
>   -netdev stream,id=socket0,addr.type=unix,addr.path=/tmp/qemu0
>   -netdev stream,id=socket0,server=off,addr.type=unix,addr.path=/tmp/qemu0
> 
>   -netdev dgram,id=socket0,\
>           local.type=unix,local.path=/tmp/qemu0,\
>           remote.type=unix,remote.path=/tmp/qemu1
> 
>   for FD:
> 
>   -netdev stream,id=socket0,addr.type=fd,addr.str=4
>   -netdev stream,id=socket0,server=off,addr.type=fd,addr.str=5
> 
>   -netdev dgram,id=socket0,local.type=fd,addr.str=4
> 
> v3:
>   - remove support of "-net" for dgram and stream. They are only
>     supported with "-netdev" option.
>   - use &error_fatal directly in net_client_inits()
>   - update qemu-options.hx
>   - move to QIO for stream socket
> 
> v2:
>   - use "stream" and "dgram" rather than "socket-ng,mode=stream"
>     and ""socket-ng,mode=dgram"
>   - extract code to bypass qemu_opts_parse_noisily() to
>     a new patch
>   - do not ignore EINVAL (Stefano)
>   - fix "-net" option
> 
> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> CC: Stefano Brivio <sbrivio@redhat.com>
> CC: Daniel P. Berrangé <berrange@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> 
> Laurent Vivier (10):
>   net: introduce convert_host_port()
>   net: remove the @errp argument of net_client_inits()
>   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
>   qapi: net: add stream and dgram netdevs
>   net: stream: add unix socket
>   net: dgram: make dgram_dst generic
>   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
>   net: dgram: add unix socket
>   qemu-sockets: introduce socket_uri()
>   net: stream: move to QIO
> 
> Stefano Brivio (1):
>   net: stream: Don't ignore EINVAL on netdev socket connection
> 
>  hmp-commands.hx        |   2 +-
>  include/net/net.h      |   3 +-
>  include/qemu/sockets.h |   4 +-
>  monitor/hmp-cmds.c     |  23 +-
>  net/clients.h          |   6 +
>  net/dgram.c            | 706 +++++++++++++++++++++++++++++++++++++++++
>  net/hub.c              |   2 +
>  net/meson.build        |   2 +
>  net/net.c              | 149 ++++++---
>  net/stream.c           | 371 ++++++++++++++++++++++
>  qapi/net.json          |  40 ++-
>  qemu-options.hx        |  12 +
>  softmmu/vl.c           |   5 +-
>  util/qemu-sockets.c    |  20 ++
>  14 files changed, 1277 insertions(+), 68 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
> 
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


