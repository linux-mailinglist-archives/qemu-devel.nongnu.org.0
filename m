Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694EB36E978
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 13:18:55 +0200 (CEST)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc4h4-0004kz-GX
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 07:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lc4fs-0004BP-Ue
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lc4fn-0005ud-1w
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619695048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HfCx7/cemNwqdfVRMUb1VpAbwhbsu+QKu0VEYlf3oI=;
 b=OjKB90SNg4DXGqV00dw6hBkM/GP0Ri+EFhaA7BLvrnP2XHCcTeyRpo8t4otp7gSiPc4C7y
 f1REbkO5PQJ1JMtxnx3MiqfAh85Svw5mQyGy7P6GFc+bu3F1MaHsHVrdJ2neWea+rh0XAe
 hKfe+PL/ggcCFQFM9jcX2XskGT0ImOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-K6MPsn5JMnGYDD0bWGTHUw-1; Thu, 29 Apr 2021 07:17:23 -0400
X-MC-Unique: K6MPsn5JMnGYDD0bWGTHUw-1
Received: by mail-wr1-f69.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso23901785wrs.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 04:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1HfCx7/cemNwqdfVRMUb1VpAbwhbsu+QKu0VEYlf3oI=;
 b=AAjD+lcQl20+iVX02BTNH+7W29xWoVTVxTmaC2c3lF9t2vPDLFnspY+I3imuzuQKvz
 QLZxrxLPjq/abuRRIQy2lg1dCOTKpmTIX/G3aBMvjq2z3pjpbdcpbOjYIZ7LZ1fbSJR0
 o/WGjrST999FzBAoFK0amn39P1tu0rs55gAA28+l6xDTzSD4g5QaDR3BlfRizGCrTddu
 iv7WUWwQ2kHm1kEVtlQxMKPUAg0qWnsEe+G23r1dRwSYwmTX/gK5X+lRUJBnwuWrhqsP
 Ef546ZCumm7evs6BnvDscysdu5db1clAet0VtcEMr1LFZyAPAlA1NWtHZwtPp86a/7rn
 9efg==
X-Gm-Message-State: AOAM531bTzsr5L8Zu2sPTVgfPZ0ZvHY2g3YbRQTYs3HnBx+MOVyDzBjy
 mk80sZ8Gn6nm+98qxU1/LEUuVN7/qeqRs6WosemWL/OGTNKGToDW9EUkjrK+L9K7T/DjAgp2Xd7
 6PYBox5ytO8Xzb6k=
X-Received: by 2002:a5d:6885:: with SMTP id h5mr35265497wru.229.1619695038691; 
 Thu, 29 Apr 2021 04:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+YAWJHmhQAiAn9NMqVQhShyJT2A0cSXx8fSO31jq5eD3mvtPWm+uISElaiu0ziQtnFYTsiQ==
X-Received: by 2002:a5d:6885:: with SMTP id h5mr35265459wru.229.1619695038469; 
 Thu, 29 Apr 2021 04:17:18 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83824.dip0.t-ipconnect.de.
 [217.232.56.36])
 by smtp.gmail.com with ESMTPSA id g6sm5125867wrr.63.2021.04.29.04.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 04:17:17 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Anthony Green <green@moxielogic.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <978e7623-8150-a2ac-20b0-69ab094c8a43@redhat.com>
Date: Thu, 29 Apr 2021 13:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <87y2d1csxe.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/04/2021 11.59, Markus Armbruster wrote:
> If you're cc'ed, you added a section to docs/system/deprecated.rst that
> is old enough to permit removal.  This is *not* a demand to remove, it's
> a polite request to consider whether the time for removal has come.
> Extra points for telling us in a reply.  "We should remove, but I can't
> do it myself right now" is a valid answer.  Let's review the file:
[...]
> Thomas Huth:
> 
>      ``moxie`` CPU (since 5.2.0)
>      '''''''''''''''''''''''''''
> 
>      The ``moxie`` guest CPU support is deprecated and will be removed in
>      a future version of QEMU. It's unclear whether anybody is still using
>      CPU emulation in QEMU, and there are no test images available to make
>      sure that the code is still working.

I'm fine with dropping moxie now - I've never seen anybody using it and I've 
never spotted any binaries in the internet that could still be used for 
regression testing of this target. And I've also put Anthony Green on CC: 
when I suggested the deprecation and he never replied. So I think it's 
really completely unused.

>      ``lm32`` CPUs (since 5.2.0)
>      '''''''''''''''''''''''''''
> 
>      The ``lm32`` guest CPU support is deprecated and will be removed in
>      a future version of QEMU. The only public user of this architecture
>      was the milkymist project, which has been dead for years; there was
>      never an upstream Linux port.
> 
>      ``unicore32`` CPUs (since 5.2.0)
>      ''''''''''''''''''''''''''''''''
> 
>      The ``unicore32`` guest CPU support is deprecated and will be removed in
>      a future version of QEMU. Support for this CPU was removed from the
>      upstream Linux kernel, and there is no available upstream toolchain
>      to build binaries for it.

I didn't add these two entries to the deprecation list, I just moved them 
around since they were in the wrong section. Both have been added by Peter 
instead (commit d8498005122 and 8e4ff4a8d2b)

  Thomas


