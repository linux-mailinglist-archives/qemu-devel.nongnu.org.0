Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2CF5264C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 10:17:48 +0200 (CEST)
Received: from localhost ([::1]:57426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfgeC-0004rZ-3w
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 04:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hfgbO-0002aw-Lb
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 04:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcel.apfelbaum@gmail.com>) id 1hfgbM-0001jR-OK
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 04:14:54 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
 id 1hfgbK-0001ZH-EM
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 04:14:50 -0400
Received: by mail-wr1-x444.google.com with SMTP id f15so6862508wrp.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=X2mwrltJlhx5CwqrPyN34TTsbDY7KmAwyOKXEZG9/GI=;
 b=U0S1ZE2H84SOyPvQ0Za0TanjwMyBg3ovWV2bkesw8mzDuoaIPpTbhLcRCBaKcacfJK
 AiVLPUkWjaYVoOhi97IIXn2TE6k5S3TplSR82ET40cxU+6RawKzM87BGsysvIRoaBQAO
 Z/f8xet4COUbjccl4CPP6V8qFVQlciaB4BHKfMY+0rbu90yODuDd1K1Hk9/WVcd1CDZl
 A0MtYorsef8+nTha54MtCzYkb+k5pZdEBGPiGWfuWgA+wDVrpaakuIjnf7cRi44JjtyI
 Ww44BkPqunfHvMAfOKJfFSiR+qLWw8jBP9dpPj05xHYMCgwZ0pPzdt+2j+jFVpwCmaKk
 /1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X2mwrltJlhx5CwqrPyN34TTsbDY7KmAwyOKXEZG9/GI=;
 b=aW/FmM5hWlj37R8956c+7Ce5XwOAe6x/WkWeoyojRNOmn0zfuU4OHSf/Iz6ZJ3anOq
 BBaq02EpsRWuAtpEl+Bcv+CpPHII1vN3lp5kAnRiOkIwfZiHbg8AGBjP+jbBMHSWsu/r
 UXViQ9QdJjVKG9ttbOPNg0AVIggQVGkYr4n3+BACjf2LMO+7rSe0lYwk7PNj1PJGqcIC
 eeJLdhHa70BOOzQCN0WKn6Tz+fY/0n8EA8sG0YGTnva8Bm/0MZySrIT+xXhoxMBHK4dQ
 DpIrZMIhZxmRzAZIN9jpymLFXPZM4X78ZQ1gyUvAOtrSnYZEv7IWvZFV5A149qljCx/I
 r/tw==
X-Gm-Message-State: APjAAAUPP174R/9S5+hOQj9v5zOqA87psW6YyYwiXdieaZjXOiungADi
 +uUhQBjiUEmRjfqHVwlUjTTT9h9i
X-Google-Smtp-Source: APXvYqxEH1QxqtJ+CGm80pfFBQFN1NpIH6hf+Zqk8X3EgiPngWC8gRqN32SQCcOIzZUkF0F/YgLRYg==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr26565688wrr.324.1561450486402; 
 Tue, 25 Jun 2019 01:14:46 -0700 (PDT)
Received: from localhost.localdomain ([37.142.144.27])
 by smtp.gmail.com with ESMTPSA id t12sm14098963wrw.53.2019.06.25.01.14.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 01:14:45 -0700 (PDT)
To: Sukrit Bhatnagar <skrtbhtngr@gmail.com>, qemu-devel@nongnu.org,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190621144541.13770-1-skrtbhtngr@gmail.com>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <a80f7beb-48c1-553a-f137-731e5500b608@gmail.com>
Date: Tue, 25 Jun 2019 11:14:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190621144541.13770-1-skrtbhtngr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [RFC 0/1] Add live migration support to the PVRDMA
 device
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
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Sukrit

On 6/21/19 5:45 PM, Sukrit Bhatnagar wrote:
> Hi,
[...]
> This RFC is meant to request suggestions on the things which are
> working and for help on the things which are not.
>
[...]
> What is not working:
>
[...]
>
> * It seems that vmxnet3 migration itself is not working properly, at least
>    for me. The pvrdma device depends on it, vmxnet3 is function 0 and pvrdma
>    is function 1. This is happening even for a build of unmodified code from
>    the master branch.
>    After migration, the network connectivity is lost at destination.
>    Things are fine at the source before migration.
>    This is the command I am using at src:
>
>    sudo /home/skrtbhtngr/qemu/build/x86_64-softmmu/qemu-system-x86_64 \
>      -enable-kvm \
>      -m 2G -smp cpus=2 \
>      -hda /home/skrtbhtngr/fedora.img \
>      -netdev tap,id=hostnet0 \
>      -device vmxnet3,netdev=hostnet0,id=net0,mac=52:54:00:99:ff:bc \
>      -monitor telnet:127.0.0.1:4444,server,nowait \
>      -trace events=/home/skrtbhtngr/trace-events \
>      -vnc 0.0.0.0:0
>
>    Similar command is used for the dest. Currently, I am trying
>    same-host migration for testing purpose, without the pvrdma device.
>    Two tap interfaces, for src and dest were created successfully at
>    the host. Kernel logs:
>    ...
>    br0: port 2(tap0) entered forwarding state
>    ...
>    br0: port 3(tap1) entered forwarding state
>
>    tcpdump at the dest reports only outgoing ARP packets, which ask
>    for gateway: "ARP, Request who-has _gateway tell guest1".
>
>    Tried using user (slirp) as the network backend, but no luck.
>    
>    Also tried git bisect to find the issue using a working commit (given
>    by Marcel), but it turns out that it is very old and I faced build
>    errors one after another.
>
>    Please note that e1000 live migration is working fine in the same setup.
>

I tried to git bisect , but I couldn't find a working version of vmxnet 
supporting live migration ....
I tried even a commit from December 2014 and it didn't work.

What is strange (to me) is that the networking packets can't be sent 
from the guest (after migration)
even after rebooting the guest.

Any help or pointer would be greatly appreciated.
Thanks,
Marcel


[...]

