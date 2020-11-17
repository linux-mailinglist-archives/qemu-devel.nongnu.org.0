Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC242B6820
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:00:02 +0100 (CET)
Received: from localhost ([::1]:36140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Sf-00020R-9K
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:00:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kf2Rd-0000xm-3y
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:58:57 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kf2RZ-00013r-RI
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:58:56 -0500
Received: by mail-ej1-x642.google.com with SMTP id w13so29821173eju.13
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wW2FjxjMrVZ5VNN8yJTUtJ6zPrStgGR6+AFEaPoEDjE=;
 b=IeHwvLYjC/wRwA5fPlmAwkTyjoR0GZ6Bcnn/g4IOA5d+KlsL/1U06lIDhFxKuhhSKL
 uZ+zO6vjkCDJD8NT8y9f6R9fXljzJ5VQfHbo84UmzJ2k0VrNMg4KhHwf7rNF0RgJUF/E
 rMNKLXuZlNFvgbP1CjA1flCI6Yoe0XgYrM+dZWqTZ7KTbq9NH9wOeQ+RXaNQ44xAOZoF
 ZiWDM3qkSFKB9UPPDkX4DEXCoLyMVQcgB6+qTrkmc8uz1Q241GUaPCrr/mkqOpl0CMpo
 5MD636Lw2oTLhWPcKgHx+R6F3XQx8a4ThARzfTa0klm5qIj7zJ6v2+GZOPIYW6cbBg1n
 UeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wW2FjxjMrVZ5VNN8yJTUtJ6zPrStgGR6+AFEaPoEDjE=;
 b=Zvd0n/GVngMjiYc5iAFmkGQBT2DQyGvv52iEDACpRP6IZZrjh28XLinemoJqGrkhI8
 1Cr80shhj860i76bJVukRd/Hsq8SREQjXBgku+H0qa1o3x+ZYGPVwAHceByH+fGQhGA0
 L48+91wvNbUE3zTwne0E5rNgbtypDT9QdVwF9RdHabCJpVoNgn66lBeG12QwIedvr1Pm
 tX2bfToES2CusdhWRuTO0ghNpA6kCqS+h6Azslo9uQTOrE09O22BoJBwXxJle2m7O8WW
 1FPHiXm7tr2Y9Pwso0LQQk+vxY6tfD6WcFU2aXfrpO2sjOU31CXEXx3HkJ+umX4P1i4v
 XGzQ==
X-Gm-Message-State: AOAM531xGq+ARg8XxMaahqomM+31TFCXsvBRRh7R37yXJzqZd+o8r1CL
 /A+emSek6p+3AfspL0x9JbcC5cg0T7D9Xyf39Fk=
X-Google-Smtp-Source: ABdhPJyy7DnvzqlQmR6EjidcAxfI/3XORC9ZBjQY9SW1jzTe5Sbk+4Vo0/kVBhpzcYjRSLCxYQUGSiEfMdRiSN7DUFw=
X-Received: by 2002:a17:906:bcd4:: with SMTP id
 lw20mr19243584ejb.527.1605625132131; 
 Tue, 17 Nov 2020 06:58:52 -0800 (PST)
MIME-Version: 1.0
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-4-ehabkost@redhat.com>
 <CAJ+F1C+YUZdP56MuLtZbO0fK6rPsDosgxXG4zaDq=mjwqsV74A@mail.gmail.com>
 <20201117144246.GD1235237@habkost.net>
In-Reply-To: <20201117144246.GD1235237@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 17 Nov 2020 18:58:39 +0400
Message-ID: <CAJ+F1CLZg-hhuK2ffRzVaWiZKe2Aqvf0-mqxXGAzscSa8FmCNw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] qnum: QNumValue type for QNum value literals
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a4ae8805b44ebb2f"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a4ae8805b44ebb2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 6:42 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:

