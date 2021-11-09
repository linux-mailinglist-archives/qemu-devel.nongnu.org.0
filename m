Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5644B4FF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 22:55:13 +0100 (CET)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkZ5E-0001Hc-5Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 16:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mkZ44-0000Ag-V5
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:54:00 -0500
Received: from speedy.comstyle.com ([206.51.28.2]:2747 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mkZ43-0004gb-Fi
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:54:00 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4HphZN5JGMz8PbN;
 Tue,  9 Nov 2021 16:53:48 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=P9/0sdbe2
 fQbnj6N/j7l6sgWumY=; b=pnFmYK17Ed3JxSXrU5EtvXHBqudSFreUsGsM8e5n+
 LuqXxbF3mRfZ7Jbiux0lk8q92xBM2+BwkGIOnGkKK+xjSimswLjrSbEfSNGDJLu8
 1HxwpLVWgVBeLBVcvh6d6tNInitGdlh7yWEThu9wYObnsoG3SylrYVT+MQEWZHtp
 8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=DlE
 9Mg5+dBzqkkr3uxFCDFZCqLoIkCmQ5kRl3YJW9aFv774puELNG4gSru3Spypy69a
 pjMqu6mlMgKbS5TmqjBuQIOhxQRHyyulxrVARt/wpEIL9dJ8HTGiNAakMAHogHuw
 19utss4AiwlPTHZ/uAqYV/0os5KP53CoXSZQv3jk=
Received: from [IPV6:2001:470:b050:6:3c8b:fdad:7699:ff35] (unknown
 [IPv6:2001:470:b050:6:3c8b:fdad:7699:ff35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4HphZN2Fcqz8PbK;
 Tue,  9 Nov 2021 16:53:48 -0500 (EST)
Message-ID: <dcb4aa07-1d2b-0f24-f9cb-196a5bcff6ec@comstyle.com>
Date: Tue, 9 Nov 2021 16:53:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH] audio: Add sndio backend
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
 <53345e90-747e-85f9-cfb4-f5e90da526f7@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <53345e90-747e-85f9-cfb4-f5e90da526f7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=206.51.28.2; envelope-from=brad@comstyle.com;
 helo=mail.comstyle.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/2021 9:58 AM, Paolo Bonzini wrote:

> On 11/7/21 06:19, Brad Smith wrote:
>> =C2=A0 if not get_option('spice_protocol').auto() or have_system
>> @@ -1301,6 +1306,7 @@ if have_system
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'oss': oss.found(),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'pa': pulse.found(),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'sdl': sdl.found(),
>> +=C2=A0=C2=A0=C2=A0 'sndio': sndio.found(),
>> =C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0 foreach k, v: audio_drivers_available
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config_host_data.set('CONFIG_AUDIO_' + =
k.to_upper(), v)
>
> Maybe you want to add sndio to the audio_drivers_priority array if=20
> targetos =3D=3D 'openbsd'?

That part I was not 100% sure of.

Am I to understand with the current Meson code it will try to use=20
PulseAudio instead of
ALSA on a Linux system unless overrriden?


