Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F825F2ACE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 09:41:49 +0200 (CEST)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofG5E-0005g3-D6
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 03:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofG2L-0003X8-Iy
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:38:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ofG2I-0000kA-7e
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664782724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bPmD5sg3grbF8HEPuVZCBkR+89aif4tQ+79bebNfxq4=;
 b=Y5u1huqfwryhWJ25WHCld/Bcdx0VKarLLB6MsIalXukQ2TICBdxnw+cp6adEF1XC6IM1II
 NrgIzNTcvdG5ND4R5kS6OVm/8j9pgQB9HOj8k/I0dWMmqZiNgpn/Ggjy6YMMDX+AeruDBl
 KNWZ0J8vWf/8dbpZJ+b5qpI2Iw2AM3Q=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-bTKXvapAODmKK3FRgJ3S4w-1; Mon, 03 Oct 2022 03:38:43 -0400
X-MC-Unique: bTKXvapAODmKK3FRgJ3S4w-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13227a6bba3so3368180fac.2
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 00:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bPmD5sg3grbF8HEPuVZCBkR+89aif4tQ+79bebNfxq4=;
 b=io4kKx6YUpRMBCt09qBqbLMFSPBA5psz/p+9FsYxv5kJtbzgwWXk1TZf7NYsfgGtU9
 8iTbfKrQepAJ26lK6RWJiU3xtrcbbwQ5BkkVLxh76l/vX2E/4HDOnJqcOB56USztKMPm
 P8HCIK6W1+RTN3QnuGaRBAPRvkRBIGjy3ndXgVbXEXpzZnSODCw/+67gaTe41Ipaf89Z
 37yM8tsAo9aPYDx+itExAKf/47KI12CF4HJnxdaQwRZHuhfuzXAaRVQvtTQlyVRBq92L
 dn24fqEw3dyzbJL5Q/YFpwQNvKm6g0oizLxsX7XvU83xglb4FY7sS/PrnzpRdpSurQJl
 0xKQ==
X-Gm-Message-State: ACrzQf2sRW+LXj+xbNcgiGZ5fr2gnTHu2c6rBWABGrXiktS6wDFxEFs3
 FgVtzU4CNRuzYDntBy7hrJBZj8Z8g2uZMxF8v7smxFmycPnhNguGv81yOyePrmKbR+alnyFx1V1
 E7+6kN7uADe+dBqN3qYb2s4EwYMlmTa0=
X-Received: by 2002:aca:674a:0:b0:353:cb71:7bf1 with SMTP id
 b10-20020aca674a000000b00353cb717bf1mr214030oiy.53.1664782722717; 
 Mon, 03 Oct 2022 00:38:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65HvNM0xZmnzvnXPkq3cWCEXZZVsd7qaTaKJDNUTkO6O/TsQemQgphTukz3sJ5Veyeellsw7HQtRBDjW5tK6M=
X-Received: by 2002:aca:674a:0:b0:353:cb71:7bf1 with SMTP id
 b10-20020aca674a000000b00353cb717bf1mr214024oiy.53.1664782722544; Mon, 03 Oct
 2022 00:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220930140354.1684652-1-marcandre.lureau@redhat.com>
 <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
In-Reply-To: <80e410e5-f151-65ce-63a0-956fae528700@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 3 Oct 2022 11:38:31 +0400
Message-ID: <CAMxuvazZYUw1LHSv_kg1gBWmGePOXXz1w6nX7MnYwA-GbaK33w@mail.gmail.com>
Subject: Re: [PATCH v3] win32: set threads name
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, bin.meng@windriver.com, 
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hi

On Fri, Sep 30, 2022 at 6:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/30/22 07:03, marcandre.lureau@redhat.com wrote:
> > +static bool
> > +set_thread_description(HANDLE h, const char *name)
> > +{
> > +  HRESULT hr;
> > +  g_autofree wchar_t *namew = NULL;
> > +
> > +  if (!load_set_thread_description()) {
> > +      return false;
> > +  }
>
> I don't understand why you're retaining this.
> What is your logic?
>

Also, if we change the "static bool name_threads" to be true by
default, then set_thread_description() might be called without calling
qemu_thread_naming()

It really shouldn't hurt to keep it that way.