> On Tue, Nov 17, 2020 at 12:37:56PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost <ehabkost@redhat.com>
> wrote:
> >
> > > Provide a separate QNumValue type that can be used for QNum value
> > > literals without the referencing counting and memory allocation
> > > features provided by QObject.
> > >
> > > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > > ---
> > > Changes v1 -> v2:
> > > * Fix "make check" failure, by updating check-qnum unit test to
> > >   use the new struct fields
> > > ---
> > >  include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--
> > >  qobject/qnum.c          | 78 ++++++++++++++++++++-------------------=
--
> > >  tests/check-qnum.c      | 14 ++++----
> > >  3 files changed, 84 insertions(+), 48 deletions(-)
> > >
> > > diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
> > > index 55c27b1c24..62fbdfda68 100644
> > > --- a/include/qapi/qmp/qnum.h
> > > +++ b/include/qapi/qmp/qnum.h
> > > @@ -46,20 +46,56 @@ typedef enum {
> > >   * in range: qnum_get_try_int() / qnum_get_try_uint() check range an=
d
> > >   * convert under the hood.
> > >   */
> > > -struct QNum {
> > > -    struct QObjectBase_ base;
> > > +
> > > +/**
> > > + * struct QNumValue: the value of a QNum
> > > + *
> > > + * QNumValue literals can be constructed using the `QNUM_VAL_INT`,
> > > + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.
> > > + */
> > > +typedef struct QNumValue {
> > > +    /* private: */
> > >      QNumKind kind;
> > >      union {
> > >          int64_t i64;
> > >          uint64_t u64;
> > >          double dbl;
> > >      } u;
> > > +} QNumValue;
> > > +
> > > +#define QNUM_VAL_INT(value) \
> > > +    { .kind =3D QNUM_I64, .u.i64 =3D value }
> > > +#define QNUM_VAL_UINT(value) \
> > > +    { .kind =3D QNUM_U64, .u.u64 =3D value }
> > > +#define QNUM_VAL_DOUBLE(value) \
> > > +    { .kind =3D QNUM_DOUBLE, .u.dbl =3D value }
> > > +
> > > +struct QNum {
> > > +    struct QObjectBase_ base;
> > > +    QNumValue value;
> > >  };
> > >
> > > +/**
> > > + * qnum_from_int(): Create a new QNum from a QNumValue
> > >
> >
> > Copy-pasta qnum_from_int() -> qnum_from_value()
>
> Oops!  I will fix it in v3, or submit a fixup patch if that's the
> only needed change.
>
> >
> > I wonder if there is a check for that kind of mistake, as it may be
> common.
>
> It looks like kernel-doc ignores what's before the colon in the
> summary line.  It probably shouldn't.
>
> >
> > + * @value: QNumValue
> > > + *
> > > + * Return strong reference.
> > > + */
> > > +QNum *qnum_from_value(QNumValue value);
> > >
> > +
> > >  QNum *qnum_from_int(int64_t value);
> > >  QNum *qnum_from_uint(uint64_t value);
> > >  QNum *qnum_from_double(double value);
> > >
> > > +/**
> > > + * qnum_get_value(): Get QNumValue from QNum
> > > + * @qn: QNum object
> > > + */
> > > +static inline const QNumValue *qnum_get_value(const QNum *qn)
> > > +{
> > > +    return &qn->value;
> > > +}
> > > +
> > >
> >
> > Nothing uses that function in this patch. Should be put into use.
>
> It is used in patch 5/8.  Why do you think it's necessary to use
> it in internal code too?
>

Not necessarily, just want to make sure we don't introduce dead code. Fine
it's used later, perhaps worth noting in the commit message.

>
> >
> >  bool qnum_get_try_int(const QNum *qn, int64_t *val);
> > >  int64_t qnum_get_int(const QNum *qn);
> > >
> > > diff --git a/qobject/qnum.c b/qobject/qnum.c
> > > index 69fd9a82d9..f80d4efd76 100644
> > > --- a/qobject/qnum.c
> > > +++ b/qobject/qnum.c
> > > @@ -15,6 +15,15 @@
> > >  #include "qemu/osdep.h"
> > >  #include "qapi/qmp/qnum.h"
> > >
> > > +QNum *qnum_from_value(QNumValue value)
> > >
> >
> > I wonder if it shouldn't be made "inline" in header too (if that can he=
lp
> > avoid argument copy).
>
> I'm unsure.  I would make it inline (in a separate patch) if
> there's evidence it's worth it.  I expect the g_new() call to be
> more expensive than any argument copying, though.
>

ok


> >
> > +{
> > > +    QNum *qn =3D g_new(QNum, 1);
> > > +
> > > +    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > > +    qn->value =3D value;
> > > +    return qn;
> > > +}
> > > +
> > >  /**
> > >   * qnum_from_int(): Create a new QNum from an int64_t
> > >   * @value: int64_t value
> > > @@ -23,13 +32,7 @@
> > >   */
> > >  QNum *qnum_from_int(int64_t value)
> > >  {
> > > -    QNum *qn =3D g_new(QNum, 1);
> > > -
> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > > -    qn->kind =3D QNUM_I64;
> > > -    qn->u.i64 =3D value;
> > > -
> > > -    return qn;
> > > +    return qnum_from_value((QNumValue) QNUM_VAL_INT(value));
> > >  }
> > >
> > >  /**
> > > @@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)
> > >   */
> > >  QNum *qnum_from_uint(uint64_t value)
> > >  {
> > > -    QNum *qn =3D g_new(QNum, 1);
> > > -
> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > > -    qn->kind =3D QNUM_U64;
> > > -    qn->u.u64 =3D value;
> > > -
> > > -    return qn;
> > > +    return qnum_from_value((QNumValue) QNUM_VAL_UINT(value));
> > >  }
> > >
> > >  /**
> > > @@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)
> > >   */
> > >  QNum *qnum_from_double(double value)
> > >  {
> > > -    QNum *qn =3D g_new(QNum, 1);
> > > -
> > > -    qobject_init(QOBJECT(qn), QTYPE_QNUM);
> > > -    qn->kind =3D QNUM_DOUBLE;
> > > -    qn->u.dbl =3D value;
> > > -
> > > -    return qn;
> > > +    return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE(value));
> > >  }
> > >
> > >  /**
> > > @@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)
> > >   */
> > >  bool qnum_get_try_int(const QNum *qn, int64_t *val)
> > >  {
> > > -    switch (qn->kind) {
> > > +    const QNumValue *qv =3D &qn->value;
> > > +
> > > +    switch (qv->kind) {
> > >      case QNUM_I64:
> > > -        *val =3D qn->u.i64;
> > > +        *val =3D qv->u.i64;
> > >          return true;
> > >      case QNUM_U64:
> > > -        if (qn->u.u64 > INT64_MAX) {
> > > +        if (qv->u.u64 > INT64_MAX) {
> > >              return false;
> > >          }
> > > -        *val =3D qn->u.u64;
> > > +        *val =3D qv->u.u64;
> > >          return true;
> > >      case QNUM_DOUBLE:
> > >          return false;
> > > @@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)
> > >   */
> > >  bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
> > >  {
> > > -    switch (qn->kind) {
> > > +    const QNumValue *qv =3D &qn->value;
> > > +
> > > +    switch (qv->kind) {
> > >      case QNUM_I64:
> > > -        if (qn->u.i64 < 0) {
> > > +        if (qv->u.i64 < 0) {
> > >              return false;
> > >          }
> > > -        *val =3D qn->u.i64;
> > > +        *val =3D qv->u.i64;
> > >          return true;
> > >      case QNUM_U64:
> > > -        *val =3D qn->u.u64;
> > > +        *val =3D qv->u.u64;
> > >          return true;
> > >      case QNUM_DOUBLE:
> > >          return false;
> > > @@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)
> > >   */
> > >  double qnum_get_double(const QNum *qn)
> > >  {
> > > -    switch (qn->kind) {
> > > +    const QNumValue *qv =3D &qn->value;
> > > +
> > > +    switch (qv->kind) {
> > >      case QNUM_I64:
> > > -        return qn->u.i64;
> > > +        return qv->u.i64;
> > >      case QNUM_U64:
> > > -        return qn->u.u64;
> > > +        return qv->u.u64;
> > >      case QNUM_DOUBLE:
> > > -        return qn->u.dbl;
> > > +        return qv->u.dbl;
> > >      }
> > >
> > >      assert(0);
> > > @@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)
> > >
> > >  char *qnum_to_string(QNum *qn)
> > >  {
> > > +    const QNumValue *qv =3D &qn->value;
> > >
> >
> > qnum_get_value() ?
>
> I prefer to not hide this behind a function call, in internal
> code.  But I don't mind changing it if you think it's important.
>

no, it's ok to me


>
> >
> >      char *buffer;
> > >      int len;
> > >
> > > -    switch (qn->kind) {
> > > +    switch (qv->kind) {
> > >      case QNUM_I64:
> > > -        return g_strdup_printf("%" PRId64, qn->u.i64);
> > > +        return g_strdup_printf("%" PRId64, qv->u.i64);
> > >      case QNUM_U64:
> > > -        return g_strdup_printf("%" PRIu64, qn->u.u64);
> > > +        return g_strdup_printf("%" PRIu64, qv->u.u64);
> > >      case QNUM_DOUBLE:
> > >          /* FIXME: snprintf() is locale dependent; but JSON requires
> > >           * numbers to be formatted as if in the C locale. Dependence
> > > @@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)
> > >           * rounding errors; we should be using DBL_DECIMAL_DIG (17),
> > >           * and only rounding to a shorter number if the result would
> > >           * still produce the same floating point value.  */
> > > -        buffer =3D g_strdup_printf("%f" , qn->u.dbl);
> > > +        buffer =3D g_strdup_printf("%f" , qv->u.dbl);
> > >          len =3D strlen(buffer);
> > >          while (len > 0 && buffer[len - 1] =3D=3D '0') {
> > >              len--;
> > > @@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)
> > >   */
> > >  bool qnum_is_equal(const QObject *x, const QObject *y)
> > >  {
> > > -    QNum *num_x =3D qobject_to(QNum, x);
> > > -    QNum *num_y =3D qobject_to(QNum, y);
> > > +    const QNum *qnum_x =3D qobject_to(QNum, x);
> > > +    const QNum *qnum_y =3D qobject_to(QNum, y);
> > > +    const QNumValue *num_x =3D &qnum_x->value;
> > > +    const QNumValue *num_y =3D &qnum_y->value;
> > >
> > >      switch (num_x->kind) {
> > >      case QNUM_I64:
> > > diff --git a/tests/check-qnum.c b/tests/check-qnum.c
> > > index 4105015872..9499b0d845 100644
> > > --- a/tests/check-qnum.c
> > > +++ b/tests/check-qnum.c
> > > @@ -30,8 +30,8 @@ static void qnum_from_int_test(void)
> > >
> > >      qn =3D qnum_from_int(value);
> > >      g_assert(qn !=3D NULL);
> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_I64);
> > > -    g_assert_cmpint(qn->u.i64, =3D=3D, value);
> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_I64);
> > > +    g_assert_cmpint(qn->value.u.i64, =3D=3D, value);
> > >      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
> > >      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
> > >
> > > @@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)
> > >
> > >      qn =3D qnum_from_uint(value);
> > >      g_assert(qn !=3D NULL);
> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_U64);
> > > -    g_assert(qn->u.u64 =3D=3D value);
> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_U64);
> > > +    g_assert(qn->value.u.u64 =3D=3D value);
> > >      g_assert(qn->base.refcnt =3D=3D 1);
> > >      g_assert(qobject_type(QOBJECT(qn)) =3D=3D QTYPE_QNUM);
> > >
> > > @@ -60,8 +60,8 @@ static void qnum_from_double_test(void)
> > >
> > >      qn =3D qnum_from_double(value);
> > >      g_assert(qn !=3D NULL);
> > > -    g_assert_cmpint(qn->kind, =3D=3D, QNUM_DOUBLE);
> > > -    g_assert_cmpfloat(qn->u.dbl, =3D=3D, value);
> > > +    g_assert_cmpint(qn->value.kind, =3D=3D, QNUM_DOUBLE);
> > > +    g_assert_cmpfloat(qn->value.u.dbl, =3D=3D, value);
> > >      g_assert_cmpint(qn->base.refcnt, =3D=3D, 1);
> > >      g_assert_cmpint(qobject_type(QOBJECT(qn)), =3D=3D, QTYPE_QNUM);
> > >
> > > @@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)
> > >      const int64_t value =3D 0x1234567890abcdefLL;
> > >
> > >      qn =3D qnum_from_int(value);
> > > -    g_assert_cmpint((int64_t) qn->u.i64, =3D=3D, value);
> > > +    g_assert_cmpint((int64_t) qn->value.u.i64, =3D=3D, value);
> > >
> > >      qobject_unref(qn);
> > >  }
> > > --
> > > 2.28.0
> > >
> > >
> > >
> > lgtm otherwise
>
> Thanks!
>
> --
> Eduardo
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000a4ae8805b44ebb2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 6:42 PM Eduar=
do Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Tue, Nov 17, 2020 at 12:37:56PM +0400, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; On Tue, Nov 17, 2020 at 2:43 AM Eduardo Habkost &lt;<a href=3D"mailto:=
ehabkost@redhat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt; wrote:<b=
r>
&gt; <br>
&gt; &gt; Provide a separate QNumValue type that can be used for QNum value=
<br>
&gt; &gt; literals without the referencing counting and memory allocation<b=
r>
&gt; &gt; features provided by QObject.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Eduardo Habkost &lt;<a href=3D"mailto:ehabkost@red=
hat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Changes v1 -&gt; v2:<br>
&gt; &gt; * Fix &quot;make check&quot; failure, by updating check-qnum unit=
 test to<br>
&gt; &gt;=C2=A0 =C2=A0use the new struct fields<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 include/qapi/qmp/qnum.h | 40 +++++++++++++++++++--<br>
&gt; &gt;=C2=A0 qobject/qnum.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 78 +++++=
+++++++++++++++---------------------<br>
&gt; &gt;=C2=A0 tests/check-qnum.c=C2=A0 =C2=A0 =C2=A0 | 14 ++++----<br>
&gt; &gt;=C2=A0 3 files changed, 84 insertions(+), 48 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h<br=
>
&gt; &gt; index 55c27b1c24..62fbdfda68 100644<br>
&gt; &gt; --- a/include/qapi/qmp/qnum.h<br>
&gt; &gt; +++ b/include/qapi/qmp/qnum.h<br>
&gt; &gt; @@ -46,20 +46,56 @@ typedef enum {<br>
&gt; &gt;=C2=A0 =C2=A0* in range: qnum_get_try_int() / qnum_get_try_uint() =
check range and<br>
&gt; &gt;=C2=A0 =C2=A0* convert under the hood.<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt; -struct QNum {<br>
&gt; &gt; -=C2=A0 =C2=A0 struct QObjectBase_ base;<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * struct QNumValue: the value of a QNum<br>
&gt; &gt; + *<br>
&gt; &gt; + * QNumValue literals can be constructed using the `QNUM_VAL_INT=
`,<br>
&gt; &gt; + * `QNUM_VAL_UINT`, and `QNUM_VAL_DOUBLE` macros.<br>
&gt; &gt; + */<br>
&gt; &gt; +typedef struct QNumValue {<br>
&gt; &gt; +=C2=A0 =C2=A0 /* private: */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 QNumKind kind;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 union {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int64_t i64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t u64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 double dbl;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 } u;<br>
&gt; &gt; +} QNumValue;<br>
&gt; &gt; +<br>
&gt; &gt; +#define QNUM_VAL_INT(value) \<br>
&gt; &gt; +=C2=A0 =C2=A0 { .kind =3D QNUM_I64, .u.i64 =3D value }<br>
&gt; &gt; +#define QNUM_VAL_UINT(value) \<br>
&gt; &gt; +=C2=A0 =C2=A0 { .kind =3D QNUM_U64, .u.u64 =3D value }<br>
&gt; &gt; +#define QNUM_VAL_DOUBLE(value) \<br>
&gt; &gt; +=C2=A0 =C2=A0 { .kind =3D QNUM_DOUBLE, .u.dbl =3D value }<br>
&gt; &gt; +<br>
&gt; &gt; +struct QNum {<br>
&gt; &gt; +=C2=A0 =C2=A0 struct QObjectBase_ base;<br>
&gt; &gt; +=C2=A0 =C2=A0 QNumValue value;<br>
&gt; &gt;=C2=A0 };<br>
&gt; &gt;<br>
&gt; &gt; +/**<br>
&gt; &gt; + * qnum_from_int(): Create a new QNum from a QNumValue<br>
&gt; &gt;<br>
&gt; <br>
&gt; Copy-pasta qnum_from_int() -&gt; qnum_from_value()<br>
<br>
Oops!=C2=A0 I will fix it in v3, or submit a fixup patch if that&#39;s the<=
br>
only needed change.<br>
<br>
&gt; <br>
&gt; I wonder if there is a check for that kind of mistake, as it may be co=
mmon.<br>
<br>
It looks like kernel-doc ignores what&#39;s before the colon in the<br>
summary line.=C2=A0 It probably shouldn&#39;t.<br>
<br>
&gt; <br>
&gt; + * @value: QNumValue<br>
&gt; &gt; + *<br>
&gt; &gt; + * Return strong reference.<br>
&gt; &gt; + */<br>
&gt; &gt; +QNum *qnum_from_value(QNumValue value);<br>
&gt; &gt;<br>
&gt; +<br>
&gt; &gt;=C2=A0 QNum *qnum_from_int(int64_t value);<br>
&gt; &gt;=C2=A0 QNum *qnum_from_uint(uint64_t value);<br>
&gt; &gt;=C2=A0 QNum *qnum_from_double(double value);<br>
&gt; &gt;<br>
&gt; &gt; +/**<br>
&gt; &gt; + * qnum_get_value(): Get QNumValue from QNum<br>
&gt; &gt; + * @qn: QNum object<br>
&gt; &gt; + */<br>
&gt; &gt; +static inline const QNumValue *qnum_get_value(const QNum *qn)<br=
>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 return &amp;qn-&gt;value;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;<br>
&gt; <br>
&gt; Nothing uses that function in this patch. Should be put into use.<br>
<br>
It is used in patch 5/8.=C2=A0 Why do you think it&#39;s necessary to use<b=
r>
it in internal code too?<br></blockquote><div><br></div><div>Not necessaril=
y, just want to make sure we don&#39;t introduce dead code. Fine it&#39;s u=
sed later, perhaps worth noting in the commit message. <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 bool qnum_get_try_int(const QNum *qn, int64_t *val);<br>
&gt; &gt;=C2=A0 int64_t qnum_get_int(const QNum *qn);<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/qobject/qnum.c b/qobject/qnum.c<br>
&gt; &gt; index 69fd9a82d9..f80d4efd76 100644<br>
&gt; &gt; --- a/qobject/qnum.c<br>
&gt; &gt; +++ b/qobject/qnum.c<br>
&gt; &gt; @@ -15,6 +15,15 @@<br>
&gt; &gt;=C2=A0 #include &quot;qemu/osdep.h&quot;<br>
&gt; &gt;=C2=A0 #include &quot;qapi/qmp/qnum.h&quot;<br>
&gt; &gt;<br>
&gt; &gt; +QNum *qnum_from_value(QNumValue value)<br>
&gt; &gt;<br>
&gt; <br>
&gt; I wonder if it shouldn&#39;t be made &quot;inline&quot; in header too =
(if that can help<br>
&gt; avoid argument copy).<br>
<br>
I&#39;m unsure.=C2=A0 I would make it inline (in a separate patch) if<br>
there&#39;s evidence it&#39;s worth it.=C2=A0 I expect the g_new() call to =
be<br>
more expensive than any argument copying, though.<br></blockquote><div><br>=
</div><div>ok</div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt; <br>
&gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
&gt; &gt; +=C2=A0 =C2=A0 qn-&gt;value =3D value;<br>
&gt; &gt; +=C2=A0 =C2=A0 return qn;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 /**<br>
&gt; &gt;=C2=A0 =C2=A0* qnum_from_int(): Create a new QNum from an int64_t<=
br>
&gt; &gt;=C2=A0 =C2=A0* @value: int64_t value<br>
&gt; &gt; @@ -23,13 +32,7 @@<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 QNum *qnum_from_int(int64_t value)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_I64;<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;u.i64 =3D value;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 return qn;<br>
&gt; &gt; +=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_INT(va=
lue));<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /**<br>
&gt; &gt; @@ -40,13 +43,7 @@ QNum *qnum_from_int(int64_t value)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 QNum *qnum_from_uint(uint64_t value)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_U64;<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;u.u64 =3D value;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 return qn;<br>
&gt; &gt; +=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_UINT(v=
alue));<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /**<br>
&gt; &gt; @@ -57,13 +54,7 @@ QNum *qnum_from_uint(uint64_t value)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 QNum *qnum_from_double(double value)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 QNum *qn =3D g_new(QNum, 1);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 qobject_init(QOBJECT(qn), QTYPE_QNUM);<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;kind =3D QNUM_DOUBLE;<br>
&gt; &gt; -=C2=A0 =C2=A0 qn-&gt;u.dbl =3D value;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 return qn;<br>
&gt; &gt; +=C2=A0 =C2=A0 return qnum_from_value((QNumValue) QNUM_VAL_DOUBLE=
(value));<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 /**<br>
&gt; &gt; @@ -75,15 +66,17 @@ QNum *qnum_from_double(double value)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 bool qnum_get_try_int(const QNum *qn, int64_t *val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_I64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.i64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.i64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_U64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qn-&gt;u.u64 &gt; INT64_MAX) {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qv-&gt;u.u64 &gt; INT64_MAX) {<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.u64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.u64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_DOUBLE:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; @@ -116,15 +109,17 @@ int64_t qnum_get_int(const QNum *qn)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 bool qnum_get_try_uint(const QNum *qn, uint64_t *val)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_I64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qn-&gt;u.i64 &lt; 0) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qv-&gt;u.i64 &lt; 0) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.i64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.i64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_U64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qn-&gt;u.u64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D qv-&gt;u.u64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_DOUBLE:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; &gt; @@ -156,13 +151,15 @@ uint64_t qnum_get_uint(const QNum *qn)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 double qnum_get_double(const QNum *qn)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_I64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.i64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.i64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_U64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.u64;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.u64;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_DOUBLE:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qn-&gt;u.dbl;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return qv-&gt;u.dbl;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 assert(0);<br>
&gt; &gt; @@ -171,14 +168,15 @@ double qnum_get_double(const QNum *qn)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 char *qnum_to_string(QNum *qn)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *qv =3D &amp;qn-&gt;value;<br>
&gt; &gt;<br>
&gt; <br>
&gt; qnum_get_value() ?<br>
<br>
I prefer to not hide this behind a function call, in internal<br>
code.=C2=A0 But I don&#39;t mind changing it if you think it&#39;s importan=
t.<br></blockquote><div><br></div><div>no, it&#39;s ok to me</div><div> <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *buffer;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 int len;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 switch (qn-&gt;kind) {<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (qv-&gt;kind) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_I64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot;=
 PRId64, qn-&gt;u.i64);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot;=
 PRId64, qv-&gt;u.i64);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_U64:<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot;=
 PRIu64, qn-&gt;u.u64);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return g_strdup_printf(&quot;%&quot;=
 PRIu64, qv-&gt;u.u64);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_DOUBLE:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: snprintf() is locale =
dependent; but JSON requires<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* numbers to be formatted=
 as if in the C locale. Dependence<br>
&gt; &gt; @@ -189,7 +187,7 @@ char *qnum_to_string(QNum *qn)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* rounding errors; we sho=
uld be using DBL_DECIMAL_DIG (17),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* and only rounding to a =
shorter number if the result would<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still produce the same =
floating point value.=C2=A0 */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer =3D g_strdup_printf(&quot;%f&=
quot; , qn-&gt;u.dbl);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer =3D g_strdup_printf(&quot;%f&=
quot; , qv-&gt;u.dbl);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len =3D strlen(buffer);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt; 0 &amp;&amp; bu=
ffer[len - 1] =3D=3D &#39;0&#39;) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len--;<br>
&gt; &gt; @@ -221,8 +219,10 @@ char *qnum_to_string(QNum *qn)<br>
&gt; &gt;=C2=A0 =C2=A0*/<br>
&gt; &gt;=C2=A0 bool qnum_is_equal(const QObject *x, const QObject *y)<br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; -=C2=A0 =C2=A0 QNum *num_x =3D qobject_to(QNum, x);<br>
&gt; &gt; -=C2=A0 =C2=A0 QNum *num_y =3D qobject_to(QNum, y);<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNum *qnum_x =3D qobject_to(QNum, x);<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNum *qnum_y =3D qobject_to(QNum, y);<br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *num_x =3D &amp;qnum_x-&gt;value;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 const QNumValue *num_y =3D &amp;qnum_y-&gt;value;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 switch (num_x-&gt;kind) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 case QNUM_I64:<br>
&gt; &gt; diff --git a/tests/check-qnum.c b/tests/check-qnum.c<br>
&gt; &gt; index 4105015872..9499b0d845 100644<br>
&gt; &gt; --- a/tests/check-qnum.c<br>
&gt; &gt; +++ b/tests/check-qnum.c<br>
&gt; &gt; @@ -30,8 +30,8 @@ static void qnum_from_int_test(void)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qn =3D qnum_from_int(value);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert(qn !=3D NULL);<br>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_I64);<br=
>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;u.i64, =3D=3D, value);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_I6=
4);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.u.i64, =3D=3D, value)=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;base.refcnt, =3D=3D, 1=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(qobject_type(QOBJECT(qn)), =
=3D=3D, QTYPE_QNUM);<br>
&gt; &gt;<br>
&gt; &gt; @@ -45,8 +45,8 @@ static void qnum_from_uint_test(void)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qn =3D qnum_from_uint(value);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert(qn !=3D NULL);<br>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_U64);<br=
>
&gt; &gt; -=C2=A0 =C2=A0 g_assert(qn-&gt;u.u64 =3D=3D value);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_U6=
4);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert(qn-&gt;value.u.u64 =3D=3D value);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert(qn-&gt;base.refcnt =3D=3D 1);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert(qobject_type(QOBJECT(qn)) =3D=3D QTY=
PE_QNUM);<br>
&gt; &gt;<br>
&gt; &gt; @@ -60,8 +60,8 @@ static void qnum_from_double_test(void)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qn =3D qnum_from_double(value);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert(qn !=3D NULL);<br>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;kind, =3D=3D, QNUM_DOUBLE);=
<br>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpfloat(qn-&gt;u.dbl, =3D=3D, value);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;value.kind, =3D=3D, QNUM_DO=
UBLE);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpfloat(qn-&gt;value.u.dbl, =3D=3D, valu=
e);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(qn-&gt;base.refcnt, =3D=3D, 1=
);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 g_assert_cmpint(qobject_type(QOBJECT(qn)), =
=3D=3D, QTYPE_QNUM);<br>
&gt; &gt;<br>
&gt; &gt; @@ -74,7 +74,7 @@ static void qnum_from_int64_test(void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 const int64_t value =3D 0x1234567890abcdefLL;=
<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qn =3D qnum_from_int(value);<br>
&gt; &gt; -=C2=A0 =C2=A0 g_assert_cmpint((int64_t) qn-&gt;u.i64, =3D=3D, va=
lue);<br>
&gt; &gt; +=C2=A0 =C2=A0 g_assert_cmpint((int64_t) qn-&gt;value.u.i64, =3D=
=3D, value);<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 qobject_unref(qn);<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; --<br>
&gt; &gt; 2.28.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; lgtm otherwise<br>
<br>
Thanks!<br>
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a4ae8805b44ebb2f--

