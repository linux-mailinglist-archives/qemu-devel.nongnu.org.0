Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC329132A83
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:54:25 +0100 (CET)
Received: from localhost ([::1]:52020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iorBY-0004iN-PK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ioqxq-0008Fb-AC
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:40:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ioqxo-0002jN-SD
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:40:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45232
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ioqxo-0002il-O3
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:40:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578411612;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MviTb3tCzn0NWnkc7hQHz3OBssRbzdJhpOH2bq1sMtk=;
 b=dGXcDkodke4GMBJ+rfPfvOIu0SnzFCo5j1Saipw84gY5nV4wTybkiO6o5C2OBlxQVctiBg
 Eymi/qmJcwUO52uAzvBP7QWKYjz8FDUsb1tJ1/iq81y9slJWdbOqFqWkxooxL7BQK0F/5N
 xXh1w2bZhPmqa5XVQChVbEXewKQVm38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-xFMd60ysMLiNwyJanWFHwA-1; Tue, 07 Jan 2020 10:40:09 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 460CD802B6D;
 Tue,  7 Jan 2020 15:40:08 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 675767EF77;
 Tue,  7 Jan 2020 15:40:07 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: no-reply@patchew.org
Subject: Re: [PATCH v2 0/3] Fix multifd + cancel + multifd
In-Reply-To: <157839883493.727.2839689792701242416@37313f22b938>
 (no-reply@patchew.org's message of "Tue, 7 Jan 2020 04:07:15 -0800
 (PST)")
References: <157839883493.727.2839689792701242416@37313f22b938>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 07 Jan 2020 16:39:51 +0100
Message-ID: <87blrfjmwo.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: xFMd60ysMLiNwyJanWFHwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: quintela@redhat.com
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200107104914.1814-1-quintela@redh=
at.com/
>
>
>
> Hi,
>
> This series failed the docker-mingw@fedora build test. Please find the
> testing commands and
> their output below. If you have Docker installed, you can probably reprod=
uce it
> locally.
>
>
>
>
>

Hi

> The full log is available at
> http://patchew.org/logs/20200107104914.1814-1-quintela@redhat.com/testing=
.docker-mingw@fedora/?type=3Dmessage.

N/A. Internal error while reading log file

So, I am going to assume that patchew is b0rken at the moment.

Later, Juan.


