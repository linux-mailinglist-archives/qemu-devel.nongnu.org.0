Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838F01D48B1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 10:41:53 +0200 (CEST)
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZVui-0007NC-Kt
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 04:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZVtm-0006dz-20
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:40:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36852
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jZVtl-0002Ni-7s
 for qemu-devel@nongnu.org; Fri, 15 May 2020 04:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589532052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+gKbR7jcuBsrCJTB4o3K2LpUhxS+jTPxrQ/Mt8AAgg=;
 b=c4KEWx9s4kEO62IFFOe8SieQXrCKdlsnIXXCyXCXaxgnKTfsBU32LACMait5tCEbEBNxn4
 fd2jjn5qvZjdaWiT7RwuQsTZcwPSUmMlSYpVc0yOFiJMbSUY5PLov2PuiEAfMqS8B4wz0T
 hHdfIc+cyEAl0cxF4/0wA+WpaV+eVZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-c6tYjOUcOxecXdZwH_lQtw-1; Fri, 15 May 2020 04:40:50 -0400
X-MC-Unique: c6tYjOUcOxecXdZwH_lQtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F3C619200D4;
 Fri, 15 May 2020 08:40:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-145.ams2.redhat.com
 [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20FB11036B4B;
 Fri, 15 May 2020 08:40:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 24A9A16E16; Fri, 15 May 2020 10:40:45 +0200 (CEST)
Date: Fri, 15 May 2020 10:40:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 2/7] dwc-hsotg (dwc2) USB host controller register
 definitions
Message-ID: <20200515084045.67qvtybodegbskgy@sirius.home.kraxel.org>
References: <20200512064900.28554-1-pauldzim@gmail.com>
 <20200512064900.28554-3-pauldzim@gmail.com>
 <5c445de9-14d0-f4fd-2419-6a0401501423@amsat.org>
MIME-Version: 1.0
In-Reply-To: <5c445de9-14d0-f4fd-2419-6a0401501423@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 15, 2020 at 10:07:41AM +0200, Philippe Mathieu-Daudé wrote:
> On 5/12/20 8:48 AM, Paul Zimmerman wrote:
> > Import the dwc-hsotg (dwc2) register definitions file from the
> > Linux kernel. This is a copy of drivers/usb/dwc2/hw.h from the
> > mainline Linux kernel, the only changes being two instances of
> > 'u32' changed to 'uint32_t' to  allow it to compile. Checkpatch
> > throws a boatload of errors due to the tab indentation, but I
> > would rather import it as-is than reformat it.
> 
> Thinking loudly, should this go under linux-headers/?

Possible, but given this is unlikely to change much in the future
(unlike say kvm headers which get new APIs now and then) it doesn't
buy us much ...

cheers,
  Gerd


