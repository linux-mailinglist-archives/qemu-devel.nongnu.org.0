Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E6575094
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:16:48 +0200 (CEST)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBze2-0008R8-S1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBzaR-0005CL-0A
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:13:03 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oBzaP-0003UD-2m
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:13:02 -0400
Received: by mail-pg1-x531.google.com with SMTP id bh13so1673204pgb.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1fzZy3pGn6CYmY1+JTb13TQYCzy+5y9FU/Pgeea4q+M=;
 b=C1BtrDlzEh4aU+2vlp/K36myrM52PkjjlPEQDot8yDlCtRYeUzDaIKspzImle/VVdm
 tcGeSC2uV4QYOxPY7UBhnt6LvR+NUbQoV+vNBfQR8/PWo5pRfFXpQhaoued2MGKnu30v
 1RH6KpdrkQi/at4mQ1Kai0U8KWPQX5/aqUfu4tWPY4wlTIKu/XpoH+ujjWLy+kXKdD9h
 CMdZqcCzalZxU8oZHBDNPgmTq7EHnYAY4BaoVJeHEm2trC/i2O0uFcWm4B6mcHc9fQkh
 sF/3uFy1Q0ix/5iTvFDKMbSsInMyJYy8ZZ/jrY3xtGMb3/f1LD7QlXaeZJTP8/313px+
 2kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1fzZy3pGn6CYmY1+JTb13TQYCzy+5y9FU/Pgeea4q+M=;
 b=WmjzUuUW0LF08g5qNHnyyTKTCu4tZKu/MmaKPR9462wxF5xFEu5isBRE3ilKqkCyWR
 Y9A8MSa/AVyL/Io8c1ubZW0wg79J8j1ml3gaBiOE8hTS4o52H1/8E/A5SZlmwz6QMieP
 s0HZkU6eGyulJzFVqDYG3UEP39aTf5Tw/984+26lhhd55Wny5eh4NGSiyWyrdtLzqbsH
 NJpaxH9CjtDnvGInbB7ekLEWcq1KRRaWzAzAdKarf46iR+TeogMysTKslDjN3q6uAZ1X
 gNHExP++CkQck/PujSd5TyjWAt77xTp8RjBsu1kUqxT2FQ+tzJywlM0qzwrv/5YxfhPm
 7nZA==
X-Gm-Message-State: AJIora/aVlzPn/0DPxu0c9gbBX3dhyErpWWn7PAiuz/O/PwBJQ2ayepE
 kCuvRxZG/iqqOHNqJtWwKMxTqg==
X-Google-Smtp-Source: AGRyM1sjgKmg1atH/flkBGq64B17KLn4n3BSekdoVh5aO/T7va6kEn80IujQeW6u8et20jCK9FhslQ==
X-Received: by 2002:a63:470f:0:b0:419:aa0d:7c51 with SMTP id
 u15-20020a63470f000000b00419aa0d7c51mr4762501pga.482.1657807978688; 
 Thu, 14 Jul 2022 07:12:58 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.141.24])
 by smtp.googlemail.com with ESMTPSA id
 b6-20020a1709027e0600b0016c3f7b5b48sm1511362plm.256.2022.07.14.07.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 07:12:58 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 14 Jul 2022 19:42:52 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, thuth@redhat.com, 
 peter.maydell@linaro.org, jsnow@redhat.com, pbonzini@redhat.com, 
 imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH v2 02/11] acpi/tests/bits: add SPDX license identifiers
 for bios bits tests
In-Reply-To: <YtAgmD+EJSCK4MG2@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2207141942100.2135546@anisinha-lenovo>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-3-ani@anisinha.ca> <YtAgmD+EJSCK4MG2@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1880351302-1657807977=:2135546"
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1880351302-1657807977=:2135546
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 14 Jul 2022, Daniel P. Berrangé wrote:

> On Sun, Jul 10, 2022 at 10:30:05PM +0530, Ani Sinha wrote:
> > Added the SPDX license identifiers based on the following output from the
> > licensee tool for bios bits:
> >
> > $ licensee detect bits/
> > License:        NOASSERTION
> > Matched files:  COPYING
> > COPYING:
> >   Content hash:  7a1fdfa894728ea69588977442c92073aad69e50
> >   License:       NOASSERTION
> >   Closest non-matching licenses:
> >     BSD-3-Clause-Clear similarity:  85.82%
> >     BSD-4-Clause similarity:        83.69%
> >     BSD-3-Clause similarity:        77.27%
>
> This report looks pretty bogus to me.
>
> smbios.py license header pretty clearly matches BSD-3-Clause with
> 99% similarity.

OK in the next iteration I will fix this. This tool likely just looked at
the COPYING file in bits and not the individual python files.

>
>    https://spdx.org/licenses/BSD-3-Clause.html
>
> and is pretty different from
>
>    https://spdx.org/licenses/BSD-3-Clause-Clear.html
>
> which adds a statement about patent rights which doens't exist.
>
>
> If we're going to add SPDX tags to existing files it needs to be
> done by a human, not an automated tool. If not possible, we should
> leave off SPDX tags, because adding incorrect SPDX tags creates
> more harm
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
>
>
--2088271309-1880351302-1657807977=:2135546--

