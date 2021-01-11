Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE632F20C7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 21:29:26 +0100 (CET)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3oa-0006fO-Pa
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 15:29:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kz3nM-0006Dn-9k
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:28:08 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kz3nK-0001am-GI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:28:08 -0500
Received: by mail-ed1-x529.google.com with SMTP id h16so1126731edt.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 12:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=16pRYjbXL3z9//vG/eYqp2GzIHVnq+GzUhTElyzNVGo=;
 b=JUUugzgHzkw9jN944Zj7Ip9sdjZRW8T9PEJEqoBfIPSKupbvr9wgxoaWwf6GP6miMT
 rn4pOzn/ntx0H9NQk8EHAP3AcGpucUPvF/OFGH9AOVyiSq8sbCF+bnizt/GXNZL7AIhE
 yTMd7a4HNtQgi4Yy/GUieOLt+faEp+9FFPHy7KiZEb9bw9EqPy/pOM9Yo0/Dm7gQ66Oa
 TiyAtNBPkBFAEDoc5M6u3klSSM3Gmy/8VXl0J+z2/LFjczncEVXHgbdtFlslBSQ0jKc2
 K42az6yuq8x3B6u+1NYDOraaIAdh4gLCjVCXQiNKTEpgG4W2osZtp9vGTkuV/C1/lwEv
 DLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=16pRYjbXL3z9//vG/eYqp2GzIHVnq+GzUhTElyzNVGo=;
 b=k2Oghn2snMgKTJXCAq0z340NqN5/Ehe7r6MqlPaJAVzL5v3xFznhUu34UapTHoXb4/
 qjmMQGEpJOwCoGiAb9RLeaWJJUbNtS5rnpwabMtq/kqghd3K7EfQQod9Fddf8+hCxkyK
 66GR+Kg9hhdf0i9kR4m5nwuf5kUxUs/eQoEYB4StRuRW802XNmcdUWRxeu/pUzikj30j
 5OfSB47+DbBF+UQ7Tuhr0DawU97G++JzcLPX9DCaUjZS95Je+gcFz5Fn3J71tDUsUoFg
 XbNVmEQEPvbZY2kQcEwr7pvJVPvoezizJtozV+pYVhLMt4uHpeBQ3jyH1MNx1iUBHYEE
 fi+g==
X-Gm-Message-State: AOAM531inAzZqo4ydxeNE55LL2aIeLmZ3Y0i3rqsnCx/8PoaQOhf2BVw
 khBaMtBts9DQg21ciiapCAxJYg==
X-Google-Smtp-Source: ABdhPJzMwS7UtaLVwJHwElx8rhIY43iDMNZeGYVjGjcDzCWv+G02tsY9X4MNTEmroS9qTXdgYKaVuA==
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr788662edk.377.1610396884349;
 Mon, 11 Jan 2021 12:28:04 -0800 (PST)
Received: from wks.local ([188.25.143.140])
 by smtp.gmail.com with ESMTPSA id s12sm431484edu.28.2021.01.11.12.28.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Jan 2021 12:28:03 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: About creating machines on the command line
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
Date: Mon, 11 Jan 2021 22:28:02 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <D199A9CD-4564-4E52-8D50-14A183DD2ABE@livius.net>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ilg@livius.net; helo=mail-ed1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, richard.fuhler@sifive.com,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 sam.grove@sifive.com, Mark Burton <mark.burton@greensocs.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 edgar.iglesias@gmail.com, Luc Michel <luc.michel@greensocs.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I know it does not answer your question directly, but you might find =
useful to take a look at the solution used in the xPack QEMU Arm =
(formerly GNU ARM Eclipse QEMU).

In this fork I dynamically create the peripheral registers when QEMU =
starts, by reading a JSON file, converted from the CMSIS SVD files.

Unfortunately this is not enough, since the actions associated with each =
register are not defined in these JSONs, and need to be hardcoded in =
code.


But I think that the mechanism to create peripherals and registers might =
be adapted to your use case too.

Regards,

Liviu



