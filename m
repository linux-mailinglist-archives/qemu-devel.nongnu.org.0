Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520BF2B59F3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 08:00:44 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keuyp-0004vR-D9
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 02:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1keuwy-00044y-0H
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1keuwt-0007Hc-Mt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605596321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8xR53WsKOgvvnRRaevJ0QEmtRp8pLw2PoZVB2orJYY=;
 b=LumB+nFJRh52ngVkjwLMERWRTGb+iusOSUhGLO2TO1GdKs0JT13CHyqn8JvI86jrfUCHL5
 hAoFSLH/WD8sakeNqmNyBA3GaTRqPVMmNddYi6MD2mMPKq4/pZBfbh6tHCuF23iVDA7Pae
 x5ez9x1JNzNLVQgEF8my80FY/YCEeZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-mtetT_0KPniU1Iw-jxgyag-1; Tue, 17 Nov 2020 01:58:39 -0500
X-MC-Unique: mtetT_0KPniU1Iw-jxgyag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E67B5720B;
 Tue, 17 Nov 2020 06:58:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5263F5D9CC;
 Tue, 17 Nov 2020 06:58:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 29F1B17532; Tue, 17 Nov 2020 07:58:33 +0100 (CET)
Date: Tue, 17 Nov 2020 07:58:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 09/13] u2f-passthru: put it into the 'usb' category
Message-ID: <20201117065833.l3gsr4tryrg5dudn@sirius.home.kraxel.org>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-10-ganqixin@huawei.com>
 <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
MIME-Version: 1.0
In-Reply-To: <49d4e8e3-7138-18cf-3972-c18e8275d3be@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Gan Qixin <ganqixin@huawei.com>,
 kuhn.chenqun@huawei.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 03:04:52PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/15/20 7:48 PM, Gan Qixin wrote:
> > The category of the u2f-passthru device is not set, put it into the 'usb'
> > category.
> 
> I guess we discussed this with Thomas 1 or 2 years ago
> but I don't remember. I think it was about using set_bits()
> so devices can appear in multiple categories.
> 
> Gerd, do you know what is the point of the "usb" category for
> management apps? This is a bus accepting multiple better
> categorized devices (display, storage, input, network, sound).

Right now we have the host adapters collected in the usb category.
Maybe we should rename the category to make that clear.

And, yes, tagging the u2f devices as "usb" doesn't look useful.

> Unrelated but multiple devices are related to SECURITY.
> Maybe it is time to introduce the DEVICE_CATEGORY_SECURITY?

Either that, or place it in the "misc" category.

take care,
  Gerd


