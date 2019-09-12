Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAAB119D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:58:37 +0200 (CEST)
Received: from localhost ([::1]:35506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8QYO-0001vv-Nf
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lists2009@fnarfbargle.com>) id 1i8QW5-0000gg-8H
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 10:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lists2009@fnarfbargle.com>) id 1i8QW3-0004Rf-HT
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 10:56:12 -0400
Received: from ns3.fnarfbargle.com ([103.4.19.87]:33004)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lists2009@fnarfbargle.com>)
 id 1i8QVx-0004K9-5V; Thu, 12 Sep 2019 10:56:05 -0400
Received: from [10.8.0.1] (helo=srv.home ident=heh26227)
 by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lists2009@fnarfbargle.com>)
 id 1i8QTo-0007GA-KP; Thu, 12 Sep 2019 22:53:52 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=fnarfbargle.com; s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=xGd+pcX1KFyrytCSyty7tQuGEaiqj8QdzzNd20ivNN4=; 
 b=J0x6YTBwlu67tO0nnaWxI+Nc6cub3srmAVR67kIZSajU1+7YLfzKtnRpMzKMnJAORgDKwSU68nsjr60vWOao9CG6d/QMtW4niytaWqk86BqD/EhJy5TgIxe1P9gfv9xDE21qKuFaf0nPAQcEwOBEKbPadkkaUh5iD25rUD835DU=;
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <ed421291-7178-d7bc-5ed3-9863d28ceba9@fnarfbargle.com>
 <dd33a398-3c1f-0c92-2318-00ad144e1e5d@fnarfbargle.com>
 <b1782119-abbc-9678-8217-ef576dbf8c93@fnarfbargle.com>
 <20190906190351.GB20068@work-vm>
 <a9799b8b-a294-59e3-f329-060b19cdcf0e@fnarfbargle.com>
 <20190909152205.GC2726@work-vm>
From: Brad Campbell <lists2009@fnarfbargle.com>
Message-ID: <cde4d063-0d7a-c0d3-3fff-b87b650802b5@fnarfbargle.com>
Date: Thu, 12 Sep 2019 22:54:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190909152205.GC2726@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 103.4.19.87
Subject: Re: [Qemu-devel] [Qemu-discuss] Cross-posted : Odd QXL/KVM
 performance issue with a Windows 7 Guest
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
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/19 11:22 pm, Dr. David Alan Gilbert wrote:
> 
> Oh, hmm.
> Sorry I don't know too much where to look then; you have any of:
>    a) Windows
>    b) guest graphics drivers
>    c) spice server in qemu
>   
> and probalby some more.
> 
> So I think it's going to be a case of profiling on the two different
> systems and see if you can spot anything in particular that stands out.
> 

G'day Dave,

Thanks for the advice.

I ran qemu through Valgrind/callgrind and nothing excessive popped up. 
It looks like the issue might be in Windows, so I'm now trying to figure 
out how to profile inside the guest.

Suggestions as to how to profile the qxl driver while it's underway 
gratefully accepted. I'm working my way through the profiling tools in 
the Windows SDK & DDK but haven't made much headway.

Regards,
Brad

