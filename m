Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE4F36EB30
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:13:39 +0200 (CEST)
Received: from localhost ([::1]:49038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6U6-0001Yo-KH
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc6T7-0000y9-L2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lc6T3-000360-8o
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619701951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4e6mVDly0A+FZEn+2npJhQ9kqEvnMtcmkS0psnrqq6Q=;
 b=RRtn0ZiReOGuCOD8s7c8xiGLXYtpDSMQFeQi0GgfV/Tz38lGmPzKpbqKa1ykEjiWDxH5Kt
 ejqZX1MjZKNQKkEJunZAbDRq6pJ6vCw4iD9sh02j5XfQyCnY7GQHzpIOt5R5uuTBgBmFqZ
 IFLYl6cHIj2MeZc+a9mGCFCpsaxZJF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-fls2O7LCPUOho_R0KaYeQQ-1; Thu, 29 Apr 2021 09:12:30 -0400
X-MC-Unique: fls2O7LCPUOho_R0KaYeQQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F158418982AB;
 Thu, 29 Apr 2021 13:12:27 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E7D319EF1;
 Thu, 29 Apr 2021 13:12:18 +0000 (UTC)
Date: Thu, 29 Apr 2021 15:12:17 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YIqwsUAGEvfazbvZ@merkur.fritz.box>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.04.2021 um 14:40 hat Gerd Hoffmann geschrieben:
>   Hi,
> 
> > For this to go away, I'd rather have something like the -nic option that
> > provides an easy way to set up the front end and back end.
> > 
> > In other words you would do something like -audiohw
> > <audiodev-args>,model=xxx and it gets desugared automatically to either
> > 
> >    -audiodev <audiodev-args>,id=foo -device devname,audiodev=xxx
> > 
> > or
> > 
> >    -audiodev <audiodev-args>,id=foo -M propname=foo
> 
> Suggestions how to do that in a clean way?
> Given that -audiodev is qapi-based I tried it this way:
> 
> --- a/qapi/audio.json
> +++ b/qapi/audio.json
> @@ -419,3 +419,22 @@
>      'sdl':       'AudiodevSdlOptions',
>      'spice':     'AudiodevGenericOptions',
>      'wav':       'AudiodevWavOptions' } }
> +
> +##
> +# @AudioDevice:
> +#
> +# TODO
> +##
> +{ 'enum': 'AudioDevice',
> +  'data': [ 'pcspk', 'ac97', 'hda' ] }
> +
> +##
> +# @AudioConfig:
> +#
> +# TODO
> +##
> +{ 'struct': 'AudioConfig',
> +  'base': 'Audiodev',
> +  'data': {
> +    'model': 'AudioDevice'
> +}}
> 
> But qemu doesn't like the schema:
> qapi/audio.json: In struct 'AudioConfig':
> qapi/audio.json:436: 'base' requires a struct type, union type 'Audiodev' isn't
> 
> We could easily support the case that no additional options are
> specified, like this:
> 
> +{ 'struct': 'AudioConfig',
> +  'data': {
> +    'driver': 'AudiodevDriver',
> +    'model': 'AudioDevice'
> +}}
> 
> But then you have to switch to the long form as soon as you want
> specify any audiodev config option.  Maybe that is ok, dunno how
> much configuration options -nic supports.

Good support for this in QAPI sounds hard because you will want to use
the same Audiodev C type for both options. I think the naive
implementation for using unions as a base would end up creating new
C types.

Another option might be that you just nest things:

{ 'struct': 'AudioConfig',
  'data': {
      'model': 'AudioDevice',
      'backend': 'Audiodev' } }

Possibly instead of 'model' on the top level, you'll actually want to
nest there, too, and accept device properties.

If or when I finally get QAPI aliases merged, we can make this look nice
on the command line again by simply mapping everything to the top level
so that you don't necessarily need to use dotted keys like you would
initially, e.g. -audio backend.driver=sdl,model=hda could be optionally
reduced to -audio driver=sdl,model=hda.

Kevin


