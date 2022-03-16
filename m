Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0064DAFF3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:43:08 +0100 (CET)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUSzb-0002iM-7N
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:43:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUSug-0005xx-Gz
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nUSue-0003WA-Mg
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647434276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fda5gfHh0SSUrCt0fSJgVplEw/0fgx2XnTi1aVudwMc=;
 b=Qhk+VXh9J3qI1HMKpeXb2DZxRav+gBDXdO5BkTDpaolC/2ig0mpUccIaCEz6DhHek6EorL
 c40RzuJ3aozZUeVEy84eOArprdZ8lSxfkRMjiIrrH877B+LIDE7HMPxO3zTFog0VggaIit
 dMQcwb/x5NkV1XEoD/Qh5EMok3Hv3Ks=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-_WaoOyM0NVaLPzOyZqveCA-1; Wed, 16 Mar 2022 08:37:52 -0400
X-MC-Unique: _WaoOyM0NVaLPzOyZqveCA-1
Received: by mail-yb1-f199.google.com with SMTP id
 h83-20020a25d056000000b0063380d246ceso1870633ybg.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fda5gfHh0SSUrCt0fSJgVplEw/0fgx2XnTi1aVudwMc=;
 b=Z9cc5qGMq/vOSWmn3Q6wosFYBRMFJf5WsqI+UAQq6Olawhv0T6vszVTpndKgtT/OMb
 frguef+LPLcUqCIE47uH9nvj6pQp0EnU2TParXcbT+A5wmw//pBddso8jqh08/LvLQvv
 fxjQvm7ZUeQq8W2zTOWJn8zq+b8Qnpjaez+l3J8hdAuYlAHB1oryeC6xeFWIAW31YfQn
 jiyp8LLnTMQV6OeSG//AUV6eCrax8/lfvH1oOj8Jb1JR6qxIcuCyYdFyiaZ16j4Yrg5Y
 VKxwpjAl/swnFk06pzfjZZrxXqnv+3TU0EGE7IOaE8VPuVwNkso79wseyGiO1uIu/KjD
 6Ujw==
X-Gm-Message-State: AOAM5316Ffc1Oc3E/pgjNndbYkGOcsYJh3vEc5ySbTvcgM7po3ceX0VZ
 T/AvIWXi0flGTL7ZE0JV/tFAfLMVyyxAvc4+uOg3evU9Hll0YiZMuidiUoAxYtO2oNGXqY8TYmw
 JBMawB7lX4VvmwAsNV49MFmaP5/bKYYE=
X-Received: by 2002:a81:8c7:0:b0:2db:fddb:e82a with SMTP id
 190-20020a8108c7000000b002dbfddbe82amr29598858ywi.445.1647434271454; 
 Wed, 16 Mar 2022 05:37:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2jkaHwbHW4dGZBwCMNsA/NCXY4ufABrknGf5liDmMIeqKkOfnfCm0WqqM4uxzEEv/7ebNoIBjnVGJPmHsHjo=
X-Received: by 2002:a81:8c7:0:b0:2db:fddb:e82a with SMTP id
 190-20020a8108c7000000b002dbfddbe82amr29598831ywi.445.1647434271188; Wed, 16
 Mar 2022 05:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095454.2613871-1-marcandre.lureau@redhat.com>
 <87bky65bb4.fsf@pond.sub.org>
In-Reply-To: <87bky65bb4.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 16 Mar 2022 16:37:39 +0400
Message-ID: <CAMxuvazmKfOcKo2dJeduvifrYFOMYCVgCDkC4qak0e8yioCWOQ@mail.gmail.com>
Subject: Re: [PATCH 25/27] include/qapi: add g_autoptr support for qobject
 types
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Mar 16, 2022 at 4:31 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Add small inline wrappers for qobject_unref() calls, which is a macro.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qapi/qmp/qbool.h   | 6 ++++++
> >  include/qapi/qmp/qdict.h   | 6 ++++++
> >  include/qapi/qmp/qlist.h   | 8 +++++++-
> >  include/qapi/qmp/qnull.h   | 6 ++++++
> >  include/qapi/qmp/qnum.h    | 6 ++++++
> >  include/qapi/qmp/qstring.h | 6 ++++++
> >  6 files changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
> > index 2f888d10573f..52b1c5c15280 100644
> > --- a/include/qapi/qmp/qbool.h
> > +++ b/include/qapi/qmp/qbool.h
> > @@ -21,6 +21,12 @@ struct QBool {
> >      bool value;
> >  };
> >
> > +static inline void qbool_unref(QBool *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qbool_unref)
> > +
>
> You need the wrapper function around the wrapper macro qobject_unref(),
> because
>
>    G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qobject_unref_impl)
>
> dies with "passing argument 1 of =E2=80=98qobject_unref_impl=E2=80=99 fro=
m incompatible
> pointer type [-Wincompatible-pointer-types]".  Okay.

