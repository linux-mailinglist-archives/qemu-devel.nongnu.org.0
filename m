Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F042864B6E8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:10:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55xx-0002nd-1C; Tue, 13 Dec 2022 09:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p55xu-0002mm-D6
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:09:02 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p55xs-0006p9-I2
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:09:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id f18so15732278wrj.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iHMPKovLcu4ZLdyQ8ABt36+jZFUM5BiKvPj3kOi4Zko=;
 b=MbkWfW4WKpUSDH+8QqKQdtpFEwdu+Ot+5jWV7s1EHEBGGkOyoEUk1tkQUCCDhZMPQx
 rKZMqUC3IgEfHkY0ackQHZ9Iq971EwnwfhRWL8qQPOhVxFuobGS4Ca1pW3u1gGLYFjGo
 5RVjhLHFHaKpyoPL8PVvbC6jpmBYGAw4qvcMAUOr0Ekl7NQtosagew0TXw7PO01YDb9I
 q6/E5TOa4eMuM58karp4U51rHPI4co1zI78fZ19MRgynReEuBFu2KFQegk1zBK7yOtyx
 Vcikxkr5jSohqEIaFg8eG1xCvus702g7ymt1uFIpacf3d3dmQzFWg989rpFAfkqBPLYg
 OQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iHMPKovLcu4ZLdyQ8ABt36+jZFUM5BiKvPj3kOi4Zko=;
 b=lkAj9R5okFT3ZviGYipjKmHqeLzMn7WH5D5wLpfUQthfbl3S7OAgKer+VpTgUkYG5o
 DRuGWmAmUsV5EKuWPsYzMkM4DYhC+iP6hq+bZnWlie6S/ySN9RwwDnauh+rWGomFuLno
 oBgmPOHTA28EHn++Nb/39fm0Lk0FviVOxDlpDiZNuhM8gOj5GKkXWklsPuRUexAdGK2R
 GT66GaKEDzXN6eSudQkAADsN3oKVhkGNBw1teMEyvtfaG4Qx/rtrzwqFlFaYdaRN+O6s
 WB3nTbfDvWCZlypPeKLPJqLS7IlfyHwbP+IcbdafRNVbdfSzZY2xasjGHt3H3ce+f6Ki
 N0Rw==
X-Gm-Message-State: ANoB5pkHCDtLdmlDV3r7x/VzlcdqwTmB5UkTRrhtrPhpRn6uDH2pzZMS
 Hy6WLvLHZ0aMkwD+LK4jCOmJxQ==
X-Google-Smtp-Source: AA0mqf6I6iiyzUfhRUEMNVnmeKo0AUANmdBS/U95ANhcEXU4X9+4KENnknJzc8mr5ksy2sTnmPHfCA==
X-Received: by 2002:adf:cc87:0:b0:242:88af:d88b with SMTP id
 p7-20020adfcc87000000b0024288afd88bmr13922580wrj.43.1670940538215; 
 Tue, 13 Dec 2022 06:08:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z5-20020adff1c5000000b002258235bda3sm11771217wro.61.2022.12.13.06.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 06:08:57 -0800 (PST)
Message-ID: <1ac96aab-c5c4-b539-956c-d2923e6d8602@linaro.org>
Date: Tue, 13 Dec 2022 15:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Single system binary & Dynamic machine model (KVM developers
 conference call 2022-12-13)
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
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
 Christophe de Dinechin <dinechin@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Dongli Zhang <dongli.zhang@oracle.com>, afaerber@suse.de,
 andrea.arcangeli@redhat.com, bazulay@redhat.com, bbauman@redhat.com,
 cjia@nvidia.com, cw@f00f.org, digitaleric@google.com,
 dustin.kirkland@canonical.com, Eric Blake <eblake@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, felipe@nutanix.com, iggy@theiggy.com,
 Jan Kiszka <jan.kiszka@web.de>, Jason Gunthorpe <jgg@nvidia.com>,
 jidong.xiao@gmail.com, jjherne@linux.vnet.ibm.com,
 Joao Martins <joao.m.martins@oracle.com>, mburton@qti.qualcom.com,
 mdean@redhat.com, mimu@linux.vnet.ibm.com, z.huo@139.com,
 zwu.kernel@gmail.com, Laurent Vivier <lvivier@redhat.com>
References: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
In-Reply-To: <936e1ac4-cef8-08b4-c688-e5b1e057208b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/12/22 00:41, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> In the last years we had few discussions on "simplifying" QEMU (system 
> emulation / virtualization), in particular for the "management layer".
> 
> Some of us are interested in having QEMU able to dynamically create
> machine models. Mark Burton's current approach is via a Python script
> which generates QMP commands. This is just another case of "management
> layer".
> 
> Various problems have been raised regarding the current limitations of
> QEMU's APIs. We'd like to remember / get a broader idea on these limits
> and look at some ideas / proposals which have been discussed / posted
> on this list.
> 
> Feel free to complete your thoughts on this public etherpad:
> https://etherpad.opendev.org/p/qemu-emulation-bof%402022-12-13
> 
> Topic I remember which can be good starters:
> 
> - Current limitations of QAPI (& QMP) model (Markus Armbruster)
> 
> - Adding a new qemu-runtime-$TARGET / QMP-only binary without today's
>    limitations (Daniel P. Berrangé & Paolo Bonzini)
> 
> - Problem with x-exit-preconfig, reworking MachinePhaseInit state
>    machine (Paolo Bonzini)
> 
> Markus / Daniel / Paolo expressed their ideas on the list (the
> historical threads are referenced in the etherpad) so reading the
> relevant threads before the call will help to get in the topic.
> These people don't have to be in the call, but if they can attend
> that would be very nice :)
> 
> The call will be Tuesday, December 13 at 3pm CET on this Bluejeans link:
> http://bluejeans.com/quintela
We moved the call here:

https://teams.microsoft.com/_#/pre-join-calling/19:meeting_MjU2NDhkOGYtOGY5ZC00MzRjLWJjNjgtYWI2ODQxZGExMWNj@thread.v2


