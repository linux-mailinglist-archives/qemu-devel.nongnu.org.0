Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E043371A8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 12:47:53 +0100 (CET)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKJnE-0000hR-6D
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 06:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lKJkh-0007Kz-I9
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:45:15 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:40084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lKJkf-0000pv-Vd
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 06:45:15 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B1D531E3;
 Thu, 11 Mar 2021 12:45:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WNRVkzC8NCVS; Thu, 11 Mar 2021 12:45:10 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 028B44E;
 Thu, 11 Mar 2021 12:45:10 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lKJka-00HHC0-Nw; Thu, 11 Mar 2021 12:45:08 +0100
Date: Thu, 11 Mar 2021 12:45:08 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/4] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
Message-ID: <20210311114508.vq5cvpr3lpqnvrfw@begin>
References: <20210310173323.1422754-1-thuth@redhat.com>
 <20210310173323.1422754-4-thuth@redhat.com>
 <87y2euqe4j.fsf@dusky.pond.sub.org>
 <1f5ff060-5ec6-22bb-8b23-a558d6520894@redhat.com>
 <20210311113738.exhvhskqnpguafyz@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311113738.exhvhskqnpguafyz@sirius.home.kraxel.org>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: B1D531E3
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[6];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC5CZXJyYW5nw6k=?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann, le jeu. 11 mars 2021 12:37:38 +0100, a ecrit:
> Which would also drop support for serial braille devices.  Not sure
> how much of a problem that would be these days.

It is an important concern: we also need to be able to test braille
devices connected through serial.

Samuel

