Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE77580255
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:57:59 +0200 (CEST)
Received: from localhost ([::1]:40118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG0T0-0000eA-FO
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG0RK-0007Gi-Ku
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:56:14 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1oG0RI-0001nf-NL
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:56:14 -0400
Received: by mail-ej1-x62d.google.com with SMTP id b11so21330552eju.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UtheBbJtexhKoaeh3asCZUpxhFIN2UBPhbEj4xsN3LI=;
 b=BFWLhe9kPFi+c5KVGEHGv7qA87z71WlHrg0VdyOggBfmitvZuVt8jm2jTlaD3wLqtL
 Ln717Mzuz7k6uT7a6kMZzqsRuszKcVur4i+3CffVOzplePlNSzg6JImLaN3YFdi+x3Q2
 WmitV5K7J0tyLodiGprc8iWRO47IgCzwhU7pdfp/YQ/HDx+5Rh8VUGgjnOu7IDnEJMMY
 7id9LVYt5pilFcZgBBKFC9G+EObO6Z/ezUxpeh+N2o7qoP0pQOL7pSJPjUniEZaMBqB3
 Q8nXqnwoWGRm7f8yxrhGJtgU0MpKAjOce3vLA5wrkw2uevLrTljKvKTzWogPU3fJmSh7
 KKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=UtheBbJtexhKoaeh3asCZUpxhFIN2UBPhbEj4xsN3LI=;
 b=W1FUB8cJ+7ofPZy2KNn9JK6GIDKP0feObC9/9SIXEvES4QoYSXwPD6R1tZrtONEQpK
 I2ccS+/Oq6BXVEDMtITPvTDTAJHEKof50WNyhpvsYeXRvoBQ8fGDH+fyURYVGAX3Ytea
 k8tOufpagngrU+2ehDjrMamkKt4gaO1mjmcV1utls8CplL1vYBZ/A2MNoH75gjHSWP4P
 Mh9Z99K8rMWulpwo4aZR0XUUkAo1yTBu+Y8Lv20X81E+Z4MedLQj4nn7vqsJ5djb4fyF
 2Zv5yc5q/iGGrpjxgydlcgBCsJLKIPpcvbwCpdNpErDzxv07KrXms2Yxmyh86bU23J9D
 tLRw==
X-Gm-Message-State: AJIora9r3tA5pi+15rSmm2oIY+3JipBhLn6chQwZcLG3Z69avo4RGfVb
 OeKvXVZxnqSMNJQfCd4DnwQsow==
X-Google-Smtp-Source: AGRyM1twAOxDiH/DoPcQTDRWNS91vega6KtmACNPYPDRWtHUbCG+kvC03MIsE9/Km24Kk9DLTzZ0yw==
X-Received: by 2002:a17:907:7615:b0:72b:35a6:5992 with SMTP id
 jx21-20020a170907761500b0072b35a65992mr10218274ejc.97.1658764570399; 
 Mon, 25 Jul 2022 08:56:10 -0700 (PDT)
Received: from smtpclient.apple (5-12-52-36.residential.rdsnet.ro.
 [5.12.52.36]) by smtp.gmail.com with ESMTPSA id
 ej22-20020a056402369600b00437d3e6c4c7sm7261558edb.53.2022.07.25.08.56.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:56:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
Date: Mon, 25 Jul 2022 18:56:08 +0300
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ilg@livius.net; helo=mail-ej1-x62d.google.com
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



> On 25 Jul 2022, at 18:43, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... the memory map for the 'virt' board doesn't change for the a72
> versus the a15. In both cases, the memory from 0x0 to 0x08000000
> is the flash memory. So QEMU is incorrect to have reported that as
> the place to put the heap in SYS_HEAPINFO.

Could you also update the documentation pages to reflect the actual =
memory map for the Arm devices? It took me some time and experimentation =
to find this for my tests.

> I suspect the fix to this bug is going to be "make sure that
> SYS_HEAPINFO doesn't consider memory regions that are rom-devices"

Sounds ok.

> You don't mention which QEMU version you are using.

7.0.0

> Do you have a test binary I can reproduce this with? That would save
> me a little time.

I have a template project that can generate several binaries intended to =
run on QEMU:

- https://github.com/micro-os-plus/hello-world-qemu-template-xpack/

The only prerequisite is npm/xpm, the rest of the dependencies are =
handled automatically.

If this does not work for you, please tell me exactly which binary you =
need, and I can try to generate it.


Thank you,

Liviu


