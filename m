Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34035E7AB5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 14:27:07 +0200 (CEST)
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obhln-0001yK-Nn
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 08:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obhMK-0001m6-9L
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obhMI-0000GD-N4
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663934438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFKekn5AXEIiENDLOoC/XrKKnJmyQ64B2/aePIFS5Ok=;
 b=QnxsfeFmByKDVhehPpsIciedWTaUK2X5giDAYWkl0aee9uBLDaH5XlhNiahYlpOmzmvf6L
 2kgnu3Pj0CqdQHWcpiGB7fe3knKu+sytF2nXAY2f2od/WI3Hezdb6mM5EcCKeiJkPYcc5v
 +diUVraM1TP/tajG4qqcyBRwwfxDjoc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-93-35mxuRCOOpGEX4a7i-SWeA-1; Fri, 23 Sep 2022 08:00:36 -0400
X-MC-Unique: 35mxuRCOOpGEX4a7i-SWeA-1
Received: by mail-qk1-f200.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso8663748qkp.21
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 05:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SFKekn5AXEIiENDLOoC/XrKKnJmyQ64B2/aePIFS5Ok=;
 b=6f+mRAHcyGkZJAIJ/62qsD+NfasAvitubT7Q5gcv5qo4hFxBN72YXNQyUDCbB+ByOl
 H5yYvWciglz5NMji80CagIoD6CS3r5bRauG8+wdksJE7usEf9OW98rNzMKP6a/GZRq6l
 TJoJvTIlWzNRgi4F7D96Q3PGFhHzT25TaZopSFpPjEIkR7pnErlm6P5f27Yzmm4Q3qal
 1HTuPMy34aISOpSZk4R4KpHzph/FGVXPYAiFspLdtnby4Q0/3wHyBjsySzOSV3fllXmu
 Yep8m8YgJWasZM6HLq+X3X99RPTdbP9f4a4ormdmVh1rAT+vKNTJTF+DD716OF3efKNM
 txaA==
X-Gm-Message-State: ACrzQf1lrtgq5KikQCQMrlhqR5iBvAj1nh7LmEqwhTAhj6nF4ssAhfwr
 6+T8+zHH8+gmaan7ulGVCLXODdXMswg5KWFEYgSiH0lUVUsDoCqMC0LN/NKIa93k1llfC9I01xC
 iPaL9tkwFn0wDVgzWiJCCTGmpfPZCpGg=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr6233785qvb.17.1663934436266; 
 Fri, 23 Sep 2022 05:00:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Niu4FyfpCXHBZzXP8Ko7NLzU5/pPPsWFOPSqRI2FFqlJCC56Jas1l2Dum0Iv4jiO279UsSLvwKQnXRSrtV/s=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr6233757qvb.17.1663934436048; Fri, 23
 Sep 2022 05:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220826132104.3678958-1-eesposit@redhat.com>
 <20220826132104.3678958-19-eesposit@redhat.com>
 <09759123-8ed4-9c6e-2086-7f65af921a13@yandex-team.ru>
 <508253cf-3134-06ba-b5e6-9f2e594cc9ed@redhat.com>
 <0f0009a2-52d2-f779-61c0-6c7a4ab9a023@redhat.com>
In-Reply-To: <0f0009a2-52d2-f779-61c0-6c7a4ab9a023@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 23 Sep 2022 14:00:25 +0200
Message-ID: <CABgObfbx3NW9nbuJnVN2MTR_Yaie+8jjFjYrhi-xbzVVhDWdCA@mail.gmail.com>
Subject: Re: [PATCH v11 18/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>, 
 Xie Changlong <xiechanglong.d@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 22, 2022 at 4:42 PM Emanuele Giuseppe Esposito
<eesposit@redhat.com> wrote:
>
> Am 18/09/2022 um 19:12 schrieb Emanuele Giuseppe Esposito:
> >> In replication_stop, we call job_cancel_sync() inside
> >> aio_context_acquire - aio_context_release section. Should it be fixed?
>
> > I don't think it breaks anything. The question is: what is the
> > aiocontext there protecting? Do we need it? I have no idea.
>
> Ok Paolo reminded me that job_cancel_sync() calls
> AIO_WAIT_WHILE_UNLOCKED. This means that it indeed needs to be wrapped
> in an aiocontext release() + acquire() block.
>
> >> Another question, sometimes you move job_start out of
> >> aio-context-acquire critical section, sometimes not. As I understand,
> >> it's of for job_start to be called both with acquired aio-context or not
> >> acquired?
> >>
> > Same as above, job_start does not need the aiocontext to be taken
> > (otherwise job_lock would be useless).
>
> I still think here it does not matter if the aiocontext is taken or not.

What matters is that the AioContext lock is taken either inside or
outside the job_lock.

job_start() takes the job mutex, so you _always_ need to ensure that
the job mutex is taken inside AioContext lock and never the opposite.

From quick grep of AIO_WAIT_WHILE_UNLOCKED(), job_finish_sync_locked()
is the only user and the only place where the two locks interact. It
is explicitly called with AioContext locks _not_ taken, and releases
job_lock when the AioContext lock might be taken inside
AIO_WAIT_WHILE_UNLOCKED(); so it should be fine. This also validates
the idea of AIO_WAIT_WHILE_UNLOCKED().

Paolo


