Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A22F5F7D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:08:54 +0100 (CET)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Un-0002jN-Ve
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:08:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1l00TH-0001YZ-Sz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:07:19 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1l00TF-0006Bm-Vy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:07:19 -0500
Received: by mail-ej1-x631.google.com with SMTP id 6so7569484ejz.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gimX3Ho1seAz3KY3wGBoMn6L0D4jYiGo7kOt/tAVDNo=;
 b=YpFOLAmnsDBMVv4JFrWrPEGJJiX0vdeEcaf53IbqL/EZCbXZ9faAunJ5u+5OXhxa5Z
 BSeQm9XtAcA3tOsNITpjIhMMyEm24kkLum/ni3HoocRpHIltAnu1sVa/bODU+zkBuY7Q
 3Q/WvRR/3YjodTGY2Bu/GL1w0yLG1xf7v86GGsBuf76DFNDQrtpcGm5ewIYVRdqH4w4K
 ZtevyxziTa9WTpfUiHcrm64fhU5neM2tIwkMDPhtHY5xvvXPUi5cDAegig5AIFDfk45d
 nAwRJPKKI4mfKfnwgSYTJ3UhOxBoYqpIC+WpO6Fy9BkZStstsy2xdKJslSq/PflyKdQY
 WqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=gimX3Ho1seAz3KY3wGBoMn6L0D4jYiGo7kOt/tAVDNo=;
 b=tD1LYaWEY0sJIvxnaQlqg3EbWkbFv6yzZ+IVJFcwklH9lTz2r+S5SBTeI1kBQhvmz2
 hJNMB+K5gqB8UzqrkeB9MTCUY2HsZGTmbFCtzQ38AYvTBWklz5AaYp3h52XnxTAV1nHN
 EmtPSUUkiZVJFa//L2GMNdFv/ORl17405ZChug7TLhkfyju9sFN8Ko4WrUjOP8dB8mXu
 /84zJ/eIUEksVCKSst/dhUuig2K9PKoMjV6FGpujSQeFY8r+IBDBSeRcqn2sb+0wvUvf
 cs4uLJ0RopoGQH8A+cMCNE3ML6XDB/cJiQI8V/FnynxooCG+TwJKHjzBc+xanhWSHm23
 kDKg==
X-Gm-Message-State: AOAM530+WLoIB4ZRJHNRtKLjsP5LRLkueA5vXDfn9vdodeFj/Lgfdevh
 YUa6MCquQDddc2TN8vKGKq9dmw==
X-Google-Smtp-Source: ABdhPJx6Ey2e291ph8HILKblrxBxVH+P0r72IA5tvnZjQuqvJTIGfeWJ8WXzXDILjC08lpBqcxtaFQ==
X-Received: by 2002:a17:906:a951:: with SMTP id
 hh17mr5084285ejb.388.1610622435922; 
 Thu, 14 Jan 2021 03:07:15 -0800 (PST)
Received: from wks.local ([188.25.143.140])
 by smtp.gmail.com with ESMTPSA id j23sm1872326ejs.112.2021.01.14.03.07.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:07:15 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: About creating machines on the command line
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <548bfe76-adee-e6cd-b783-6df3154986f4@greensocs.com>
Date: Thu, 14 Jan 2021 13:07:13 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <7C5A9F62-4E2C-48A1-AAF7-FB06E73002AA@livius.net>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
 <D199A9CD-4564-4E52-8D50-14A183DD2ABE@livius.net>
 <548bfe76-adee-e6cd-b783-6df3154986f4@greensocs.com>
To: Luc Michel <luc.michel@greensocs.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=ilg@livius.net; helo=mail-ej1-x631.google.com
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
 sam.grove@sifive.com, QEMU Developers <qemu-devel@nongnu.org>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 edgar.iglesias@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 14 Jan 2021, at 12:56, Luc Michel <luc.michel@greensocs.com> wrote:
>=20
> ... But yes the goal here is to rely on QEMU's already existing device =
models to dynamically create a machine.

I did not check the current QEMU device models, so I might be wrong, but =
I think that the scope might be slightly different.

In my fork I read the JSON with the detailed peripherals definitions, =
which include not only memory address, but registers, sizes, alignment, =
bit-fields, access right, reset values, etc, and from these definitions =
I automatically create the QEMU objects.

The result is a device with all registers available, you can already =
read/write all of them, just that there are no actions associated yet, =
and these actions need to be added manually.

There is also a tool that generates the C code for this, so basically I =
can turn a CMSIS SVD definition into a complete QEMU device, partly =
functional (without actions).

I plan to further improve this mechanism, but it'll probably take some =
time.


Regards,

Liviu



