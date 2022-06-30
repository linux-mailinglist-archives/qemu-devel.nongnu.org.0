Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB1562648
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 00:54:40 +0200 (CEST)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o733X-00072E-MP
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 18:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o731m-0005ok-1L
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:52:50 -0400
Received: from gw2.atmark-techno.com ([35.74.137.57]:33442)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dominique.martinet@atmark-techno.com>)
 id 1o731j-0003Fj-IS
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 18:52:49 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id BCA4120D06
 for <qemu-devel@nongnu.org>; Fri,  1 Jul 2022 07:52:44 +0900 (JST)
Received: by mail-pg1-f197.google.com with SMTP id
 d66-20020a636845000000b0040a88edd9c1so304031pgc.13
 for <qemu-devel@nongnu.org>; Thu, 30 Jun 2022 15:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7GW2S5YKFQpzruXLj2IHhnNvWngsf7PDLEfsPmQblL8=;
 b=ScX+ilY6k65ABakH7axBTky48PRJi42qN6FE1XUEHDGLcqasH6UQwlog0AvawMDzKe
 vLLl/eAjpdLQCoKkL5caoie4D7I3LcXFMg9gsHua/7lWr0ydQKm4LVAf0EWRVCRHj8QA
 gL0JsF4Tzx2sLiW9YcpwE9nTYyaodxkcdKaGicmf0lDGUu9H66VNKyPBlMigX+sRfZUc
 GAs/VeYqo/yZEUOir1uF423S1fKzAMuqX9pwswpeUoFvLM0h1R6Q8AOy5XKUqRmeUVdT
 ypTIa3N8ymRCgGiWK/X0OwvB7xU/dgy7hVYhVo8pvEPwOK1uEQv1QRjgRdlX+rIMND/G
 we1Q==
X-Gm-Message-State: AJIora8AgYUKOoybVeEPfK7RIv3mkp/A0K7F2Joeyp2s2SQiYWX+pwU7
 mIvjt3n6X6xeh0+txRn/ZPUFXEI7eFDlTwhPEZmD0a/heArDZJG6UVKUJFBA2mAuYnw3yeXDKlp
 1j5QyztWH75II0l3k
X-Received: by 2002:a17:903:3286:b0:16a:b0c:336 with SMTP id
 jh6-20020a170903328600b0016a0b0c0336mr18025141plb.79.1656629563656; 
 Thu, 30 Jun 2022 15:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMkp7EGzseCxB/FZhHA8r298UUHLSxEblWV34sD+59I3gzeVIn2QDgrtDFVmuhJ8AY8KkWgQ==
X-Received: by 2002:a17:903:3286:b0:16a:b0c:336 with SMTP id
 jh6-20020a170903328600b0016a0b0c0336mr18025117plb.79.1656629563383; 
 Thu, 30 Jun 2022 15:52:43 -0700 (PDT)
Received: from pc-zest.atmarktech (76.125.194.35.bc.googleusercontent.com.
 [35.194.125.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020a635c0a000000b0040c40b022fbsm13586457pgb.94.2022.06.30.15.52.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2022 15:52:42 -0700 (PDT)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.95)
 (envelope-from <martinet@pc-zest>) id 1o731d-000EnS-LA;
 Fri, 01 Jul 2022 07:52:41 +0900
Date: Fri, 1 Jul 2022 07:52:31 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Aarushi Mehta <mehta.aaru20@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Filipe Manana <fdmanana@kernel.org>
Subject: Re: [PATCH v2] io_uring: fix short read slow path
Message-ID: <Yr4pLwz5vQJhmvki@atmark-techno.com>
References: <20220629044957.1998430-1-dominique.martinet@atmark-techno.com>
 <20220630010137.2518851-1-dominique.martinet@atmark-techno.com>
 <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220630154921.ekl45dzer6x4mkvi@sgarzare-redhat>
Received-SPF: pass client-ip=35.74.137.57;
 envelope-from=dominique.martinet@atmark-techno.com; helo=gw2.atmark-techno.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella wrote on Thu, Jun 30, 2022 at 05:49:21PM +0200:
> > so when we ask for more we issue an extra short reads, making sure we go
> > through the two short reads path.
> > (Unfortunately I wasn't quite sure what to fiddle with to issue short
> > reads in the first place, I tried cutting one of the iovs short in
> > luring_do_submit() but I must not have been doing it properly as I ended
> > up with 0 return values which are handled by filling in with 0 (reads
> > after eof) and that didn't work well)
> 
> Do you remember the kernel version where you first saw these problems?

Since you're quoting my paragraph about testing two short reads, I've
never seen any that I know of; but there's also no reason these couldn't
happen.

Single short reads have been happening for me with O_DIRECT (cache=none)
on btrfs for a while, but unfortunately I cannot remember which was the
first kernel I've seen this on -- I think rather than a kernel update it
was due to file manipulations that made the file eligible for short
reads in the first place (I started running deduplication on the backing
file)

The older kernel I have installed right now is 5.16 and that can
reproduce it --  I'll give my laptop some work over the weekend to test
still maintained stable branches if that's useful.

-- 
Dominique

