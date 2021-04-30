Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA4F36F61D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:03:30 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNBR-0007hO-A5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcN9X-0005yi-FF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcN9O-00029D-3G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619766081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4vm+GMylMF3E5bcl/yfOvzvBSFk8Xx8xVCnu/Vn8n0=;
 b=HVyFuBxNCzVfnBFsUSXjMgW+nxavnMWoY5rCU7nSB/WNPUz/+HU3yMvaUQ+FLPeATVOryt
 2TdjyR6JV/aiquUMz/6aW8bVAal3ThkMPiyQcNLQ3eA1QvOwudMFqMUrQV1LO9snIc2Pg2
 qrm/O75dKV77jv1EaEpLi1G4ahjrvng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-AikUCllfON6HF3m2-EH6mA-1; Fri, 30 Apr 2021 03:01:17 -0400
X-MC-Unique: AikUCllfON6HF3m2-EH6mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7BAF107ACCD;
 Fri, 30 Apr 2021 07:01:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF60E19C45;
 Fri, 30 Apr 2021 07:01:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 02C1F1800380; Fri, 30 Apr 2021 09:01:12 +0200 (CEST)
Date: Fri, 30 Apr 2021 09:01:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <20210430070112.krryahox7r3eo6rl@sirius.home.kraxel.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
 <YIqwsUAGEvfazbvZ@merkur.fritz.box>
 <20210429134612.rtnoy5yo3v36h4l7@sirius.home.kraxel.org>
 <bbaac55c-4877-82f8-1a70-bd62ff79a25f@amsat.org>
MIME-Version: 1.0
In-Reply-To: <bbaac55c-4877-82f8-1a70-bd62ff79a25f@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 05:05:35PM +0200, Philippe Mathieu-Daudé wrote:
> On 4/29/21 3:46 PM, Gerd Hoffmann wrote:
> 
> > Hmm.  Not so easy I suspect.  While most sound cards map to a single
> > device there are exceptions.  pcspk is build-in and hda is two devices.
> 
> What do you mean by "pcspk is build-in"?
> 
> Do you mean "the 'pcspk' audiodev is build in the 8254 PIT device"?
> (see pcspk_audio_init).

built-in == "the device is there, no matter what".  Being part of 8254
PIT is the underlying technical reason for that.  The only thing you can
do when configuring qemu is assigning an audio backend to it (or not).

take care,
  Gerd


