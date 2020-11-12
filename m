Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B82B0763
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:15:17 +0100 (CET)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDNb-0007yS-VT
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1kdDMg-0007Ow-CX
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1kdDMd-0002jQ-QM
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605190453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XrODCT3RtuzWLfzLJzRq6TI/3MAIWq8jf1AOmEIj+U=;
 b=ibinEGoK/z/3hfgDyaf/vxZxWVfDdnqCQ1RQO7hcaBVYOyE0MZZUZTsFlfOdUof/ZZvcuJ
 fvxud4t+ZeMlCqvT0bPR5ey5EhzaGzhbLuzvO/ykNfeP1q+hjB4w/dbUOLgE4NMOeXjFFd
 MaUyMvF0Yg+GBo4jzYlz8ZDbV9i1NqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-QxuP6-tqNgifqEnCx1Io0g-1; Thu, 12 Nov 2020 09:14:12 -0500
X-MC-Unique: QxuP6-tqNgifqEnCx1Io0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34FA5804740
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 14:14:10 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.195.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98B4B10013D0;
 Thu, 12 Nov 2020 14:14:07 +0000 (UTC)
Message-ID: <60b03f8c99014e2ee6071bafdc7ed6e4739e0882.camel@redhat.com>
Subject: Re: Command line QAPIfication and -readconfig
From: Andrea Bolognani <abologna@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, "Daniel P." =?ISO-8859-1?Q?Berrang=E9?=
 <berrange@redhat.com>
Date: Thu, 12 Nov 2020 15:14:04 +0100
In-Reply-To: <20201111103550.GB3898@merkur.fritz.box>
References: <20201111092423.GA3898@merkur.fritz.box>
 <20201111101407.GD906488@redhat.com>
 <20201111103550.GB3898@merkur.fritz.box>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-11-11 at 11:35 +0100, Kevin Wolf wrote:
> Am 11.11.2020 um 11:14 hat Daniel P. BerrangÃƒÂ© geschrieben:
> > Normally we would not mark something as deprecated unless its replacement
> > is ready, because telling people "stop using this but the replacement
> > doesn't exist yet" is not a nice message as there is no action users can
> > take to deal with the deprecation.
> 
> But there is a replacement: Put everything back into the command line
> and keep it in a shell script. Config files with -readconfig were never
> complete enough to fully describe a VM, so it's not too unlikely that
> you'll already have that script anyway.

This is correct: in fact...

> > We might question whether -readconfig has any users but I would note
> > that our own documentation illustrates its usage, and provides several
> > example configs
> > 
[...]
> > config/mach-virt-graphical.cfg:#     -readconfig mach-virt-graphical.cfg \
> > config/mach-virt-serial.cfg:#     -readconfig mach-virt-serial.cfg \
> > config/q35-emulated.cfg:#     -readconfig q35-emulated.cfg
> > config/q35-virtio-graphical.cfg:#     -readconfig q35-virtio-graphical.cfg
> > config/q35-virtio-serial.cfg:#     -readconfig q35-virtio-serial.cfg \
[...]

... these configuration files, which I contributed some time ago, all
start with something along the lines of

  # Usage:
  #
  #   $ qemu-system-aarch64 \
  #     -nodefaults \
  #     -readconfig mach-virt-serial.cfg \
  #     -display none -serial mon:stdio \
  #     -cpu host

because it was simply impossible to provide QEMU with all the
settings necessary to obtain the desired virtual hardware using the
configuration file only.

-- 
Andrea Bolognani / Red Hat / Virtualization


