Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8752F5DE3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 10:40:43 +0100 (CET)
Received: from localhost ([::1]:38506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzz7S-000688-SM
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 04:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzz55-0005Ec-R6
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:38:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kzz54-00017y-0A
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 04:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610617092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfl7LXQDNHLE5MNJKJnCqhFBfHprgG1Ad3LGxI4Z8AM=;
 b=cIBkRFDEmBMNUzK/PLPUdCa/4eQtPKj+hogRyoNZUzQqbBNlDibnblVDJoeQEHfqRq7Bps
 BGMAqX/0n8JOL18mPR8mlK077DlErFAUY+qw+PYQrhNdG78a4LohJPw6tyiP6nwQWWnBp6
 U83AARaAlduCyr5TXimm5Fn/G2RZW88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-HzDO2R81MxOyUdPydNQnBA-1; Thu, 14 Jan 2021 04:38:11 -0500
X-MC-Unique: HzDO2R81MxOyUdPydNQnBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E98F71005D44;
 Thu, 14 Jan 2021 09:38:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B5D760C47;
 Thu, 14 Jan 2021 09:38:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E319618000B4; Thu, 14 Jan 2021 10:38:07 +0100 (CET)
Date: Thu, 14 Jan 2021 10:38:07 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 0/3] ui/gtk: paper over a gtk bug on Windows
Message-ID: <20210114093807.j23oglcboi3ubmro@sirius.home.kraxel.org>
References: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
MIME-Version: 1.0
In-Reply-To: <d5f2e3c5-b6d0-db4e-70c2-9de47fd8fefd@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 13, 2020 at 05:56:28PM +0100, Volker Rümelin wrote:
> Patch dc26435edb "ui/gtk: Update refresh interval after widget
> is realized" exposed a bug in gtk on Windows. The monitor refresh
> rate reported by gtk may be much smaller than the real refresh
> rate leading to an unusable guest screen refresh rate.

Added to ui patch queue.

thanks,
  Gerd


