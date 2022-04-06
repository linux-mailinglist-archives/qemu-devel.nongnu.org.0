Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B54F5A18
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:39:23 +0200 (CEST)
Received: from localhost ([::1]:47574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc28I-00029r-Oe
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc25K-0000Xn-D5
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nc250-0005iV-UQ
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649237758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XTB8oIHYAcoHVxTSfvzY6ZtjSXioyXpjIQsV2uD7fTg=;
 b=OYQjwGCxATBBZIr9zU9ULdR6hOhyRWU0kvR9mwlAIRakRuh2+pOJr87/Kf92YRWaoFeFPK
 2uRHPCPGgXSRGoqWSCbHceJILFflG9pHWW7ZcLzhqEc58xLiiBmhoYohZTY8IPdvkFhCRl
 EX/KGWBUOhgFCCoAX/7wQ6kIYQjOOd4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-P28JLP4zOn2Fzg7gpsHwlQ-1; Wed, 06 Apr 2022 05:35:57 -0400
X-MC-Unique: P28JLP4zOn2Fzg7gpsHwlQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 b12-20020a056902030c00b0061d720e274aso1329731ybs.20
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 02:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XTB8oIHYAcoHVxTSfvzY6ZtjSXioyXpjIQsV2uD7fTg=;
 b=cGKWfklhbTR+XfC8SlM3Cu76o1GS1JMuK2DjfTsQYuzxD1W1jiCbjhguF+WJlXdI6+
 mkfzeaKOmu/2/qBbI3XM14HkblllqyyzieeJVjh2Uv1G8tGwd3Q4Zrr3UyWihSlMIeDO
 s8bVZKOXWzE9UwoyDYaXPyEuX3PylNbwrqaw16ENwUBfiL29VnS3sO/EpgWbfPX0fEdo
 JiCDIXabqNMEzPDStfWuPqtZzL1eJgOqqBALP0uOkhjebkiknri7/ZjdsamY31gf8ppZ
 Qxi/gPcFrPC67eTQqJrIWGNBl9/moh0JhZDJcDEb1jd7ZxtjQbYgUX/RJhCL0CpmeO7n
 MeVw==
X-Gm-Message-State: AOAM532nV8wqt9oFYBmVg7X9BN4g4z4DgtMkmuJYVcRh7rdQgBg5HkQz
 Jm/M7nl2acm5/STGE2vTMYeXETsx4OoRZaXAL/ckjp1nQb9zqw9Ci6glijF19YpnY1Tf6D64A0E
 BRQp4vfzLmY6R9JKuKbLUuhKeer4m+WY=
X-Received: by 2002:a81:d42:0:b0:2eb:6e52:15c5 with SMTP id
 63-20020a810d42000000b002eb6e5215c5mr6221062ywn.312.1649237755673; 
 Wed, 06 Apr 2022 02:35:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9g4PlceI5L8jJPUIB9QMGx3O6dPG+eXWqy2AO1q5UeGK5gzHodFGnhdoeRIAG0lmHBtwnolD5pXGMRbwKMxM=
X-Received: by 2002:a81:d42:0:b0:2eb:6e52:15c5 with SMTP id
 63-20020a810d42000000b002eb6e5215c5mr6221055ywn.312.1649237755497; Wed, 06
 Apr 2022 02:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-14-marcandre.lureau@redhat.com>
 <87fsmqr34l.fsf@pond.sub.org>
In-Reply-To: <87fsmqr34l.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Apr 2022 13:35:44 +0400
Message-ID: <CAMxuvazZMQFJ4-8my4kLOe_XuJQNSqttXd2tn7zXGS9U+6FeEA@mail.gmail.com>
Subject: Re: [PATCH 13/32] error-report: replace deprecated
 g_get_current_time() with glib >= 2.62
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 6, 2022 at 1:08 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > According to GLib API:
> > g_get_current_time has been deprecated since version 2.62 and should no=
t
> > be used in newly-written code. GTimeVal is not year-2038-safe. Use
> > g_get_real_time() instead.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/glib-compat.h | 10 ++++++++++
> >  util/qemu-error.c     | 17 ++++++++++++++---
> >  2 files changed, 24 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/glib-compat.h b/include/glib-compat.h
> > index 3113a7d2af84..dc14d3ec0d1e 100644
> > --- a/include/glib-compat.h
> > +++ b/include/glib-compat.h
> > @@ -145,6 +145,16 @@ qemu_g_test_slow(void)
> >  #define g_test_thorough() qemu_g_test_slow()
> >  #define g_test_quick() (!qemu_g_test_slow())
> >
> > +#if GLIB_CHECK_VERSION(2,62,0)
> > +static inline gchar *
> > +g_date_time_format_iso8601_compat(GDateTime *datetime)
> > +{
> > +    return g_date_time_format_iso8601(datetime);
> > +}
> > +
> > +#define g_date_time_format_iso8601 g_date_time_format_iso8601_compat
> > +#endif
>
> I'm confused.
>
> If we're using v2.62 or later, g_time_val_to_iso8601(dt) calls GLib's
> g_time_val_to_iso8601().  Why do we need the inline function and the
> macro?

To hide the "deprecation" warning because GLIB_VERSION_MAX_ALLOWED is 2.56.

>
> Else, I expect g_date_time_format_iso8601(dt) not to compile.
>
> > +
> >  #pragma GCC diagnostic pop
> >
> >  #endif
> > diff --git a/util/qemu-error.c b/util/qemu-error.c
> > index 7769aee8e791..4ea380dd4169 100644
> > --- a/util/qemu-error.c
> > +++ b/util/qemu-error.c
> > @@ -180,6 +180,19 @@ static void print_loc(void)
> >      }
> >  }
> >
> > +static char *
> > +real_time_iso8601(void)
> > +{
> > +#if GLIB_CHECK_VERSION(2,62,0)
> > +    g_autoptr(GDateTime) dt =3D g_date_time_new_from_unix_utc(g_get_re=
al_time());
> > +    return g_date_time_format_iso8601(dt);
> > +#else
> > +    GTimeVal tv;
> > +    g_get_current_time(&tv);
> > +    return g_time_val_to_iso8601(&tv);
> > +#endif
> > +}
> > +
> >  /*
> >   * Print a message to current monitor if we have one, else to stderr.
> >   * @report_type is the type of message: error, warning or informationa=
l.
> > @@ -189,12 +202,10 @@ static void print_loc(void)
> >   */
> >  static void vreport(report_type type, const char *fmt, va_list ap)
> >  {
> > -    GTimeVal tv;
> >      gchar *timestr;
> >
> >      if (message_with_timestamp && !monitor_cur()) {
> > -        g_get_current_time(&tv);
> > -        timestr =3D g_time_val_to_iso8601(&tv);
> > +        timestr =3D real_time_iso8601();
> >          error_printf("%s ", timestr);
> >          g_free(timestr);
> >      }
>


