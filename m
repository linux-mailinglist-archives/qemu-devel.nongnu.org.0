Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0F64B9F0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58J3-0002Q6-Au; Tue, 13 Dec 2022 11:39:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p58J1-0002MK-Pl
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:38:59 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p58Iz-0003yg-KX
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:38:59 -0500
Received: by mail-pl1-x631.google.com with SMTP id t2so361699ply.2
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 08:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1tedyGFZapeWIC8x3wYCXSrM5M2awkIMlKUHlk8diE=;
 b=dM6yISrxmrDMpY5api+dN6PMXKLGSE4IOJIuTpOlYDwQN55RdNgGjNLeSscJFxMV7r
 Q5aNmuMV9PR/VP7WoSqbCH/HOTZHAjJng/kqX9cLVpI3z3dnA6QMjjagm15iL/1HqxVP
 nJq89ZpquG+VioUzleCuuyBSBNpscA86tE/LRcoxwP3YOFcS7sfLHYAL2ATSlaHtKEj/
 nJ9xkGueJLXZ8ri+FkGBoSiq3mtXWvc7W2tGgp59lR5QAlKT6aaoJLiKHzmI9YuIA5dM
 Sw9tyb3NYFyIrZFsszhFytLOMaCbGpRCqz7OXMjoZQOzdpS0rRJuABt8UJCjsUh8fmah
 9+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a1tedyGFZapeWIC8x3wYCXSrM5M2awkIMlKUHlk8diE=;
 b=ThcHjnrlLi1I6VI/f3PoQ8KucSrUG62Kv/NGFozCkHdzOxKVFyzdtjgk5V5NROlkRg
 4K9WzL3szS+u00b8rgQh/EbY9iJNfGYs41wBEBkYmDxngNIYUBGN3y5Q5XG2Nol1k66N
 ftBbKtMEN51jAHnYsa2xeL1M8EP9HySMhsZzJkCzvuzFudyhuoejTPdWi/fczvNUpNIb
 55HplCn4lLy/na22IfA+kHcoEjeBlwfqZTd1UL7H9wMxmT2hH3bqa4XST+Q9xEv07GBt
 aIWgifzAaNGZKLCPtGqSsQfvC9oiMFBb33KYe/efzVPYk4P5hiqWTfJLnSIo5KFRTmLs
 ECMQ==
X-Gm-Message-State: ANoB5pnHMOY+vY8EH9+Wa9NJJd8R9ByW8jM8Pdr22VyzjoyMlwNEqeqQ
 rZnHeQDQP7Uq2eoBSovIP8fdNft0ASHsWZMoSJAlmQ==
X-Google-Smtp-Source: AA0mqf4nE5s0TqE5lsceUn+uDcSmlNOg5rtN1yVH5PG8Ruj/B5afbPvBdHJBnKE3DSfND4SCH9OHNY2xhl6WL2I26ws=
X-Received: by 2002:a17:902:f292:b0:189:91b8:bf92 with SMTP id
 k18-20020a170902f29200b0018991b8bf92mr49106053plc.19.1670949535906; Tue, 13
 Dec 2022 08:38:55 -0800 (PST)
MIME-Version: 1.0
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
 <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
 <236991F2-4CDA-46BA-AE68-66E8D329F459@nutanix.com>
In-Reply-To: <236991F2-4CDA-46BA-AE68-66E8D329F459@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2022 16:38:44 +0000
Message-ID: <CAFEAcA_KuCaZC-OKjzyX71BCnGfHsVA2RwCoVyEG5GpKvE8DJA@mail.gmail.com>
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
To: Felipe Franciosi <felipe@nutanix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Mark Burton <mburton@qti.qualcomm.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Brian Cain <bcain@quicinc.com>, 
 Warner Losh <imp@bsdimp.com>, Luc Michel <luc@lmichel.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Alessandro Di Federico <ale@rev.ng>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, Jim Shu <jim.shu@sifive.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Anton Johansson <anjo@rev.ng>, Michal Privoznik <mprivozn@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Denis V. Lunev" <den@virtuozzo.com>, Cleber Rosa <cleber@redhat.com>, 
 Stefan Hajnoczi <stefanha@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Dominik Csapak <d.csapak@proxmox.com>,
 Christophe de Dinechin <dinechin@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, 
 Dongli Zhang <dongli.zhang@oracle.com>, "afaerber@suse.de" <afaerber@suse.de>, 
 "andrea.arcangeli@redhat.com" <andrea.arcangeli@redhat.com>,
 "bazulay@redhat.com" <bazulay@redhat.com>, 
 "bbauman@redhat.com" <bbauman@redhat.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "cw@f00f.org" <cw@f00f.org>, 
 "digitaleric@google.com" <digitaleric@google.com>, 
 "dustin.kirkland@canonical.com" <dustin.kirkland@canonical.com>,
 Eric Blake <eblake@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, "iggy@theiggy.com" <iggy@theiggy.com>,
 Jan Kiszka <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "jidong.xiao@gmail.com" <jidong.xiao@gmail.com>, 
 "jjherne@linux.vnet.ibm.com" <jjherne@linux.vnet.ibm.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 "mburton@qti.qualcom.com" <mburton@qti.qualcom.com>,
 "mdean@redhat.com" <mdean@redhat.com>, 
 "mimu@linux.vnet.ibm.com" <mimu@linux.vnet.ibm.com>,
 "z.huo@139.com" <z.huo@139.com>, 
 "zwu.kernel@gmail.com" <zwu.kernel@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Tue, 13 Dec 2022 at 16:34, Felipe Franciosi <felipe@nutanix.com> wrote:
>
>
> > On 13 Dec 2022, at 14:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> >
> > We moved the call here:
> >
> > https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYt=
OGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2
>
> Just wondering: what's wrong with Google Hangout?

Nothing. We were just a dozen people sat in the chat window of a
BlueJeans meeting we couldn't get into, and somebody volunteered
"I can quickly set up a meeting in the tool I happen to use",
so we used that rather than spending another 10 minutes debating
which videoconferencing setup to use.

thanks
-- PMM