Yeah, unfortunately. There might be other tricks possible, but they
would likely be less obvious.

>
> Style nitpick: a function's opening brace goes on its own line:
>
>    static inline void qbool_unref(QBool *q)
>    {
>        qobject_unref(q);
>    }
>

right

> Moreover, I prefer to put code in headers only when there's a real need.
> I don't see one here.  Most existing uses of

I agree, I generally don't like inline. However, simple one-liner
wrapper kinda fit. I was even tempted to use extra _ at the end of the
function to prevent usage outside of the macro, but decided that
wouldn't be much better.

Btw, what's' your rule for using "static inline" in headers then :) ?

> G_DEFINE_AUTOPTR_CLEANUP_FUNC() use a plain extern function.
>
> >  QBool *qbool_from_bool(bool value);
> >  bool qbool_get_bool(const QBool *qb);
> >
> > diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
> > index d5b5430e21a9..9f0a6a6708b5 100644
> > --- a/include/qapi/qmp/qdict.h
> > +++ b/include/qapi/qmp/qdict.h
> > @@ -30,6 +30,12 @@ struct QDict {
> >      QLIST_HEAD(,QDictEntry) table[QDICT_BUCKET_MAX];
> >  };
> >
> > +static inline void qdict_unref(QDict *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QDict, qdict_unref)
> > +
> >  /* Object API */
> >  QDict *qdict_new(void);
> >  const char *qdict_entry_key(const QDictEntry *entry);
> > diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
> > index 06e98ad5f498..06c267dfb898 100644
> > --- a/include/qapi/qmp/qlist.h
> > +++ b/include/qapi/qmp/qlist.h
> > @@ -26,7 +26,13 @@ struct QList {
> >      QTAILQ_HEAD(,QListEntry) head;
> >  };
> >
> > -#define qlist_append(qlist, obj) \
> > +static inline void qlist_unref(QList *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QList, qlist_unref)
> > +
> > +#define qlist_append(qlist, obj)                \
>
> The whitespace change looks accidental.
>
> >          qlist_append_obj(qlist, QOBJECT(obj))
> >
> >  void qlist_append_bool(QList *qlist, bool value);
> > diff --git a/include/qapi/qmp/qnull.h b/include/qapi/qmp/qnull.h
> > index e84ecceedbcb..8c45e08b1c47 100644
> > --- a/include/qapi/qmp/qnull.h
> > +++ b/include/qapi/qmp/qnull.h
> > @@ -26,4 +26,10 @@ static inline QNull *qnull(void)
> >      return qobject_ref(&qnull_);
> >  }
> >
> > +static inline void qnull_unref(QNull *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNull, qnull_unref)
> > +
> >  #endif /* QNULL_H */
> > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> > index 7f84e20bfb2c..ebbf9cd5abe8 100644
> > --- a/include/qapi/qmp/qnum.h
> > +++ b/include/qapi/qmp/qnum.h
> > @@ -54,6 +54,12 @@ struct QNum {
> >      } u;
> >  };
> >
> > +static inline void qnum_unref(QNum *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNum, qnum_unref)
> > +
> >  QNum *qnum_from_int(int64_t value);
> >  QNum *qnum_from_uint(uint64_t value);
> >  QNum *qnum_from_double(double value);
> > diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
> > index 1d8ba469368f..a38d2925d757 100644
> > --- a/include/qapi/qmp/qstring.h
> > +++ b/include/qapi/qmp/qstring.h
> > @@ -20,6 +20,12 @@ struct QString {
> >      const char *string;
> >  };
> >
> > +static inline void qstring_unref(QString *q) {
> > +    qobject_unref(q);
> > +}
> > +
> > +G_DEFINE_AUTOPTR_CLEANUP_FUNC(QString, qstring_unref)
> > +
> >  QString *qstring_new(void);
> >  QString *qstring_from_str(const char *str);
> >  QString *qstring_from_substr(const char *str, size_t start, size_t end=
);
>


