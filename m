Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F69344F54C
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 21:42:44 +0100 (CET)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlzrH-0004tt-6x
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 15:42:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mlzq6-0003gq-H3
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 15:41:30 -0500
Received: from [2607:f938:3000:8::2] (port=7135 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1mlzq4-0004Fq-Fr
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 15:41:30 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Hs6n26vxVz8PbN;
 Sat, 13 Nov 2021 15:41:26 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=gHWyf7mQe
 dng8dbNEMcXxpc1FOo=; b=Lcp0T9uVR4rYrVXEahGFR23RafN1Tdqo0B2/Y6X4C
 57WRGIKcvzp0w6HNkY2T3lwyohR0IUjW2Gak8/oBb1IRkp+c/97eIS0sOI2kQ9eB
 Dc38KsyAW80tnTwp1q7r5KoXckySVr6WtmdsuWgarAt26z3RfzcvcCsd4j1k8mS5
 oY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=VH6
 lx21+84X+3jTgAE9LWZ3h1XGgTQxhySKDKDOvUwvWIZfUyb/WAzv5u9Zx2jHIg7d
 IaHMGGFCydOJzByKjTX4jn0DJn2NWDdmNATbH1r2xCQxHyaVqDZm1z/QtMUq4Sxr
 7DzgH5651mm2M/vgr604cgitMtspwPsKzGOTthTI=
Received: from [192.168.6.70]
 (bras-base-toroon2719w-grc-40-174-88-240-196.dsl.bell.ca [174.88.240.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Hs6n26Sd7z8PbK;
 Sat, 13 Nov 2021 15:41:26 -0500 (EST)
Message-ID: <6cd26cf0-487d-ef8d-4126-eaf1ebefa8a5@comstyle.com>
Date: Sat, 13 Nov 2021 15:41:26 -0500
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.852,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
>
> Paolo

I see what to do there now. When I first came across it I wasn't sure.

