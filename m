Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5651154ED7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 23:19:00 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izpUB-0003qT-4d
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 17:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izpT2-0003Ov-VS
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 17:17:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izpT1-000480-HZ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 17:17:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60938
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izpT0-0003zx-P1
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 17:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581027465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EP++KqaP/dBAc2GfiO5I7gMvByLlL7y8Yz+x8gmOBUM=;
 b=D16zULkgeTsqXCOu1hT7NQ9BxIvvKYMBVhg5StTcppbR6tVhQQsMyLJNsNx2wjhj7eFznG
 kN+woBMimXDwbmtYc8EHLAg1e5SIFrZVYAtJq8jJOM6YJ9tLv9gXHPGU6Ch6JjM5GxXVe6
 oNl6N4ilXWDIYlae+QBAERskT5TJCNI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-yYV3jSvbPOCrVTCiQhpxoA-1; Thu, 06 Feb 2020 17:17:44 -0500
Received: by mail-wr1-f72.google.com with SMTP id t3so133605wrm.23
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 14:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EP++KqaP/dBAc2GfiO5I7gMvByLlL7y8Yz+x8gmOBUM=;
 b=hKGpU8sGFWLBudAQ4DvjL+47bcT1mzIROscJn/13BZ5FuBCvpviBmrkmrFLHYiAnQq
 U6t2osgMqleBNGrUfVjUEn7xi8Hu4nS+2EIU7jklVbWznG5+LvjOoSviiJoYA5XopJSL
 MIApvA7+NPIpPe3+hgDSlYJETUSqH71Wp4L9tc/Pg1X4IFi2XCK5tY4cKLW2M1ZPfFWu
 SJF+ga1KD3wF/GV5kEHn8yxAUSUfvzzCqBv7ZoiqXa0AYo7SFLgpv85u4Zsc4VlezsJa
 mFxFxsZxtauILUEmLGm72XqPFtVOpAYmVjcvTR/YTybLqciAypode/buYalWtMPNarAP
 Vnig==
X-Gm-Message-State: APjAAAVGTq55pQYAYpS2ZdQ14nUOK595wS5CrkO2NkAi4FfoVgR2qUp1
 W2qVCExXiWYhbTqAUJFcXCZ0H6JSBUnZ4rew028s8SqMR125o57TIXG2odReZsVxR2hkYldpQ9P
 d/CTGkg9E3qn0+IE=
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr154337wrk.53.1581027463412;
 Thu, 06 Feb 2020 14:17:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyIo14G/hn0bjkZiIj2tv6MI81CFbuFSqJ2bMvyE82PD0CWEYJ+Fq5TLD/ymQQyE7ePxZ3wlQ==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr154312wrk.53.1581027463152;
 Thu, 06 Feb 2020 14:17:43 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id s65sm1002940wmf.48.2020.02.06.14.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 14:17:40 -0800 (PST)
Subject: Re: Qemu 4.2.0 on Windows host
To: Jerry Geis <jerry.geis@gmail.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>
References: <CABr8-B7+S=WavWA7Ad_7sSB5B-QFJ6uBFuVXPw1hNRQwdZw_7A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e5723022-32d6-56f0-8499-9be7890fc4d6@redhat.com>
Date: Thu, 6 Feb 2020 23:17:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CABr8-B7+S=WavWA7Ad_7sSB5B-QFJ6uBFuVXPw1hNRQwdZw_7A@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: yYV3jSvbPOCrVTCiQhpxoA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefan who might know...

On 2/8/20 1:42 PM, Jerry Geis wrote:
> I am trying to figure out how to boot a linux external USB disk from 
> windows host ?
> 
> I do this all the time on linux - simply -hda /dev/sdb
> 
> But how do I reference the USB on Windows ?
> Thanks,
> 
> Jerry


