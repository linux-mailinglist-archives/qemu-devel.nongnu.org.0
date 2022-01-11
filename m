Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650B48BB8E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 00:47:36 +0100 (CET)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7QrW-0003gH-7c
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 18:47:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7QpV-0002e0-WC
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:45:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7QpQ-0007Df-Q9
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641944713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wvkqiU4vxREXp20FaUfxIRpGDzframiPzvD6zjf7LwU=;
 b=e5soW+odUAXkaTPBIFSzB0stPtwHc+fLIjyooT9tUtdVy7FrYEvJexw6GKzdqpAocFMwL5
 Y3iYRwaDWBcGXT+AIjdjxkbwpOQ3xzBNdBaiU8/7Fc4GqS5CMMr3Javfl/A5RSMVHAoDTX
 k/S71EVJzwHAtWXAalXSo3vYAMDbK54=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-AecaE8HZMnanQGJ1EZ0tTw-1; Tue, 11 Jan 2022 18:45:10 -0500
X-MC-Unique: AecaE8HZMnanQGJ1EZ0tTw-1
Received: by mail-ua1-f70.google.com with SMTP id
 x9-20020ab05789000000b002fa60bdf012so532246uaa.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 15:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wvkqiU4vxREXp20FaUfxIRpGDzframiPzvD6zjf7LwU=;
 b=5cRTSulJq4hB2qE+xQoC4fAh2xvkGp/DHm/nZadpwMK2ZuOqHXq6kMtJ2jpL+RyFyg
 Lq66vPyr5cL8IjECRvreu/YO0jAwmdtIo7yADeFYFaNKFfeQQavkSMbCdNwWMW3C0JTo
 Yoj5+Qz1Ou/avEgVdmM3Ep/+W3wFj3Fv1YmJ6E1PtYLfwGTDd/ER7vQI5jYeOD/ksqCH
 4K7rojHSUFlLryh/Kh/+VSUMkm0zSvJm0F6MGHrBb1kdBTHceuqq2ieFTvJ1FdmV7LPi
 Zp2zizmwNCwZ//9WzyZrwB1HunY96ZSci08yWqZK5OMjVVXEql7Vls5K+R124CdqI/jn
 FO+Q==
X-Gm-Message-State: AOAM530uWFHIyYJ6rLmegPH5s0l5oV+/Gi90m25U/bdlj7rSKu3BCQIm
 QUoEns/rQagyWtSLM0H2EqsWZc1a8YIaSQ9izvli3M2sfCkZXVHLlm6GGZIcEbhrtN4Mhl9mcpI
 MYgKtefH14kZr0S9g0k7KbkVfME6kttY=
X-Received: by 2002:ab0:2141:: with SMTP id t1mr3094687ual.87.1641944709383;
 Tue, 11 Jan 2022 15:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfHOQCq7wDq8l5sW/aLoYjC3Z7/QbA1rPsy4NyvW1rwXEOqw1bm1qcaI69j0ovFqeJMNsUbPGoVEn3c+LbVow=
X-Received: by 2002:ab0:2141:: with SMTP id t1mr3094678ual.87.1641944709184;
 Tue, 11 Jan 2022 15:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20211223110756.699148-1-vsementsov@virtuozzo.com>
 <20211223110756.699148-2-vsementsov@virtuozzo.com>
 <YdxZTz3UcLBAdVxL@stefanha-x1.localdomain>
In-Reply-To: <YdxZTz3UcLBAdVxL@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 18:44:58 -0500
Message-ID: <CAFn=p-Zx5NatsY6qVrm6dQ2jh8=0030_7+-nKSkFhMgpOV=+Fg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] jobs: drop qmp_ trace points
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 11:06 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Dec 23, 2021 at 12:07:53PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> > diff --git a/block/trace-events b/block/trace-events
> > index 549090d453..5be3e3913b 100644
> > --- a/block/trace-events
> > +++ b/block/trace-events
> > @@ -49,15 +49,6 @@ block_copy_read_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64"
> >  block_copy_write_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
> >  block_copy_write_zeroes_fail(void *bcs, int64_t start, int ret) "bcs %p start %"PRId64" ret %d"
> >
> > -# ../blockdev.c
> > -qmp_block_job_cancel(void *job) "job %p"
> > -qmp_block_job_pause(void *job) "job %p"
> > -qmp_block_job_resume(void *job) "job %p"
> > -qmp_block_job_complete(void *job) "job %p"
> > -qmp_block_job_finalize(void *job) "job %p"
> > -qmp_block_job_dismiss(void *job) "job %p"
> > -qmp_block_stream(void *bs) "bs %p"
> > -
> >  # file-win32.c
> >  file_paio_submit(void *acb, void *opaque, int64_t offset, int count, int type) "acb %p opaque %p offset %"PRId64" count %d type %d"
> >
> > diff --git a/trace-events b/trace-events
> > index a637a61eba..1265f1e0cc 100644
> > --- a/trace-events
> > +++ b/trace-events
> > @@ -79,14 +79,6 @@ job_state_transition(void *job,  int ret, const char *legal, const char *s0, con
> >  job_apply_verb(void *job, const char *state, const char *verb, const char *legal) "job %p in state %s; applying verb %s (%s)"
> >  job_completed(void *job, int ret) "job %p ret %d"
> >
> > -# job-qmp.c
> > -qmp_job_cancel(void *job) "job %p"
> > -qmp_job_pause(void *job) "job %p"
> > -qmp_job_resume(void *job) "job %p"
> > -qmp_job_complete(void *job) "job %p"
> > -qmp_job_finalize(void *job) "job %p"
> > -qmp_job_dismiss(void *job) "job %p"
>
> The job pointer argument will be lost. That's not ideal but probably
> worth getting trace events for all QMP commands.
>
> Stefan

We could move the six job-related tracepoints into the implementation
routines instead; i.e. job_user_cancel, job_user_pause, etc. This
would cover all 12 QMP interface tracepoints, and that'd let us keep
the "implementation" trace points.

--js


