Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8602F6028
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:39:02 +0100 (CET)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00xx-0003T1-IW
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l00wK-0002KN-Fx
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l00wI-0002Ax-Gm
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610624237;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=++9DjMX9o5Z/JLpkpf14KYSmndImEFJ33CI5QOzgt/c=;
 b=FMKfhkuxe0UwMiz+pRiMzFeDg1f/f3KOXwbOO/XPKYaKXEDUpTz0kvG9daIZPJ1/WEN+EL
 Ox/1WqLyRAaTfCeaxJeahUqylCfZtrOzXdOcof4+CNjoyFVTsJPKu2MwUaFWrsAZhRi72e
 X9wzyDgJTfSpmCauiTa0xJtfWlaxF+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-PjctkdvlOj-rXgtYcxQJ1Q-1; Thu, 14 Jan 2021 06:37:13 -0500
X-MC-Unique: PjctkdvlOj-rXgtYcxQJ1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCCDC107ACF7;
 Thu, 14 Jan 2021 11:37:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-77.ams2.redhat.com [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D332460C47;
 Thu, 14 Jan 2021 11:37:08 +0000 (UTC)
Date: Thu, 14 Jan 2021 11:37:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Luc Michel <luc.michel@greensocs.com>
Subject: Re: About creating machines on the command line
Message-ID: <20210114113706.GF1643043@redhat.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 sam.grove@sifive.com, armbru@redhat.com,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 richard.fuhler@sifive.com, edgar.iglesias@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 03:50:58PM +0100, Luc Michel wrote:
> Hi,
> 
> We would like to work on improving QEMU to be able to create custom machines
> from the command line. The goal here is to get feedback from the community
> and shape the future developments.
> 
> The use case mainly comes from people working with tools to customize their
> designs, such as SiFive Core Designer
> (https://scs.sifive.com/core-designer). This kind of tools may allow
> creation or customization of a whole SoC, from the number of cores, to the
> memory and IRQ mapping of peripherals etc.
> 
> The ultimate goal would be to be able to create any kind of machine on the
> command line. However we are aware that this is a substantial amount of
> changes in QEMU.
> 
> In its current state, QEMU allows for very limited customization of existing
> machines on the command line. We identified the following limitations (feel
> free to add to the list):
> 
>   - Most devices are not user creatable. Moreover, sysbus devices must be
> explicitly allowed by a machine to be creatable through `-device`,
> 
>   - Memory regions cannot be created on the command line,
> 
>   - Device MMIO regions cannot be mapped on a bus from the command line,
> 
>   - GPIOs and clocks cannot be wired from the command line,
> 
>   - CPUs are not sysbus devices (and not user-creatable). They need special
> care when creating them regarding system reset. Not being on a bus means
> that they must be reset manually on system reset. This is done in machines
> by registering a QEMU reset handler.
> 
>   - Machine specific boot code is usually hard-coded into the machine
> itself.  Some architectures (e.g. ARM) do factorize bootloader related code,
> but there is no standard way of doing that in QEMU.
> 
> We don't want to address all those limitations at once. We plan to start
> with the following scenario:
> 
>   - Start with a base machine that would handle CPU creation and bootloader
> stuff. Note that the "none" machine is probably not sufficient in its
> current shape. It does allow only one CPU and obviously does not handle the
> boot process.
> 
>   - Allow for this machine every sysbus devices we want to be user
> command-line creatable (and mark them user_creatable if needed)
> 
>   - Add command line options to create memory regions (probably ram ones at
> first)
> 
>   - Add command line options to map a memory region (including sysbus device
> MMIO regions) onto another (memory_region_add_subregion)
> 
>   - Add command line options to connect GPIOs and clocks.
> 
> This would hopefully allow for simple machines creation. We would then be
> able to use either the command line or the `-readconfig` option to create
> the machine.
> 
> Note that we are not planning to use QMP/HMP for now. From our
> understanding, a `device_add` request is always considered as hot-plug,
> which is not what we want here.
> 
> Please tell us what do you think about this plan. Any feedback is
> appreciated.  Then we can discuss the details of how to do this properly.

There's a general desire amongst QEMU maintainers to move to a world
where QAPI is used for describing everything. In this vision, eventually
all current command line options would be replaced with QMP commands
and QAPI objects specs.

In this world -readconfig is likely to be deleted. Also this means we
have a bias against adding new command line options to current QEMU.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


