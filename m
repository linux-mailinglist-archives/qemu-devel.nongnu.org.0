Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6044186523
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 07:41:40 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDjRT-0006Q5-6L
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 02:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jDjKi-0005LN-BD
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:34:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jDjKh-0004uI-4e
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:34:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56365
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jDjKg-0004hI-V3
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584340478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9e4JkimSMNuzo5ByUoUoDpe8BLF5xqqL8qhHGiT3M8=;
 b=SVQ2PIQlIQjc8HUbkQC0ewnGxGEb9HmGYB1ZzY5cX0kqcwvdxAv4Zi64rnsNpJFhYK++4V
 RGlfbLYZHQZaM4L6PC8QIVJBTkNQ60rZevzhjDyC4cNzE9KbrMAnRNUCawCvJxQfTnkW6t
 7Hfz3FaUPz5j79syo0Dtf0yUcYuqvr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-lQpn1vdYM82JkMJwJ19ZKQ-1; Mon, 16 Mar 2020 02:34:34 -0400
X-MC-Unique: lQpn1vdYM82JkMJwJ19ZKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BB2C107ACC7;
 Mon, 16 Mar 2020 06:34:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-49.ams2.redhat.com
 [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F1885DA2C;
 Mon, 16 Mar 2020 06:34:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 124881138404; Mon, 16 Mar 2020 07:34:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 1/8] hw/ide: Get rid of piix3_init functions
References: <cover.1584134074.git.balaton@eik.bme.hu>
 <adddfa21552783020d64e1314318cab6d24362c3.1584134074.git.balaton@eik.bme.hu>
Date: Mon, 16 Mar 2020 07:34:29 +0100
In-Reply-To: <adddfa21552783020d64e1314318cab6d24362c3.1584134074.git.balaton@eik.bme.hu>
 (BALATON Zoltan's message of "Fri, 13 Mar 2020 22:14:34 +0100")
Message-ID: <877dzkn6yy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, philmd@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> This removes pci_piix3_ide_init() and pci_piix3_xen_ide_init()
> functions similar to clean up done to other ide devices.

Got a commit hash for "done to other ide devices"?

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>


