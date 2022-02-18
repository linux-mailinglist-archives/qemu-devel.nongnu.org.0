Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4564BBEBF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:52:20 +0100 (CET)
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7QZ-0005qo-Hb
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:52:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7OV-0004oS-2L
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:50:11 -0500
Received: from [2607:f8b0:4864:20::c35] (port=44683
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7OS-0008QF-N0
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:50:10 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so4341807ooa.11
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 09:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fCRKRiBH6sYbtWz5iLph23tpoi/EGciIGMzk6qdGhg8=;
 b=caEVgYy57l+O+5UEGtJruKx/M1LAVex7uUZ3pF70GN750l7WPAFK3wFs3rP94cz+sl
 HK7jGMx9zXE8A+C9itEG0FPZokY6vHZHS0dA0SVSzhHTW7dgt3H1Qm3PCxdJd2vmLWHk
 nlB3u9j65CQS5MN1OowFkln25JKKZBHgnirfGgwnTeO8JPhM6Bi3ZE26PP8gR3Y69lCS
 CvyOOUqxgDIBsCblsbmijOTlVP3BoiPCMAZJ/Yy9cBDYXfgB1VxWSLmm4krp3YAmDR1H
 frkkORddc3X8LH4CKX3c69GuQxBvKjTAAF7XrsPIR5p8dPN0ADcvm/ea0cn/W1o+RjUF
 wV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fCRKRiBH6sYbtWz5iLph23tpoi/EGciIGMzk6qdGhg8=;
 b=NMNsJW0qFiGrnYRnbgdBiLOvO0i4DxoSDH9ySLJrAZXv3OV0vdhFMATyAkk4vBRdKK
 AYaKrblouweQT8CI9LBiJAVfP2q4gy5eUalCWhsxfv2+jyCm95i04kwN9OK24Ge8dyCg
 cvEBIe2fLS3w9/eifewgT1VpenDFY85nPV12bMyu+y1qd09fXclbtcboSTRrkSgPHDUD
 /x8F5Q3zP5WyfZ0Q4lbxn19+hF2aLiGoGFQEsXvC8Tr5+aTRNYdqAZeX3YTUiL+/1wLa
 jmQc33H8p6ioqE3UWkVmUl80fv9lhYFzxsGefC1MGHzF7zoDBCWCnn9mTOqTVHXAIfHw
 fobQ==
X-Gm-Message-State: AOAM5314OQlMoo4h9Gs5OfJZvBxXs1xYYAa7F6PbnGs/NRv91s9DJlFJ
 YnNeiizjBXacBq2eGQnjK5VBv3yQKG6TeS2KkDk=
X-Google-Smtp-Source: ABdhPJz2/T5KtrOMBuZat8WESN/m7A2/j2FENr+tSb/tPfCAIRskQsaAmrySWNyXsbwecL4kN/ssbdOkghd66s9S5KI=
X-Received: by 2002:a05:6870:f78d:b0:d2:73ff:93a8 with SMTP id
 fs13-20020a056870f78d00b000d273ff93a8mr3148510oab.193.1645206606714; Fri, 18
 Feb 2022 09:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-12-f4bug@amsat.org>
 <CAFEAcA89pP021OxJM9pqivmTHWAjSSHGkNoGAJYB77OH1RpRyg@mail.gmail.com>
In-Reply-To: <CAFEAcA89pP021OxJM9pqivmTHWAjSSHGkNoGAJYB77OH1RpRyg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 19 Feb 2022 02:49:55 +0900
Message-ID: <CAMVc7JWuwTLsP__A33wBGsf7QFstuEuP1JAdJOtxdW9y-W0YWQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] ui/cocoa: Add Services menu
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 19, 2022 at 2:33 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Tue, 15 Feb 2022 at 08:26, Philippe Mathieu-Daud=C3=A9 via
> <qemu-devel@nongnu.org> wrote:
> >
> > From: Akihiko Odaki <akihiko.odaki@gmail.com>
> >
> > Services menu functionality of Cocoa is described at:
> > https://developer.apple.com/design/human-interface-guidelines/macos/ext=
ensions/services/
> >
>
> I tested this, and while it does create a Services menu, none of
> the items in it seem very relevant to QEMU (on my machine, there's
> Activity Monitor, Time Profile Active Application, and some other
> software-development related things). In fact, every app I looked
> at exposed the same list of things in the Services menu. So I'm
> not sure why this is even an application-specific menu that needs
> specific code to support, rather than something system-wide that
> Apple automatically adds to the UI where it wants it.
>
> -- PMM

Actually I wanted to use those services from Xcode to debug QEMU. I
have no idea why Apple decided to do it this way, but an application
template from Xcode does the same although it uses an interface file
instead of Objective-C code.

Regards,
Akihiko Odaki

