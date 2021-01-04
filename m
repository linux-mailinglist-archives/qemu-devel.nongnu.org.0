Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E285D2E9FD9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:12:39 +0100 (CET)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwY5e-00067i-F1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwY3X-0005OI-OU
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwY3T-0007Bo-Fy
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609798221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+B+r0+4aZaYYBaD8upICaTg7dnMjcQT09LwD9q+xk6I=;
 b=iSLIQFc9PA+rJAztwnahxf74XhW8a/TvSa+gLmyebgEh88oH4ZPE8QxmpdrWPJs7f5Ob8E
 NHYDUVqRKugM9yhsHQWaTMH+yIyVd4y4W5cxjw9fvQpvR5itfqltlhdqv9HygpferWYigO
 oCHDu+tfHjj/A+8fauNwGF9teR/hoWI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-ycQTF7KoNlGtDn5EJgAHLQ-1; Mon, 04 Jan 2021 17:10:19 -0500
X-MC-Unique: ycQTF7KoNlGtDn5EJgAHLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B7A107B45F;
 Mon,  4 Jan 2021 22:10:17 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28D2E5D9D5;
 Mon,  4 Jan 2021 22:10:14 +0000 (UTC)
Date: Mon, 4 Jan 2021 17:10:13 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20210104221013.GK18467@habkost.net>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201229142001.3b28fdf2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201229142001.3b28fdf2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 29, 2020 at 02:20:01PM +0100, Igor Mammedov wrote:
> On Mon, 14 Dec 2020 15:50:26 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > This includes code previously submitted[1] by Daniel P. Berrangé
> > to add a "smbios-ep" machine property on PC.
> > 
> > SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> > large number of VCPUs can easily hit the table size limit of
> > SMBIOS 2.1 entry points.
> 
> Eduardo,
> do you plan to submit Seabios patches for SMBIOS 3.0?
> will OVMF pick up new tables automatically?

OVMF will pick the new tables automatically.

SeaBIOS patches are at:
https://www.mail-archive.com/search?l=mid&q=20201210212640.2023885-1-ehabkost@redhat.com

-- 
Eduardo


