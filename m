Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94761FF226
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 14:43:26 +0200 (CEST)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jltt8-0001sf-1f
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 08:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jltsB-00012d-1n
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 08:42:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27011
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jlts8-0006IA-Nd
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 08:42:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592484143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbfrvjeMUBsBLid1SAXl9n5HmExSLF/DIjsM6+S1eWg=;
 b=IXJKlFBrK0BFRPa8wLP8SLZBuf7MPx7x5svduSCwLBNnnuzEhz+AsK7g1GJ0SAyNlYaILE
 AslHno38/KzIbUa8VPMztbShRJh7yg0IiSW/hGIGXq5Yk+GA87Sno864ugOxIrQg4ZtlPr
 f5r4w24fSjHzZpMOOBBMIZdZcFEi6dg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-M0J6i7xAOF6VxGhmWDBMFg-1; Thu, 18 Jun 2020 08:42:22 -0400
X-MC-Unique: M0J6i7xAOF6VxGhmWDBMFg-1
Received: by mail-wm1-f72.google.com with SMTP id p24so1752850wma.4
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 05:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbfrvjeMUBsBLid1SAXl9n5HmExSLF/DIjsM6+S1eWg=;
 b=DebhXLq904yVT4DNspMrvBSYLlVcuABcIrsc/4XLV4k+ri/OCtnDkCak2AnnC+U8FF
 D8ps6Ur8P3F30+/yg13mUelYTSUd2YotOfjqfga/v1c4roT8OOo5PRE0m/JVKndn8yDg
 0lUfO2zwkYXk7fPuRPnQ5h496pOT1SQ4itRK0tycLotmWINFaC2xihItDOoS78+H+2+l
 /8BCsW1wZx5raNDFeUMkNDdvBFmm6A0cp6TqRRhcDBDyG2v/LsHb2zmlOsbsbgGBXX29
 Mf8DNYrh72qS0DRSD27mwFnNjs8g/qwtZR53PUTarWY7NqgiKomkGkDRwKr41mE/I2DV
 T6tQ==
X-Gm-Message-State: AOAM530XEasljf9fnemQiA3x6o4Xvphpt1WhLukrOaUJPr2tBpUL1fvY
 RLHkk6cT1BynWr2ZWfqtIDAUrlNiNTTEiVaQwpZTaIptLEZM8iwS0tHExuHKq90x8IFFQL1GQx4
 UXMq0pvoWogZFWWk=
X-Received: by 2002:a1c:de55:: with SMTP id v82mr3853105wmg.148.1592484140879; 
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA/bF9WYMLIbJkVZ56zD7epB1zG2aEb1KIwMZrUoxw4C7febSncq3q2251K0y8UijcYpgjUA==
X-Received: by 2002:a1c:de55:: with SMTP id v82mr3853081wmg.148.1592484140654; 
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e1d2:138e:4eff:42cb?
 ([2001:b07:6468:f312:e1d2:138e:4eff:42cb])
 by smtp.gmail.com with ESMTPSA id e12sm3503089wro.52.2020.06.18.05.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 05:42:20 -0700 (PDT)
Subject: Re: [PATCH 0/7] misc: Reduce QEMUTimer pressure by using lower
 precision when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200616075121.12837-1-f4bug@amsat.org>
 <b6170c76-27d3-c3b2-e32f-427fea769350@redhat.com>
 <df330613-a75a-5d3c-5290-c080f5c32785@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <80230616-1927-e861-98f5-b9aaf2fe03b7@redhat.com>
Date: Thu, 18 Jun 2020 14:42:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <df330613-a75a-5d3c-5290-c080f5c32785@amsat.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:21:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Corey Minyard <minyard@acm.org>,
 David Hildenbrand <david@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/20 14:26, Philippe Mathieu-Daudé wrote:
>> This is in principle a very good idea; however, util/qemu-timer.c does
>> not use the scale to coalesce low-precision timers with nearby
>> high-precision ones.
> IOW this doesn't reduce the pressure, but simply makes the code easier?

Easier, or harder depending on the point of view.  The reason why scale
exists is just because QEMU_CLOCK_REALTIME used to be millisecond based;
having to scale based on the clock was really ugly code, and furthermore
the scale provides an easy way to switch timers from one clock to
another without having to modify every deadline computation.

One might argue that the scale adds to QEMU's cognitive weight for
little benefit.  You might counter-argue that having to scale up to
nanoseconds every time is a pain in the ass, and I am not sure which
side I actually agree with.

> Only the cover mentions 'pressure', so maybe the patches can still be
> reviewed/queued in their current state?

Yes, of course.

Paolo


