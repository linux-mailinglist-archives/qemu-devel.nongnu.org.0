Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E522A2A83A5
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 17:38:33 +0100 (CET)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaiHQ-00058g-WE
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 11:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1kaiFo-0003wH-Hm
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 11:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jfreimann@redhat.com>)
 id 1kaiFm-0007a8-Lz
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 11:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604594209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gxcf603UZuqKyv5KUpyy72Lg4idtpn3seH+iuA6+zA4=;
 b=Lf8x73gnAUhSDZKrWI+lfVA/pzj3sJ0KpdsxX1ezRs4Cexxs8Tnt2v/T6sCz1Il2RaA9bW
 UagaV1Y49XbZ+9nEttJEysMhy2f4SZsWXehqmzTxYHcRvZDqdcDhxOhlGqORPtH+n24oJ+
 UA6Y0DxvYiUyxyHLrqB7wCe9GjIhYe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-L4MkymCWNc-2djaDmbFQFQ-1; Thu, 05 Nov 2020 11:36:47 -0500
X-MC-Unique: L4MkymCWNc-2djaDmbFQFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D54DB1009E26;
 Thu,  5 Nov 2020 16:36:45 +0000 (UTC)
Received: from localhost (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0881373679;
 Thu,  5 Nov 2020 16:36:39 +0000 (UTC)
Date: Thu, 5 Nov 2020 17:36:38 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Documents not in sphinx toctree
Message-ID: <20201105163605.GX47859@linux.fritz.box>
References: <CAJ+F1CJ7KpB8C6-_+Gdh6twqjjRMweERUapw4tfjKyMqa6AM0w@mail.gmail.com>
 <CAFEAcA86UyXfir3JA3E2vuJNZBGOhbxzvomemaCLg6uwOB3c8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA86UyXfir3JA3E2vuJNZBGOhbxzvomemaCLg6uwOB3c8Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfreimann@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jfreimann@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>, Sergio Lopez <slp@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 05, 2020 at 04:19:00PM +0000, Peter Maydell wrote:
>On Thu, 5 Nov 2020 at 16:14, Marc-André Lureau
><marcandre.lureau@gmail.com> wrote:
>> By running sphinx over the docs/ directory (like readthedocs.org presumably does), it finds a couple of rst documents that are not referenced:
>> - cpu-hotplug.rst
>> - microvm.rst
>> - pr-manager.rst
>> - virtio-net-failover.rst

Given the current structure of the content in
https://qemu.readthedocs.io/en/latest/,
would adding this as a new bullet in "QEMU System Emulation User’s
Guide" be the right thing to do?  

regards,
Jens 


