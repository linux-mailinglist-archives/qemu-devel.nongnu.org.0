Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75040F3A97
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 22:35:00 +0100 (CET)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSpQh-00045f-06
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 16:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53145)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1iSpPG-0003eR-8h
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 16:33:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1iSpPE-0004zj-RE
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 16:33:29 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:35335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1iSpPE-0004xI-HN
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 16:33:28 -0500
Received: by mail-lj1-x243.google.com with SMTP id r7so3940795ljg.2
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 13:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=po5BRt7Y3tcW0ckyLk4B9jLYnHdCSF/4D8GiUZbqTdc=;
 b=JWLdQmkkh9b2uumj2yqFfbpWkvQ/WT/d6mfF+nX5NXVVWzNfNYXfgfXwU4H8qvaHpN
 sfSyWhsu232JK5pB0/+xKh1IanOogJQ7ODVnJf9cJBl+DZxpojd8ATZcHphWTZtcWMXo
 QxJOa+AuiT1TY6Ujy7B1QexAdXXh8BZzfXX3RnkHf8GClrCcMSS6DOg8+wqXIf6Wzuhw
 jPpxO4r3Ab4XSQ01JxNn+J3vV7/hVRhcjhdOdJn1aTelRBwIK67HGEfHcx04U1ukpzyT
 aexyolt6rXRf9XlmTeFSt0GL7Wl14Bcrk+Qpu0yxGly+SuGCGdcNT378gU+fTMkWZ0Dr
 AMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=po5BRt7Y3tcW0ckyLk4B9jLYnHdCSF/4D8GiUZbqTdc=;
 b=mjjkjHWm89Gkf4MOQenqUpogaZCjf3Rj7IvbBPgnZlYopUPCHjKKRwjUAqXHcDG2e2
 u95frN4BTim/sZGNfXAjw1Afekkw9KdsXqahogBoldm/1eIveJo4N+Viii90psvoT0hu
 Bn9sThGXpd/aJWiccFEH7NRMUab+J7Z+s/trXw9zFFBFtClLNhT16skjrNgqWFuS9+pm
 L/9jTJq0Q/3Ww555WCosMea2P0cy9Q4ej9nVW+MH2hGTvXsSB5j54BiHoxVxBD94fGb4
 kmzQ0M4iPdQ5gWpqQo2Bsczp/cbQa0LvXGCMgNfp67W7haU3LiXCrvQ3gepinAwq5p9f
 nOyg==
X-Gm-Message-State: APjAAAUF9/ZNmw8YgXkFpv+bCdoKyLG3gmZAFXF9Vrd5kvVAkxWxcFzl
 /wF9fK2Rh+pUbF6k2SXVA9jjwdZzKXNfzojV7P2fytHj
X-Google-Smtp-Source: APXvYqzWoZTxidukJqI/DbdrTeQjC8Nb5BisndKwK/wHF7xWKyD34c+D5X5Rx8q5E5nefcABUAmkirvOLc/UjqetASc=
X-Received: by 2002:a2e:96c1:: with SMTP id d1mr4203294ljj.87.1573162406813;
 Thu, 07 Nov 2019 13:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20191107142613.2379-1-robert.foley@linaro.org>
 <20191107142613.2379-5-robert.foley@linaro.org> <87tv7fhcl7.fsf@linaro.org>
In-Reply-To: <87tv7fhcl7.fsf@linaro.org>
From: Robert Foley <robert.foley@linaro.org>
Date: Thu, 7 Nov 2019 16:33:15 -0500
Message-ID: <CAEyhzFstympdB_zeJ4WzxV4vChJUrqyqYEERgDrTge5joaEx0A@mail.gmail.com>
Subject: Re: [PATCH 4/4] Added tests for close and change of logfile.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: Peter Puhov <peter.puhov@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Agree with all the suggestions below.  These are great ideas.  Will
make the changes.

Thanks,
-Rob Foley

