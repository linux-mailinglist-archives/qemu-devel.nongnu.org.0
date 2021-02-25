Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38732529A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 16:45:06 +0100 (CET)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFIp5-0008Tq-VV
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 10:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFInv-0007WC-Ro
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:43:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFInu-0003sl-D3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 10:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614267829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vv/7CRLWAUmvN2S8pKhMvSwoaJugN0f4dZ6I9PVK3og=;
 b=HXq+Y34m+9sLvJ3Ldl1g6lm8py2davVnes7H3HDVpptEl1UN2nlOW2c3WwodhslM3Z22d+
 bjuC3rj93qfT0Zf+UxA7nq4H6lG3pjF68aIiEUSJqi3tXGeedDdNzlRAzvgGKXo4kK8Gfo
 TP9hid6ZR6hzaw8yqQ+1YJg0Hu+/n9Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-6o-TayDYOjKlkZIcaY0Q3w-1; Thu, 25 Feb 2021 10:43:40 -0500
X-MC-Unique: 6o-TayDYOjKlkZIcaY0Q3w-1
Received: by mail-ed1-f69.google.com with SMTP id g20so2926394edr.6
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 07:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vv/7CRLWAUmvN2S8pKhMvSwoaJugN0f4dZ6I9PVK3og=;
 b=WxfMM3oyRgO2fF/w77G+kmqYqrBuDBtigeuHVhFm+mP3Tr7pfDedB6QbKuVAlFU3Dr
 7TzL9t2N4uVoLyYDyVxeHx8iQPxDArEYgrLFP+NNe3Yzo3mBGMFvipxSO4a6Q3d2DMvK
 PUt9dPQezC07RQ3pQUvHdrGe8gpAlFGPHUwK8jhG2T8RGAAgjFJG8KtT6cdM9lyBuZSS
 hVgvBYH8rNt6v1nKKFwQtLqiEqp+RVoWeNUgNvOQ3jHKxcpORTnG0LqB38C//7wRdGRM
 QvR1svzo3Ix/y1dqEkVyyNBRJ8BWdJLsgFt97ZXW4vS28h3NPb1GIkP7VWYlp+nFkXbI
 6RAA==
X-Gm-Message-State: AOAM533xSaQ3AXs6Auh/fubcKfySZ2SizP4vRZJWuP6zxw81W+hHTuf1
 82rxJpEXHFyluM+GS8jPwdMGDtg8x71mSKzBdMpZr1J7Vs5LxWHUjXMMglNZ1B9QFOotsjjarq4
 Ab9gnTLk9eG0z/NQ=
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr3602359edy.12.1614267818955; 
 Thu, 25 Feb 2021 07:43:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySqXwreBdSI1b3ORihBy8qYFKBslmEtyPFwBs54jhM7dUFh8EojZbpUMaDZ1sc6O9Mx2E9Rw==
X-Received: by 2002:aa7:df0a:: with SMTP id c10mr3602345edy.12.1614267818810; 
 Thu, 25 Feb 2021 07:43:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bw22sm3200150ejb.78.2021.02.25.07.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 07:43:38 -0800 (PST)
Subject: Re: QEMU Clock record and replay
To: Arnabjyoti Kalita <akalita@cs.stonybrook.edu>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
References: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4677d3d-b221-3bba-185c-5a43faf6aab7@redhat.com>
Date: Thu, 25 Feb 2021 16:43:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJGDS+F0Mtv+XFXeR4wOP35UjmfKt+fiMAfraT7mg9J-4t+SiA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Pavel/Alex.

On 2/25/21 4:09 PM, Arnabjyoti Kalita wrote:
> Hello all,
> 
> I am trying to understand how the clock values are recorded and replayed
> in QEMU (when it runs in TCG mode). I have been specifically following
> the document that has been provided here -
> https://github.com/qemu/qemu/blob/master/docs/replay.txt
> <https://github.com/qemu/qemu/blob/master/docs/replay.txt>
> 
> I have the following 4 questions to ask-
> 
> - Why are clock values being replayed off a cache and not directly off
> the file as seen here -
> https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?
> <https://github.com/qemu/qemu/blob/stable-5.0/replay/replay-time.c#L45?>?
> 
> - I have a requirement to record and replay host clock values. Can it so
> happen that if incorrect values of the host clock are replayed, then the
> timers in the guest start expiring incorrectly, during replay?
> 
> - Let's say we record the clock values when the guest starts in KVM
> mode, and we replay the clock values when the guest starts in TCG mode.
> Does the record-replay functionality change a lot?
> 
> - Also, I couldn't understand the specific purpose of replaying the
> 'virtual real time clock' ? Do I still need to record and replay the
> 'virtual real time clock' if we record the clock values in KVM mode, and
> replay the clock values in TCG mode?
> 
> Thank you very much.
> 
> Best Regards,
> Arnab
> 
> 


