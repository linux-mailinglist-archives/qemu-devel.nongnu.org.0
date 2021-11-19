Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80724456DB5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:44:30 +0100 (CET)
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo1Nd-0007xY-HW
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:44:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mo1MC-0006sU-3G
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:43:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mo1MA-0004IX-L1
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637318578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RX8OvaADbFutSHRUzRwYwJBJLcRpAvQ0pD8rKsm7f0Y=;
 b=QEXyaxKVNB+TRs9g/fUH1oTGzSOj9jwV0YHy+BqgclUWgFIcTR2JhOdZULyfvzTKHyxsLu
 vD3DYfsJ4dbRC4uU35/MC62OuayOYOg61k6fnwpBEtIJcrlJmUm+hVrjkU1I0V2OLj6Dp4
 js2ZL2Unx+q6bm97n+NUvWo6FFo+EZY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-243-7cOh68i7Mk6_atozHcb5fQ-1; Fri, 19 Nov 2021 05:42:57 -0500
X-MC-Unique: 7cOh68i7Mk6_atozHcb5fQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m17-20020aa7d351000000b003e7c0bc8523so8064757edr.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RX8OvaADbFutSHRUzRwYwJBJLcRpAvQ0pD8rKsm7f0Y=;
 b=75Y6krPO3wyc5AycH0NiJsxtZDdbgV6ADpDwUqd0HF4oWePFTOnmZ5icnPqVknfU6s
 Ff1Hm5kVNeYbD202ApaZJmnmIAMp8jECsM285xpbMihcaTTmDt234bUTK0+cp2Qyx4sB
 yyQ71lSjR/o/bnTAnw5QhQJsQugK3Kux0XzZd9mr3Vtog/z1tNJU2gwizJFfN3ZH8zGk
 aRKnjlmjIWYCbA6/0OHf98LPrTTuN8jgdbq9JehhDXuDERnfZnGqdYA2ZuOXcFW+vZSe
 n/tl76pdxSBS6ZLssCZAbgOT8jry7w4Cd0/ApumhLkxKXxZl27dS+8JdBzRzdaYHTdGH
 rMAw==
X-Gm-Message-State: AOAM531hhxRfmfriyq2q4fo4magbAGBwQXE46OYdLxfD8wnhenuECCF7
 lGZ/1qUoQEiP4hq+nowaURbGVYsKQ2Rr/buy6tBSyOM/WdwV6WRRSsRM02bFnBBEJLsij+8GOrn
 7+OGArhGpBMg8OL0=
X-Received: by 2002:a05:6402:1e92:: with SMTP id
 f18mr22544176edf.153.1637318574517; 
 Fri, 19 Nov 2021 02:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+VKsEZ4sYC+M0c9ItduLy8MPQCSE4qD15qAFHdJmlkdI7t5HU/dRKSNQbP2OtvnoyPYzNCw==
X-Received: by 2002:a05:6402:1e92:: with SMTP id
 f18mr22544115edf.153.1637318574250; 
 Fri, 19 Nov 2021 02:42:54 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id b11sm1341156ede.62.2021.11.19.02.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:42:53 -0800 (PST)
Message-ID: <b57c47ed-4ec7-c57e-788e-723c286c234b@redhat.com>
Date: Fri, 19 Nov 2021 11:42:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 00/25] block layer: split block APIs in global state
 and I/O
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <93821bd8-2ac0-a19e-7029-900e6a6d9be1@redhat.com>
 <a2891f6d-f383-f252-4b82-da08b2a2c1d7@redhat.com>
 <3e55da77-66e1-d9ac-e23a-3fa0beceec8e@redhat.com>
 <CABgObfYnJ+TjDbbBcpnx39q+sNA8_ec_mNV7FVUCp3qDDY5R-A@mail.gmail.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <CABgObfYnJ+TjDbbBcpnx39q+sNA8_ec_mNV7FVUCp3qDDY5R-A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 19/11/2021 04:13, Paolo Bonzini wrote:
> 
> 
> El jue., 18 nov. 2021 16:31, Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> escribió:
> 
>     On 18.11.21 14:50, Paolo Bonzini wrote:
>      > On 11/15/21 17:03, Hanna Reitz wrote:
>      >>
>      >> I only really see four solutions for this:
>      >> (1) We somehow make the amend job run in the main context under the
>      >> BQL and have it prevent all concurrent I/O access (seems bad)
>      >> (2) We can make the permission functions part of the I/O path
>     (seems
>      >> wrong and probably impossible?)
>      >> (3) We can drop the permissions update and permanently require the
>      >> permissions that we need when updating keys (I think this might
>     break
>      >> existing use cases)
>      >> (4) We can acquire the BQL around the permission update call and
>      >> perhaps that works?
>      >>
>      >> I don’t know how (4) would work but it’s basically the only
>      >> reasonable solution I can come up with.  Would this be a way to
>     call
>      >> a BQL function from an I/O function?
>      >
>      > I think that would deadlock:
>      >
>      >     main                I/O thread
>      >     --------            -----
>      >     start bdrv_co_amend
>      >                     take BQL
>      >     bdrv_drain
>      >     ... hangs ...
> 
>     :/
> 
>     Is there really nothing we can do?  Forgive me if I’m talking complete
>     nonsense here (because frankly I don’t even really know what a bottom
>     half is exactly), but can’t we schedule some coroutine in the main
>     thread to do the perm notifications and wait for them in the I/O thread?
> 
> 
> I think you still get a deadlock, just one with a longer chain. You 
> still have a cycle of things depending on each other, but one of them is 
> now the I/O thread waiting for the bottom half.
> 
>     Hmm...  Perhaps.  We would need to undo the permission change when the
>     job finishes, though, i.e. in JobDriver.prepare() or JobDriver.clean().
>     Doing the change in qmp_x_blockdev_amend() would be asymmetric then, so
>     we’d probably want a new JobDriver method that runs in the main thread
>     before .run() is invoked. (Unfortunately, “.prepare()” is now taken
>     already...)
> 
> 
> Ok at least it's feasible.

Ok I think I got it. I will create a new callback, maybe "pre_run" or 
something like that to perform the first bdrv_child_refresh_perms and 
implement the .clean callback to perform the "cleanup" 
bdrv_child_refresh_perms in block_crypto_amend_options_generic_luks.

> 
>     Doesn’t solve the FUSE problem, but there we could try to just take the
>     RESIZE permission permanently and if that fails, we just don’t allow
>     truncates for that export.  Not nice, but should work for common cases.
> 
> 
> Yeah definitely not nice. Probably permissions could be protected by 
> their own mutex, even a global one like the one we have for jobs. For 
> now I suggest just ignoring the problem and adding a comment, since it's 
> not really something that didn't exist.
> 

Will add a TODO in blk_set/get permissions explaining the issue.
Last issue we had with regards to permissions in GS had to do with 
bdrv_co_invalidate_cache: however, Paolo suggested me a simple fix to 
simply assert that the function is either under BQL or does not have 
open_flags & BDRV_O_INACTIVE set. This basically skips the permission 
code block, entering it only if we have the BQL.


Ok, apart from this permissions issue and assert_bdrv_graph_writable, I 
should have addressed all main comments of this series. Assume that for 
the others where I did not explicitly answered, I agree and applied your 
comments.

Thank you,
Emanuele


