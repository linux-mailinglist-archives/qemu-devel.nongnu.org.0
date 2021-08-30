Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848343FBCB6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 20:56:26 +0200 (CEST)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKmSH-0002XF-1q
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 14:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mKmN9-0008Vr-Lh; Mon, 30 Aug 2021 14:51:09 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carpeddiem@gmail.com>)
 id 1mKmN7-00054g-6v; Mon, 30 Aug 2021 14:51:06 -0400
Received: by mail-io1-f41.google.com with SMTP id a15so21213646iot.2;
 Mon, 30 Aug 2021 11:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMn4gNdH35bROA1lED0zkD+n5Ctz/uq3n/fh9h0pueQ=;
 b=KD1oYKKi9OspmzBToXLTUuEEwqbZ3UR/UEvnDv3ozFL27lpvBxLsNn2eyi8Z94SNJI
 GqX6jPYGbKGg0TvAjN2ukSPuL9jfndO1P+VTKp9OwbU8HdFjvHRY83l24YSUmyAIKkqF
 It3vI6jDsvu/zmiIbklnMKIQtEplm9hiO/bCcktTl8Uk3zA4sSpQCbkE3T57UaK8gk8i
 Yvy2s881UOX8yZT6HE++2R+bD7Ye6nAx9mm8IlAIwqAjfKEoxX1wiCa54tzCyPuKLn8k
 OACctkHHhpFu+YJhNivVT9ocv75lMsgtI73+h1YOjjE+msVRkc+KjRhPd8TJeWY6vjc1
 Q2kw==
X-Gm-Message-State: AOAM530hzzi1zdXFRFFMBkPsrwbJ6IdY18UaCzzaQMiiRn3UeG0/+l4y
 nV96w37iCqNg4gZNqxtul07ZbfGVdRDj0uMujj8=
X-Google-Smtp-Source: ABdhPJwnDHLowPfP3UKmNKOeeXDJhC92yrz5aKd29VB7W0AEBQRBuz3lCpXmKvN4j0slibJ68V+StVqmUkNll8KUoDc=
X-Received: by 2002:a6b:fd05:: with SMTP id c5mr18857750ioi.102.1630349462852; 
 Mon, 30 Aug 2021 11:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
 <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
In-Reply-To: <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
Date: Mon, 30 Aug 2021 14:50:47 -0400
Message-ID: <CAPyFy2CZNOL0=-F5_7rZt+oBEC36wwgNj9JQFJre3stZf+KTcw@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.41; envelope-from=carpeddiem@gmail.com;
 helo=mail-io1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 johannst <johannes.stoelp@gmail.com>, Eric Blake <eblake@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 johannst <johannes.stoelp@googlemail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 Aug 2021 at 13:34, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> # As noted, this does not actually cause problems on Linux, because
> # unlike FreeBSD, Linux knows what the f*ck it is doing, and just
> # ignores the upper bits exactly because of possible sign confusion.
>
> Whether that's still true a decade later I have no idea :-)

It wasn't even true a decade ago -- FreeBSD has ignored the upper bits
since 2005[1]. That change included a warning if upper bits were set,
but the warning is now hidden behind a diagnostic option.

[1] URL: https://cgit.FreeBSD.org/src/commit/?id=9fc6aa0618a174f436fb1a26867c99cff4125b40

