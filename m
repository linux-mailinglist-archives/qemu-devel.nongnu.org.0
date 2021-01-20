Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD292FCDCC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:20:09 +0100 (CET)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Aau-0000Ym-1F
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2AYX-0007ar-Aj
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:17:42 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1l2AYV-0005Xy-EN
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:17:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id v184so2326748wma.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 02:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/HkiBvoVdZIJrEzSBhimQMSj69Zur+6MeKP45Dw7C+4=;
 b=04udrIMQEUCn+LV7lpovSHz86Xa5bR8HWH9qa1Fw7WQBhVjh0exPCN1c9qsrmp/20M
 WkgehbzmDfGYLtuDit1cgvuXnNH2se5LBjwq0E5h1wyFH5p/TXCCApIswYU4aLomSACh
 EScLZOMizgOVGcwouZkcgIMt8I/PtJRnHw/6w9z8HDI2TTpX9pKHYj6Zf0vmz9jCB2OV
 ankWfuqR9YePjaLaJ/4y0MtHRcNh1pWlMbSeh3Efg9E354qr/V4Q3/BzCOMcNyKrFLNg
 vT2ORaD8U38sC5QaVU1iXd6JXPC5/Q9xqx92wMqstCJCwYrbfE8/e3CsTwTHSmehzhus
 BYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=/HkiBvoVdZIJrEzSBhimQMSj69Zur+6MeKP45Dw7C+4=;
 b=EcF3EqNaU8PMcww+zKUA6IDIP87AvwrIqCEZ6DFHIcHx3WX2rD48UrZt6Zf9YXd0ny
 r6YDLWXqVwqvDD+w2d5xnTWORqpYSHrIbVkECfa9JYz0z+EhZRFd8pMSgCebvb6bWSio
 Br5lcOSSx8pvwx8Wm4fQaKk0sQSL5LY9OiXPuDQJXJiW+sinEnh0ir/Eo+7IQ1wdBU0N
 VYFY0ItLbMkqTlvjxnLvWLd0YMwdXZH+engYGawW11uO4fdgOlg3vlH2/8S9fSm0wm6R
 j6VSYwkTJEYw1Xl3uAHDlidSwmeLDOEry7RtlSmX4+fNPYeDgUUClL1QAoBOeoJXKlXC
 23xw==
X-Gm-Message-State: AOAM533vhhdofUMWWxv5xYjX+qZsX0nV3NXw8e8dmbImn8CNDMkedJHl
 RjEyNt2K8H+bb8To7NQg/1bB1Q==
X-Google-Smtp-Source: ABdhPJw4f1hLG4zTb7nyJJE9o/odNPPLmrrCJwxZDF4XtHSY9haqsyGtrTTKvvMm6xqAxK35bI/59w==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr3592648wme.76.1611137857996; 
 Wed, 20 Jan 2021 02:17:37 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id v6sm2717189wrx.32.2021.01.20.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 02:17:37 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d9b0d2fd;
 Wed, 20 Jan 2021 10:17:36 +0000 (UTC)
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH 1/2] hw/i386: -cpu model,-feature,+feature should
 enable feature
In-Reply-To: <20210120100803.GF3015589@redhat.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
 <20210119142207.3443123-2-david.edmondson@oracle.com>
 <20210119152056.GE1227584@habkost.net> <cuna6t499ir.fsf@dme.org>
 <20210119163052.GG1227584@habkost.net>
 <20210120100803.GF3015589@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
X-Now-Playing: Four Tet - Sixteen Oceans: 1993 Band Practice
Date: Wed, 20 Jan 2021 10:17:36 +0000
Message-ID: <cuny2gn7vzz.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::333;
 envelope-from=dme@dme.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-20 at 10:08:03 GMT, Daniel P. Berrang=C3=A9 wrote:

> On Tue, Jan 19, 2021 at 11:30:52AM -0500, Eduardo Habkost wrote:
>> On Tue, Jan 19, 2021 at 04:27:56PM +0000, David Edmondson wrote:
>> > On Tuesday, 2021-01-19 at 10:20:56 -05, Eduardo Habkost wrote:
>> >=20
>> > > Hi,
>> > >
>> > > Thanks for the patch.  Getting rid of special -feature/+feature
>> > > behavior was in our TODO list for a long time.
>> > >
>> > > On Tue, Jan 19, 2021 at 02:22:06PM +0000, David Edmondson wrote:
>> > >> "Minus" features are applied after "plus" features, so ensure that a
>> > >> later "plus" feature causes an earlier "minus" feature to be remove=
d.
>> > >>=20
>> > >> This has no effect on the existing "-feature,feature=3Don" backward
>> > >> compatibility code (which warns and turns the feature off).
>> > >
>> > > If we are changing behavior, why not change behavior of
>> > > "-feature,feature=3Don" at the same time?  This would allow us to
>> > > get rid of plus_features/minus_features completely and just make
>> > > +feature/-feature synonyms to feature=3Don/feature=3Doff.
>> >=20
>> > Okay, I'll do that.
>> >=20
>> > Given that there have been warnings associated with
>> > "-feature,feature=3Don" for a while, changing that behaviour seems
>> > acceptable.
>> >=20
>> > Would the same be true for changing "-feature,+feature"? (i.e. what th=
is
>> > patch does) Really: can this just be changed, or does there have to be
>> > some period where the behaviour stays the same with a warning?
>>=20
>> I actually expected warnings to be triggered when using
>> "-feature,+feature" as well.  If we were not generating warnings
>> for that case, it will need more careful evaluation, just to be
>> sure it's safe.  Igor, do you remember the details here?
>
> Where are you expecting warnings ? I don't see any when launching QEMU

qemu-system-x86_64 -display none -cpu Westmere,-vmx,+vmx

Warnings because the result of this is "-vmx".

> IMHO just leave the parsing unchanged, deprecate it, and then delete
> the code.  We don't need to "improve" usability semantics of something
> that we want to delete anyway.

/me nods.

dme.
--=20
I just bite it, it's for the look I don't light it.

