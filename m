Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F3A452EA9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:06:45 +0100 (CET)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvMS-0008KR-1x
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>)
 id 1mmvL4-0007UA-Ny; Tue, 16 Nov 2021 05:05:18 -0500
Received: from [2a00:1450:4864:20::434] (port=34773
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>)
 id 1mmvL3-0006Bp-7c; Tue, 16 Nov 2021 05:05:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id d5so36441115wrc.1;
 Tue, 16 Nov 2021 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=umf3jekVSE+q3zndQXQbaMm8de+5jHv8p9w5itkRDDM=;
 b=A/+2Xga+ZeLo8HL6psRBhnU+raYmv2a0aK8VF997eqiDjiYgLUyZCdWHp5ZcJTW2UP
 UaDwR6JE9rExLBF9S17NR8Pv90g+m/pBwY80OydoPiPyi8WmXmwGnqDVxFwvfDpr4GQC
 Ui+yg+8GAeSes0R+mwLCj2DQCBzdUCwpIDCMWOm2MkHAFKocYmkWCqN0VVigmHVas7TE
 Q0VUVok+XD7466wnG7zHvA6IP8zJAa/cybwmVnK6lbL5XDPViSlhpAeowVNkKKIa6ORX
 t7QU0FJbEkgauoi2p01cW/Ycgr9cR43KziG9BPIWGvtkg7HdH8FWTukNg0tDKR1seVLf
 tkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=umf3jekVSE+q3zndQXQbaMm8de+5jHv8p9w5itkRDDM=;
 b=5ldhRDnqOxma76+DuBtF0xdUzOjxVVfhPDJW7PhxaYoWvjEOEsyVe8ENaTfIdOgUab
 rcgfnmrmylHWUa9XGHsArlt60C96wc2SH+1GMRfGnJYo9NCoyk/QLivjAYyHbvYIc9dC
 03vxwgn4VQ+fgo+2s1VfcChaRZOMvVJabyimEblI1YOkAI/Z7oCOzO3Asn2//INRONUV
 vM7hP1JKgtT46SxtDigNQQWWT3QpqggXBxP6TVV6n3ozMLfOYz+lkJqK+mUAhUreLtsI
 zSYL/Lpe5X4RAx0t1AbN6wQWciR0xwF1lpN7KWGyVaeH0o20y0t7mwO6rhZca9JZ7rpY
 gNmQ==
X-Gm-Message-State: AOAM531qsj12m5K7RTabCixlONsq8TMMsI4q+1iPCPKfEh8Pn4CsH3kq
 mDxO8EBYhq5XteFU+DInH2o=
X-Google-Smtp-Source: ABdhPJx1OUSTS61BtsxjmrJ/xZE86J0CTaezST3FMC/EFvIwbboPial+rjyi++oszdPcXUHkVaY97A==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr7691641wrr.228.1637057114936; 
 Tue, 16 Nov 2021 02:05:14 -0800 (PST)
Received: from jondnuc ([2a0d:6fc2:4af1:7d00:5e41:a6ea:ffaa:548c])
 by smtp.gmail.com with ESMTPSA id h18sm18044251wre.46.2021.11.16.02.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:05:14 -0800 (PST)
Date: Tue, 16 Nov 2021 12:05:11 +0200
From: Jon Doron <arilou@gmail.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Subject: Re: [PATCH v4 0/1] hw/hyperv/vmbus: Is it maintained?
Message-ID: <YZOCV1EFniPx9FLh@jondnuc>
References: <20211106134155.582312-1-philmd@redhat.com>
 <54b75db4-8867-d1ee-e32c-bc3e4c23ec28@virtuozzo.com>
 <YY7Q62ltAyfAUYJp@rvkaganb.lan>
 <8caa5fb3-df36-d763-e07b-8fe1667ed7c9@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8caa5fb3-df36-d763-e07b-8fe1667ed7c9@oracle.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=arilou@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Roman Kagan <rvkagan@yandex-team.ru>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/11/2021, Maciej S. Szmigiero wrote:
>On 12.11.2021 21:39, Roman Kagan wrote:
>>On Fri, Nov 12, 2021 at 09:32:31PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>>Add Den and Roman (his new address)
>>
>>Thanks, I missed it on the list indeed.
>>
>>>06.11.2021 16:41, Philippe Mathieu-Daudé wrote:
>>>>This is the 4th time I send this patch. Is the VMBus infrastructure
>>>>used / maintained? Should we deprecate & remove?
>>
>>I think it's fair to say it's not maintained.  The whole
>>hw/hyperv/vmbus.c was submitted as a part of the work by Jon to enable
>>some obscure windows debugging feature which only worked in presence of
>>VMBus.  It was mostly taken from the respective branch of the (now
>>effectively abandoned) downstream tree with an implementation of the
>>core VMBus infrastructure and the devices using it; however, none of the
>>actual VMBus devices ever made it into the mainline tree.
>>
>
>The VMBus code works fine, is mostly self-contained and by being a part
>of the upstream QEMU it does benefit from any improvements done there and
>so it is much less likely to bit-rot with time.
>
>I am still committed to upstreaming a Hyper-V Dynamic Memory Protocol
>driver (which uses VMBus), however had been preempted by higher-priority
>work for now.
>
>Thanks,
>Maciej

Hi guys,

Sorry for the late reply, like Roman I also never got to submit the RFC 
for the Synth debugger device which requires the VMBus, I do hope to get 
to it at some point and VMBus is a required part for it.

In the last year or so I have not had much time to spend on this but I 
do hope to get back to finishing what I have started.

I'm not really sure I have the time or knowledge to maintain VMBus :( 
but I'll do my best to answer any questions as well.

-- Jon.

