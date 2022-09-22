Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7695E6507
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 16:22:16 +0200 (CEST)
Received: from localhost ([::1]:41940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obN5j-0004WV-Al
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 10:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obMLx-0004dY-D7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:34:59 -0400
Received: from mail-vs1-f41.google.com ([209.85.217.41]:35728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obMLv-0001Ul-Au
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:34:56 -0400
Received: by mail-vs1-f41.google.com with SMTP id 63so9018122vse.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=phzwqKcQjZLI3N1WlA52eHuFuLlRVITevGe0tOSHyz4=;
 b=4GboyQum6OQh3GCfrtNPc2TzHa8Rz7AzLliukmBwaZpIg/5yDRzlmWUZPDHzBjc1D9
 +QhZzniuFAEMjo3+Gx9ZXbP2skk7xB0ks71B8PspZQ2Zox54QCEONTywqAPgUNGaSwcN
 hTFjvIZ+EQbtYElHiiEzoOJW5mejo9rdcfH22yuy3KEqaGCiiGuagrEb0eP2KcKDJy5+
 fWI+N4ZnyEjg1gm7XYJgoHpGVBr6JAOp88IWnIsjWTV8eRV2L1T9WKOQrAUn2NqkxSc3
 d4X4CIjlshQ8bEQLwDKAKgr8Pd4kLRODd7K7K5gOtu8yOPza9rbJjPmN9zogcDoPFSTs
 Sycg==
X-Gm-Message-State: ACrzQf0X7sDnJj+o7D0AZywOde0jcR+zC/O9i+EEksPjQDo9f3ZRjYgt
 SzshqL7ygUW0Z9WofgkYMIrPAlzef/0KY5jQjOk=
X-Google-Smtp-Source: AMsMyM45iVMYWlIIL7HcYuxJCa3aj3dT6OzAoZuvKFK9Ff5h8PFIL0mGpoHKjcyHBwh5qEMljgs0hB7s7tUX3xR4tNs=
X-Received: by 2002:a67:ab0a:0:b0:39a:c8e4:fde9 with SMTP id
 u10-20020a67ab0a000000b0039ac8e4fde9mr1312195vse.23.1663853694052; Thu, 22
 Sep 2022 06:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org> <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org> <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org> <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org> <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org>
In-Reply-To: <87r103lf4y.fsf@pond.sub.org>
Date: Thu, 22 Sep 2022 15:34:42 +0200
Message-ID: <CAAdtpL7=6YN+jh30xB_PB5aAxaWoFf4-3nLsWiAMGK6ZvWnLww@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
To: Markus Armbruster <armbru@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.217.41;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vs1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, Sep 22, 2022 at 3:20 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Claudio Fontana <cfontana@suse.de> writes:
>
> [...]
>
> > I think it would be better to completely make the return value separate from the Error,
> > and really treat Error as an exception and not mix it up with the regular execution,
> >
> > but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>
> It's a matter of language pragmatics.  In Java, you throw an exception
> on error.  In C, you return an error value.
>
> Trying to emulate exceptions in C might be even more unadvisable than
> trying to avoid them in Java.  Best to work with the language, not
> against it.
>
> Trouble is the error values we can conveniently return in C can't convey
> enough information.  So we use Error for that.  Just like GLib uses
> GError.
>
> More modern languages do "return error value" much better than C can.  C
> is what it is.
>
> We could certainly argue how to do better than we do now in QEMU's C
> code.  However, the Error API is used all over the place, which makes
> changing it expensive.  "Rethinking the whole Error API" (your words)
> would have to generate benefits worth this expense.  Which seems
> unlikely.

QEMU Error* and GLib GError are designed to report recoverable runtime *errors*.

There is or is no error. A boolean return value seems appropriate.

We are bikeshedding about the API because we are abusing it in a non-error case.

If we want to try to load an optional module, the Error* argument is
not the proper way to return the information regarding why we couldn't
load.

In both cases we want to know if the module was loaded. If this is an
optional module, we don't care why it couldn't be loaded.

So trying to make everybody happy:

  // Return true if the module could be loaded, otherwise return false
and errp contains the error.
 bool module_load_one(const char *prefix, const char *name, Error *errp);

  // Return true if the module could be loaded, false otherwise.
  bool module_try_load_one(const char *prefix, const char *name);

