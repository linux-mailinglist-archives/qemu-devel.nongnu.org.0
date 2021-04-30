Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C649936F61C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:03:29 +0200 (CEST)
Received: from localhost ([::1]:39018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNBQ-0007fv-Ax
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcN9Q-0005vD-0H
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcN9L-00027T-V2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619766078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIRgi3lvGTnasG2XHBPa7MI8OSY1gqerr37IlnMRPgM=;
 b=dUwMkzTezNNXGzkOgwFAsLQN8tzAn2DB9p7qzUM4AznhaZlsX0oE8C6yNqC1Z0VNevhGLd
 AVuR1Mf0eMPwrrDniJEyCKQRPv3FACb+dpZmM1OYPLchGMBA6H/7Hoo9agv7wdDl6L+AcC
 RnqpM+UXJ8oVNRQDS8BoXK+zuG/57Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-PTF6JG8GOlC1A9cZ0I4p9Q-1; Fri, 30 Apr 2021 03:01:16 -0400
X-MC-Unique: PTF6JG8GOlC1A9cZ0I4p9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912671008065;
 Fri, 30 Apr 2021 07:01:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0B6A100EB3D;
 Fri, 30 Apr 2021 07:01:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 600C4113525D; Fri, 30 Apr 2021 09:01:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: Let's remove some deprecated stuff
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
 <YIqwsUAGEvfazbvZ@merkur.fritz.box>
 <20210429134612.rtnoy5yo3v36h4l7@sirius.home.kraxel.org>
 <bbaac55c-4877-82f8-1a70-bd62ff79a25f@amsat.org>
Date: Fri, 30 Apr 2021 09:01:06 +0200
In-Reply-To: <bbaac55c-4877-82f8-1a70-bd62ff79a25f@amsat.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 29 Apr 2021 17:05:35
 +0200")
Message-ID: <87r1isntn1.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 4/29/21 3:46 PM, Gerd Hoffmann wrote:
>
>> Hmm.  Not so easy I suspect.  While most sound cards map to a single
>> device there are exceptions.  pcspk is build-in and hda is two devices.
>
> What do you mean by "pcspk is build-in"?
>
> Do you mean "the 'pcspk' audiodev is build in the 8254 PIT device"?
> (see pcspk_audio_init).

I think so.  The 8254 is an onboard device, i.e. it's always there.  In
real PC hardware, one of its timers is wired to a speaker.  In our
virtual hardware, we have separate "isa-pit" (or "kvm-pit) and
"isa-pcspk" devices, where the latter connects to the former via link
property "pit", and may be connected to an audio backend, but isn't by
default.  To connect to one, use -machine pcspk-audiodev=3D...

> FWIW I'm using this device as example to work on the PWM API,
> and I see the AUD API as a generic DSP processing one.
> And in my TODO I have "split pcspk audiodev backend from 8254".

Not sure I understand your TODO, but then I don't have to :)


