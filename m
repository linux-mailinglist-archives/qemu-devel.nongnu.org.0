Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E332AA66
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:31:56 +0100 (CET)
Received: from localhost ([::1]:38944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAkN-0001O2-DQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:31:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHALD-0004Pr-7Y
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lHALB-0000wL-Fx
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614711952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b/hEjVkG7Edi1NU8yEb9vyFqIoKf/FJ+6mFSTKG6zLc=;
 b=a/yGHVmPrqdgqzIz6IpOlzei9srgZCScQWlkJqftv9f2rw33Tn3UinCwumdfel2MuAr48b
 k6NQViHWYg4IOTpN2eee+qkW2kOstizXnLrcYV1aVIKPgQeUhhyZTqtCPsaVOdt/+UJa7a
 UDqz/MhxMqFYNfnxV2aQYo9mqbn12pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-sQlmTIQfOuC1BvH3okJZaQ-1; Tue, 02 Mar 2021 14:05:50 -0500
X-MC-Unique: sQlmTIQfOuC1BvH3okJZaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1C0B100CCC0;
 Tue,  2 Mar 2021 19:05:49 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C68A6F456;
 Tue,  2 Mar 2021 19:05:46 +0000 (UTC)
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e3b72b58-8dca-dade-f872-bee8303f075d@redhat.com>
Date: Tue, 2 Mar 2021 13:05:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302175524.1290840-3-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 11:55 AM, Daniel P. Berrangé wrote:
> Currently the -audiodev accepts any audiodev type regardless of what is
> built in to QEMU. An error only occurs later at runtime when a sound
> device tries to use the audio backend.
> 
> With this change QEMU will immediately reject -audiodev args that are
> not compiled into the binary. The QMP schema will also be introspectable
> to identify what is compiled in.

Nice!

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  audio/audio.c          | 16 +++++++++++++++
>  audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
>  audio/audio_template.h | 16 +++++++++++++++
>  qapi/audio.json        | 44 ++++++++++++++++++++++++++++++++----------
>  4 files changed, 106 insertions(+), 11 deletions(-)
> 

> +++ b/qapi/audio.json
> @@ -386,8 +386,24 @@
>  # Since: 4.0
>  ##
>  { 'enum': 'AudiodevDriver',
> -  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
> -            'sdl', 'spice', 'wav' ] }
> +  'data': [ 'none',
> +            { 'name': 'alsa',
> +              'if': 'defined(CONFIG_AUDIO_ALSA)' },
> +            { 'name': 'coreaudio',
> +              'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> +            { 'name': 'dsound',
> +              'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> +            { 'name': 'jack',
> +              'if': 'defined(CONFIG_AUDIO_JACK)' },
> +            { 'name': 'oss',
> +              'if': 'defined(CONFIG_AUDIO_OSS)' },
> +            { 'name': 'pa',
> +              'if': 'defined(CONFIG_AUDIO_PA)' },
> +            { 'name': 'sdl',
> +              'if': 'defined(CONFIG_AUDIO_SDL)' },
> +            { 'name': 'spice',
> +              'if': 'defined(CONFIG_SPICE)' },
> +            'wav' ] }

I'll trust that you compiled multiple times to test the various
interplays between options.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


