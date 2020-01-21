Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB3144499
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 19:52:01 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ityd6-0004f9-DS
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 13:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1itycI-0004Dl-VO
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1itycE-0007Z4-Ev
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:51:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23027
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1itycE-0007YZ-BG
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 13:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579632665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pj/HUAzwjMlgIuLjcEWglGU4JsXQB65NO3kFLv9b/3Y=;
 b=gVrPOTuJxfYb7OlVO92hGChZ1azacZ5c3GudTiNByl4Hu7qxz/3HFZFIx/V2QLtEeMjhFa
 u5HGfpfiDqFAUe0CUiD3xFHEGB0iNHRcdDJa/rD0wN8qdzxtVCG+rL28DIT3VZX8naNQpX
 T50Qrn+KRhgioea4cVg0AuN8QmGTt7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-2l_syVfUPuO96-p_njDB_Q-1; Tue, 21 Jan 2020 13:51:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC1091005510
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:51:02 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-70.ams2.redhat.com
 [10.36.116.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC705DA7B;
 Tue, 21 Jan 2020 18:50:59 +0000 (UTC)
Subject: Re: [PULL 0/2] EDK2 firmware patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200121151543.18538-1-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <17f892ab-e0ac-c4b0-947e-0cf7085e9b07@redhat.com>
Date: Tue, 21 Jan 2020 19:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200121151543.18538-1-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 2l_syVfUPuO96-p_njDB_Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/21/20 16:15, Philippe Mathieu-Daud=C3=A9 wrote:

> Another set of build-sys patches, to help building the firmware
> binaries we use for testing. We almost have reproducible builds.

\o/


