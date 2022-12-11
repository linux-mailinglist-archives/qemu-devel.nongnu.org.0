Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C56664973A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 00:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4VxU-0002Yz-0f; Sun, 11 Dec 2022 18:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4VxS-0002Yq-94
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 18:42:10 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4VxP-0004vq-UM
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 18:42:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id b2so23930882eja.7
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 15:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxXva8ICo2juLeRUEfsSUjHUCal67NLzLrUd3X/kO4M=;
 b=SuKqmSSvvuQUxUcZ0ZOYlz3cdAdWBgLOOFk0PjGIRCzuBNODe/iD1NS5QnCMMngXGN
 JMIHcj3D8VaHEXDQJ8q/0UmnT/o2D8vV0e2kW2OSNeRBkRe2/CF+h1hm5frKPaVwtrBC
 5XRnhSfdlERFw4mR/UsjQf0QsU7fxwpe+YAYnZYL4+ecU0zJmkGfKDSTpvxZLen20nwV
 wXvZ1YZ+qr72cUYltuTrzh0bHUbedBy/M/bpnsR/Khu+vZKeAoL4DUj+C14yrC99uWC8
 3Xkv/yggDe2wxUhhONpt4KeV6lrOzPUlXnv/JOWKzEwPWaXhdqIRHf87q5vve+Xc6MQD
 MQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xxXva8ICo2juLeRUEfsSUjHUCal67NLzLrUd3X/kO4M=;
 b=PdiviaQe8S4TtozX4JIe+XoywzqM5J3x72fIDqXii/Y68Fzaox/NT8RkFk5X0HRVW8
 qS90zInwGSzo6VwddLttCqTgASveJjDQcL4vEqIG8VTSENjoOW3dmbTz98LJVuzx3L5Q
 brGpMImcVtCFN0ATcK7axYsCNItiF6+fGl0KvnHmwYflfwFlEwkxufFCgwz6Gjok9h02
 HfevYCr6zkQ5sHk5dVksT0z8up5JgHLdiIxHunmr93uQc7B3SzSoXpBlgcI7vCFQZb9x
 l9d+o5HOqVqYniACbJyMM7qAf2o+8p+n5pmM2LQ4WoOZsoIiSJOYLVuzSLDuVR9B+a7E
 kXgg==
X-Gm-Message-State: ANoB5pmHf+RR2KU73kiaZZjeQEE6FheKKGkOiuznu4Ng+ymU5ODxva7c
 XSnW7X9j7wvLOUvFrAgwffTuJA==
X-Google-Smtp-Source: AA0mqf40/gVHpNOVcIkTa8Vh85u3rCB2RuO+eVJ26+7isK3JqhVfJlcHwk6LGafwnbUKKZFB5AA/pg==
X-Received: by 2002:a17:907:970c:b0:78d:f455:b4ba with SMTP id
 jg12-20020a170907970c00b0078df455b4bamr14814173ejc.33.1670802124976; 
 Sun, 11 Dec 2022 15:42:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 de39-20020a1709069be700b007c0f45ad6bcsm2563961ejc.109.2022.12.11.15.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 15:42:04 -0800 (PST)
Message-ID: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
Date: Mon, 12 Dec 2022 00:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Subject: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di Federico
 <ale@rev.ng>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Dominik Csapak <d.csapak@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, bazulay@redhat.com, bbauman@redhat.com,
 cjia@nvidia.com, cw@f00f.org, digitaleric@google.com,
 dustin.kirkland@canonical.com, Eric Blake <eblake@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, felipe@nutanix.com, iggy@theiggy.com,
 Warner Losh <imp@bsdimp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Jason Gunthorpe <jgg@nvidia.com>, jidong.xiao@gmail.com,
 jjherne@linux.vnet.ibm.com, Joao Martins <joao.m.martins@oracle.com>,
 mburton@qti.qualcom.com, mdean@redhat.com, mimu@linux.vnet.ibm.com,
 Stefan Hajnoczi <stefanha@gmail.com>, z.huo@139.com, zwu.kernel@gmail.com,
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

In the last years we had few discussions on "simplifying" QEMU (system 
emulation / virtualization), in particular for the "management layer".

Some of us are interested in having QEMU able to dynamically create
machine models. Mark Burton's current approach is via a Python script
which generates QMP commands. This is just another case of "management
layer".

Various problems have been raised regarding the current limitations of
QEMU's APIs. We'd like to remember / get a broader idea on these limits
and look at some ideas / proposals which have been discussed / posted
on this list.

Feel free to complete your thoughts on this public etherpad:
https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13

Topic I remember which can be good starters:

- Current limitations of QAPI (& QMP) model (Markus Armbruster)

- Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
   limitations (Daniel P. Berrangé & Paolo Bonzini)

- Problem with x-exit-preconfig, reworking MachinePhaseInit state
   machine (Paolo Bonzini)

Markus / Daniel / Paolo expressed their ideas on the list (the
historical threads are referenced in the etherpad) so reading the
relevant threads before the call will help to get in the topic.
These people don't have to be in the call, but if they can attend
that would be very nice :)

The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link:
http://bluejeans.com/quintela

You can subscribe to the 'KVM developers conference call' calendar here:
https://calendar.google.com/calendar/u/0/embed?src=eged7cki05lmu1tngvkl3thids@group.calendar.google.com

Regards,

Phil.

