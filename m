Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2516612D074
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Dec 2019 14:57:00 +0100 (CET)
Received: from localhost ([::1]:33466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilvXW-0000hG-S1
	for lists+qemu-devel@lfdr.de; Mon, 30 Dec 2019 08:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilvWf-00006c-Vi
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilvWe-0003KP-HW
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:56:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55541
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilvWe-0003Gl-DM
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 08:56:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577714163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MHSzmjz6cu9SKrzfWd1SEiu5xFqOAFfwFjdZyZ6OEQ=;
 b=gf1AvffQ3F3F2KrEUbdVxbAnZt5gsziS5r/fz0V8CW9tKNqVSRS6mUweweoV10CzVeQ1Ri
 PIDrhf06hCiGPM8I5S2N2aLIhImRSq+2CR3lbZN76MOspAl3s6hM07IC5bv3WBSizu1Vw9
 9V03Qbmh+pmPYi506UJ3DWs7HmuTHmU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-VeX3GvFhPMSHo6_V7Rm_4Q-1; Mon, 30 Dec 2019 08:56:01 -0500
Received: by mail-wr1-f70.google.com with SMTP id d8so11243408wrq.12
 for <qemu-devel@nongnu.org>; Mon, 30 Dec 2019 05:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3MHSzmjz6cu9SKrzfWd1SEiu5xFqOAFfwFjdZyZ6OEQ=;
 b=Zw5agMLoLtZfkMaxLGXflfOaz61RCm117o9e+Z8B+QGWnV6frDvBMiHfzGYdHPbCgp
 KmQDn6egvTzQXxvXcdVg+xd+USzPUvYjtxPwewmF5kPnB5OpGok7acTWPVTLkYeXzSmW
 3to14OVW5eAnDB99hS+QOotAePzv3H5cFUlahtjl2mgpNN9qKdTe1ZQ6dfsBu/DFb9bg
 sJsZ7aw00OiTK2VCnZTW8xdv26gxJQWGGFKn3n8FSeL9AJC3zF3PZBLL55ViTY55bbzz
 CMmTnusa0AaBh3kkTfoqM+Kk8eNuGVfyup8aKRB04Qt+A66+kQQ6vRTENGyBrYCwdbEh
 +EKg==
X-Gm-Message-State: APjAAAUjfY6Jwdth7XKjX6XkOrXOnZzO4b/s7YQ3HuaNK5QjGTplvChp
 SZ5G6kFFMcfJC3G/y7SJjiVoD6kwLARNXzyLS12JyZdgxkVdqIQIiJIBkYhKows38xc5T77AUiC
 N4Jj67sL9AApD3wQ=
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr63088128wrr.215.1577714159959; 
 Mon, 30 Dec 2019 05:55:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMMPVvipAz+y+st3XwiJ7LIptYJYbWANdahjTl6Fg+Trpo82YNEtvXSNX6mnE67yfWumx9YQ==
X-Received: by 2002:adf:fe8c:: with SMTP id l12mr63088109wrr.215.1577714159747; 
 Mon, 30 Dec 2019 05:55:59 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id b15sm20694410wmj.13.2019.12.30.05.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 05:55:58 -0800 (PST)
Subject: Re: [RFC PATCH 6/6] hw/arm/cubieboard: Disable unsupported M-USB in
 device tree blob
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
 <20191230110953.25496-7-f4bug@amsat.org>
 <CAPan3WrBN77rcczzQ1knMEKCaCUSCb6RtdhSMiDWE9Ah7jvgjg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9cdbe625-fe29-cb91-2ed4-1231953b3148@redhat.com>
Date: Mon, 30 Dec 2019 14:55:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPan3WrBN77rcczzQ1knMEKCaCUSCb6RtdhSMiDWE9Ah7jvgjg@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: VeX3GvFhPMSHo6_V7Rm_4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/19 12:33 PM, Niek Linnenbank wrote:
> Hello Philippe,
> 
> I have a suggestion: probably you can apply (almost) the same patch to 
> get USB
> working for A10 as I did in the Allwinner H3, in patch #4 "add USB host 
> controller" [1]
> That way you can avoid the DTB modifications and with low effort get USB 
> working as well for this board.
> As far as I can see, in Section 21.1 in the A10 user manual [2] has the 
> same description
> as for the H3. It basically has the standard EHCI and OHCI interfaces.

Oh good news. I guess in the long term we want a AllwinnerSoc parent 
class where all common blocks are mapped, and A10/H3 children with the 
differences. But we'll worry about that after your H3 series get merged.

> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg03266.html
> [2] https://linux-sunxi.org/File:Allwinner_A10_User_manual_V1.5.pdf
> 
> Regards,
> Niek


