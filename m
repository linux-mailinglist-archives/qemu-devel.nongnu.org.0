Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9A31DCAF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 16:51:46 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCP78-0003Qx-Ls
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 10:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCP5Q-0002pM-4l
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:49:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCP5O-0002MF-AF
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 10:49:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so17901852wrj.5
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 07:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+56YKTG2tnG1hMQoFNwPlggugsvmkQC+/nvu6PBcUVM=;
 b=Tw3KvhLqXXzXnuI4pRxnJxG7kKY79pf4XkQZYe8pppfsme8V42nGaLvZzJcy9nt4pG
 2yNlUuKw3AnoGxUNp/uMcakjJdnO+HVYVHfi8ZkSEvaEoOqsB/s5Hn1DPK1IKp3ucRMZ
 LP9BIaHP2Sy7c5FsQa0zhS2u24tdDKv3y++xR8dSczwpPnNndoYCudCiv1aiPW8SKOlD
 Vm35WzBbEyKmeMlFASTScVa27RVQiZGiZ7oDdYlkKzVQtIIVDEexJ/21RXFYj8GDx0vs
 PXK1iUxjtb3LGVEYCkYBxJDz6kHDD7xmcitMEZbQ4dU0JFJababUZ8uNrbHzs8j8ld3E
 LCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+56YKTG2tnG1hMQoFNwPlggugsvmkQC+/nvu6PBcUVM=;
 b=eoOaJG0Y4SgSXdMUkveTDdL6Y2TtzbxAHEC12D8dQjDjgfk2X6WN42NPJSW+8FSIwI
 eEaKuK+LJcvgz3LVvlF24IC6vUbQf7VCPQX2MoyXUaoXvMSwva67CniEXYfJWjHXnZ8b
 tGb+9XXfi4Y65lORTE3kq0TiVDHr8ffToRmoMIvHIr5bBvo85jQI1I9WVmdj6d/dMz1r
 rg3ut5tid0BgpQeYcdKJAna3ZHljYcCsTjESuNprsBekqTIHn64i9BEpqT3uwKadd7Gr
 0DruB8CAoS1diNMy87wR6Ye4MDqsN5FOsQJ3vNIReLJ331pMQLlpGIw342V3uSJnMouK
 aqCA==
X-Gm-Message-State: AOAM5303MLtp3Wk86rYrDZYdOa/Fru1wn71SmBiWJZ84WYRjJ2nGJ/1u
 rTMycIzmiX508IXrn1ZG99HoDw==
X-Google-Smtp-Source: ABdhPJxswB83Sb/KzDqS/LTLxn/3t3i0EAKjwNNIlESlQZCB7yYeX2vGLBIAWgb0EtWo8ucrYtTjxg==
X-Received: by 2002:adf:e543:: with SMTP id z3mr8125188wrm.181.1613576992361; 
 Wed, 17 Feb 2021 07:49:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 16sm3355281wmi.43.2021.02.17.07.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 07:49:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 329191FF7E;
 Wed, 17 Feb 2021 15:49:49 +0000 (GMT)
References: <87y2fmsrxw.fsf@linaro.org>
 <CAHFG_=VHqTORBGshu5CpC83h3EtFeD1pPteftC4UfSUP9OyUbQ@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Fran=C3=A7ois?= Ozog <francois.ozog@linaro.org>
Subject: Re: Measuring the impact of buffer copy for virtio-gpu guests
Date: Wed, 17 Feb 2021 15:48:01 +0000
In-reply-to: <CAHFG_=VHqTORBGshu5CpC83h3EtFeD1pPteftC4UfSUP9OyUbQ@mail.gmail.com>
Message-ID: <87v9aqsnhe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mikhail Golubev <Mikhail.Golubev@opensynergy.com>,
 Vasyl Vavrychuk <Vasyl.Vavrychuk@opensynergy.com>,
 Zhao Jiancong <chou.kensou@jp.panasonic.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Griffin <peter.griffin@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Fran=C3=A7ois Ozog <francois.ozog@linaro.org> writes:

> On Wed, 17 Feb 2021 at 15:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>> Hi Gerd,
>>
>> I was in a discussion with the AGL folks today talking about approaches
>> to achieving zero-copy when running VirGL virtio guests. AIUI (which is
>> probably not very much) the reasons for copy can be due to a number of
>> reasons:
>>
>>   - the GPA not being mapped to a HPA that is accessible to the final HW
>>   - the guest allocation of a buffer not meeting stride/alignment
>> requirements
>>   - data needing to be transformed for consumption by the real hardware?
>>
>> any others? Is there an impedance between different buffer resource
>> allocators in the guest and the guest? Is that just a problem for
>> non-FLOSS blob drivers in the kernel?
>>
>> I'm curious if it's possible to measure the effect of these extra copies
>> and where do they occur?
>
> Making a good benchmark is going to be difficult. Copying has big impacts
> on:
> - L3 pressure (pure cost of evictions and loss of "sticky" cache lines
> benefits)
> - Memory request queue and prefetching
> - TLB pressure
> Conversely, as we are in VM environments the pressure that other VMs have
> on those resources, the jitter of the bounce copies will grow.
> (lesson learnt from high speed - > 100Gbps - user pace networking)
> All this to say that a unitest may be wrongly give impression that copy is
> not that costly.

No I'm not doubting that unneeded copying can be costly - I'm just
trying to get an understanding of the scope of the problem. How often do
buffers get copied rather than measuring the total effect which as you
say can be very load dependant.

>
>> Do all resources get copied from the guest buffer to
>> host or does this only occur when there is a mismatch in the buffer
>> requirements?
>>
>> Are there any functions where I could add trace points to measure this?
>> If this occurs in the kernel I wonder if I could use an eBPF probe to
>> count the number of bytes copied?
>>
>> Apologies for the wall of questions I'm still very new to the 3D side of
>> things ;-)
>>
>> --
>> Alex Benn=C3=A9e
>>


--=20
Alex Benn=C3=A9e

