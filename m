Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3917C4933EB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 05:06:51 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA2FF-0001pa-Qp
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 23:06:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nA2By-0000xX-JR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 23:03:26 -0500
Received: from [2607:f8b0:4864:20::433] (port=43627
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1nA2Bp-00041c-2W
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 23:03:19 -0500
Received: by mail-pf1-x433.google.com with SMTP id 78so1302448pfu.10
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 20:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QUp7k7fkMOiSHTZG35UdTlcE0Rz1eXym8TM8JydBxnY=;
 b=7ZonSKf1evvTId/JAUbndP3ddifle/vAAHGd0gIgveu5yGxzdmMpQhtA+9S//dkQua
 trEtSzQO1hjcLspl12jH6tEjKrzvxAS3MTS0CyTDnb6Ilw6y+Snd1oYHIJ2nXWm5ZOPy
 jx5pkKsHvOR1LWMpIKHyxlsrHPvT3u1SOj7zM4PaVZGCxuPB5g502He2YlZRX53UsGaF
 74ELFh4OSQz5Q1iSYt5LtaIZ9XHlWC6ktf9Kv/0E1oXhMNMqZM3Lo+EAEgYmDU1bRgtT
 3cfinDSHAn3ykV+yCXffmy8MUFlDSUc3vjMdaVkExWn9Xo7Mha2kvnPgLWEKBjP1ntbH
 tidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QUp7k7fkMOiSHTZG35UdTlcE0Rz1eXym8TM8JydBxnY=;
 b=qKbL4moJluloFAmKYn5H4bharcjkw0sXfaYghzwNZEXtQkywJzvg6B91RRTsAOAz5E
 hP9jikqeS1T+0CNvVhweH8m3fLdo+82MI/bbJJcM/gR3Zr0M8Xf6VtC3zjHDP74Gbrt4
 29jm+liz3tsgMaVodVTmupp1bbiIpcaui4PlDbq0fgN7ltqDQWaHP3pmMLXjABCYzAY2
 A4CrYuuq9slDlUVnA4Ma3e2dFIEyiug6smi0vHdUwb3Jcms7j7N9U4iLgr+kFPBxlZLJ
 PTMXZryLPYkdLltp5ctPuS4bVHcDjaE5bwufsWBv8PE1AUJCxrcCR40SpoMlu7930UqV
 mXHw==
X-Gm-Message-State: AOAM533Kyi007feNUu5abzoDhHhxQeMBXgFAOvGJEevIiR4JyMFY3GXJ
 O2zPR6e7ed3e0KYbqG4+YrmtKw==
X-Google-Smtp-Source: ABdhPJzInW7PG7Nifd3oryv/qhFQTLhmCIOpYJwBjQd6TtO8wRAOYxip4b5y65insHACA1gU9f+6Bw==
X-Received: by 2002:a05:6a00:1703:b0:4c3:13c9:3a2e with SMTP id
 h3-20020a056a00170300b004c313c93a2emr19844551pfc.44.1642564992893; 
 Tue, 18 Jan 2022 20:03:12 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 k2sm19534022pfc.53.2022.01.18.20.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 20:03:12 -0800 (PST)
Message-ID: <abbd9923-04a9-be7f-edd0-e1b2ebcc8b20@ozlabs.ru>
Date: Wed, 19 Jan 2022 15:03:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/17/22 03:45, Peter Maydell wrote:
> On Fri, 7 Jan 2022 at 07:29, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> "PowerPC Processor binding to IEEE 1275" says in
>> "8.2.1. Initial Register Values" that the initial state is defined as
>> 32bit so do it for both SLOF and VOF.
>>
>> This should not cause behavioral change as SLOF switches to 64bit very
>> early anyway. As nothing enforces LE anywhere, this drops it for VOF.
>>
>> The goal is to make VOF work with TCG as otherwise it barfs with
>> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)
> 
> If you get this assert it means that something is changing
> the CPU state and not calling the function to recalculate
> the hflags (which are basically caching part of the CPU state).
> So I don't know whether this patch is correct or not in updating
> MSR bits, but in any case I think it is only masking the
> missing-hflags-update that is causing the assertion...


If we emulate a bare metal machine, then most likely we want MSR_SF 
(==64bit) set. But this particular case is paravirtual pseries/spapr and 
it requires special handling so spapr_reset_vcpu() seems to be the right 
place.


> 
> -- PMM

