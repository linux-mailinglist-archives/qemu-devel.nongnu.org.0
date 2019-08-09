Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E786875CE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 11:21:59 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw15y-0002bV-KB
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 05:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48307)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw14v-000155-R1
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 05:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hw14u-0000dn-Qc
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 05:20:53 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49316)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hw14p-0000Xi-P5; Fri, 09 Aug 2019 05:20:48 -0400
Received: from [172.16.11.117] (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BBAE896F50;
 Fri,  9 Aug 2019 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1565342446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6RC9WtmbZhhCHopOjtYEaLOC3+Z0AX+8u6YSjXVUks=;
 b=x5PP0XNebUzuh6czPgO9LSIVbY1JApCkPF3OblOZo5dbF74ePcsaTVrCmD2/8nsGJN0EKb
 9NthaO8G4w3bD/08vrBhbPpJ1B9R+y4txd4PfqnUzp8hVC5J1EwD6NKRJ1pQgHMkuX6taM
 wkoiQxVO4p/Gul2O584BNPKPamvyDFw=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-3-damien.hedde@greensocs.com>
 <CAFEAcA9puHxUvxbSBsFrEQ6QN=fq3GJH4SgzcpQWQB60PTVR=g@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <b5d20c72-2254-7055-a93b-252ca3887f85@greensocs.com>
Date: Fri, 9 Aug 2019 11:20:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9puHxUvxbSBsFrEQ6QN=fq3GJH4SgzcpQWQB60PTVR=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1565342446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6RC9WtmbZhhCHopOjtYEaLOC3+Z0AX+8u6YSjXVUks=;
 b=C46GEBXeX/5vzjiq0r5e3hG2LnjQeCWxh/hBG3lKx6hjwieY1ZwLvXNnLhX/VddcvDadrm
 Pxap8lmGyiJHdxqGbvHI456jmvsfQU2CxGQX5kITCAGbB7Y+HA996A6aeaMndBS2Va78iR
 SCDa56+dqwSeXSBsUbZ/8BwkdqasWl0=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1565342446; a=rsa-sha256; cv=none;
 b=I+y2CakCVbr4TjFgW4TvXKA9Ljebkm3ljBgMqF9lyMf0aDvcShpt/awXVjlp8mK1FaWGqK
 9qUzawMndsZQ2WOvXxnK335FAh/MGe6qpO3Obt2rG2U1FBZAt0Qzrtx3KEl7a3sCJx9wrW
 Twgve5G2+a28NYudGElWotWrAGvfBWI=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [PATCH v3 02/33] add temporary device_legacy_reset
 function to replace device_reset
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 8/7/19 4:27 PM, Peter Maydell wrote:
> On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>> Provide a temporary function doing what device_reset does to do the
>> transition with Resettable API which will trigger a prototype change
>> of device_reset.
> 
> The other point here is that device_legacy_reset() resets
> only that device, not any of its qbus children, right?
> So the new function which we eventually replace the callsites
> with also has different semantics, which is why we do the
> changes one by one in patches 10-28.

Yes, for device_reset there is a change of scope.

> 
> So you could add:
> 
> The new resettable API function also has different semantics
> (resetting child buses as well as the specified device).
> Subsequent commits will make the changeover for each callsite
> individually; once that is complete device_legacy_reset() will be
> removed.

sure

> 
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> I agree with David that patch 3 could be squashed into this one.

ok

> 
> If you do that and tweak the commit message you can have
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

