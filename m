Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890689D63
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 13:57:35 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx8xC-0003Rq-Rp
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 07:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38169)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <balaton@eik.bme.hu>) id 1hx8wb-0002va-E9
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:56:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1hx8wa-0000tA-JM
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 07:56:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:42047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
 id 1hx8wa-0000lr-D5; Mon, 12 Aug 2019 07:56:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7CE1074C9F1;
 Mon, 12 Aug 2019 13:56:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6302C74C707; Mon, 12 Aug 2019 13:56:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 59C0374C659;
 Mon, 12 Aug 2019 13:56:53 +0200 (CEST)
Date: Mon, 12 Aug 2019 13:56:53 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
In-Reply-To: <20190812113739.16587-1-philmd@redhat.com>
Message-ID: <alpine.BSF.2.21.9999.1908121355300.1201@zero.eik.bme.hu>
References: <20190812113739.16587-1-philmd@redhat.com>
User-Agent: Alpine 2.21.9999 (BSF 287 2018-06-16)
MIME-Version: 1.0
Content-ID: <alpine.BSF.2.21.9999.1908121356030.1201@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH 0/2] hw/display: Compile various display
 devices as common object
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Aug 2019, Philippe Mathieu-Daud=E9 wrote:
> This series move various generic display devices to $(common-obj-y),
> so they are compiled once for all targets.
>
> 'make world' is reduced by 54 objects.
>
> Philippe Mathieu-Daud=E9 (2):
>  hw/display/sm501: Remove unused include
>  hw/display: Compile various display devices as common object
>
> hw/display/Makefile.objs | 18 +++++++++---------
> hw/display/sm501.c       |  1 -
> 2 files changed, 9 insertions(+), 10 deletions(-)

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

For sm501 and ati-vga parts.

Regards,
BALATON Zoltan