On Thu, 7 Nov 2019 at 11:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Robert Foley <robert.foley@linaro.org> writes:
>
> > One test ensures that the logfile handle is still valid even if
> > the logfile is changed during logging.
> > The other test validates that the logfile handle remains valid under
> > the logfile lock even if the logfile is closed.
> >
> > Signed-off-by: Robert Foley <robert.foley@linaro.org>
> > ---
> >  tests/test-logging.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 74 insertions(+)
> >
> > diff --git a/tests/test-logging.c b/tests/test-logging.c
> > index a12585f70a..a3190ff92c 100644
> > --- a/tests/test-logging.c
> > +++ b/tests/test-logging.c
> > @@ -108,6 +108,76 @@ static void test_parse_path(gconstpointer data)
> >      error_free_or_abort(&err);
> >  }
> >
> > +static void test_logfile_write(gconstpointer data)
> > +{
> > +    QemuLogFile *logfile;
> > +    gchar const *dir =3D data;
> > +    Error *err =3D NULL;
> > +    gchar *file_path;
> > +    gchar *file_path1;
>
>   with g_autofree char *file_path you can avoid the free down bellow.
>
> > +    FILE *orig_fd;
> > +
> > +    file_path =3D g_build_filename(dir, "qemu_test_log_write0.log", NU=
LL);
> > +    file_path1 =3D g_build_filename(dir, "qemu_test_log_write1.log", N=
ULL);
> > +
> > +    /*
> > +     * Test that even if an open file handle is changed,
> > +     * our handle remains valid due to RCU.
> > +     */
> > +    qemu_set_log_filename(file_path, &err);
> > +    g_assert(!err);
> > +    rcu_read_lock();
> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
> > +    orig_fd =3D logfile->fd;
> > +    g_assert(logfile && logfile->fd);
> > +    fprintf(logfile->fd, "%s 1st write to file\n", __func__);
> > +    fflush(logfile->fd);
> > +
> > +    /* Change the logfile and ensure that the handle is still valid. *=
/
> > +    qemu_set_log_filename(file_path1, &err);
> > +    g_assert(!err);
>
> Maybe better would be:
>
>   logfile2 =3D atomic_rcu_read(&qemu_logfile);
>   g_assert(logfile->fd =3D=3D orig_fd);
>   g_assert(logfile2->fd !=3D logfile->fd);
>   fprintf(logfile2->fd, "%s 2nd write to file\n", __func__);
>   fflush(logfile2->fd);
>
> <snip>
> > +    g_assert(logfile->fd =3D=3D orig_fd);
> > +    fprintf(logfile->fd, "%s 2nd write to file\n", __func__);
> > +    fflush(logfile->fd);
> > +    rcu_read_unlock();
> > +
> > +    g_free(file_path);
> > +    g_free(file_path1);
> > +}
> > +
> > +static void test_logfile_lock(gconstpointer data)
> > +{
> > +    FILE *logfile;
> > +    gchar const *dir =3D data;
> > +    Error *err =3D NULL;
> > +    gchar *file_path;
>
> g_autofree
>
> > +
> > +    file_path =3D g_build_filename(dir, "qemu_test_logfile_lock0.log",=
 NULL);
> > +
> > +    /*
> > +     * Test the use of the logfile lock, such
> > +     * that even if an open file handle is closed,
> > +     * our handle remains valid for use due to RCU.
> > +     */
> > +    qemu_set_log_filename(file_path, &err);
> > +    logfile =3D qemu_log_lock();
> > +    g_assert(logfile);
> > +    fprintf(logfile, "%s 1st write to file\n", __func__);
> > +    fflush(logfile);
> > +
> > +    /*
> > +     * Initiate a close file and make sure our handle remains
> > +     * valid since we still have the logfile lock.
> > +     */
> > +    qemu_log_close();
> > +    fprintf(logfile, "%s 2nd write to file\n", __func__);
> > +    fflush(logfile);
> > +    qemu_log_unlock(logfile);
> > +
> > +    g_assert(!err);
> > +    g_free(file_path);
> > +}
> > +
> >  /* Remove a directory and all its entries (non-recursive). */
> >  static void rmdir_full(gchar const *root)
> >  {
> > @@ -134,6 +204,10 @@ int main(int argc, char **argv)
> >
> >      g_test_add_func("/logging/parse_range", test_parse_range);
> >      g_test_add_data_func("/logging/parse_path", tmp_path, test_parse_p=
ath);
> > +    g_test_add_data_func("/logging/logfile_write_path",
> > +                         tmp_path, test_logfile_write);
> > +    g_test_add_data_func("/logging/logfile_lock_path",
> > +                         tmp_path, test_logfile_lock);
> >
> >      rc =3D g_test_run();
>
>
> --
> Alex Benn=C3=A9e

