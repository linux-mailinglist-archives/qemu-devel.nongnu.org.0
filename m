Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E7D493FD9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:26:42 +0100 (CET)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFfM-0007PK-Sa
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFcL-0006Tz-7W
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFcI-0005GY-SL
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642616603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eVOHpeMGKrGFrj+KwmMtOot9B3qupEuQG0hR/lpNFkY=;
 b=DjMwRth+SmuqhTyeYcL0OlHgnJVcQcD1RvQiB5sOuA77/LNhWU80Wls83pTsnzNwFiIE2d
 8gibLLWO6nneN7oI4VV8vvS7/FtpZqlKZrR9wh6AXTs+Uw/3bLxNA0F64+NSIqjQ/gePud
 nJR9Qastip4EDflYv3OVZ8TNcVRXTac=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-8o_Rt0L_PRiTb-prSTLNcQ-1; Wed, 19 Jan 2022 13:23:22 -0500
X-MC-Unique: 8o_Rt0L_PRiTb-prSTLNcQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 el8-20020a056402360800b00403bbdcef64so3463066edb.14
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eVOHpeMGKrGFrj+KwmMtOot9B3qupEuQG0hR/lpNFkY=;
 b=0+Uw2xRjTN8cTH/lk8Rq0MK0rIrW9qkwehamSZe09sr3utpE7KVwEsoeUBCULQfQZz
 NzzRjS5TDH2BgBW0N5esV85hXIqNFtMk8aRJZ6c8EeXg4tWg5Q/2/5cTLIgieNP/EtTv
 ndugmBjnexs++VRcrsL+9n//dfJ6Ll1Wu9TsoIFenKsksi2enoLM1+TRysayRGb4WXr+
 udvsgTuYUj6GmIl/eq5ByQBiiafgvYbJhrBCr5dHOLp1ksj6CuVfJyxjijsF3CbTbh1B
 qNTeyaBIuCNHa5Sokt0Q4EMtXZfUnc2X2xRqSNNKfHDV7TXDb3i77j0yOulszSYlApk/
 E+hA==
X-Gm-Message-State: AOAM530NhjKwfNl1V/QZUr7yHxKrnDYJGjFGnv1hnveE/eYmptDvb8n1
 IQ1ukvdKm4MPSK7rW2oIR6BzxPnPostB9ubu83ptzsTRCUFCnvPDp8+EiYELk5wq1yqZVys4Su/
 ohKaxySDLUNREkgYGjQxk1+lP6a8rLJM=
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr17185415lfr.630.1642616600816; 
 Wed, 19 Jan 2022 10:23:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFMFqUlOy7I78KNm9IKTKldPBmXJLfUUmNm35CvW9aSuo+M7S/uBcJA0G8Po8Mug2IvPoDFUZ1/lLhx8VY290=
X-Received: by 2002:ac2:4e07:: with SMTP id e7mr17185392lfr.630.1642616600572; 
 Wed, 19 Jan 2022 10:23:20 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-6-leobras@redhat.com>
 <Yd/RkBTwMFxYBOiX@xz-m1.local>
In-Reply-To: <Yd/RkBTwMFxYBOiX@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:23:09 -0300
Message-ID: <CAJ6HWG65oghwxjaxZ=Vh-LBMg2XH+nGL5wu+nL=NghekO+0_Fw@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

On Thu, Jan 13, 2022 at 4:15 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:42PM -0300, Leonardo Bras wrote:
> > Implement zero copy on nocomp_send_write(), by making use of QIOChannel
> > writev + flags & flush interface.
> >
> > Change multifd_send_sync_main() so it can distinguish each iteration sync from
> > the setup and the completion, so a flush_zero_copy() can be called
> > after each iteration in order to make sure all dirty pages are sent
> > before a new iteration is started.
>
> Leo - could you remind me (since I remembered we've discussed something
> similar) on why we can't simply do the sync() unconditionally for zero copy?

On previous implementations, it would get stuck on the setup, since it
was waiting for any movement on the error queue before even starting
the sending process.
At the time we would sync only at 'complete', so it would only need to
run once. Running every iteration seemed a waste at the time.

Then, after some talk with Juan, it was decided to sync after each
migration, so on 'complete' it was unnecessary.
But sure, now it would add just 2 syncs in the whole migration, and
those should not even get to the syscall due to queued/sent counters.

>
> I remember why we need the sync(), but I can't remember what's the matter if we
> simply sync() too during setup and complete of migration.
>



> Another trivial nit here:
>
> > -void multifd_send_sync_main(QEMUFile *f)
> > +int multifd_send_sync_main(QEMUFile *f, bool sync)
>
> I'd name it "bool full" or anything not called "sync", because the function
> already has a name that contains "sync", then it's werid to sync(sync==false).
>

Yeah, I agree.
But if we will flush every time, then there is no need for such parameter :).

> The rest looks good to me.  Thanks.
>

Thanks!

> --
> Peter Xu
>

Best regards,
Leo


