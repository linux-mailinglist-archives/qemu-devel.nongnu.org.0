Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77C4ACF32
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 03:52:49 +0100 (CET)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGca-0007Pv-K5
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 21:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nHGZp-0006Oq-Ab
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nHGZn-0002U4-Jw
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 21:49:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644288595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=83vPdwItu2lRNYNMaCS6GHL6ldLO4DUgPIEvdKlcZjw=;
 b=NCevC1BNCTGXTRrQXwu7XTev+saGinSsY2HqaV5D3daYonRmR7cDTT4viko0ktwzRSjxZf
 QPhpiuga6HUwuTtAuKb2ZV6M8JqYRZd0j9HKxX1Z3M9ZJXeXN45VIHCuNIH7ljZYctbB3F
 3VckILQe0AHmj9C64Nkn9kY6xyFLT+o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-L50ahe7hP6alE1xVjTDYFA-1; Mon, 07 Feb 2022 21:49:52 -0500
X-MC-Unique: L50ahe7hP6alE1xVjTDYFA-1
Received: by mail-lj1-f197.google.com with SMTP id
 m13-20020a2e97cd000000b0023e09d49ce4so5373529ljj.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 18:49:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=83vPdwItu2lRNYNMaCS6GHL6ldLO4DUgPIEvdKlcZjw=;
 b=gA/oDWpe/DYwxxjf9O9A32Q/ttSKDsrjVraTNRP8yXSg7Pd63jioJ7mercnx5yzXTX
 vO4ANNDs3vktUEhl6gUtiQL77PG+XYACuBb4EDmhMTEo1P/WEEGOs0wIbvphqhSnPZsw
 K8kLyVS0F/SEHnhfvhMfgN/M9fMUbnBl/GxvDELAy14vQ6IhlA6lqVmZm//I6nGuHg15
 05PrQXbqq2WQEpCpJLKULXPhaFyseanj7v+gd0JvKd+tiR9BIFO+Id0ue1PX8F0Fwtd0
 hRmIkoBAscYPaguRdZCkajkH6WkPORztwDaQrfAtBX535oV1WatV7mAS+7lxF+EHTt/Z
 ZW0g==
X-Gm-Message-State: AOAM533aHZEm2/Z7WMfziJXii8jGSZ5rTDMaskYKBt/hqTWQW1HeZrcM
 PjKyzvG5F7yBkm0Yes9t7ZXKrAuTva7LpxgwjMQ/edogVGWnu4/YfbxJkEuqTgP/WSfJoqLlKD2
 a2nDEId35nnXm3o7YgQXziQ3qIuYR7y8=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr1513781ljr.162.1644288590470; 
 Mon, 07 Feb 2022 18:49:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrdWxea/OXYWpz4cjZipIKAObuJmerYZG2iI5DHGRlFWaMXqaONGACv93kcktdzPofrWNsyNLlKbF83kg4v9I=
X-Received: by 2002:a05:651c:b13:: with SMTP id
 b19mr1513759ljr.162.1644288590182; 
 Mon, 07 Feb 2022 18:49:50 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <YgHT2AzvnHYun6j4@xz-m1.local>
In-Reply-To: <YgHT2AzvnHYun6j4@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 7 Feb 2022 23:49:38 -0300
Message-ID: <CAJ6HWG44WaWmCopWvF6-vbzMg8A-QWV85Vv2VmgEA7cs4CfM3Q@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter, thanks for reviewing!

On Mon, Feb 7, 2022 at 11:22 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Feb 01, 2022 at 03:29:03AM -0300, Leonardo Bras wrote:
> > -void multifd_send_sync_main(QEMUFile *f)
> > +int multifd_send_sync_main(QEMUFile *f)
> >  {
> >      int i;
> > +    bool flush_zero_copy;
> >
> >      if (!migrate_use_multifd()) {
> > -        return;
> > +        return 0;
> >      }
> >      if (multifd_send_state->pages->num) {
> >          if (multifd_send_pages(f) < 0) {
> >              error_report("%s: multifd_send_pages fail", __func__);
> > -            return;
> > +            return 0;
>
> I've not checked how it used to do if multifd_send_pages() failed, but.. should
> it returns -1 rather than 0 when there will be a return code?

Yeah, that makes sense.
The point here is that I was trying not to modify much of the current behavior.

I mean, multifd_send_sync_main() would previously return void, so any
other errors would not matter to the caller of this function, which
will continue to run as if nothing happened.

Now, if it fails with flush_zero_copy, the operation needs to be aborted.

Maybe, I should make it different:
- In any error, return -1.
- Create/use a specific error code in the case of a failing
flush_zero_copy, so I can test the return value for it on the caller
function and return early.

Or alternatively, the other errors could also return early, but since
this will change how the code currently works, I would probably need
another patch for that change. (so it can be easily reverted if
needed)

What do you think is better?


> >          }
> >      }
> > +
> > +    /*
> > +     * When using zero-copy, it's necessary to flush after each iteration to
> > +     * make sure pages from earlier iterations don't end up replacing newer
> > +     * pages.
> > +     */
> > +    flush_zero_copy = migrate_use_zero_copy_send();
> > +
> >      for (i = 0; i < migrate_multifd_channels(); i++) {
> >          MultiFDSendParams *p = &multifd_send_state->params[i];
> >
> > @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
> >          if (p->quit) {
> >              error_report("%s: channel %d has already quit", __func__, i);
> >              qemu_mutex_unlock(&p->mutex);
> > -            return;
> > +            return 0;
>
> Same question here.

Please see above,

>
> >          }
>
> The rest looks good.  Thanks,

Thank you!

Best regards,
Leo


