Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89169512B41
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 08:04:59 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njxGs-0001ws-8i
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 02:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1njxCB-0000NA-PP
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:00:08 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:34758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1njxC9-00058P-PG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 02:00:07 -0400
Received: by mail-oi1-x234.google.com with SMTP id s131so4366255oie.1
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 23:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=dwbQm1VnzIZbY2anbYhUFvRcuN5zNqRnT0QiofDbYFM=;
 b=QsPFOxszwAea8I2uDx2LL3px60JVaGQdFIl0s5GnXNBKEYdEKcKhvMKT+UK0sK00nW
 pYOJfUwIE0QylyPMt56mqqFa9gzHHzG3OzJ/0gv4Z4li1YqrCV0PhMRVbpJ/786tugtV
 CGYtO28C/cNf9pgN0zXN30dKpI47cNkBXSiHKXOT1Qnj3eXaVFsLTzvOs0xLts05FDnY
 FtsKIOkN0L5HbzMuGsIe7CCGAMnug8WJktAP+yshAD3DAGMxNcI+Hu51xl5lpL9E5ehK
 ZDBxkuX3nyROEbtcqstM1DnBWZIeT88cKuQ8kfDau81bPtF7zZQEnDkhQCy2W24bISAQ
 EkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dwbQm1VnzIZbY2anbYhUFvRcuN5zNqRnT0QiofDbYFM=;
 b=4rquUOPSjS2bNCiVTHaTSHcrYMTQxgc++7sVmRIKnzSZll4s72Ox1dS6Zr11K3rWL+
 Y3SbMT/7SOOZS8UYWyWGk0xqFkvZayPPfDg0gxurZkQQtSk7+tIThAmpVEQnNO5q9ycV
 g6JEwtcNQfuHQs4VF3jDEu8pI6QyKJ+TBXv64neDZ4p5gexa9hm4yG5YIRmIcflOIpky
 OVhHJby1+gWEoNdDOi4hTCBUWn9h6kA8U/YYjVCgg0KFcDcvU3VGzCPCAHT5y/IfM8m4
 r/JpVC9/XjkM3SQeMRSI56I5EC0WITTjyiVDe/Tko3UjWM5yS8kNagqLT9MJ5DTipRpc
 7b9A==
X-Gm-Message-State: AOAM530qgiVhec9PIZhHHrzhe6EJDr2no91iD33vwF0jcWjrV0Equza3
 dH8u8iq9q5y7roxCYg4Ik/DWyA==
X-Google-Smtp-Source: ABdhPJydMG7AIJHy4NILtehzI/2byH735WJAOu42PHnGZD4ghQspODKJV6nPMPs0hDYUjPFmJjIjTA==
X-Received: by 2002:a05:6808:1645:b0:325:5182:a9ca with SMTP id
 az5-20020a056808164500b003255182a9camr7430840oib.104.1651125604567; 
 Wed, 27 Apr 2022 23:00:04 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a056870028400b000e5aa7f2cadsm1525070oaf.3.2022.04.27.23.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 23:00:04 -0700 (PDT)
Message-ID: <45188be3-0e1a-8645-f7da-3c87a6f8d8e5@landley.net>
Date: Thu, 28 Apr 2022 01:04:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
From: Rob Landley <rob@landley.net>
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
 <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
In-Reply-To: <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::234;
 envelope-from=rob@landley.net; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/22 00:41, Rob Landley wrote:
> On 4/27/22 10:27, Thomas Huth wrote:
>> On 26/04/2022 12.26, Rob Landley wrote:
>>> When I cut and paste 80-ish characters of text into the Linux serial console, it
>>> reads 16 characters and stops. When I hit space, it reads another 16 characters,
>>> and if I keep at it will eventually catch up without losing data. If I type,
>>> every character shows up immediately.
>> 
>> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
>> QEMU sources, I think.
>> 
>>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>>> binary and it goes through just fine in one go, but this target hangs with big
>>> pastes until I hit keys.)
>>> 
>>> Is this a qemu-side bug, or a kernel-side bug?
>>> 
>>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>>> 
>>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>>> console=hvc0"
>> 
>> Which version of QEMU are you using?
> 
> $ qemu-system-ppc64 --version
> QEMU emulator version 6.2.92 (v6.2.0-rc2)
> Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

Just confirmed it behaves the same with current git (commit cf6f26d6f9b2).

Rob

