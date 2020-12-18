Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB1E2DE51E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:51:12 +0100 (CET)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqH67-0003Ai-65
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqH53-00028h-QH; Fri, 18 Dec 2020 09:50:05 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:53929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1kqH50-00055C-N1; Fri, 18 Dec 2020 09:50:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id iq13so1413341pjb.3;
 Fri, 18 Dec 2020 06:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iBtkezwhG5m6Bz8DSrB2RxuoeZavx4nE/pGviYuTN4Q=;
 b=Ev6+yKudtE4/K9NKGeJv6qpCDj+ERNL0D86hqNJcW8EJuwpOEIe8m2lLh9Amm5XzBh
 Do8tmSe138X5+Wvi1R+PHzQFH0z7SNeqXimiUL9xyhbnn9vemFSXQyt5KVfKztGxPeko
 0/Hykn0A4VJakfR5IqVG3T4E9vmgwyEfSrpx9mX5eW8tdmw4f5XdlfNjL16H6bztixbT
 5IZ4BD1moKiL+XquzCI/VFbQV0mgM2+QN5XNXg1djmJd3V77Q6gAif4UOIhRbxOwRjTX
 6D5CciLw/p+sreT0OHxojGvkXLPZtmrSmNiUD6tL9tOBLd+GcmM/vFr06twWCDi3Pjs3
 AMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iBtkezwhG5m6Bz8DSrB2RxuoeZavx4nE/pGviYuTN4Q=;
 b=FyZcisoGHjfD85ltX14s2DGuBN8xXQqMWwhwCNLkVI4I7UlPaR8Yi27fWcVGBrShql
 VYWFQ+ojy4z7T9hArz1tiNKps16MdcSxvbZfKgfspuQzdM9v8cSWPxG1/pTYik3gaa9W
 S9tL9o38cKGfbDniEthBDmamIXeDb5uhilgiXzEYvHcGp/3LN580ZuPJNB6cEYZQRMjn
 jbMN1vHieZzkYWOaFycYqbnKP82AkX2SLz6XbSdFe4yNA9skzuXpGZeNvfHF8bWyz1FH
 gpHfxp4yTMoBTd8zbaMi31TYUzKUqzR8m0suDX553KNSXyEdbsPwlKgo4Qc65s7+Hk1K
 aBwg==
X-Gm-Message-State: AOAM533NG+Xkc3OGuQGzxLDb7jmkCZsKkCf2xxa9TrrHwdiVdWEPdehj
 dpxsZKa+jwQ+aTQRmw3Dhrc=
X-Google-Smtp-Source: ABdhPJwc/p94NNvDRRcC+3xwOE/XK8zgZmqJ02HqTCASrbS134rVlDsbrIuaii1S/25ciV27pzrbBQ==
X-Received: by 2002:a17:90a:1f01:: with SMTP id
 u1mr4640881pja.62.1608303000967; 
 Fri, 18 Dec 2020 06:50:00 -0800 (PST)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id g7sm7911107pjm.46.2020.12.18.06.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:50:00 -0800 (PST)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 18 Dec 2020 22:49:06 +0800
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH for-5.2 01/10] test: new qTest case to test the
 vhost-user-blk-server
Message-ID: <20201218144906.putr67rgijg6nu7r@Rk>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-2-stefanha@redhat.com>
 <20201125082056.wcxx274zo34qmobb@Rk>
 <20201125082820.6g5umkr4dafrzsai@Rk>
 <20201207112838.GD203660@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201207112838.GD203660@stefanha-x1.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=coiby.xu@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 11:28:38AM +0000, Stefan Hajnoczi wrote:
>On Wed, Nov 25, 2020 at 04:28:20PM +0800, Coiby Xu wrote:
>> On Wed, Nov 25, 2020 at 04:20:56PM +0800, Coiby Xu wrote:
>> > On Wed, Nov 11, 2020 at 12:43:22PM +0000, Stefan Hajnoczi wrote:
>> > > +static void quit_storage_daemon(void *qmp_test_state)
>> > > +{
>> > > +    const char quit_str[] = "{ 'execute': 'quit' }";
>> > > +
>> > > +    /* Before quiting storate-daemon, quit qemu to avoid dubious messages */
>> > > +    qobject_unref(qtest_qmp(global_qtest, quit_str));
>> > > +
>> > > +    /*
>> > > +     * Give storage-daemon enough time to wake up&terminate
>> > > +     * vu_client_trip coroutine so the Coroutine object could
>> > > +     * be cleaned up. Otherwise LeakSanitizer would complain
>> > > +     * about memory leaks.
>> > > +     */
>> > > +    g_usleep(1000);
>> >
>> > Your "[PATCH for-5.2 07/10] vhost-user-blk-test: fix races by using fd passing"
>> > prompts to me think if there is a race condition under which 1000 ms
>>                                                               ^^^^^^^
>> Sorry, I meant 1000 μs.
>
>In the next revision vhost-user-blk-test sends a SIGTERM signal to
>qemu-storage-daemon and then calls waitpid(2). This way there is a clean
>shutdown without a sleep.
>

Thank you for the explaining! Do you think checking if
qemu-storage-daemon has exited by detecting if qemu-storage-daemon's
QMP monitor socket has been closed is simpler solution than
waitpid(2) in v2?

>Regarding the LeakSanitizer issue you saw, are you still able to
>reproduce it with commit f10802d2c9fd8bfd92c70f465da1a5992445157f
>("qemu-storage-daemon: add missing cleanup calls") applied? Maybe
>qemu-storage-daemon is still missing some cleanup code (e.g. to stop
>exports before terminating).

It seems commit f10802d2c9fd8bfd92c70f465da1a5992445157f
("qemu-storage-daemon: add missing cleanup calls") is not related to
the LeakSanitizer issue.

When applying v9 (no "g_usleep(1000)") on
commit eea8f5df4ecc607d64f091b8d916fcc11a697541
("Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20200611.0' into staging")
which doesn't contain commit f10802d2c9fd8bfd92c70f465da1a5992445157f,
there is no LeakSanitizer issue.

However, if applying v9 on
commit d0ed6a69d399ae193959225cdeaa9382746c91cc ("Update version for v5.1.0 release")
which contains commit f10802d2c9fd8bfd92c70f465da1a5992445157f, there is
the LeakSanitizer issue.

And if applying this patch set on
commit 23895cbd82be95428e90168b12e925d0d3ca2f06
("Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging"),
the LeakSanitizer issue couldn't be reproduced even without "g_usleep(1000)".

>
>Stefan



--
Best regards,
Coiby

